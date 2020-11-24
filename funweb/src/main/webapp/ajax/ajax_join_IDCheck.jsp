<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");

	if (id == null || id.length() == 0) {
		return;
	}

	MemberDao dao = MemberDao.getInstance();
	
	boolean isIdDup = dao.isIdDuplicated(id);
	//out.println(isIdDup);
	
	Map<String, Object> map = new HashMap<>();
	map.put("isIdDup", isIdDup);
	map.put("name", "홍길동");
	map.put("age", 22);

	Gson gson = new Gson();
	String strJson = gson.toJson(map);
	out.println(strJson);
%>
<%//=isIdDup %>





