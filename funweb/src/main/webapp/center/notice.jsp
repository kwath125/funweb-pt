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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://kit.fontawesome.com/f31fb562ea.js" crossorigin="anonymous"></script>
<title>notice</title>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
<!-- Header -->
</head>
<%
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
		
				<!-- Main -->
				<section>
					<article>
						<h1 style="padding-left: 15px !important;">공개 게시판 [전체글갯수: <%=totalCount %>]</h1>
						
						<div class="table-responsive col-md-12">	
							<table class="table table-striped">
								<tr>
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
										<tr onclick="location.href='content.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'">
											<td><%=vo.getNum() %></td>
											<td style="text-align:left !important; cursor: pointer;">
												<%
												if (vo.getReLev() > 0) {
													%>
													<img src="/images/center/level.gif" width="<%=vo.getReLev() * 10 %>" height="13">
													<img src="/images/center/re.gif">
													<%
												}
												%>
												<%=vo.getSubject() %>
											</td>
											<td><%=vo.getName() %></td>
											<td><%=strRegDate %></td>
											<td><%=vo.getReadcount() %></td>
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
	
	<div class="col-md-6"></div>
		<div id="table_search" class="col-md-5 col-md-offset-1" >
			<form action="notice.jsp" method="get" >
				<select name="category" class="category">
					<option value="content" class="" <% if (category.equals("content")) { %>selected<% } %>>글내용</option>
					<option value="subject" <% if (category.equals("subject")) { %>selected<% } %>>글제목</option>
					<option value="name" <% if (category.equals("name")) { %>selected<% } %>>작성자</option>
				</select>
				<input type="text" name="search" value="<%=search %>" class="searchbox"> 
				<input type="submit" value="검색" class="button-search">
			</form>
			
			<input type="button" value="글쓰기" class="button" onclick="location.href='writeForm.jsp?pageNum=<%=pageNum %>'">
		</div>
	
	</article>
	</section>
	</div>
	
	<div class="clear"></div>
	
	<div id="page_control">
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
				<a href="notice.jsp?pageNum=<%=startPage - pageBlock %>&category=<%=category %>&search=<%=search %>">[이전]</a>
				<%
			}
					
			
			// 페이지블록 내에서의 시작페이지부터 끝페이지까지 번호출력
			for (int i=startPage; i<=endPage; i++) {
				%>
				<a href="notice.jsp?pageNum=<%=i %>&category=<%=category %>&search=<%=search %>">
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
				<a href="notice.jsp?pageNum=<%=startPage + pageBlock %>&category=<%=category %>&search=<%=search %>">[다음]</a>
				<%
			}
		} // if
	%>
	</div>
</div>

	<%-- bottom 영역  include bottom.jsp --%>
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

