<%@page import="exam.dao.MemberDao"%>
<%@page import="exam.domain.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp로 이동
	if (id == null) {
		response.sendRedirect("/member/login.jsp");
		return;
	}
	
	// post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");
	
	// MemberVo 객체 생성
	MemberVo vo = new MemberVo();
	
	// 파라미터 가져와서 vo객체에 설정
	vo.setId(request.getParameter("id"));
	System.out.println(id);
	vo.setPasswd(request.getParameter("passwd"));
	vo.setName(request.getParameter("name"));
	vo.setAge(Integer.parseInt(request.getParameter("age")));
	vo.setGender(request.getParameter("gender"));
	vo.setEmail(request.getParameter("email"));
	
	System.out.println(vo);
	
	// 싱글톤 dao 객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	// 회원정보 수정하기
	int rowCount = dao.update(vo);
	System.out.println(rowCount);
	
	if (rowCount > 0) {
		%>
		<script>
			alert('수정 성공');
			location.href = '/index.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			alert('수정 실패\n다시 시도하세요...');
			history.back();
		</script>
		<%
	}
%>





