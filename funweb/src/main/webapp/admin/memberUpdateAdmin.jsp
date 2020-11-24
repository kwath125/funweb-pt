<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="exam.dao.MemberDao"%>
<%@page import="exam.domain.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
	//String id = (String) session.getAttribute("id");
	
	MemberDao dao = MemberDao.getInstance();
	
	//세션에 저장된 아이디를 가져와서
	// 그 아이디 해당하는 회원정보를 가져온다.
	String id = request.getParameter("id");
	MemberVo vo = dao.getMemberById(id);
	System.out.println("vo=" + vo);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	LocalDateTime dateTime = vo.getRegDate();
	String strRegDate = dateTime.format(formatter);
%>

<head>
<title>updateAdmin</title>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
</head>
<body>

	<div id="top-menu">
		<%-- top 영역  include top.jsp --%>
		<jsp:include page="/include/top.jsp" />
	</div>

	<div id="wrapper">
		<div id="page" class="container">

			<div class="container">
				<div class="row">

					<div class="col-md-3 col-lg-3">
						<%--  관리 항목 영역  include board_submenu_admin.jsp --%>
						<jsp:include page="/include/board_submenu_admin.jsp" />
					</div>

					<article>
						<div class="col-md-9 col-lg-9 table-responsive">
							<h1>회원정보</h1>

							<table class="table table-striped" id="table table-striped" style="width: auto !important;">
								<tr>
									<th scope="col" width="200">아이디</th>
									<td width="500" style="text-align: left;"><%=vo.getId()%></td>
								</tr>

								<tr>
									<th scope="col">비밀번호</th>
									<td style="text-align: left;"><%=vo.getPasswd()%></td>
								</tr>

								<tr>
									<th scope="col">이름</th>
									<td style="text-align: left;"><%=vo.getName()%></td>
								</tr>

								<tr>
									<th scope="col">가입일</th>
									<td style="text-align: left;"><%=strRegDate%></td>
								</tr>

								<tr>
									<th scope="col">이메일</th>
									<td style="text-align: left;"><%=vo.getEmail()%></td>
								</tr>

							</table>
							
							<div id="table_search">
								<button type="button" class="button" onclick="location.href = 'memberUpdateFormAdmin.jsp?id=<%=vo.getId()%>'">회원수정</button>
								<button type="button" class="button" onclick="location.href='memberListAdmin.jsp'">회원목록</button>
							</div>

						</div>
					</article>
				</div>
			</div>
		</div>
	</div>

	<%-- bottom 영역  include bottom.jsp --%>
	<jsp:include page="/include/bottom.jsp" />

	<!-- Scripts -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrollex.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/skel.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script src="/assets/js/bootstrap.js"></script>
	<script src="/assets/js/jquery-3.5.1.js"></script>


</body>
</html>
