<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="region_id" value="${pagingCreator.boardPaging.region_id}" />
 
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body id="main">

  <header>
	  <div id="header" class="header fixed-top" data-scrollto-offset="0">
	    <div class="container-fluid d-flex align-items-center justify-content-between">
	
	      <a href="#" class="logo d-flex align-items-center scrollto me-auto me-lg-0">
	        <h1>RC<span>.</span></h1>
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
				    <form id="logoutForm" role="form" action="${contextPath}/logout" method="post" style="padding-right: 10px;">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        <fieldset>
				            <button onclick="document.getElementById('logoutForm').submit(); return false;" class="btn-getstarted scrollto" style="margin-right:3px;">Logout</button>
				        </fieldset>
				    </form>
				    <input type="hidden" id="user_id" value='<sec:authentication property="principal.username"/>'/>
				    <button class="btn-getstarted scrollto" type="button" id="mypagebtn">MyPage</button>
				</div>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
		      	<a class="btn-getstarted scrollto" href="/rc_pro/login" style="margin-right:3px;">Login</a>
		      	<a class="btn-getstarted scrollto" href="/rc_pro/signin">Sign In</a>
		    </sec:authorize>
		  </div>
	    </div>
	  </div>
  </header>
	  
	  <section id="hero-animated" class="hero-animated d-flex align-items-center">
	    <div class="container d-flex flex-column justify-content-center align-items-center text-center position-relative" data-aos="zoom-out">
	      <img src="img/mainimg.png" width="140%"/>
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
	  			
	  			<table style="width:100%;text-align:center;" >
 					<thead>
 						<tr>
							<th style="text-align:center;">인기글</th>
						</tr>
					</thead>
 					<tbody>
						<c:set var="count" value="0" />
						<c:forEach items="${freePost}" var="FreePost">
						    <c:if test="${FreePost.region_id == region_id}">
						        <c:if test="${count < 5}">
						            <tr>
						                <td style="text-align:left;">
						                    <a href="/rc_pro/board/detail?category_id=1&region_id=${region_id}&post_id=${FreePost.post_id}">
						                        <c:out value="${FreePost.post_title}" />
						                        <span style="float:right;">
						                            <fmt:formatDate pattern="MM/dd hh:mm" value="${FreePost.post_date}" />
						                        </span>
						                    </a>
						                </td>
						            </tr>
						            <c:set var="count" value="${count + 1}" />
						        </c:if>
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
	  			
	  			<table style="width:100%;text-align:center;" >
 					<thead>
 						<tr>
							<th style="text-align:center;">인기글</th>
						</tr>
					</thead>
 					<tbody>
						<c:set var="count" value="0" />
						<c:forEach items="${promotionPost}" var="PromotionPost">
						    <c:if test="${PromotionPost.region_id == region_id}">
						        <c:if test="${count < 5}">
						            <tr>
						                <td style="text-align:left;">
						                    <a href="/rc_pro/board/detail?category_id=2&region_id=${region_id}&post_id=${PromotionPost.post_id}">
						                        <c:out value="${PromotionPost.post_title}" />
						                        <span style="float:right;">
						                            <fmt:formatDate pattern="MM/dd hh:mm" value="${PromotionPost.post_date}" />
						                        </span>
						                    </a>
						                </td>
						            </tr>
						            <c:set var="count" value="${count + 1}" />
						        </c:if>
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
	  			
	  			<table style="width:100%;text-align:center;" >
 					<thead>
 						<tr>
							<th style="text-align:center;">인기글</th>
						</tr>
					</thead>
 					<tbody>
						<c:set var="count" value="0" />
						<c:forEach items="${newsPost}" var="NewsPost">
						    <c:if test="${NewsPost.region_id == region_id}">
						        <c:if test="${count < 5}">
						            <tr>
						                <td style="text-align:left;border-bottom: 1px solid #73685D;">
						                    <a href="/rc_pro/board/detail?category_id=3&region_id=${region_id}&post_id=${NewsPost.post_id}">
						                        <img src="/rc_pro/upload/${NewsPost.post_file}" id="img" style="width:15%;">
						                        <span style="display: inline-block; vertical-align: top; margin-left: 10px; width: calc(100% - 120px); width:75%;">
						                            <span style="font-size: 16px; font-weight: bold;">
						                                <c:out value="${NewsPost.post_title}" />
						                            </span><br><br>
						                            <div id="newscontent">
						                            	<c:out value="${NewsPost.post_content}"/>
						                            </div>
						                        </span>
						                        <span style="float:right; text-align: right; width: 10%;">
						                            <fmt:formatDate pattern="MM/dd hh:mm" value="${NewsPost.post_date}"/>
						                        </span>
						                    </a>
						                </td>
						            </tr>
						            <c:set var="count" value="${count + 1}" />
						        </c:if>
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
	
	#img {
		width: 150px; /* 원하는 너비 */
		height: 150px; /* 원하는 높이 */
    } 	
    
    table {
	  border: 1px #a39485 solid;
	  font-size: .9em;
	  box-shadow: 0 2px 5px rgba(0,0,0,.25);
	  width: 100%;
	  border-collapse: collapse;
	  border-radius: 5px;
	  overflow: hidden;
	}

	th {
	  text-align: left;
	}
	  
	thead {
	  font-weight: bold;
	  color: #fff;
	  background: #73685d;
	}
	  
	 td, th {
	  padding: 1em .5em;
	  vertical-align: middle;
	}
	  
	 td {
	  border-bottom: 1px solid rgba(0,0,0,.1);
	  background: #fff;
	}

	a {
	  color: #73685d;
	}
  
	@media all and (max-width: 768px) {
	   
		table, thead, tbody, th, td, tr {
			display: block;
		}
		 
		th {
		  	text-align: right;
		}
		 
		table {
			position: relative; 
			padding-bottom: 0;
			border: none;
			box-shadow: 0 0 10px rgba(0,0,0,.2);
		}
		 
		thead {
			float: left;
			white-space: nowrap;
		}
		 
		tbody {
			overflow-x: auto;
			overflow-y: hidden;
			position: relative;
			white-space: nowrap;
		}
		 
		tr {
			display: inline-block;
			vertical-align: top;
		}
	
		th {
			border-bottom: 1px solid #a39485;
		}
		 
		td {
		    border-bottom: 1px solid #e5e5e5;
		}
		
	}
	
	#newscontent{
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	}
</style>
<script>
	
	var userauthority = '<c:out value="${param.userauthority}"/>';	
	if(userauthority == ("suspended")){
		alert("정지된 계정입니다.");
		document.getElementById('logoutForm').submit();
	}
	
	$("#mypagebtn").on("click",function(){
		var user_id= document.getElementById("user_id").value;
		window.location.href="/rc_pro/myinfo?user_id="+user_id +"&sortmenu=post_date";
		
	});
</script>
<%@ include file="../myinclude/myfooter.jsp" %>   	  
	  