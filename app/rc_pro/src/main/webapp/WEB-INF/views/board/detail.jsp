<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="postInfo" value="${PostInfo}"/>
<c:set var="user_num" value="${user_num}"/>
<c:set var="userInfo" value="${userInfo}"/>
    
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
		    // URL 파라미터를 가져오기
		    String postIdParameter = request.getParameter("post_id");
			pageContext.setAttribute("postIdParameter", postIdParameter);
		%>
		
		<article style="margin-top: 10px;">
			<c:forEach var="postInfo" items="${PostInfo}">
				<c:choose>
					<c:when test="${postInfo.post_id == postIdParameter}">
						<header id="postInfo_box" style="border-bottom: 1px solid #ccc; overflow: hidden;"> <!-- 게시글 정보 -->
							<div id="post">
								<h2>${postInfo.post_title}</h2>
								<div id="post_info">
									<div id="hl" style="float:left;" > 
										<c:forEach var="userInfo" items="${userInfo}">
											<c:choose>
												<c:when test="${userInfo.user_num == postInfo.user_num}">
													<span> ${userInfo.user_name} </span>
												</c:when>
											</c:choose>
										</c:forEach>
										<a>|</a>
										<span><fmt:formatDate pattern="MM/dd hh:mm" value="${postInfo.post_date}"/></span>
									</div>
									<div id="hr" style="float:right;">
										<span> 조회수 ${postInfo.post_view}</span>
										<a>|</a>
										<span> 추천수 ${postInfo.post_like}</span>
										<a>|</a>
										<span> 댓글 ${postInfo.post_reply}</span>
									</div>
								</div>
							</div>
						</header>
						<div id="content_box" style="min-height: 500px; padding:15px;"> <!-- 본문 -->
							<c:if test="${postInfo.category_id == 3}">
								<img src="${contextPath}/assets/upload/${postInfo.post_file}" id="img" style="text-align:center; width:100%; height:300px;">
							</c:if>
							<div style="margin-top:10px;">${postInfo.post_content}</div>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<div style="border-bottom: 1px solid #ccc; display:flex; float:right; width:100%; text-align:right;">
				<div style="margin-right:10px;">
					<a class="btn-getstarted" id="like">추천</a>
				</div>
				<div>
					<a class="btn-getstarted" id="scrape">스크랩</a>
				</div>
			</div>
			<div id="comment_box"> <!-- 댓글 -->
				<div class="form-group" style="margin-top:10px;margin-bottom:10px;"> <!-- 댓글 쓰는 곳 -->
					<label>댓글 쓰기</label> <textarea id="replyContent" class="form-control" rows="3" name="bcontent" style="height:100px; width:100%; resize:none;"></textarea>
					<a class="btn-getstarted" id="replyRegister">댓글 작성</a>
				</div>
				<div> <!-- 여기에 댓글이 생깁니다! -->
					<c:forEach items="${ReplyInfo}" var="reply">
						<c:if test="${reply.post_id == postIdParameter && reply.reply_group == 0}">
							<li style="border-top: 1px solid #ccc; list-style-type: none; padding:10px; margin:10px;">
								<div id="reply" style="display: flex;">
									<c:forEach var="userInfo" items="${userInfo}">
										<c:choose>
											<c:when test="${userInfo.user_num == reply.user_num and reply.reply_hide == 0}">
												<div id="replyName"><c:out value="${userInfo.user_name}"/></div>
												<div id="replyContent" onclick="toggleReplyGroup_${reply.reply_id}()"><c:out value="${reply.reply_content}"/></div>
												<div id="replyDate"><fmt:formatDate pattern="YYYY/MM/dd hh:mm" value="${reply.reply_regdate}"/></div>
												<c:if test="${reply.user_num == user_num}">
													<a class="btn-getstarted" id="hideReply" onclick="hideReply(${reply.reply_id})">삭제</a>
												</c:if>
											</c:when>
											<c:when test="${userInfo.user_num == reply.user_num and reply.reply_hide == 1}">
												<div id="deleteReply" style="width:100%; text-align:center;">작성자에 의해 지워진 댓글입니다.</div>
											</c:when>
										</c:choose>
									</c:forEach>
								</div>
								
								<div id="replyGroup_${reply.reply_id}" style="display : none; margin : 10px;">
									<textarea id="replyGroupContent_${reply.reply_id}" style="width:100%; resize:none;"></textarea>
									<div id="replyGroupReg_${reply.reply_id}" style="width:100%; text-align:right;">
										<a class="btn-getstarted" id="replyGroupRegister" onclick=insertReplygroup(${reply.reply_id})>댓글 작성</a>
									</div>
								</div>
								<script>
									function toggleReplyGroup_${reply.reply_id}() {
								        // replyGroup의 display 속성을 토글
								        var replyGroup = document.getElementById("replyGroup_${reply.reply_id}");
								        if (replyGroup.style.display === "none") {
								            replyGroup.style.display = "block";
								        } else {
								            replyGroup.style.display = "none";
								        }
								    }
								</script>
								
								<c:forEach items="${ReplyInfo}" var="replyGroup">
									<c:if test="${replyGroup.post_id == postIdParameter && replyGroup.reply_group == reply.reply_id}">
										<li style="list-style-type: none; padding:10px; margin:10px; width:100%; float:right; border-top: 1px solid #ccc;">
											<div id="replyGroup" style="display: flex;">
												<c:forEach var="userInfo" items="${userInfo}">
													<c:choose>
														<c:when test="${userInfo.user_num == replyGroup.user_num and replyGroup.reply_hide == 0}">
															<div>→</div>
															<div id="replyName" style="padding-left:40px;"><c:out value="${userInfo.user_name}"/></div>
															<div id="replyContent"><c:out value="${replyGroup.reply_content}"/></div>
															<div id="replyDate"><fmt:formatDate pattern="YYYY/MM/dd hh:mm" value="${replyGroup.reply_regdate}"/></div>
															<c:if test="${replyGroup.user_num == user_num}">
																<a class="btn-getstarted" id="hideReply" onclick="hideReply(${replyGroup.reply_id})">삭제</a>
															</c:if>
														</c:when>
														<c:when test="${userInfo.user_num == replyGroup.user_num and replyGroup.reply_hide == 1}">
															<div id="deleteReply" style="width:100%; text-align:center;">사용자에 의해 지워진 댓글입니다.</div>
														</c:when>
													</c:choose>
												</c:forEach>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</li>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<c:forEach var="postInfo" items="${PostInfo}">
				<c:choose>
					<c:when test="${postInfo.post_id == postIdParameter and postInfo.user_num == user_num}">
						<div id="btn_box" style="border-bottom: 1px solid #ccc; text-align:right; width:100%;">
							<a class="btn-getstarted scrollto" id="modifyPost" href="/rc_pro/board/modify?category_id=${postInfo.category_id}&region_id=${postInfo.region_id}&post_id=${postInfo.post_id}">수정</a>
							<a>|</a>
							<a class="btn-getstarted scrollto" id="deletePost">삭제</a>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</article>
	</section>
	<style>
		li {
			list-style-type: none;
		}
	
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
	    
	    #reply {
	    	width:100%;
	    }
	    
	    #replyName {
	    	width : 10%;
	    	margin-right: 10px;
	    	border-right: 1px solid #ccc;
	    }
	    
	    #replyContent {
	    	width : 77%;
	    	word-wrap: break-word; 
	    }
	    
	    #replyDate {
	    	width : 10%;
	    	text-align:right;
	    }
	    
	    #hideReply {
	    	width : 3%;
	    	text-align:center;
	    }
	    
	    #replyGroupReg {
	    	width:100%;
	    	text-align:right;
	    }
	    
	    
	</style>
	<script>	
		var myCsrfHeaderName = "${_csrf.headerName}";
		var myCsrfToken = "${_csrf.token}";
		
		$(document).ajaxSend(function(e, xhr){
		   xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken);
		});
	
		
		var urlParams = new URLSearchParams(window.location.search);
		var post_id = urlParams.get("post_id");
		
		document.getElementById('replyRegister').addEventListener('click', function() {
			
			// 필요한 정보 얻기
			var reply_content = document.getElementById("replyContent").value;
			console.log("post_id : " + post_id);
			console.log("reply_content : " + reply_content);
			
		    // AJAX 요청
		    $.ajax({
		        type: "POST",
		        url: "/rc_pro/board/detail/reply",
		        data: {
		            post_id: post_id,
		            reply_content: reply_content
		        },
		        dataType: "json",
		        success: function(result) {
		            // 성공 시 실행할 코드
		            console.log("AJAX 요청 성공");
		            console.log(result);
		            alert("작성되었습니다");
		            location.reload(true);
		        },
		        error: function(xhr, status, error) {
		            // 에러 발생 시 실행할 코드
		            console.error("AJAX 요청 실패");
		            console.log("Status: " + status);
		            console.log("Error: " + error);
		        }
		    });
		});
	
		function insertReplygroup(reply_id) {
			
			var replyGroup_id = reply_id
			var replyGroupContent = document.getElementById("replyGroupContent_" + reply_id).value;
			
			console.log("post_id : " + post_id);
			console.log("replyGroup_id : " + replyGroup_id);
			console.log("replyGroupContent : " + replyGroupContent);
			
		    // AJAX 요청
		    $.ajax({
		        type: "POST",
		        url: "/rc_pro/board/detail/replyGroup",
		        data: {
		            post_id: post_id,
		            replyGroup_id : replyGroup_id,
		            replyGroupContent: replyGroupContent
		        },
		        dataType: "json",
		        success: function(result) {
		            // 성공 시 실행할 코드
		            console.log("AJAX 요청 성공");
		            console.log(result);
		            alert("작성되었습니다");
		            location.reload(true);
		        },
		        error: function(xhr, status, error) {
		            // 에러 발생 시 실행할 코드
		            console.error("AJAX 요청 실패");
		            console.log("Status: " + status);
		            console.log("Error: " + error);
		        }
		    });
		}
		
		document.getElementById('like').addEventListener('click', function() {
			console.log("post_id : " + post_id);
			
		    // AJAX 요청
		    $.ajax({
		        type: "POST",
		        url: "/rc_pro/board/detail/likeReply",
		        data: {
		            post_id: post_id
		        },
		        dataType: "json",
		        success: function(result) {
		            // 성공 시 실행할 코드
		            console.log("AJAX 요청 성공");
		            console.log(result);
		            alert("좋아요 누르기");
		            location.reload(true);
		        },
		        error: function(xhr, status, error) {
		        	console.error("AJAX 요청 실패");
				    $.ajax({
				        type: "POST",
				        url: "/rc_pro/board/detail/unlikeReply",
				        data: {
				            post_id: post_id
				        },
				        dataType: "json",
				        success: function(result) {
				            // 성공 시 실행할 코드
				            console.log("AJAX 요청 성공");
				            console.log(result);
				            alert("좋아요 해제");
				            location.reload(true);
				        },
				        error: function(xhr, status, error) {
				            // 에러 발생 시 실행할 코드
				            console.error("AJAX 요청 실패");
				            console.log("Status: " + status);
				            console.log("Error: " + error);
				        }
				    });
		        }
		    });
			
		});
		
		document.getElementById('scrape').addEventListener('click', function() {
			console.log("post_id : " + post_id);
			
		    // AJAX 요청
		    $.ajax({
		        type: "POST",
		        url: "/rc_pro/board/detail/scrapeReply",
		        data: {
		            post_id: post_id
		        },
		        dataType: "json",
		        success: function(result) {
		            // 성공 시 실행할 코드
		            console.log("AJAX 요청 성공");
		            console.log(result);
		            alert("스크랩하기");
		            location.reload(true);
		        },
		        error: function(xhr, status, error) {
				    $.ajax({
				        type: "POST",
				        url: "/rc_pro/board/detail/unscrapeReply",
				        data: {
				            post_id: post_id
				        },
				        dataType: "json",
				        success: function(result) {
				            // 성공 시 실행할 코드
				            console.log("AJAX 요청 성공");
				            console.log(result);
				            alert("스크랩해제");
				            location.reload(true);
				        },
				        error: function(xhr, status, error) {
				            // 에러 발생 시 실행할 코드
				            console.error("AJAX 요청 실패");
				            console.log("Status: " + status);
				            console.log("Error: " + error);
				        }
				    });
		        }
		    });
			
		});
		
		document.getElementById('deletePost').addEventListener('click', function() {
			
		    // AJAX 요청
		    $.ajax({
		        type: "POST",
		        url: "/rc_pro/board/detail/hide",
		        data: {
		            post_id: post_id
		        },
		        dataType: "json",
		        success: function(result) {
		            // 성공 시 실행할 코드
		            console.log("AJAX 요청 성공");
		            console.log(result);
		            alert("삭제되었습니다.");
		            window.location.href="/rc_pro/";
		        },
		        error: function(xhr, status, error) {
		            // 에러 발생 시 실행할 코드
		            console.error("AJAX 요청 실패");
		            console.log("Status: " + status);
		            console.log("Error: " + error);
		        }
		    });
			
		});
		
		function hideReply(reply_id) {
			
			var reply_id = reply_id
			
			console.log("reply_id : " + reply_id);
			
		    // AJAX 요청
		    $.ajax({
		        type: "POST",
		        url: "/rc_pro/board/detail/hideReply",
		        data: {
		        	reply_id : reply_id
		        },
		        dataType: "json",
		        success: function(result) {
		            // 성공 시 실행할 코드
		            console.log("AJAX 요청 성공");
		            console.log(result);
		            alert("댓글이 삭제되었습니다.");
		            location.reload(true);
		        },
		        error: function(xhr, status, error) {
		            // 에러 발생 시 실행할 코드
		            console.error("AJAX 요청 실패");
		            console.log("Status: " + status);
		            console.log("Error: " + error);
		        }
		    });
		}
	</script>

<%@ include file="../myinclude/myfooter.jsp" %>   