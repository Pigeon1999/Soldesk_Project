<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file="../myinclude/myheader.jsp" %>



<style>
 th {text-align: center;}
</style>  

  <main>

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs"> <!-- breadcrumbs 시작 -->
      <div class="container"> <!-- container 시작 -->

        <div class="d-flex justify-content-between align-items-center"> <!-- 상단 제목 시작 -->
        <c:choose>
			<c:when test="${pagingCreator.boardPaging.category_id == '1'}" >
				<h2>자유게시판</h2>
			</c:when>
			<c:when test="${pagingCreator.boardPaging.category_id == '2'}" >
				<h2>홍보게시판</h2>
			</c:when>
			<c:when test="${pagingCreator.boardPaging.category_id == '3'}" >
				<h2>뉴스</h2>
			</c:when>
			<c:otherwise>
				<h2>자유게시판</h2>
			</c:otherwise>
		</c:choose>
						
          <ol>
            <li><a href="index.html">Home</a></li>
            <c:choose>
			<c:when test="${pagingCreator.boardPaging.category_id == '1'}" >
				<li>자유게시판</li>
			</c:when>
			<c:when test="${pagingCreator.boardPaging.category_id == '2'}" >
				<li>홍보게시판</li>
			</c:when>
			<c:when test="${pagingCreator.boardPaging.category_id == '3'}" >
				<li>뉴스</li>
			</c:when>
		</c:choose>
          </ol>
        </div> <!-- 상단 제목 끝 -->

      </div> <!-- container 끝 -->
    </div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" > <!-- container 시작 -->
      
		<div class="col-lg-8">
	        <div class="section-header"> <!-- 섹션 헤더 시작 -->
			<c:choose>
				<c:when test="${pagingCreator.boardPaging.category_id == '1'}" >
					<h2>자유게시판</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.category_id == '2'}" >
					<h2>홍보게시판</h2>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.category_id == '3'}" >
					<h2>뉴스</h2>
				</c:when>
				<c:otherwise>
					<h2>자유게시판</h2>
				</c:otherwise>
			</c:choose>
	      	</div> <!-- 섹션 헤더 끝 -->
	      
	      	<div class="row gy-4 posts-list">
				
<c:choose>                         
<c:when test="${not empty pagingCreator.boardList }">                               
	<c:forEach var="board" items="${pagingCreator.boardList}">
		<c:choose>
			<c:when test="${board.post_hide == 1 }">
			<div class="col-lg-6"><!-- Start post list item -->
                <article class="d-flex flex-column">

                  <div class="post-img">
                    <img src="" alt="이미지가 없습니다" class="img-fluid">
                  </div>

                  <h2 class="title">
                    <a href="#me">삭제된 기사입니다.</a>
                  </h2>

                  <div class="meta-top">
                    <ul>
                      <li class="d-flex align-items-center"><i class="bi bi-person"></i></li>
                      <li class="d-flex align-items-center"><i class="bi bi-clock"></i></li>
                      <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i></li>
                    </ul>
                  </div>

                  <div class="content">
                    <p>
                      삭제된 기사입니다.
                    </p>
                  </div>

                  <div class="read-more mt-auto align-self-end">
                    <a href="#me">Read More</a>
                  </div>

                </article>
              </div><!-- End post list item -->	
			</c:when>
			<c:otherwise>
				<div class="col-lg-6"><!-- Start post list item -->
                <article class="d-flex flex-column">

                  <div class="post-img">
                    <img src="img/<c:out value="${board.post_file }"/>" alt="이미지가 없습니다" class="img-fluid">
                  </div>

                  <h2 class="title">
                    <a href="blog-details.html"><c:out value="${board.post_title }"/></a>
                  </h2>

                  <div class="meta-top">
                    <ul>
                      <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html"><c:out value="${board.user_num }"/></a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html"><fmt:formatDate value="${board.post_date }" pattern="yyyy/MM/dd HH:mm:ss"/></a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html"><c:out value="${board.post_reply }"/></a></li>
                    </ul>
                  </div>

                  <div class="content">
                    <p>
                      <c:out value="${board.post_content }"/>
                    </p>
                  </div>

                  <div class="read-more mt-auto align-self-end">
                    <a href="blog-details.html">Read More</a>
                  </div>

                </article>
              </div><!-- End post list item -->
			</c:otherwise>
		</c:choose>
	</c:forEach>
</c:when>
<c:otherwise>
	<div class="col-lg-6"><!-- Start post list item -->
                <article class="d-flex flex-column">

                  <div class="post-img">
                    <img src=img/"<c:out value="${board.post_file }"/>" alt="이미지가 없습니다" class="img-fluid">
                  </div>

                  <h2 class="title">
                    <a href="blog-details.html">기사가 없습니다</a>
                  </h2>

                  <div class="meta-top">
                    <ul>
                      <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html"></a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html"></a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html"></a></li>
                    </ul>
                  </div>

                  <div class="content">
                    <p>
                      기사가 없습니다
                    </p>
                  </div>

                  <div class="read-more mt-auto align-self-end">
                    <a href="#me">Read More</a>
                  </div>

                </article>
              </div><!-- End post list item -->
</c:otherwise>
</c:choose>
			
<!-- 			
              <div class="col-lg-6">Start post list item
                <article class="d-flex flex-column">

                  <div class="post-img">
                    <img src="assets/img/blog/blog-1.jpg" alt="" class="img-fluid">
                  </div>

                  <h2 class="title">
                    <a href="blog-details.html">Dolorum optio tempore voluptas dignissimos cumque fuga qui quibusdam quia</a>
                  </h2>

                  <div class="meta-top">
                    <ul>
                      <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html">John Doe</a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html"><time datetime="2022-01-01">Jan 1, 2022</time></a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html">12 Comments</a></li>
                    </ul>
                  </div>

                  <div class="content">
                    <p>
                      Similique neque nam consequuntur ad non maxime aliquam quas. Quibusdam animi praesentium. Aliquam et laboriosam eius aut nostrum quidem aliquid dicta.
                    </p>
                  </div>

                  <div class="read-more mt-auto align-self-end">
                    <a href="blog-details.html">Read More</a>
                  </div>

                </article>
              </div>End post list item

            </div>End blog posts list -->
            
	        
	      	<div class="blog-pagination"> <!-- 페이지 버튼 영역 시작 -->
				<ul class="justify-content-center" >
			  		<c:if test="${pagingCreator.prev }">
			  			<li class="pagination-button">
			  				<a href="1" aria-label="Previous">
			  					<span aria-hidden="ture">&laquo</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:if test="${pagingCreator.prev }">
			  			<li class="pagination-button">
			  				<a href="${pagingCreator.startPagingNum - 1 }" aria-label="Previous">
			  					<span aria-hidden="ture">이전</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:forEach begin="${pagingCreator.startPagingNum }" 
			  				   end="${pagingCreator.endPagingNum }"
			  				   var="pagingNum" >
			  				   
			  			<li class='pagination-button ${(pagingNum == pagingCreator.boardPaging.pageNum) ? "active" : "" }'>
			  				<a href="${pagingNum }">${pagingNum }</a>
			  			</li>		   
			  		</c:forEach>
			  		<c:if test="${pagingCreator.next }">
			  			<li class="pagination-button">
			  				<a href="${pagingCreator.endPagingNum + 1 }" aria-label="Next">
			  					<span aria-hidden="ture">다음</span>
			  				</a>
			  			</li>
			  		</c:if>
			  		<c:if test="${pagingCreator.next }">
			  			<li class="pagination-button">
			  				<a href="${pagingCreator.lastPageNum }" aria-label="Next">
			  					<span aria-hidden="ture">&raquo</span>
			  				</a>
			  			</li>
			  		</c:if>
				</ul>
			</div> <!-- 페이지 버튼 영역 끝 -->
			<div>
				<button type="button" id="btnToRegister" class="btn btn-primary btn-sm pull-right">새글 등록</button> 
			</div>
		</div>
		    
    	<div class="col-lg-6">

            <div class="sidebar" >
			  <div class="sidebar-item search-form">
                <h3 class="sidebar-title">Search</h3>
                <form class="form-inline mt-3" id="frmSendValue" name="frmSendValue" action="${contextPath }/board/list" method="get" >
					<div class="from-group">

						<select id="selectAmount" name="rowAmountPerPage">
							<option value="10" ${(pagingCreator.boardPaging.rowAmountPerPage == 10) ? "selected" : "" }>10개</option>
							<option value="20" ${(pagingCreator.boardPaging.rowAmountPerPage == 20) ? "selected" : "" }>20개</option>
							<option value="50" ${(pagingCreator.boardPaging.rowAmountPerPage == 50) ? "selected" : "" }>50개</option>
							<option value="100" ${(pagingCreator.boardPaging.rowAmountPerPage == 100) ? "selected" : "" }>100개</option>
						</select>
						
						<select id="selectScope" name="scope">
							<option value="" ${(pagingCreator.boardPaging.scope == null ) ? "selected" : "" }>선택</option>
							<option value="T" ${(pagingCreator.boardPaging.scope == "T" ) ? "selected" : "" }>제목</option>
							<option value="C" ${(pagingCreator.boardPaging.scope == "C" ) ? "selected" : "" }>내용</option>
							<option value="W" ${(pagingCreator.boardPaging.scope == "W" ) ? "selected" : "" }>작성자</option>
							<option value="TC" ${(pagingCreator.boardPaging.scope == "TC" ) ? "selected" : "" }>제목+내용</option>
							<option value="TCW" ${(pagingCreator.boardPaging.scope == "TCW" ) ? "selected" : "" }>제목+내용+작성자</option>
						</select>
						<div class="input-group">
							<input class="form-control" id="keyword" name="keyword" type="text" 
								placeholder="검색어를 입력하세요" value='<c:out value="${pagingCreator.boardPaging.keyword}" />' />
							<span class="input-group-btn">
			                	<button type="button" id="btnSearchGo"><i class="bi bi-search"></i></button>
			                </span>
						</div>
	
						<input type="hidden" name="category_id" value="${pagingCreator.boardPaging.category_id }" >
						<input type="hidden" name="region_id" value="${pagingCreator.boardPaging.region_id }" >
						<input type="hidden" name="pageNum" value="${pagingCreator.boardPaging.pageNum }" >
						<input type="hidden" name="rowAmountPerPage" value="${pagingCreator.boardPaging.rowAmountPerPage }" >
						<input type="hidden" name="lastPageNum" value="${pagingCreator.lastPageNum }" >
					</div>
					
					<div class="form-group"><!-- 검색어 입력 -->
						<input class="form-control" id="beginDate" name="beginDate" type="date"
							value="${pagingCreator.boardPaging.beginDate}"  />
						<input class="form-control" id="endDate" name="endDate" type="date"
							value="${pagingCreator.boardPaging.endDate}"  />
					</div>
                </form>
              </div><!-- End sidebar search formn-->

            </div><!-- End Blog Sidebar -->

          </div>
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

//등록페이지 이동
$("#btnToRegister").on("click", function() {
	window.location.href = "${contextPath}/board/register" ;
	
});

//상세페이지 이동
$(".moveDetail").on("click", function(){
	var post_id = $(this).data("post_id") ;
	
	frmSendValue.append("<input type='hidden' name='post_id' value='" + post_id + "'/>")
	frmSendValue.attr("action", "${contextPath}/board/detail").attr("method", "get") ;
	frmSendValue.submit() ;
	
});

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
	frmSendValue.attr("action", "${contextPath}/board/list") ;
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
	
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	
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

$(document).ready(function(){
	runModal(result) ;
	
	window.addEventListener("popstate", function(event){
		history.pushState(null, null, location.href) ;
		
	});
	
	history.pushState(null, null, location.href) ;
	
}) ;

</script>

<%@ include file="../myinclude/myfooter.jsp" %>   