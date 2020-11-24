<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>Introduction</title>
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
			<div>
				<div class="col-md-6 col-sm-12">
					<h2>여!놀자란?</h2>
						<p>여!놀자는 여행을 좋아하는 사람들과 다양한 정보, 여행후기 등을 공유하는 커뮤니티 사이트 입니다.</p>
				</div>
				<div class="col-md-6 col-sm-12">
					<img src="/images/about/about1.jpg" style="width: 100%;">
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
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