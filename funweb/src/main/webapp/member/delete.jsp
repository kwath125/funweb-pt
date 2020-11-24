<%@page import="exam.domain.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>delete</title>
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
					// 세션 가져오기
					String id = (String) session.getAttribute("id");
					
					// 세션 없으면 login.jsp 이동
					if (id == null) {
						response.sendRedirect("login.jsp");
						return;
					}
				%>
				<div class="container">
					<div class="box">
						<h1 class="text-heading">삭제 메세지</h1>
						<hr>
							<div class="sample-text">
								<form name="frm" action="deletePro.jsp" method="post" class="memberDelete" <%-- onsubmit="return check()" --%>>
									<!-- hidden type input tag > 사용자에게 invisible-->
									<label>아이디</label><input type="text" name="id" value="<%=id %>" readonly><br>
									<label>비밀번호</label><input type="password" name="passwd"><br><br>
									<label></label><input type="submit" class="memberDeleteConfirm" value="회원삭제"><br>
								</form>
							</div>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		function check() {
			// 선택창. true/false return함
			var result = confirm('삭제하시겠습니까?');
			
			if (result == false) {
				return false;
			}
			
		}
	
	</script>
	
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