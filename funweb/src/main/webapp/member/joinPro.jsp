<%@page import="exam.dao.MemberDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- post 파라미터 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- 액션태그 vo 객체 생성 --%>
<jsp:useBean id="vo" class="exam.domain.MemberVo" />

<%-- 액션태그 setProperty 폼 -> vo에 저장 --%>
<jsp:setProperty property="*" name="vo"/>

<%-- regDate 가입날짜 생성해서 넣기 --%>
<% vo.setRegDate(LocalDateTime.now()); %>

<%-- DB객체 가져오기 --%>
<% MemberDao dao = MemberDao.getInstance(); %>

<%-- 회원가입 메소드 호출 --%>
<% dao.insert(vo); %>

<%-- 이동 login.jsp --%>
<% response.sendRedirect("login.jsp"); %>


