<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="region_id" value="${pagingCreator.boardPaging.region_id }" />

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>리컴에 오신것을 환영합니다.</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Variables CSS Files. Uncomment your preferred color scheme -->
  <link href="assets/css/variables.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
</head>

<body>

  <header>
	  <div id="header" class="header fixed-top" data-scrollto-offset="0">
	    <div class="container-fluid d-flex align-items-center justify-content-between">
	
	      <a href="#" class="logo d-flex align-items-center scrollto me-auto me-lg-0">
	        <h1>리컴<span>.</span></h1>
	      </a>
	
	      <a class="logo d-flex align-items-center scrollto me-auto me-lg-0">
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
	      </a>
		
	      <nav id="navbar" class="navbar">
	        <ul>	
	          <li class="dropdown megamenu"><a href="#"><span>지역 선택</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
	            <ul id="region">
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
	      </nav>
	
		  <div>
		  	<sec:authorize access="isAuthenticated()">
			    <div style="display: flex; align-items: center;">
				    <form id="logoutForm" role="form" action="${contextPath}/main" method="post" style="padding-right: 10px;">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        <fieldset>
				            <a onclick="document.getElementById('logoutForm').submit(); return false;" class="btn-getstarted scrollto">Logout</a>
				        </fieldset>
				    </form>
				    <a class="btn-getstarted scrollto" href="">MyPage</a>
				</div>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
		      	<a class="btn-getstarted scrollto" href="/rc_pro/login">Login</a>
		      	<a class="btn-getstarted scrollto" href="/rc_pro/signin">Sign In</a>
		    </sec:authorize>
		  </div>
	    </div>
	  </div>
  </header>
	  
	  <section id="hero-animated" class="hero-animated d-flex align-items-center">
	    <div class="container d-flex flex-column justify-content-center align-items-center text-center position-relative" data-aos="zoom-out">
	      <h2>리컴 메인화면</h2>
	      <p>hello world!</p>
	    </div>
	  </section>
	  
	  <div>
	  	<!-- 게시판 글 -->
	  	<div id="post">
	  		<!-- 자유 게시판 -->
	  		<div id="free_post">
	  			<div id="page-wrapper">
 					<div class="row">
						<div class="col-lg-12">
							<h3 class="page-header">자유게시판</h3>
						</div><%-- /.col-lg-12 --%>
					</div><%-- /.row --%>
	  			</div>
	  			
	  			<table class="table table-striped table-bordered table-hover"
 						style="width:100%;text-align:center;" >
 					<thead>
 						<tr>
							<th style="text-align:center;">인기글</th>
						</tr>
					</thead>
 					<tbody>
 					<c:forEach items="${freePostInfo}" var="FreePost">
 						<c:if test="${FreePost.post_hide == 0 and FreePost.region_id == region_id}">
 							<tr>
								<td style="text-align:left;">
									<a href="{대충 게시글로 간다는 내용}">
									    <c:out value="${FreePost.post_title}" />
									    <span style="float:right;">
									        <fmt:formatDate pattern="MM/dd hh:mm" value="${FreePost.post_date}" />
									    </span>
									</a>
								</td>
 							</tr>
 						</c:if>
 					</c:forEach>
 					</tbody>
				</table>	  			
	  		</div>
	  		<!-- 홍보 게시판 -->
	  		<div id="promotion_post">
	  			<div id="page-wrapper">
 					<div class="row">
						<div class="col-lg-12">
							<h3 class="page-header">홍보게시판</h3>
						</div><%-- /.col-lg-12 --%>
					</div><%-- /.row --%>
	  			</div>
	  			
	  				  			<table class="table table-striped table-bordered table-hover"
 						style="width:100%;text-align:center;" >
 					<thead>
 						<tr>
							<th style="text-align:center;">인기글</th>
						</tr>
					</thead>
 					<tbody>
 					<c:forEach items="${promtionPostInfo}" var="PromotionPost">
 						<c:if test="${PromotionPost.post_hide == 0 and PromotionPost.region_id == region_id}">
 							<tr>
								<td style="text-align:left;">
									<a href="{대충 게시글로 간다는 내용}">
									    <c:out value="${PromotionPost.post_title}" />
									    <span style="float:right;">
									        <fmt:formatDate pattern="MM/dd hh:mm" value="${PromotionPost.post_date}" />
									    </span>
									</a>
								</td>
 							</tr>
 						</c:if>
 					</c:forEach>
 					</tbody>
				</table>
				
	  		</div>
	  	</div>
	  	<!-- 뉴스 -->
	  	<div id="news">
	  			<div id="page-wrapper">
 					<div class="row">
						<div class="col-lg-12">
							<h3 class="page-header">뉴스</h3>
						</div><%-- /.col-lg-12 --%>
					</div><%-- /.row --%>
	  			</div>
	  			
	  			<table class="table table-striped table-bordered table-hover"
 						style="width:100%;text-align:center;" >
 					<thead>
 						<tr>
							<th style="text-align:center;">인기글</th>
						</tr>
					</thead>
 					<tbody>
	 					<c:forEach items="${newsPostInfo}" var="NewsPost">
							<c:if test="${NewsPost.post_hide == 0 and NewsPost.region_id == region_id}">
							    <tr>
							        <td style="text-align:left;">
							            <a href="{대충 게시글로 간다는 내용}">
							                <img src="이미지_경로" alt="대체 텍스트">
							                <span style="display: inline-block; vertical-align: top; margin-left: 10px; width: calc(100% - 120px);">
							                    <span style="font-size: 16px; font-weight: bold;">
							                        <c:out value="${NewsPost.post_title}" />
							                    </span><br><br>
							                    <c:out value="${NewsPost.post_content}" />
							                </span>
							                <span style="float:right; text-align: right; width: 100px;">
							                    <fmt:formatDate pattern="MM/dd hh:mm" value="${NewsPost.post_date}"/>
							                </span>
							            </a>
							        </td>
							    </tr>
							</c:if>
	 					</c:forEach>
 					</tbody>
				</table>
	  	</div>
	  </div>
	  <style>
	  	#free_post {
	  		float:left;
	  		width:50%;
	  		padding:2px;
	  	}
	  	
	  	#promotion_post {
	  		float:right;
	  		width:50%;
	  		padding:2px;
	  	}
	  	#news_post {
	  		padding:2px;
	  	}  	
	  </style>

<%@ include file="../myinclude/myfooter.jsp" %>   	  
	  