<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>지역 커뮤니티 메인 화면 템플릿</title>
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
	        <h1>RC<span>.</span></h1>
	      </a>
	
	      <a class="logo d-flex align-items-center scrollto me-auto me-lg-0">
	        <h1>관철동</h1>
	      </a>
	
	      <nav id="navbar" class="navbar">
	        <ul>	
	          <li class="dropdown megamenu"><a href="#"><span>지역 선택</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
	            <ul>
	              <li>
	                <a href="#">관철동</a>
	                <a href="/rc_pro/Samgak">삼각동</a>
	                <a href="/rc_pro/Seorin">서린동</a>
	                <a href="/rc_pro/Jongno2ga">종로2가</a>
	              </li>
	              <li>
	                <a href="/rc_pro/Gongpyeong">공평동</a>
	                <a href="/rc_pro/Cheongjin">청진동</a>
	                <a href="/rc_pro/Gwansu">관수동</a>
	                <a href="/rc_pro/Insa">인사동</a>
	              </li>
	            </ul>
	          </li>
	          <li><a class="nav-link scrollto" href="/rc_pro/Gwancheol/FreePost">자유 게시판</a></li>
	          <li><a class="nav-link scrollto" href="/rc_pro/Gwancheol/PromotionPost">홍보 게시판</a></li>
	          <li><a class="nav-link scrollto" href="/rc_pro/Gwancheol/NewsPost">뉴스</a></li>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle d-none"></i>
	      </nav>
	
		  <div>
		  	<sec:authorize access="isAuthenticated()">
			    <form id="logoutForm" role="form" action="${contextPath}/Gwancheol" method="post">
			    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			    	<fieldset>
			        	<a onclick="document.getElementById('logoutForm').submit(); return false;" class="btn-getstarted scrollto">Logout</a>
			        </fieldset>
			    </form>
			    <a class="btn-getstarted scrollto" href="/">MyPage</a>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
		      	<a class="btn-getstarted scrollto" href="/rc_pro/login">Login</a>
		      	<a class="btn-getstarted scrollto" href="/rc_pro/signin">Sign In</a>
		    </sec:authorize>
		  </div>
	    </div>
	  </header>
	  
	  <section id="hero-animated" class="hero-animated d-flex align-items-center">
	    <div class="container d-flex flex-column justify-content-center align-items-center text-center position-relative" data-aos="zoom-out">
	      <h2>Welcome to <span>RC</span></h2>
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
 						<c:if test="${FreePost.post_hide == 0 and FreePost.region_id == 1}">
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
 						<c:if test="${PromotionPost.post_hide == 0 and PromotionPost.region_id == 1}">
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
							<c:if test="${NewsPost.post_hide == 0 and NewsPost.region_id == 1}">
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
	  	
		#logoutForm {
		    display: inline-block;
		}
		
		.btn-getstarted {
		    display: inline-block;
		}
	  	
	  </style>
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="footer-content">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>HeroBiz</h3>
              <p>
                A108 Adam Street <br>
                NY 535022, USA<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> info@example.com<br>
              </p>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="footer-legal text-center">
      <div class="container d-flex flex-column flex-lg-row justify-content-center justify-content-lg-between align-items-center">

        <div class="d-flex flex-column align-items-center align-items-lg-start">
          <div class="copyright">
            &copy; Copyright <strong><span>HeroBiz</span></strong>. All Rights Reserved
          </div>
          <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/herobiz-bootstrap-business-template/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>

        <div class="social-links order-first order-lg-last mb-3 mb-lg-0">
          <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
          <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
          <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
          <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>

      </div>
    </div>

  </footer><!-- End Footer -->

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>