<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp로 이동
	if (id == null) {
		response.sendRedirect("login.jsp");
		return;
	}

	// "passwd" 파라미터 가져오기
	String formId = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// DB객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	// -1: 아이디 없음, 0: 비밀번호 틀림, 1: 아이디 비밀번호 일치
	int check = dao.userCheck(id, passwd);
	
	if (check == 0) {
		%>
		<script>
			alert('비밀번호 틀림');
			history.back();
		</script>
		<%
	} else if (check == 1) {
		response.sendRedirect("update.jsp");
	}
%>




