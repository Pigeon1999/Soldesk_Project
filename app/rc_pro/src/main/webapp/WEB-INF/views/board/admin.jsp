<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="region" value="${region}"/>



<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>관리자 페이지</title>
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

  <link href="${contextPath}/assets/css/list.css" rel="stylesheet">

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
    <div class="container-fluid d-flex align-items-center justify-content-between"> <!-- header container 영역 시작 -->
      
      <a href="${contextPath}/main" class="logo d-flex align-items-center scrollto me-auto me-lg-0">
        <h1>RC<span>.</span></h1>
      </a>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="${contextPath }/admin">이용자 정보 목록</a></li>
          <li><a class="nav-link scrollto" href="${contextPath }/admin_board">게시판 목록</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle d-none"></i>
      </nav><!-- .navbar -->
      
		<div> <!-- 로그인 로그아웃 버튼 구역 시작 -->
		<sec:authorize access="isAuthenticated()">
			<div style="display: flex; align-items: center;">
			    <form id="logoutForm" role="form" action="${contextPath}/main" method="post" style="padding-right: 10px;">
			    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
			    	<fieldset>
			        	<button onclick="document.getElementById('logoutForm').submit(); return false;" class="btn-getstarted scrollto">Logout</button>
			        </fieldset>
			    </form>
			    <input type="hidden" id="user_id" value='<sec:authentication property="principal.username"/>'/>
			    <button class="btn-getstarted scrollto" type="button" id="mypagebtn">MyPage</button>

			    
			</div>
		</sec:authorize>
			
		<sec:authorize access="isAnonymous()">
	      	<a class="btn-getstarted scrollto" href="/rc_pro/login">Login</a>
	      	<a class="btn-getstarted scrollto" href="/rc_pro/signin">Sign In</a>
	    </sec:authorize>
		</div><!-- 로그인 로그아웃 버튼 구역 끝 -->
    </div> <!-- header container 영역 끝 -->
  </header><!-- End Header -->



  <main>

    <!-- ======= Breadcrumbs ======= -->
	<div class="breadcrumbs"> <!-- breadcrumbs 시작 -->
		<div class="container"> <!-- container 시작 -->

		<div class="d-flex justify-content-between align-items-center"> <!-- 상단 제목 시작 -->
		
			<h2>관리자 페이지</h2>
		
				<ol>
					<li><a href="${contextPath }/main">Home</a></li>
					<li>관리자 페이지</li>
					<li>이용자 정보 목록</li>
				</ol>
		</div> <!-- 상단 제목 끝 -->

		</div> <!-- container 끝 -->
	</div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" > <!-- container 시작 -->
      
		<div class="col-lg"> <!-- 영역 시작 -->
	      	<h4>이용자 정보 목록</h4>
			<table style="width:100%;text-align:center;" > <!-- 테이블 영역 시작 -->
			<table> <!-- 테이블 영역 시작 -->
				<thead>
					<tr>
					    <th>유저번호</th>
					    <th>유저이름</th>
					    <th>유저생일</th>
					    <th>유저전화번호</th>
					    <th>유저주소</th>
					    <th>유저이메일</th>
					    <th>유저아이디</th>
					    <th>유저등록일</th>
					    <th>유저권한</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>                         
					<c:when test="${not empty adminPagingCreator.userList }">                               
						<c:forEach var="userinfo" items="${adminPagingCreator.userList}">
									<tr class="userinfos" data-user_num="${userinfo.user_num }">
										<td><c:out value="${userinfo.user_num }"/></td>
									    <td><c:out value="${userinfo.user_name }"/></td>
									    <td class="center"><c:out value="${userinfo.user_birth }"/></td>
									    <td class="center"><c:out value="${userinfo.user_pn }"/></td>
									    <td class="center"><c:out value="${userinfo.user_address }"/></td>
									    <td class="center"><c:out value="${userinfo.user_email }"/></td>
									    <td class="center"><c:out value="${userinfo.user_id }"/></td>
									    <td class="center"><fmt:formatDate value="${userinfo.user_regdate }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
									    <td class="center"><c:out value="${userinfo.authorityList[0].user_authority }"/></td>
									</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="odd gradeX">
							<td colspan="9">등록된 게시물이 없습니다.</td>
						</tr>
					</c:otherwise>
					</c:choose>                        
				</tbody>
			</table> <%-- 테이블 영역 끝 --%>
	      	<div class="blog-pagination"> <!-- 페이지 버튼 영역 시작 -->
				<ul class="justify-content-center" >
			  		<c:if test="${adminPagingCreator.prev }">
			  			<li class="pagination-button">
			  				<a href="1" aria-label="Previous">
			  					<span aria-hidden="ture">&laquo</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:if test="${adminPagingCreator.prev }">
			  			<li class="pagination-button">
			  				<a href="${adminPagingCreator.startPagingNum - 1 }" aria-label="Previous">
			  					<span aria-hidden="ture">이전</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:forEach begin="${adminPagingCreator.startPagingNum }" 
			  				   end="${adminPagingCreator.endPagingNum }"
			  				   var="pagingNum" >
			  				   
			  			<li class='pagination-button ${(pagingNum == adminPagingCreator.adminPaging.pageNum) ? "active" : "" }'>
			  				<a href="${pagingNum }">${pagingNum }</a>
			  			</li>		   
			  		</c:forEach>
			  		<c:if test="${adminPagingCreator.next }">
			  			<li class="pagination-button">
			  				<a href="${adminPagingCreator.endPagingNum + 1 }" aria-label="Next">
			  					<span aria-hidden="ture">다음</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:if test="${adminPagingCreator.next }">
			  			<li class="pagination-button">
			  				<a href="${adminPagingCreator.lastPageNum }" aria-label="Next">
			  					<span aria-hidden="ture">&raquo</span>
			  				</a>
			  			</li>
			  		</c:if>
				</ul>
			</div> <!-- 페이지 버튼 영역 끝 -->
		</div> <!-- 영역 끝 -->
		
		<div class="row justify-content-lg-center">   <!-- 하단 검색 부분 영역 시작 -->
	    	<div class="col-lg-4" style="width:100%;"> 
	    	
	            <div class="sidebar"> <!-- sidebar 시작 -->
	            
				  <div class="search-form"> <!-- start sidebar search-form -->
				  
	                <h3 class="sidebar-title">Search</h3>
	                <form class="search-form " id="frmSendValue" name="frmSendValue" action="${contextPath}/admin" method="get" >
						<div class="from-group" style="display:flex;"> <!-- 검색어 폼 그룹 영역 시작 -->
	
							<select id="selectAmount" name="rowAmountPerPage" style="margin-right:5px;">
								<option value="10" ${(adminPagingCreator.adminPaging.rowAmountPerPage == 10) ? "selected" : "" }>10개</option>
								<option value="20" ${(adminPagingCreator.adminPaging.rowAmountPerPage == 20) ? "selected" : "" }>20개</option>
								<option value="50" ${(adminPagingCreator.adminPaging.rowAmountPerPage == 50) ? "selected" : "" }>50개</option>
								<option value="100" ${(adminPagingCreator.adminPaging.rowAmountPerPage == 100) ? "selected" : "" }>100개</option>
							</select>
							
							<select id="selectScope" name="scope" style="margin-right:5px;">
								<option value="" ${(adminPagingCreator.adminPaging.scope == null ) ? "selected" : "" }>선택</option>
								<option value="I" ${(adminPagingCreator.adminPaging.scope == "I" ) ? "selected" : "" }>아이디</option>
								<option value="N" ${(adminPagingCreator.adminPaging.scope == "N" ) ? "selected" : "" }>이름</option>
								<option value="A" ${(adminPagingCreator.adminPaging.scope == "A" ) ? "selected" : "" }>주소</option>
								<option value="U" ${(adminPagingCreator.adminPaging.scope == "U" ) ? "selected" : "" }>권한</option>
							</select>
							
							<div class="input-group-btn" style="width:100%;">
								<input class="form-control " id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요" value='<c:out value="${adminPagingCreator.adminPaging.keyword}"/>' style="border: 1px solid #007bff;" >
				                <button type="button" id="btnSearchGo" ><i class="bi bi-search"></i></button>
							</div>
		
							<input type="hidden" name="pageNum" value="${adminPagingCreator.adminPaging.pageNum }" >
							<input type="hidden" name="rowAmountPerPage" value="${adminPagingCreator.adminPaging.rowAmountPerPage }" >
							<input type="hidden" name="lastPageNum" value="${adminPagingCreator.lastPageNum }" >
						</div> <!-- 검색어 폼 그룹 영역 끝 -->
						
	                </form> <!-- 폼 영역 끝 -->
	              </div><!-- End sidebar search formn-->
	
	            </div><!-- End Blog Sidebar -->
	            
	            <div class="input-group input-group-text"> <!-- 권한 수정 영역 시작 -->
		            <form id="frmAuthValue" name="frmAuthValue" action="${contextPath }/admin/modify" method="get" style="width:100%;" >
		            	<div>
			            	<input type="text" id="authId" name="user_id">
			            	<select id="selectAuth" name="user_authority">
			            		<option value="" selected >선택</option>
			            		<option value="generaluser">유저</option>
			            		<option value="reporter">기자</option>
			            		<option value="admin">운영자</option>
			            		<option value="suspended">정지</option>
			            	</select>
			            	<button type="button" class="btn btn-primary" id="authButton">적용</button>
		            	</div>
		            	<!-- 
		            	<select id="selectAuth" name="user_authority">
		            		<option value="" ($("#selectAuth").val() == null ) ? "selected" : ""  >선택</option>
		            		<option value="generaluser" ($("#selectAuth").val() == generaluser ) ? "selected" : "" >유저</option>
		            		<option value="reporter" ($("#selectAuth").val() == reporter ) ? "selected" : "" >기자</option>
		            		<option value="admin" ($("#selectAuth").val() == admin ) ? "selected" : "" >운영자</option>
		            		<option value="suspended" ($("#selectAuth").val() == suspended ) ? "selected" : "" >정지</option>
		            	</select> -->
		            	
					<!-- 	            	
		            <input type="hidden" name="user_id" value="$(#authId).val()" >
					<input type="hidden" name="user_authority" value="$(#authId).val()" > -->
		            </form>
	            </div> <!-- 권한 수정 영역 끝 -->
	
	          </div> 
          </div> <!-- 하단 검색 부분 영역 끝 -->
	</div>
    </section><!-- End blog Page -->

  </main><!-- End #main -->
  

<%-- Modal --%>
<div class="modal fade" id="yourModal" tabindex="-1" role="dialog" aria-labelledby="yourModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="yourModalLabel">결과 안내</h4>
            </div>
            <div class="modal-body" id="yourModal-body">메시지</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div><%-- /.modal-content --%>
   </div><%-- /.modal-dialog --%>
</div><%-- /.modal --%>

<style>
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
	  text-align: center;
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
		  	text-align: center;
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
</style>


<script>
	var frmSendValue = $("#frmSendValue") ;
	var result = '<c:out value="${result}" />' ;
	
	var frmAuthValue = $("#frmAuthValue") ;
	
	
	//모달 호출 함수
	function runModal(result) {
		
		if(result.length == 0) {
			return ;
			
		} else if( result == "successRemove") {
			var myMsg = "게시물이 삭제되었습니다. " ;
	 		
		} else if(parseInt(result) > 0) {
			var myMsg = result + "번 게시물이 등록되었습니다."
			
		}
		
	
		$("#yourModal-body").html(myMsg) ;
		
		$("#yourModal").modal("show") ;
		
		myMsg = "" ;
	}
	
	<%-- 페이징 처리: 검색 목록 페이지 이동 --%>
	$("li.pagination-button a").on("click", function(e){
		e.preventDefault() ;
		frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
		console.log(frmSendValue.find("input[name='pageNum']").val());
		frmSendValue.attr("action", "${contextPath}/admin") ;
		frmSendValue.attr("method", "get") ;
		
		frmSendValue.submit();
		
	});
	
	<%--검색 관련 요소의 이벤트 처리--%>
	<%--표시행수 변경 이벤트 처리--%>
	$("#selectAmount").on("change", function(){
		frmSendValue.find("input[name='pageNum']").val(1) ;
		frmSendValue.submit() ;
		
	});
	
	<%--검색범위 클릭 이벤트 처리 --%>
	$("#selectScope").on("change", function(){
		$("#pageNum").val(1) ;
		frmSendValue.submit() ;
	});
	
	<%--검색버튼 클릭 이벤트 처리 --%>
	$("#btnSearchGo").on("click", function(){
		
		var scope = $("#selectScope").find("option:selected").val() ;
		
	
		if(!scope || scope == "") {
			alert("검색범위를 선택하세요.") ;
			return false;
		}
		
		var keyword = $("#keyword").val() ;
		
		if(!keyword || keyword.length == 0) {
			alert("검색어를 입력하세요.") ;
			return ;
		}
		
		frmSendValue.find("input[name='pageNum']").val(1) ;
		frmSendValue.submit() ;
		
	});	
	<%--권한수정버튼 클릭 이벤트 처리 --%>
	$("#authButton").on("click", function(){
	
		var selectAuth = $("#selectAuth").find("option:selected").val() ;
		var authId = $("#authId").val() ;
	
		if(!authId || authId == "") {
			alert("아이디를 입력하세요.") ;
			return false;
		}
		
	//	frmAuthValue.find("input[name='user_id']").val(authId);
	//	frmAuthValue.find("input[name='user_authority']").val(selectAuth);
		console.log(authId);
		console.log(selectAuth);
	
	
		frmAuthValue.attr("action", "${contextPath}/admin/modify") ;
		frmAuthValue.attr("method", "get") ;
		
		frmAuthValue.submit() ;
	
	});	
	
	
	
	$(document).ready(function(){
		runModal(result) ;
		
		window.addEventListener("popstate", function(event){
			history.pushState(null, null, location.href) ;
			
		});
		
		history.pushState(null, null, location.href) ;
	}) ;

	
	$("#mypagebtn").on("click",function(){
		var user_id= document.getElementById("user_id").value;
		window.location.href="/rc_pro/myinfo?user_id="+user_id +"&sortmenu=post_id";
	});
</script>

<%@ include file="../myinclude/myfooter.jsp" %>