<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Login</title><!-- 수정 -->
 <!-- Bootstrap Core CSS -->
 <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!-- 수정 -->
 <!-- MetisMenu CSS -->
 <link href="${contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet"><!-- 수정 -->
 <!-- Custom CSS -->
 <link href="${contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet"><!-- 수정 -->
 <!-- Custom Fonts -->
 <link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"
 type="text/css"> <!-- 수정 -->
</head>
<body>
 <div class="container">
 <div class="row">
 <div class="col-md-4 col-md-offset-4">
 <div class="login-panel panel panel-default" style="margin-top: 10%"><!-- 추가 -->
 <div class="panel-heading">
 <h2 class="panel-title">Please Sign In</h2>
 </div>
 <div class="panel-body">
 <div>
 <h5 class="text-muted"><c:out value="${error}"/></h5>
 </div>
<form role="form" method='post' action="${contextPath}/login"><!-- method, action 속성 추가 -->
 <fieldset>
 <h6 class="text-muted"><c:out value="${error}"/></h6>
 <h6 class="text-muted"><c:out value="${logout}"/></h6>
 </fieldset>
 <fieldset>
 <div class="form-group">
 <input class="form-control" name="username" id="username" type="text"
  placeholder="Username 입력" required autofocus>
 </div>
<div class="form-group">
 <input class="form-control" name="password" id="password" type="password"
 placeholder="Password 입력" required >
 </div>
 <div class="checkbox">
 <label>
 <input name="remember-me" type="checkbox">자동로그인(Remember Me)
 </label>
 </div>
 <div>
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 </div>
 <div>
 <button type='submit' class="btn btn-lg btn-success btn-block">Sign in</button>
 </div>
 </fieldset>
 <fieldset>
 <hr>
<h6 class="text-muted text-center"><c:out value="${normal}"/></h6>
 </fieldset>
 </form>
 </div>
 </div>
 </div>
 </div>
 </div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
 <script src="${contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
 <script src="${contextPath}/resources/dist/js/sb-admin-2.js"></script>
</body>
</html>
