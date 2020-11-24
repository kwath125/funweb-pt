<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Index</title>
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
		<div id="header-wrapper" style="text-align:center;">
		 	<div id="logo">
				<h1>여!놀자</h1>
			</div>
		</div>
		<div id="carousel-example-generic" class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img src="/images/banner.jpg" alt="First slide">
						<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img src="/images/banner1.jpg" alt="Second slide">
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img src="/images/banner2.jpg" alt="Third slide">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
            	<span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="icon-next"></span>
            </a>
		</div>
		<div id="page" class="container" style="text-align: center !important;">
			<div class="col-md-4">
				<div class="image round fit">
					<img src="images/pic01.jpg" alt="" />
					<p>Feugiat sed lorem ipsum magna</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="image round fit">
					<img src="images/pic02.jpg" alt="" />
					<p>Lorem ipsum dolor sit</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="image round fit">
					<img src="images/pic03.jpg" alt="" />
					<p>Animi mollitia optio culpa expedita. Dolorem alias minima culpa repellat. Dolores, fuga maiores ut obcaecati blanditiis, at aperiam doloremque.</p>
				</div>
			</div>
		</div>
	</div>
	
	<%-- bottom 영역  include bottom.jsp --%>
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