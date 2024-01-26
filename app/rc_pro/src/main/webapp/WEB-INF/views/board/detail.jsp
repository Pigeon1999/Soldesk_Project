<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="postInfo" value="${PostInfo}"/>
    
<%@ include file="../myinclude/myheader.jsp" %>
<!-- myheader.jsp 에서 
<body> -->
	<section>
		<header style="border-bottom: 1px solid #ccc;">
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
		</header>
		
		<%
		    // url에서 "post_id" 파라미터 값을 가져오기
		    String postIdParameter = request.getParameter("post_id");
		%>
			
		<article style="margin-top: 10px;">
			<header id="postInfo_box" style="border-bottom: 1px solid #ccc; overflow: hidden;"> <!-- 게시글 정보 -->
				<div id="post">
					<h4>제목</h4>
					<div id="post_info">
						<div id="hl" style="float:left;" > 
							<span> 작성자 </span>
							<a>|</a>
							<span> 작성일 </span>
						</div>
						<div id="hr" style="float:right;">
							<span> 조회수 </span>
							<a>|</a>
							<span> 추천수 </span>
							<a>|</a>
							<span> 댓글 </span>
						</div>
					</div>
				</div>
			</header>
			<div id="content_box" style="border-bottom: 1px solid #ccc;"> <!-- 본문 -->
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaa</div>
			</div>
			<div id="comment_box" style="border-bottom: 1px solid #ccc;"> <!-- 댓글 -->
				<div class="form-group" style="margin-top:10px;margin-bottom:10px;"> <!-- 댓글 쓰는 곳 -->
					<label>댓글 쓰기</label> <textarea class="form-control" rows="3" name="bcontent" style="height:100px;resize:none;"></textarea>
					<a class="btn-getstarted scrollto" id="registerReply">댓글 작성</a>
				</div>
				<ul> <!-- 여기에 댓글이 생깁니다! -->
					<li style="display: flex; border-bottom: 1px solid #ccc;">
						<div id="reply" style="display: flex;">
							<div id="replyName">댓글단놈</div>
							<div id="replyContent">뭐라고 적어놓은거냐</div>
							<div id="replyDate">언제 적은거냐</div>
						</div>
					</li>
					<li style="display: flex; border-bottom: 1px solid #ccc;">
						<div id="reply" style="display: flex;">
							<div id="replyName">댓글단놈2</div>
							<div id="replyContent">뭐라고 적어놓은거냐2</div>
							<div id="replyDate">언제 적은거냐2</div>
						</div>
					</li>
				</ul>
			</div>
			<div id="btn_box" style="border-bottom: 1px solid #ccc;text-align:right">
				<a class="btn-getstarted scrollto" id="modifyPost" href="/rc_pro/board/modify">수정</a>
				<a>|</a>
				<a class="btn-getstarted scrollto" id="deletePost" href="#">삭제</a>
			</div>
		</article>
	</section>
	<style>
	    body {
	        text-align: center; /* 부모인 body에 가운데 정렬 스타일 적용 */
	    }
	
	    section {
	        display: inline-block; /* inline-block으로 설정하여 텍스트 정렬 영향을 받음 */
	        text-align: left; /* 텍스트를 왼쪽 정렬로 되돌림 */
	        width: 90%; /* 페이지의 2/3 크기로 설정 */
	        margin-top: 150px;
	        padding: 20px; /* 내부 여백 설정 */
	        box-sizing: border-box; /* padding이 width에 포함되도록 box-sizing 설정 */
	    }
	    
	    #post_info {
	    	width: 100%;
	    }
	    
	    #replyName {
	    	width: 100%;
	    }
	    
	    #replyName {
	    	width:150px;
	    }
	    
	    #replyContent {
	    	width:800px;
	    }
	    
	    #replyDate {
	    	float:right;
	    }
	    
	    #replyName, #replyContent {
	    	margin-right: 10px;
	    	border-right: 1px solid #ccc;
	    }
	</style>

<%@ include file="../myinclude/myfooter.jsp" %>   