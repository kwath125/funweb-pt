<%@page import="exam.dao.BoardDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");

	String pageNum = request.getParameter("pageNum");
%>

<jsp:useBean id="vo" class="exam.domain.BoardVo"/>
<jsp:setProperty property="*" name="vo"/>

<%
	// ip주소 regDate 설정
	vo.setIp(request.getRemoteAddr());
	vo.setRegDate(LocalDateTime.now());
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 답글 insert
	dao.replyInsert(vo);
	
	// 이동 notice.jsp
	response.sendRedirect("notice.jsp?pageNum=" + pageNum);
%>