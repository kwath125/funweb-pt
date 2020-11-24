<%@page import="exam.domain.AttachfileVo"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>fileModifyForm</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
<!-- Header -->
</head>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 login.jsp로 이동
	if (id == null) {
		response.sendRedirect("/member/login.jsp");
		return;
	}


	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDao boardDao = BoardDao.getInstance();
	
	BoardVo boardVo = boardDao.getBoardAndAttachfilesByNum(num);
	List<AttachfileVo> attachList = boardVo.getAttachList();
%>

<body>
	<div id="top-menu">
		<%-- top 영역  include top.jsp --%>
		<jsp:include page="/include/top.jsp" />
	</div>

		<div id="wrapper">
			<div id="page" class="container">
		
	<article>
	<div class="table-responsive">
	<h1>파일 게시판 글수정</h1>
	
	<form action="fileModifyPro.jsp" method="post" enctype="multipart/form-data" name="frm">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<table class="table table-striped" style="width: auto !important;">
		<tr>
			<th scope="col" width="200">아이디</th>
			<td style="text-align: left; width: 500px;">
				<input type="text" name="name" value="<%=id %>" readonly>
			</td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;">
				<input type="text" name="subject" value="<%=boardVo.getSubject() %>">
			</td>
		</tr>
		<tr>
			<th scope="col">파일</th>
			<td style="text-align: left;">
				<button type="button" class="button" id="btnAddFile">첨부파일 추가</button>
				<div id="fileBox">
					<div id="oldFileBox">
						<%
						for (AttachfileVo attachVo : attachList) {
							%>
							<input type="hidden" name="oldfile" value="<%=attachVo.getUuid() %>">
							<div>
								<%=attachVo.getFilename() %>
								<span class="delete-oldfile">X</span>
							</div>
							<%
						}
						%>
					</div>
				
					<div id="newFileBox"></div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;">
				<textarea rows="13" cols="40" name="content"><%=boardVo.getContent() %></textarea>
			</td>
		</tr>
	</table>

	<div id="table_search">
		<button type="submit" class="button">파일글수정</button>
		<button type="reset" class="button">다시쓰기</button>
		<button type="button" class="button" onclick="location.href='fileNotice.jsp?pageNum=<%=pageNum %>'">목록보기</button>
	</div>
	</form>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
	</div>
	</article>
    </div>
	</div>
    
    
    
	<div class="clear"></div>
	<%-- footer 영역  include bottom.jsp --%>
	<jsp:include page="/include/bottom.jsp"/>

	<!-- Scripts -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/jquery.scrollex.min.js"></script>
	<script src="/assets/js/skel.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	
<script src="/script/jquery-3.5.1.js"></script>
<script>
	var fileCount = <%=attachList.size() %>;

	// 정적 이벤트 바인딩
	$('button#btnAddFile').click(function (event) {
		if (fileCount >= 5) {
			alert('첨부파일은 최대 5개까지만 가능합니다.');
			return;
		}
		
		var str = '<div><input type="file" name="filename"><span class="delete-addfile">X</span></div>';
		
		//$(this).next().find('div#newFileBox').append(str);
		$('div#newFileBox').append(str);
		fileCount++;
	});
	
	// 동적 이벤트 바인딩
	$('div#newFileBox').on('click', 'span.delete-addfile', function (event) {
		$(this).parent().remove(); // empty()는 안쪽요소만 비움
		fileCount--;
	});
	
	// 정적 이벤트 바인딩
	$('span.delete-oldfile').click(function () {
		$(this).parent().prev().prop('name', 'delfile');
		$(this).parent().remove();
		fileCount--;
	});
</script>
</body>
</html>   






