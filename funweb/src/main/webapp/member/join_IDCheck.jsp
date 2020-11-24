<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// "id" 파라미터 가져오기 
	String id = request.getParameter("id");

	// DB객체 준비하기
	MemberDao dao = MemberDao.getInstance();
	
	if (dao.isIdDuplicated(id)) { // 중복
		%>
		<p>아이디 중복, 사용중인 ID입니다.</p>
		<%
	} else { // 중복아님
		%>
		<p>사용가능한 ID입니다.
			<input type="button" value="사용" onclick="result()">
		</p>
		<%		
	}

%>

<form action="join_IDCheck.jsp" method="post" name="cfrm">
	<input type="text" name="id" value="<%=id %> ">
	<input type="submit" value="중복확인">
</form>

<script>
	function result() {
		// 현재창(자식창)의 id값을 부모창(join.jsp)의 id 입력상자에 넣기
		opener.document.frm.id.value = cfrm.id.value;
		close(); // window.close(); 현재창 닫기
	}

</script>
</body>
</html>