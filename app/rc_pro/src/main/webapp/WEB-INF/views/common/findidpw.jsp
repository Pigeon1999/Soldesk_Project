<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="kr" data-bs-theme="auto">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<head><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<meta charset="utf-8">
	<title>회원가입 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/signup.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>    
	<div class="container">
		<div class="screen">
			<div class="screen__content">
				<form class="login" style="display: block;" id="findid" method="post" action="${contextPath }/findid">
					<h1>아이디 찾기</h1>
					<div class="login__field">
						<label class="login__inputcontent">이름 : </label>
				    	<input type="text" class="login__inputname" name="user_name"  id="user_name" required/>
					</div>
					<div class="login__field">
						<label class="login__inputidlabel">이메일 : </label>
						<input type="text" class="login__input" name="user_email" id="user_email" required>
					</div>
					<div class="btn-toolbar">
						<button class="button login__submit" type="submit" style="width: 125px;" name="findidbtn" id="findidbtn">아이디 찾기</button>
						<button class="button login__submit" type="button" style="width: 100px;" name="closebtn" onclick="window.close();">창 닫기</button>
					</div>
					<button class="button login__submit" type="button" style="width: 150px;" name="findpwbtn1" id="findpwbtn1">비밀번호 찾기</button>
					<sec:csrfInput/>
				</form>
				<form class="login" style="display: none;" id="findpw" method="post" action="${contextPath }/findpw">
					<h1>비밀번호 찾기</h1>
					<div class="login__field">
						<label class="login__inputcontent">이름 : </label>
				    	<input type="text" class="login__inputname" name="user_name"  id="user_name" required/>
					</div>
					<div class="login__field btn-group">
						<label class="login__inputidlabel">아이디 : </label>
						<input type="text" class="login__inputid" id="user_id" name="user_id" required>
					</div>
					<div class="btn-toolbar">
						<button class="button login__submit" type="submit" style="width: 150px;" name="findpwbtn" id="findpwbtn">비밀번호 찾기</button>
						<button class="button login__submit" type="button" style="width: 100px;" name="closebtn" onclick="window.close();">창 닫기</button>
					</div>
					<button class="button login__submit" type="button" style="width: 125px;" name="findidbtn1" id="findidbtn1">아이디 찾기</button>
					<sec:csrfInput/>
				</form>
			</div> <!-- screen content div-end -->
			<div class="screen__background">
				<span class="screen__background__shape screen__background__shape4"></span>
				<span class="screen__background__shape screen__background__shape3"></span>    
				<span class="screen__background__shape screen__background__shape2"></span>
				<span class="screen__background__shape screen__background__shape1"></span>
			</div>    <!--screen__background div-end  -->
		</div><!-- screen div-end -->
	</div><!--container div-end  -->
</body>
	<script>
	
		var myCsrfHeaderName = "${_csrf.headerName}" ;
		var myCsrfToken = "${_csrf.token}" ;
		$(document).ajaxSend(function(e, xhr){
			xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken) ;
				
		});
		
		var result = '<c:out value="${result}"/>';
		if(result == "fail"){
			alert("일치하는 아이디가 없습니다.");
		}else if(result.length != 0){
			alert("이름과 이메일이 일치하는 아이디 : " + result);
			window.close();
		}
		
		var pw = '<c:out value="${pw}"/>';
		if(pw == "fail"){
			alert("이름과 아이디에 일치하는 계정이 없습니다.");
		}else if(pw.length != 0){
			alert("임시 비밀번호 : " + pw + "입니다");
			alert("반드시 비밀번호를 변경해주세요.");
			window.close();
		}
		
		$("#findpwbtn1").on("click",function(){
			
			var findid = document.getElementById("findid");
			var findpw = document.getElementById("findpw");
			
			findid.style.display = "none";
			findpw.style.display = "block";
		});
	
		$("#findidbtn1").on("click",function(){
			
			var findid = document.getElementById("findid");
			var findpw = document.getElementById("findpw");
			
			findid.style.display = "block";
			findpw.style.display = "none";
		});
		
		
	</script>
</html>
