<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>updateUserCheck</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
<!-- Header -->
</head>

<body>

	<div id="top-menu">
		<%-- top 영역  include top.jsp --%>
		<jsp:include page="/include/top.jsp" />
	</div>

		<div id="wrapper">
			<div id="page" class="container">
				<%
					// 세션값 가져오기
					String id = (String) session.getAttribute("id");
					// 세션값 없으면 loginForm.jsp로 이동
					if (id == null) {
						response.sendRedirect("login.jsp");
						return;
					}
				%>
				
	<h1>사용자 확인</h1>
		<hr>
		
			<form action="updateUserCheckPro.jsp" method="post">
				<!-- hidden 타입 input태그로 사용자 눈에 안보이게 전송 -->
				<input type="hidden" name="id" value="<%=id %>">
				비밀번호 <input type="password" name="passwd" style="width : 200px"><br><br>
				<input type="submit" value="비밀번호 확인" class="updateUserCheck-input">
			</form>
		
			</div>
		</div>
	
	<jsp:include page="/include/bottom.jsp" />
	
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




