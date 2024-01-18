<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<c:set var="region_id" value="${pagingCreator.boardPaging.region_id }" />

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>게시판 - 지역커뮤니티</title>
  <!-- 
  <meta content="" name="description">
  <meta content="" name="keywords"> -->

  <!-- Favicons -->
  <link href="${contextPath}/assets/img/favicon.png" rel="icon">
  <link href="${contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Variables CSS Files. Uncomment your preferred color scheme -->
  <link href="${contextPath}/assets/css/variables.css" rel="stylesheet">
  <!-- <link href="${contextPath}/css/variables-blue.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/css/variables-green.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/css/variables-orange.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/css/variables-purple.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/css/variables-red.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/css/variables-pink.css" rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <link href="${contextPath}/assets/css/main.css" rel="stylesheet">
  
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- =======================================================
  * Template Name: HeroBiz
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/herobiz-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body id="main">

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top" data-scrollto-offset="0">
    <div class="container-fluid d-flex align-items-center justify-content-between">
      
      <a href="${contextPath}/main?region_id=${region_id}" class="logo d-flex align-items-center scrollto me-auto me-lg-0">
        <h1>RC<span>.</span></h1>
      </a>
      
     <a class="logo d-flex align-items-center scrollto me-auto me-lg-0">
        <h1>
			<c:choose>
				<c:when test="${pagingCreator.boardPaging.region_id == '1'}" >
				  <h1>관철동</h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '2'}" >
				  <h1>청진동</h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '3'}" >
				  <h1>공평동</h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '4'}" >
				  <h1>관수동</h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '5'}" >
				  <h1>인사동</h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '6'}" >
				  <h1>종로2가</h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '7'}" >
				  <h1>삼각동</h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '8'}" >
				  <h1>서린동</h1>
				</c:when>
				<c:otherwise>
				  <h1>관철동</h1>
				</c:otherwise>
			</c:choose>
        </h1>
      </a>
      
      <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown megamenu"><a href="#me"><span>지역선택</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li>
                <a id="region1" href="${contextPath}/main?region_id=1">관철동</a>
                <a id="region2" href="${contextPath}/main?region_id=2">청진동</a>
                <a id="region3" href="${contextPath}/main?region_id=3">공평동</a>
                <a id="region4" href="${contextPath}/main?region_id=4">관수동</a>
              </li>
              <li>
                <a id="region5" href="${contextPath}/main?region_id=5">인사동</a>
                <a id="region6" href="${contextPath}/main?region_id=6">종로2가</a>
                <a id="region7" href="${contextPath}/main?region_id=7">삼각동</a>
                <a id="region8" href="${contextPath}/main?region_id=8">서린동</a>
              </li>
            </ul>
          </li>
	          <li><a class="nav-link scrollto" href="/rc_pro/board/list?category_id=1&region_id=${region_id}">자유 게시판</a></li>
	          <li><a class="nav-link scrollto" href="/rc_pro/board/list?category_id=2&region_id=${region_id}">홍보 게시판</a></li>
	          <li><a class="nav-link scrollto" href="/rc_pro/board/newslist?category_id=3&region_id=${region_id}">뉴스</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle d-none"></i>
      </nav><!-- .navbar -->
		<div>
			<sec:authorize access="isAuthenticated()">
			    <form id="logoutForm" role="form" action="${contextPath}/Gwancheol" method="post">
			    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			    	<fieldset>
			        	<a onclick="document.getElementById('logoutForm').submit(); return false;" class="btn-getstarted scrollto">Logout</a>
			        </fieldset>
			    </form>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
		      	<a class="btn-getstarted scrollto" href="/rc_pro/login">Login</a>
		      	<a class="btn-getstarted scrollto" href="/rc_pro/signin">Sign In</a>
		    </sec:authorize>
		</div>
    </div>
  </header><!-- End Header -->