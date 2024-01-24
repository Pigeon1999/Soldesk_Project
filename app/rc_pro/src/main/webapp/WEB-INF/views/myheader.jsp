<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="region_id" value="${pagingCreator.boardPaging.region_id }" />
<c:set var="category_id" value="${pagingCreator.boardPaging.category_id }" />

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
  <link href="${contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Variables CSS Files. Uncomment your preferred color scheme -->
  <link href="${contextPath}/resources/css/variables.css" rel="stylesheet">
  <!-- <link href="${contextPath}/resources/css/variables-blue.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/resources/css/variables-green.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/resources/css/variables-orange.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/resources/css/variables-purple.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/resources/css/variables-red.css" rel="stylesheet"> -->
  <!-- <link href="${contextPath}/resources/css/variables-pink.css" rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <link href="${contextPath}/resources/css/main.css" rel="stylesheet">
  
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

      <a href="index.html" class="logo d-flex align-items-center scrollto me-auto me-lg-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="img/logo.png" alt=""> -->
        <h1>HeroBiz<span>.</span></h1>
      </a>
      
      <div>
      	<c:choose>
				<c:when test="${pagingCreator.boardPaging.region_id == '1'}" >
					<h2>관철동</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '2'}" >
					<h2>삼각동</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '3'}" >
					<h2>서린동</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '4'}" >
					<h2>종로2가</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '5'}" >
					<h2>공평동</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '6'}" >
					<h2>청진동</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '7'}" >
					<h2>관수동</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.region_id == '8'}" >
					<h2>인사동</h2>
				</c:when>
				<c:otherwise>
					<h2>관철동</h2>
				</c:otherwise>
			</c:choose>
      </div>
      
      <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown megamenu"><a href="#me"><span>지역선택</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li id="region">
                <a id="1" href="${contextPath}/board/region_home?region_id=1">관철동</a>
                <a id="2" href="${contextPath}/board/region_home?region_id=2">삼각동</a>
                <a id="3" href="${contextPath}/board/region_home?region_id=3">서린동</a>
                <a id="4" href="${contextPath}/board/region_home?region_id=4">종로2가</a>
              </li>
              <li>
                <a id="5" href="${contextPath}/board/region_home?region_id=5">공평동</a>
                <a id="6" href="${contextPath}/board/region_home?region_id=6">청진동</a>
                <a id="7" href="${contextPath}/board/region_home?region_id=7">관수동</a>
                <a id="8" href="${contextPath}/board/region_home?region_id=8">인사동</a>
              </li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="${contextPath}/board/list?category_id=1&region_id=${region_id}">자유게시판</a></li>
          <li><a class="nav-link scrollto" href="${contextPath}/board/list?category_id=2&region_id=${region_id}">홍보게시판</a></li>
          <li><a class="nav-link scrollto" href="${contextPath}/board/newslist?category_id=3&region_id=${region_id}">뉴스</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle d-none"></i>
      </nav><!-- .navbar -->
		<div>
			<a class="btn-getstarted scrollto" href="/rc_pro/login">Login</a>
			<a class="btn-getstarted scrollto" href="/rc_pro/SignIn">Sign In</a>
		</div>
    </div>
  </header><!-- End Header -->
  
<script>
<%--지역버튼 클릭 이벤트 처리 --%>
$("#region").children('a').on("click", function(){
	if($(this).attr('id') == ${region_id}) { 
		$(this).attr('href','#main') ;
	} 

	//alert($(this).attr('id'));
	
});
</script>