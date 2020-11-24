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
<title>writeForm</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
<!-- Header -->
</head>
<%
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
		
	<h1>공개 게시판 글작성</h1>
	
	<form action="writePro.jsp" method="post" name="frm">
	<table class="table table-striped" id="table table-striped">
		<tr>
			<th scope="col" width="200">이름</th>
			<td style="text-align: left; width: 500px;">
				<input type="text" name="name">
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
			<th scope="col">글내용</th>
			<td style="text-align: left;">
				<textarea rows="13" cols="40" name="content"></textarea>
			</td>
		</tr>
	</table>

	<div id="table_search">
		<button type="submit" class="button">글쓰기</button>
		<button type="reset" class="button">다시쓰기</button>
		<button type="button" class="button" onclick="location.href='notice.jsp?pageNum=<%=pageNum %>'">목록보기</button>
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

</body>
</html>   

