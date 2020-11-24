<%@page import="exam.domain.AttachfileVo"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 login.jsp로 이동
	if (id == null) {
		%>
		<script>
			alert('해당 게시물은 로그인 후 이용할 수 있습니다.');
			location.href = '/member/login.jsp';
		</script>
		<%
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>fileContent</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
<!-- Header -->
</head>

<%
	// int num    String pageNum  파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 조회수 1증가
	dao.updateReadcount(num);
	// 글 한개 가져오기
	BoardVo vo = dao.getBoardAndAttachfilesByNum(num);
	// 첨부파일 리스트 가져오기
	List<AttachfileVo> attachList = vo.getAttachList();
	
	// 내용에서 엔터키 줄바꿈 \r\n -> <br> 바꾸기
	String content = "";
	if (vo.getContent() != null) {
		content = vo.getContent().replace("\r\n", "<br>");
	}

	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	LocalDateTime dateTime = vo.getRegDate();
	String strRegDate = dateTime.format(formatter);

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
	<h1>파일 게시판 Content</h1>
		
	
	<table class="table table-striped" id="table table-striped" style="width: auto !important;">
		<tr>
			<th scope="col" width="200">글번호</th>
			<td width="500" style="text-align: left;"><%=vo.getNum() %></td>
		</tr>
		<tr>
			<th scope="col">조회수</th>
			<td style="text-align: left;"><%=vo.getReadcount() %></td>
		</tr>
		<tr>
			<th scope="col">작성자</th>
			<td style="text-align: left;"><%=vo.getName() %></td>
		</tr>
		<tr>
			<th scope="col">작성일</th>
			<td style="text-align: left;"><%=strRegDate %></td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;"><%=vo.getSubject() %></td>
		</tr>
		<tr>
			<th scope="col">파일</th>
			<td style="text-align: left;">
				<%
				if (attachList != null) {
					for (AttachfileVo attachVo : attachList) {
						%>
						<a href="download.jsp?uuid=<%=attachVo.getUuid() %>">
						<%=attachVo.getFilename() %><br>
						</a>
						<%
					}
				}
				%>
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;"><%=content %></td>
		</tr>
	</table>

	<div id="fileContentButton">
		<%
		// 로그인 아이디와 글작성자 아이디(이름)가 같으면 
		if (id.equals(vo.getName())) {
			%>
			<button type="button" class="genric-btn info-border circle" onclick="location.href='fileModifyForm.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'">글수정</button>
			<button type="button" class="genric-btn danger-border circle" onclick="remove()">글삭제</button>
			<%
		}
		%>
		<button type="button" class="genric-btn primary-border circle" onclick="location.href='replyWriteForm.jsp?reRef=<%=vo.getReRef() %>&reLev=<%=vo.getReLev() %>&reSeq=<%=vo.getReSeq() %>&pageNum=<%=pageNum %>'">답글쓰기</button>
		<button type="button" class="genric-btn success-border circle" onclick="location.href='fileNotice.jsp?pageNum=<%=pageNum %>'">목록보기</button>
	</div>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
	</div>
	</article>
    
	<div class="clear"></div>
	</div>
	</div>

<script>
	function remove() {
		var result = confirm('<%=vo.getNum() %>번 글을 정말 삭제하시겠습니까?');
		if (result) {
			location.href = 'fileDelete.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>';
		}
	}
</script>

	<%-- bottom 영역  include bottom.jsp --%>
	<jsp:include page="/include/bottom.jsp"/>

	<!-- Scripts -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/jquery.scrollex.min.js"></script>
	<script src="/assets/js/skel.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script src="/assets/js/bootstrap.js"></script>
	<script src="/assets/js/jquery-3.5.1.js"></script>


</body>
</html>   





