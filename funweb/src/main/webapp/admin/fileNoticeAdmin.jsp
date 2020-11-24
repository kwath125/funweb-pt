<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>fileNoticeAdmin</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
<!-- Header -->
</head>
<%
String id = (String)session.getAttribute("id");
// 세션값 없으면 로그인페이지 이동
if (!id.equals("admin")){
	%>
	<script>
		alert('권한이 없습니다.')
	</script>
	<%
	response.sendRedirect("/member/login.jsp");
	return;
}


	//검색어 관련 파라미터 가져오기. 없으면 null 리턴
	String category = request.getParameter("category"); // 검색유형
	String search = request.getParameter("search"); // 검색어
	
	category = (category == null) ? "" : category;
	search = (search == null) ? "" : search;
	
	System.out.println("category = " + category);
	System.out.println("search = " + search);

	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 전체 글갯수
	int totalCount = dao.getTotalCount(category, search);
	
	// 사용자가 요청한 페이지번호 파라미터 가져오기
	String strPageNum = request.getParameter("pageNum");
	
	if (strPageNum == null || strPageNum.equals("")) {
		strPageNum = "1";
	}
	//strPageNum = (strPageNum == null) ? "1" : strPageNum;
	
	// 문자열 페이지번호를 숫자로 변환
	int pageNum = Integer.parseInt(strPageNum);
	
	// 한 페이지에 15개씩 가져오기
	int pageSize = 15;
	// 시작행 인덱스번호 구하기(수식)
	int startRow = (pageNum-1) * pageSize;
		
	// 원하는 페이지의 글을 가져오는 메소드
	List<BoardVo> list = null;
	if (totalCount > 0) {
		list = dao.getBoards(startRow, pageSize, category, search);
	}
%>
<body>

	<div id="top-menu">
		<%-- top 영역  include top.jsp --%>
		<jsp:include page="/include/top.jsp" />
	</div>

		<div id="wrapper">
			<div id="page" class="container">

	<div class="container">
	<div class="row">

	<div class="col-md-3">
	<%--  관리 항목 영역  include board_submenu_admin.jsp --%>
	<jsp:include page="/include/board_submenu_admin.jsp"/>
	</div>


	<div class="col-md-9 mt-sm-20" style="margin-top : 20px;">

	<h1>파일 게시판 [전체글갯수: <%=totalCount %>]</h1>
	<form action="fileNoticeAdminDelete.jsp" method="post">	
	
	<div class="table-responsive col-md-12">	
	<table class="table table-striped">
		<tr>
		<%
				if (id != null && id.equals("admin")) {
					%>
					<th class="select">선택</th>
					<input type=hidden name="pageNum" value="<%=pageNum %>">
					<%
				}
				%>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	<%
		if (totalCount > 0) {
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			
			for (BoardVo vo : list) {
				LocalDateTime dateTime = vo.getRegDate();
				String strRegDate = dateTime.format(formatter);
				%>
				<tr>
				<td>
					<input id="<%=vo.getNum() %>" type="checkbox" name="selected" value="<%=vo.getNum() %>">
					<label for="<%=vo.getNum() %>"> </label>
				</td>
				<td><%=vo.getNum() %></td>	
					<td style="text-align:left !important; cursor: pointer;" onclick="location.href='fileContent.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'">
						<%
						if (vo.getReLev() > 0) {
							%>
							<img src="/images/center/level.gif" width="<%=vo.getReLev() * 10 %>" height="13">
							<img src="/images/center/re.gif">
							<%}%>
						<%=vo.getSubject()%>
					</td>	
					<td onclick="location.href='fileContent.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'"><%=vo.getName() %></td>
					<td onclick="location.href='fileContent.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'"><%=strRegDate %></td>
					<td onclick="location.href='fileContent.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'"><%=vo.getReadcount() %></td>
				</tr>
				<%
			}
		} else {
			%>
			<tr>
				<td colspan="5">게시판 글없음</td>
			</tr>
			<%
		}
		%>
	</table>
	</div>
	<button class="adminDeleteButton" type="submit" id="delete-button">삭제</button>
</form>

	<div id="table_search">
		<form action="notice.jsp" method="get">
		<select name="category" class="category">
			<option value="content" <% if (category.equals("content")) { %>selected<% } %>>글내용</option>
			<option value="subject" <% if (category.equals("subject")) { %>selected<% } %>>글제목</option>
			<option value="name" <% if (category.equals("name")) { %>selected<% } %>>작성자</option>
		</select>
		<input type="text" name="search" value="<%=search %>" class="searchbox"> 
		<input type="submit" value="검색" class="button-search">
		</form>
		
	</div>
	</div>
	</div>
	</div>
	<div class="col-md-3"></div>
	<div id="page_control" class="col-md-9" style="text-align:center;">
	<%
		if (totalCount > 0) {
			// 총 페이지 수 구하기
			// 글50개. 한화면에보여줄글 10개 -> 50/10 = 5페이지
			// 글55개. 한화면에보여줄글 10개 -> 55/10 = 5 + 1페이지(나머지 있으면) -> 6페이지
			//int pageCount = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);
			int pageCount = totalCount / pageSize;
			if (totalCount % pageSize > 0) {
				pageCount += 1;
			}
			
			// 화면에 보여줄 페이지번호의 갯수 설정
			int pageBlock = 10;
			
			// 페이지블록의 시작페이지 구하기!
			// 1~10   11~20   21~30
			
			//  1~10 ->  1
			// 11~20 -> 11
			// 21~30 -> 21
			// 31~40
			
			// 페이지 블록의 시작페이지
			int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			// 페이지 블록의 끝페이지
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			
			// [이전]
			if (startPage > pageBlock) {
				%>
				<a href="fileNoticeAdmin.jsp?pageNum=<%=startPage - pageBlock %>">[이전]</a>
				<%
			}
					
			
			// 페이지블록 내에서의 시작페이지부터 끝페이지까지 번호출력
			for (int i=startPage; i<=endPage; i++) {
				%>
				<a href="fileNoticeAdmin.jsp?pageNum=<%=i %>">
				<%
				if (i == pageNum) {
					%>
					<span style="font-weight: bold; color: red;">[<%=i %>]</span>
					<%
				} else {
					%>
					[<%=i %>]
					<%
				}
				%>
				</a>
				<%
			}
			
			// [다음]
			if (endPage < pageCount) {
				%>
				<a href="fileNoticeAdmin.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a>
				<%
			}
		} // if
	%>
	</div>
	</div>
	</div>

	<jsp:include page="/include/bottom.jsp" />

	<!-- Scripts -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrollex.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/skel.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script src="/assets/js/bootstrap.js"></script>
	<script src="/assets/js/jquery-3.5.1.js"></script>

</body>

</html>