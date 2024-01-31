<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<c:set var="region_id" value="${adminboardpagingCreator.adminboardPaging.region_id }" />
<c:set var="category_id" value="${adminboardpagingCreator.adminboardPaging.category_id }" />

<c:set var="region" value="${region}"/>

<c:set var="userInfo" value="${userInfo}"/>

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
          <li><a class="nav-link scrollto" href="${contextPath }/admin">멤버 목록</a></li>
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
					<li>게시판 목록</li>
				</ol>
		</div> <!-- 상단 제목 끝 -->

		</div> <!-- container 끝 -->
	</div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" > <!-- container 시작 -->
      
		<div class="col-lg"> <!-- 영역 시작 -->	
			<div style="display:flex;">
				<h4 style="width:85%;">게시판 목록</h4>
	      		<div style="float:right; width:15%;"> <!-- 카테고리 및 지역 조회 영역 시작 -->
		            <form id="frmboardValue" name="frmboardValue" action="${contextPath }/admin_board" method="get">
		            	<select id="selectCategory" name="category_id">
		            		<option value="" ${(adminboardpagingCreator.adminboardPaging.category_id  == 0) ? "selected" : "" }>선택</option>
		            		<option value="1" ${(adminboardpagingCreator.adminboardPaging.category_id  == 1) ? "selected" : "" }>자유게시판</option>
		            		<option value="2" ${(adminboardpagingCreator.adminboardPaging.category_id  == 2) ? "selected" : "" }>홍보게시판</option>
		            		<option value="3" ${(adminboardpagingCreator.adminboardPaging.category_id  == 3) ? "selected" : "" }>뉴스</option>
		            	</select>
		            	<select id="selectRegion" name="region_id">
		            		<option value="" ${(adminboardpagingCreator.adminboardPaging.region_id  == 0) ? "selected" : "" }>선택</option>
		            		<option value="1" ${(adminboardpagingCreator.adminboardPaging.region_id  == 1) ? "selected" : "" }>관철동</option>
		            		<option value="2" ${(adminboardpagingCreator.adminboardPaging.region_id  == 2) ? "selected" : "" }>청진동</option>
		            		<option value="3" ${(adminboardpagingCreator.adminboardPaging.region_id  == 3) ? "selected" : "" }>공평동</option>
		            		<option value="4" ${(adminboardpagingCreator.adminboardPaging.region_id  == 4) ? "selected" : "" }>관수동</option>
		            		<option value="5" ${(adminboardpagingCreator.adminboardPaging.region_id  == 5) ? "selected" : "" }>인사동</option>
		            		<option value="6" ${(adminboardpagingCreator.adminboardPaging.region_id  == 6) ? "selected" : "" }>종로2가</option>
		            		<option value="7" ${(adminboardpagingCreator.adminboardPaging.region_id  == 7) ? "selected" : "" }>삼각동</option>
		            		<option value="8" ${(adminboardpagingCreator.adminboardPaging.region_id  == 8) ? "selected" : "" }>서린동</option>
		            	</select>
		            </form>
	            </div> <!-- 카테고리 및 지역 조회 영역 끝 -->
			</div>
			<table > <!-- 테이블 영역 시작 -->
				<thead>
					<tr>
					    <th>게시글번호</th>
					    <th>카테고리번호</th>
					    <th>지역번호</th>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>댓글수</th>
					    <th>작성일</th>
					    <th>조회수</th>
					    <th>추천수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>                         
						<c:when test="${not empty adminboardpagingCreator.boardList }">                               
							<c:forEach var="board" items="${adminboardpagingCreator.boardList}">
								<c:choose>
									<c:when test="${board.post_hide == 1 }">
										<tr style="background-color: Moccasin; text-align: center">
											<td></td>
											<td>${board.post_id }</td>
						             		<td colspan="8"><em>작성자에 의해서 삭제된 게시글입니다.</em></td>
						         		</tr>
									</c:when>
									<c:otherwise>
										<tr class="moveDetail" data-post_id="${board.post_id }">
										    <td><c:out value="${board.post_id }"/></td>
										    <td><c:out value="${board.category_id }"/></td>
										    <td><c:out value="${board.region_id }"/></td>
										    <td ><c:out value="${board.post_title }"/></td>
											<c:forEach var="userInfo" items="${userInfo}">
												<c:choose>
													<c:when test="${userInfo.user_num == board.user_num}">
													<td class="center">${userInfo.user_name}</td>
													</c:when>
												</c:choose>
											</c:forEach>
										    <td class="center">${board.post_reply }</td>
										    <td class="center"><fmt:formatDate value="${board.post_date }" pattern="MM/dd HH:mm"/></td>
										    <td class="center"><c:out value="${board.post_view }"/></td>
										    <td class="center"><c:out value="${board.post_like }"/></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="odd gradeX">
								<td colspan="10">등록된 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>                        
				</tbody>
			</table> <%-- 테이블 영역 끝 --%>
			
	        
	      	<div class="blog-pagination"> <!-- 페이지 버튼 영역 시작 -->
				<ul class="justify-content-center" >
			  		<c:if test="${adminboardpagingCreator.prev }">
			  			<li class="pagination-button">
			  				<a href="1" aria-label="Previous">
			  					<span aria-hidden="ture">&laquo</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:if test="${adminboardpagingCreator.prev }">
			  			<li class="pagination-button">
			  				<a href="${adminboardpagingCreator.startPagingNum - 1 }" aria-label="Previous">
			  					<span aria-hidden="ture">이전</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:forEach begin="${adminboardpagingCreator.startPagingNum }" 
			  				   end="${adminboardpagingCreator.endPagingNum }"
			  				   var="pagingNum" >
			  				   
			  			<li class='pagination-button ${(pagingNum == adminboardpagingCreator.adminboardPaging.pageNum) ? "active" : "" }'>
			  				<a href="${pagingNum }">${pagingNum }</a>
			  			</li>		   
			  		</c:forEach>
			  		<c:if test="${adminboardpagingCreator.next }">
			  			<li class="pagination-button">
			  				<a href="${adminboardpagingCreator.endPagingNum + 1 }" aria-label="Next">
			  					<span aria-hidden="ture">다음</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:if test="${adminboardpagingCreator.next }">
			  			<li class="pagination-button">
			  				<a href="${adminboardpagingCreator.lastPageNum }" aria-label="Next">
			  					<span aria-hidden="ture">&raquo</span>
			  				</a>
			  			</li>
			  		</c:if>
				</ul>
			</div> <!-- 페이지 버튼 영역 끝 -->
		</div> <!-- 영역 끝 -->
		
		<div class="row justify-content-lg-center" style>   <!-- 하단 검색 부분 영역 시작 -->
	    	<div class="col-lg-4" style="width:100%;"> 
	    	
	            <div class="sidebar"> <!-- sidebar 시작 -->
	            
				  <div class="search-form"> <!-- start sidebar search-form -->
				  
	                <h3 class="sidebar-title">Search</h3>
	                <form class="search-form " id="frmSendValue" name="frmSendValue" action="${contextPath }/admin_board" method="get" >
						<div class="from-group" style="display:flex;"> <!-- 검색어 폼 그룹 영역 시작 -->
	
							<select id="selectAmount" name="rowAmountPerPage" style="margin-right:5px;">
								<option value="10" ${(adminboardpagingCreator.adminboardPaging.rowAmountPerPage == 10) ? "selected" : "" }>10개</option>
								<option value="20" ${(adminboardpagingCreator.adminboardPaging.rowAmountPerPage == 20) ? "selected" : "" }>20개</option>
								<option value="50" ${(adminboardpagingCreator.adminboardPaging.rowAmountPerPage == 50) ? "selected" : "" }>50개</option>
								<option value="100" ${(adminboardpagingCreator.adminboardPaging.rowAmountPerPage == 100) ? "selected" : "" }>100개</option>
							</select>
							
							<select id="selectScope" name="scope" style="margin-right:5px;">
								<option value="" ${(adminboardpagingCreator.adminboardPaging.scope == null ) ? "selected" : "" }>선택</option>
								<option value="TC" ${(adminboardpagingCreator.adminboardPaging.scope == "TC" ) ? "selected" : "" }>제목+내용</option>
								<option value="W" ${(adminboardpagingCreator.adminboardPaging.scope == "W" ) ? "selected" : "" }>작성자</option>
							</select>
		
							<input type="hidden" name="pageNum" value="${adminboardpagingCreator.adminboardPaging.pageNum }" >
							<input type="hidden" name="rowAmountPerPage" value="${adminboardpagingCreator.adminboardPaging.rowAmountPerPage }" >
							<input type="hidden" name="lastPageNum" value="${adminboardpagingCreator.lastPageNum }" >
							<input type="hidden" name="category_id" value="${adminboardpagingCreator.adminboardPaging.category_id }" >
							<input type="hidden" name="region_id" value="${adminboardpagingCreator.adminboardPaging.region_id }" >
							
							<div class="form-group" style="display:flex; margin-right:5px;"><!-- 검색어 입력 -->
								<input class="form-control" id="beginDate" name="beginDate" type="date" value="${adminboardpagingCreator.adminboardPaging.beginDate}"  >
								<input class="form-control" id="endDate" name="endDate" type="date" value="${adminboardpagingCreator.adminboardPaging.endDate}"  >
							</div>
							
							<div class="input-group-btn" style="width:100%;">
								<input class="form-control " id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요" value='<c:out value="${adminboardpagingCreator.adminboardPaging.keyword}" />' style="border: 1px solid #007bff;">
				                <button type="button" id="btnSearchGo" ><i class="bi bi-search"></i></button>
							</div>
						</div> <!-- 검색어 폼 그룹 영역 끝 -->
						
	                </form> <!-- 폼 영역 끝 -->
	              </div><!-- End sidebar search formn-->
	
	            </div><!-- End Blog Sidebar -->
	          
	            
	
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

<script>
var frmSendValue = $("#frmSendValue") ;
var result = '<c:out value="${result}" />' ;

var frmboardValue = $("#frmboardValue") ;

var category_id = $("#selectCategory").find("option:selected").val() ;
var region_id = $("#selectRegion").find("option:selected").val()  ;


//모달 호출 함수
function runModal(result) {
	
	if(result.length == 0) {
		return ;
		
	} else if(result == "successRemove") {
		var myMsg = "게시물이 삭제되었습니다. " ;
 		
	} else if(result == "successModify") {
		var myMsg = "게시물이 수정되었습니다. "
		
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
	frmSendValue.attr("action", "${contextPath}/admin_board") ;
	frmSendValue.attr("method", "get") ;
	
	frmSendValue.submit();
	
});

<%--검색 관련 요소의 이벤트 처리--%>
<%--표시행수 변경 이벤트 처리--%>
$("#selectAmount").on("change", function(){
	frmSendValue.find("input[name='pageNum']").val(1) ;
	frmSendValue.submit() ;
	
});

<%--검색범위 변경 이벤트 처리 --%>
$("#selectScope").on("change", function(){
	$("#pageNum").val(1) ;
	frmSendValue.submit() ;
});


<%--카테고리 변경 이벤트 처리 --%>
$("#selectCategory").on("change", function(){


	frmboardValue.find("input[name='category_id']").val(Number(category_id)) ;

	$("#pageNum").val(1) ;
	frmboardValue.submit() ;
});

<%--지역범위 변경 이벤트 처리 --%>
$("#selectRegion").on("change", function(){

	frmboardValue.find("input[name='category_id']").val(Number(region_id)) ;
	
	$("#pageNum").val(1) ;
	frmboardValue.submit() ;
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


<%--게시글삭제버튼 클릭 이벤트 처리 --%>
$("#boardRemoveButton").on("click", function(){
	var selectPost = document.querySelector('input[name="radioPostid"]:checked').value;
	
	frmboardmodify.find("input[name='post_id']").val(Number(selectPost)) ;
	
	frmboardmodify.attr("action", "${contextPath}/admin_board/remove") ;
	frmboardmodify.attr("method", "get") ;
	
	frmboardmodify.submit() ;

});	

$(document).ready(function(){

	runModal(result) ;
	
	window.addEventListener("popstate", function(event){
		history.pushState(null, null, location.href) ;
		
	});
	
	history.pushState(null, null, location.href) ;
	
}) ;

</script>

<%@ include file="../myinclude/myfooter.jsp" %>