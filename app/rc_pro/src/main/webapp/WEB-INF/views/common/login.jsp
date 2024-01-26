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
	<title>로그인 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/login.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>    
	<div class="container">
		<div class="screen">
			<div class="screen__content">
				<button class="button login__home" type="button" style="width: 50px;" onclick="window.location.href='/rc_pro/';">&lt;</button>
				<form class="login" method="post" action="${contextPath }/login">
					<div class="login__field">
						<i class="login__icon fas fa-user"></i>
						<input type="text" class="login__input" id="user_id" name="user_id" placeholder="아이디">
					</div>
					<div class="login__field">
						<i class="login__icon fas fa-lock"></i>
						<input type="password" class="login__input" id="user_passwd" name="user_passwd" placeholder="비밀번호">
					</div>
					<fieldset>
						<h6 class="text-muted"><c:out value="${error}"/></h6>
						<h6 class="text-muted"><c:out value="${logout}"/></h6>
					</fieldset>
					<input type="checkbox" name="remember-me">
					<span class="remember__input">자동 로그인</span>
					<div class="btn-toolbar">
						<div class="btn-group" role="group" aria-label="first group" style="width: 100x;">
							<button class="button login__submit" type="submit" style="width: 90px;">
								<span class="button__text">로그인</span>
							</button>
						</div>
						<div class="btn-group" role="group" aria-label="Second group" style="width: 100px;">
							<button class="button login__submit" type="button" style="width: 100px;" id="signupbtn">
							<span class="button__text">회원가입</span>
							</button>
						</div>
							<button class="button login__submit" type="button" style="width: 190px;" id="findidbtn">
								<span class="button__text">아이디,비밀번호 찾기 </span>
							</button>
					</div>
					<sec:csrfInput/>       
				</form>
			</div>
			<div class="screen__background">
				<span class="screen__background__shape screen__background__shape4"></span>
				<span class="screen__background__shape screen__background__shape3"></span>    
				<span class="screen__background__shape screen__background__shape2"></span>
				<span class="screen__background__shape screen__background__shape1"></span>
			</div>    
		</div>
	</div>
	<script>
		$("#signupbtn").on("click",function(){
			window.open("/rc_pro/signin","_blank","width=500, height=900, scrollbars=yes, resizable=no");
		});
		
		$("#findidbtn").on("click",function(){
			window.open("/rc_pro/findidpw","_blank","width=500, height=900, scrollbars=yes, resizable=no");
		});
	</script>
</body>
</html>
