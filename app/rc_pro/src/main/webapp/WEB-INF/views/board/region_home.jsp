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
            <li><a href="${contextPath}/main?region_id=${region_id}">Home</a></li>
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
	      
			<table class="table table-striped table-bordered table-hover" 
	        	style="width:100%;text-align:center;" > <!-- 테이블 영역 시작 -->
				<thead>
					<tr>
					    <th>게시글번호</th>
					    <th>제목</th>
					    <th>댓글수</th>
					    <th>작성자</th>
					    <th>작성일</th>
					    <th>조회수</th>
					    <th>추천수</th>
					</tr>
				</thead>
				<tbody>
	<c:choose>                         
	<c:when test="${not empty pagingCreator.boardList }">                               
		<c:forEach var="board" items="${pagingCreator.boardList}">
			<c:choose>
				<c:when test="${board.post_hide == 1 }">
					<tr style="background-color: Moccasin; text-align: center">
						<td>${board.post_id }</td>
	             		<td colspan="6"><em>작성자에 의해서 삭제된 게시글입니다.</em></td>
	         		</tr>
				</c:when>
				<c:otherwise>
					<tr class="moveDetail" data-post_id="${board.post_id }">
					    <td><c:out value="${board.post_id }"/></td>
					    <td style="text-align: left"><c:out value="${board.post_title }"/></td>
					    <td class="center">${board.post_reply }</td>
					    <td class="center">${board.user_num }</td>
					    <td class="center"><fmt:formatDate value="${board.post_date }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
					    <td class="center"><c:out value="${board.post_view }"/></td>
					    <td class="center"><c:out value="${board.post_like }"/></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr class="odd gradeX">
			<td colspan="7">등록된 게시물이 없습니다.</td>
		</tr>
	</c:otherwise>
	</c:choose>                        
				</tbody>
			</table> <!-- 테이블 영역 끝 -->
	        
		   
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



</script>

<%@ include file="../myinclude/myfooter.jsp" %>   