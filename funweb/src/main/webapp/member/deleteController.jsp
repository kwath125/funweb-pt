<%-- <%@page import="exam.dao.MemberDaoAdmin"%>
<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String adminId = (String) session.getAttribute("id");
	
	if (adminId.equals("admin")) {
		
		String[] memberid = request.getParameterValues("userid");	
		
		for (int i=0; i<memberid.length; i++){
			System.out.println(memberid[i]);
		}
		
		MemberDaoAdmin memberDaoAdmin = MemberDaoAdmin.getInstance();
		memberDaoAdmin.deleteMembers(memberid);
		response.sendRedirect("list.jsp");
		
	} else {
		%>
		<script>
			alert('권한이 없습니다.');
			location.href='/member/list.jsp';
		</script>
		<%
	}
	 %>

	

		

 --%>