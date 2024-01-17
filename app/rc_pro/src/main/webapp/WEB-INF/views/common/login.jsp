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
	<link href="assets/css/sign-in.css" rel="stylesheet">
</head>

    
		<main class="form-signin">
				<form method="post" action="${contextPath }/login" style="width: 350px; margin:auto; text-align:center;" >
					<h1 class="h3 mb-3 fw-normal">로그인</h1>
					<fieldset>
						<div class="form-group">
							<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력해주세요.">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="user_passwd" name="user_passwd" placeholder="비밀번호를 입력해주세요.">
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="remember-me">자동 로그인
							</label>
						</div>
						<div>
							<button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
						</div>
					</fieldset>
					<fieldset>
						<h6 class="text-muted"><c:out value="${error}"/></h6>
						<h6 class="text-muted"><c:out value="${logout}"/></h6>
					</fieldset>
					<sec:csrfInput/>
				</form>
				 
				<div style="width: 350px; margin:auto;text-align: center;">
					<hr>
					<button class="btn btn-secondary btn-outline-Dark" onclick="window.location.href='/rc_pro/signin';">회원가입</button>
					<button class="btn btn-secondary btn-outline-Dark" onclick="window.location.href='/rc_pro/findidpw';">아이디/비밀번호 찾기</button>
					<hr>
					<button class="btn btn-secondary btn-outline-Dark" onclick="window.location.href='/rc_pro/';">홈으로</button>
				</div>
		</main>
    </body>
</html>
