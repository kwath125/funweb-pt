<%@page import="exam.dao.MemberDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] value = request.getParameterValues("selectedid");
	MemberDao dao = MemberDao.getInstance();
	if (value == null) {
		%>
		<script>
			alert('삭제할 회원을 선택해주세요.');
			history.back();
		</script>
		<%
		return;
	}
	
	for (String id : value) {
		System.out.println(id);
		dao.deleteById(id);
		
	}
	%>
	<script>
		alert('탈퇴 되었습니다.');
	</script>
	<%
	response.sendRedirect("memberListAdmin.jsp");
	%>
