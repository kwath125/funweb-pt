<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 로그인 상태유지 쿠키정보 가져오기
	Cookie[] cookies = request.getCookies();
	// name이 "id"인 쿠키객체 찾기
	if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("id")) {
	String id = cookie.getValue();

	// 로그인 인증(세션에 id값 추가)
	session.setAttribute("id", id);
		}
	}
}
%>
<%
// 세션값 가져오기
String id = (String) session.getAttribute("id");
// 세션값 있으면 ..님 반가워요~ logout join없어짐
// 세션값 없으면 login으로 join 나타남
%>
<header>
	<div class="logo"><a href="/index.jsp">Urban <span>by TEMPLATED</span></a></div>
	<a href="#menu">Menu</a>
</header>

<!-- Nav -->
<nav id="menu">
	<ul class="links">
			<%
			if (id != null) {
			%>
			<%=id%>님 반갑습니다. 
			<li><a href="/index.jsp">홈으로</a></li>
			<li><a href="/member/logout.jsp">로그아웃</a></li>
			<li><a href="/member/updateUserCheck.jsp">회원정보수정</a></li> 
			<li><a href="/member/delete.jsp">회원정보삭제</a></li>
			<li><a href="/center/notice.jsp">공개게시판</a></li>
			<li><a href="/center/fileNotice.jsp">파일게시판</a></li>
				<%
				if (id.equals("admin")) {
				%>
				<li><a href="/admin/list.jsp">관리자 메뉴</a></li>
					<%
					} else {
											
					}
				} else { // id == null
					%>
					<li><a href="/index.jsp">홈으로</a></li>
					<li><a href="/member/login.jsp">로그인</a><li>
					<li><a href="/member/join.jsp">회원가입</a></li>
					<li><a href="/center/notice.jsp">공개게시판</a></li>
					<%
					}
					%>
	</ul>
</nav>
