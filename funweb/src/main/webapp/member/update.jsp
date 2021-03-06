<%@page import="exam.domain.MemberVo"%>
<%@page import="exam.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>update</title>
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
						response.sendRedirect("/member/login.jsp");
						return;
					}
					
					// DB객체 가져오기
					MemberDao dao = MemberDao.getInstance();
					
					// id에 해당하는 행 가져오기 메소드 호출
					MemberVo vo = dao.getMemberById(id);
					
					// 날짜 형식 변환
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
					LocalDateTime dateTime = vo.getRegDate();
					String strRegDate = dateTime.format(formatter);
					
					// 성별값 가져오기
					String gender = vo.getGender();
					if (gender == null || gender.equals("")) {
						gender = "남"; // 기본값을 "남"으로 설정
					}
				%>
					<section class="container">
					<div class="box">
					<h1>회원정보 수정</h1>
					<div class="sample-text" class="genric-btn info-border circle">
					<hr>
					
					<form action="updatePro.jsp" method="post" class="memberUpdate">
						<label>아이디</label><input type="text" name="id" value="<%=vo.getId() %>" readonly><br>
						<label>비밀번호</label><input type="password" name="passwd" id="passwd"><br>
						<label>비밀번호 확인</label><input type="password" name="passwd2" id="passwd2"><br>
						<span id="passwdMessage"></span><br>
						<label>이름</label><input type="text" name="name" value="<%=vo.getName() %>"><br>
						<label>나이</label><input type="number" name="age" min="0" max="150" value="<%=vo.getAge() %>"><br>
						<label>성별</label>
							<input type="radio" name="gender" value="남" <% if (gender.equals("남")) { %>checked<% } %>>남자
						    <input type="radio" name="gender" value="여" <% if (gender.equals("여")) { %>checked<% } %>>여자<br>
						<label>이메일</label><input type="email" name="email" value="<%=vo.getEmail() %>"><br><br>
						<label></label><input type="submit" value="회원수정" class="memberUpdateConfirm">
					</form>
					</div>
					</div>
					</section>
			</div>
		</div>
	
	<jsp:include page="/include/bottom.jsp" />
	
	<!-- Scripts -->
	<script src="/assets/js/jquery-3.5.1.js"></script>
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/jquery.scrollex.min.js"></script>
	<script src="/assets/js/skel.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script src="/assets/js/bootstrap.js"></script>
	
	
	<script>
	// 패스워드 일치여부 확인
	var passwd = document.getElementById('passwd');
	var passwd2 = document.getElementById('passwd2');
	var spanMessage = document.getElementById('passwdMessage');
	
	passwd2.onkeyup = function() {
		console.log('타이핑 중');
	
		if (passwd.value != passwd2.value) {
			spanMessage.style.color = "red";
			spanMessage.innerHTML = '비밀번호가 일치하지 않습니다.'
		} else {
			spanMessage.style.color = "green";
			spanMessage.innerHTML = '비밀번호 일치.';
		}
		
	};
	
	
	</script>
	
</body>
</html>






