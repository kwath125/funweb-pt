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

<!-- Nav -->
<nav id="top-menu-navbar" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse" style="cursor: pointer;">
			<span class="sr-only">Navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<div id="menu-navbar" class="navbar-collapse navbar-ex1-collapse collapse in" aria-expanded="true">
			<ul class="nav navbar-nav">
				<li><a href="/index.jsp" accesskey="1" title="">홈으로</a></li>
				<li><a href="/about.jsp" accesskey="2" title="">커뮤니티소개</a></li>
				<li><a href="/center/notice.jsp" accesskey="3" title="">공개게시판</a></li>
			</ul>
				<div class="navbar-right">
					<ul class="nav navbar-nav">
					<%
					if (id != null) {
					%>
					<li><a href="/member/logout.jsp">로그아웃</a></li>
					<li><a href="/member/updateUserCheck.jsp">회원정보수정</a></li> 
					<li><a href="/member/delete.jsp">회원정보삭제</a></li>
					<li><a href="/center/fileNotice.jsp">파일게시판</a></li>
						<%
						if (id.equals("admin")) {
						%>
						<li><a href="/admin/memberListAdmin.jsp">관리자 메뉴</a></li>
							<%
							} else {
													
							}
						} else { // id == null
							%>
							<li><a href="/member/login.jsp">로그인</a><li>
							<li><a href="/member/join.jsp">회원가입</a></li>
							<%
							}
							%>
				</ul>
			</div>
	</div>
</nav>