<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="exam.domain.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>adminList</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
<!-- Header -->
</head>

<body>
	
	<div id="top-menu">
		<%-- top 영역  include top.jsp --%>
		<jsp:include page="/include/top.jsp" />
	</div>

		<div id="wrapper">
			<div id="page" class="container">


<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	
	if (id == null || !id.equals("admin")) { // id.equals("admin") == false
		response.sendRedirect("/index.jsp");
		return;
	}
	
	
	// 회원 정보 있을 경우 페이지 생성
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null) {
		strPageNum = "1";
	}
	
	// 페이지 번호
	int pageNum = Integer.parseInt(strPageNum);
	
	// 한페이지에 호출되는 회원 정보
	int pageSize = 10;
	
	// 시작행번호
	int startRow = (pageNum - 1) * pageSize + 1;
%>
<%
	//멤버 정보 가져오기
	// DB객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	List<MemberVo> list = dao.getMembers();
%>
	<div class="container">
	<div class="row">
	
	<div class="col-md-3 col-lg-3">
	<%--  관리 항목 영역  include board_submenu_admin.jsp --%>
	<jsp:include page="/include/board_submenu_admin.jsp" />
	</div> 
	
	<div class="col-md-9 col-lg-9 table-responsive" style="margin-top : 20px;">
	<h1>전체 회원목록</h1>
	<hr>
	<form action="memberDeleteAdmin.jsp">
	<table class="table table-striped" id="adminTable">
	<tr>
		<th>선택</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
		<th>이메일</th>
		<th>가입일자</th>
		<th>회원 정보 수정</th>
	</tr>
	<%
	if(list.size() > 0) { // 회원정보가 있는지 확인
		for (MemberVo vo : list) {
			// 날짜 변환
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			LocalDateTime dateTime = vo.getRegDate();
			String strRegDate = dateTime.format(formatter);
			%>
			<tr>
				<td><input type="checkbox" id="selectedid<%=vo.getId()%>" name="selectedid" value=<%=vo.getId() %>>
				<label for="selectedid<%=vo.getId()%>"></label>
				</td>
				<td><%=vo.getId() %></td>
				<td><%=vo.getPasswd() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getAge() %></td>
				<td><%=vo.getGender() %></td>
				<td><%=vo.getEmail() %></td>
				<td><%=strRegDate %></td>
				<td><input type="button" value="수정하기" onclick="location.href='memberUpdateAdmin.jsp?id=<%=vo.getId() %>'" class="adminInput"></td>
			</tr>
			<%
		} // for
	} else {
		%>
		<tr>
			<td>등록된 회원이 없습니다.</td>
		</tr>
		<%
	}
	%>
	</table>
		<button type="button" class="adminButton" onclick="location.href='/index.jsp'">메인화면</button>
		<button type="submit" class="adminButton">삭제</button>
	</form>
	</div>
	</div>
	</div>
	<div style="text-align: center;">
	<%
		if(list.size()>0){
			int pageCount = list.size() / pageSize + (list.size() % pageSize == 0 ? 0 :1);
			
			//페이지 블록수 설정
			int pageBlock = 1;
			
			int startPage = ((pageNum - 1)/ pageBlock) * pageBlock+1;
			
			// 끝페이지 번호 endPage구하기
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			// 이전 버튼 출력
			if(startPage>pageBlock){
			%>
			<a href="list.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
			<%
			}
			// 페이지 블록 
			for(int i= startPage; i<=endPage; i++){
			%>
			<a href="list.jsp?pageNum<%=i %>">
			<%
			if(i == pageNum){
				%> <span style="font-weight: bold;">[<%=i %>]</span><%
			}else{
				%><%=i %><% 
			}
			%>
			</a>
			<%
		}
			// 다음 버튼 출력
			if(startPage < pageBlock){
				%>
				<a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
				<%
			}
		}//if
	%>
	</div>
	</div>
	</div>

	<jsp:include page="/include/bottom.jsp" />
			<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/jquery.scrolly.min.js"></script>
			<script src="/assets/js/jquery.scrollex.min.js"></script>
			<script src="/assets/js/skel.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>
			<script src="/assets/js/bootstrap.js"></script>
			<script src="/assets/js/jquery-3.5.1.js"></script>
			
</body>
</html>




