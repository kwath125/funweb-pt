<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 가져오기
	String id = (String) session.getAttribute("id");
	// 세션 없으면 login.jsp로 이동
	if (id == null){
		response.sendRedirect("/member/login.jsp");
		return;
	}

	// "passwd 파라미터"
	String passwd = request.getParameter("passwd");

	// DB객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	// -1: 아이디 없음, 0: 비밀번호 틀림, 1: 아이디 비밀번호 일치
	int check = dao.userCheck(id, passwd);
	
	if (check == 1) { // 아이디와 비밀번호 일치 하면 -> 1
		// 테이블에서 행 삭제
		dao.deleteById(id);
		
		// 로그아웃
		session.invalidate();
		%>
		<script>
			alert('삭제되었습니다.')
			location.href = 'login.jsp'
		</script>
		<%
	} else if (check == 0) { // 비밀번호 틀림
		%>	
		<script>
	 		alert('비밀번호가 일치하지 않습니다.')
	 		history.back();
	 	</script>
	 	<%
	}
	 	
%>
