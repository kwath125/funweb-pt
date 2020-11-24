<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- post 파라미터값 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="exam.domain.MemberVo"/>
<jsp:setProperty property="*" name="vo"/>

<% MemberDao dao = MemberDao.getInstance(); %>

<%
dao.update(vo); 
String id = vo.getId();

//수정 완료 후 글목록으로 이동 
response.sendRedirect("/admin/memberListAdmin.jsp?id=" + id); 
%>





