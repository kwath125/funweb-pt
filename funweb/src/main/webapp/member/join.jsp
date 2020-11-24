<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Join</title>
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
			<div class="container">
				<div class="box">
					<form id="join" action="joinPro.jsp" method="post" name="frm">
						<h2>회원가입</h2>
						<label>아이디</label> <input name="id" type="text" class="id"><input type="button" value="ID중복확인" class="dup" onclick="winopen()" style="margin-left: 5px !important;"><span id="idDupMessage"></span><br> 
						<label>비밀번호 </label> <input name="passwd" type="password" class="pass" id="passwd"><br> 
						<label>비밀번호 확인 </label> <input name="passwd2" type="password" class="pass" id="passwd2"><br>
						<span id="passwdMessage"></span><br>
						<label>이름 </label> <input name="name" type="text" class="nick"><br>
						<label>나이 </label> <input name="age" type="number"><br>
						<label>성별 </label> 
							<input type="radio" name="gender" value="남" >남자
						    <input type="radio" name="gender" value="여" >여자<br> 
						<label>이메일</label> <input name="email" type="email" class="email"><br>
						<label>이메일 확인</label> <input name="email2" type="email" class="email"><br>
						<div id="buttons">
							<input type="submit" value="회원가입" class="submit"> 
							<input type="reset" value="리셋" class="cancel">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/include/bottom.jsp" />
	
	<!-- Scripts -->
	<script src="/assets/js/jquery-3.5.1.js"></script>	
	
<script>
	$('input[name="id"]').keyup(function (event) {
		var id = $(this).val();
		
		$.ajax({
			url: '/ajax/ajax_join_IDCheck.jsp',
			data: { id: id },
			success: function (data) {
				console.log(data.isIdDup);
				console.log(data.name);
				console.log(data.age);
				
				showIdDupMessage(data);
				
		
			}
		});
	});
	
	function showIdDupMessage(data) {
		if (data.isIdDup) {
			$('span#idDupMessage').html('이미 사용중인 아이디 입니다.').css('color', 'red');
		} else {
			$('span#idDupMessage').html('사용 가능한 아이디 입니다.').css('color', 'green');
		}
	}

	function winopen() {
		var id = document.frm.id.value;
		console.log('id = ' + id);
		
		if (id == '') {
			alert('아이디를 입력하세요');
			document.frm.id.focus();
			return;
		}		
		
		// 새창 열어서 jsp요청 	window.open()
		open('join_IDCheck.jsp?id=' + id, 'dupCheck', 'width=400,height=200');
		
		
	}
	
	// 패스워드 일치여부 확인
	var passwd = document.getElementById('passwd');
	var passwd2 = document.getElementById('passwd2');
	var spanMessage = document.getElementById('passwdMessage');
	
	passwd2.onkeyup = function() {
		console.log('타이핑 중');
	
		if (passwd.value != passwd2.value) {
			spanMessage.style.color = "red";
			spanMessage.innerHTML = '비밀번호가 일치하지 않습니다.'
		} else {
			spanMessage.style.color = "green";
			spanMessage.innerHTML = '비밀번호 일치.';
		}
		
	};
	
	
	
</script>

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

