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
<title>fileWriteForm</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
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
%>

<body>
	
	<div id="top-menu">
		<%-- top 영역  include top.jsp --%>
		<jsp:include page="/include/top.jsp" />
	</div>

	<div id="wrapper">
			<div id="page" class="container">
	
	<div class="table-responsive">
	<article>
	
	<h1>파일 게시판 글작성</h1>
	
	<form action="fileWritePro.jsp" method="post" enctype="multipart/form-data" name="frm">
	<table class="table table-striped" id="fileWriteForm">
		<tr>
			<th scope="col" width="200">아이디</th>
			<td style="text-align: left; width: 500px;">
				<input type="text" name="name" value="<%=id %>" readonly>
			</td>
		</tr>
		<tr>
			<th scope="col">비밀번호</th>
			<td style="text-align: left;">
				<input type="password" name="passwd">
			</td>		
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;">
				<input type="text" name="subject">
			</td>
		</tr>
		<tr>
			<th scope="col">파일</th>
			<td style="text-align: left;">
				<button type="button" id="btnAddFile">첨부파일 추가</button>
				<div id="fileBox">
					<div>
						<input type="file" name="filename">
						<span class="fileDelete">X</span>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;">
				<textarea rows="13" cols="40" name="content"></textarea>
			</td>
		</tr>
	</table>

	<div id="table_search">
		<button type="submit" class="button">파일글쓰기</button>
		<button type="reset" class="button">다시쓰기</button>
		<button type="button" class="button" onclick="location.href='fileNotice.jsp?pageNum=<%=pageNum %>'">목록보기</button>
	</div>
	</form>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
		
	</article>
	</div>
    </div>
	</div>
    
	<%-- footer 영역  include bottom.jsp --%>
	<jsp:include page="/include/bottom.jsp"/>


<script src="/script/jquery-3.5.1.js"></script>
<script>
	var fileCount = 1;

	// 정적 이벤트 바인딩
	$('button#btnAddFile').click(function (event) {
		if (fileCount >= 5) {
			alert('첨부파일은 최대 5개까지만 가능합니다.');
			return;
		}
		
		var str = '<div><input type="file" name="filename"><span class="fileDelete">X</span></div>';
		
		//$(this).next().append(str);
		$('div#fileBox').append(str);
		fileCount++;
	});
	
	// 동적 이벤트 바인딩
	$('div#fileBox').on('click', 'span.fileDelete', function (event) {
		$(this).parent().remove(); // empty()는 안쪽요소만 비움
		fileCount--;
	});
</script>
</body>
</html>   






