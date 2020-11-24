<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@page import="exam.dao.MemberDao"%>
<%@page import="exam.domain.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%
MemberDao dao = MemberDao.getInstance();
//세션에 저장된 아이디를 가져와서
//그 아이디 해당하는 회원정보를 가져온다.
String id = request.getParameter("id");
MemberVo vo = dao.getMemberById(id);
System.out.println("vo=" + vo);

%>
	<h1>회원수정</h1>
	<hr>
	
	<form name="frm" action="a_memberUpdatePro.jsp" method="post" onsubmit="return check()">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="<%=vo.getId() %>" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" value="<%=vo.getPasswd() %>"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			
			<tr>
				<th>가입일</th>
				<td><input type="text" name="regdate" value="<%=vo.getRegDate() %>" readonly></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="<%=vo.getEmail() %>"></td>
				
			</tr>
			<tr>
			<tr>
				<th>주소</th>
				<td><textarea name="address" cols="20" rows="13"><%=vo.getAddress() %></textarea></td>
			</tr>
			<tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="<%=vo.getTel() %>"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정완료"onclick="location.href = 'a_memberUpdatePro.jsp'"> 
				<input type="button" value="회원목록" onclick="location.href = 'adminpage.jsp'"></td>
			</tr>
		</table>
	</form>


</body>
</html>