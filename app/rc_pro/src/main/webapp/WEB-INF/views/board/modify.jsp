<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../myinclude/myheader.jsp" %>
<!-- myheader.jsp 에서 
<body> -->
	<section>
		<header style="border-bottom: 1px solid #ccc;">
			<h1><a href="#">-- 게시판</a></h1> <!-- 나중에 현재 위치한 게시판으로 이동 -->
		</header>
		<article style="margin-top: 10px;">
			<form role="form" action="${contextPath}/myboard/register" method="post" name="frmBoard">
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="btitle">
				</div>
				
				<div class="form-group" style="margin-top:10px;">
					<label>내용</label> <textarea class="form-control" rows="3" name="bcontent" style="height:500px;resize:none;"></textarea>
				</div>
				
				<div style="margin-top: 10px;">
					<button id="img">이미지 첨부</button>
					<span id="imgName">이미지 이름</span>
				</div>
				
				<a id="modify" class="btn btn-primary" style="margin-top: 10px;" type="post">수정</a>
			</form>
		</article>
	</section>
	<style>
	    body {
	        text-align: center; /* 부모인 body에 가운데 정렬 스타일 적용 */
	    }
	
	    section {
	        display: inline-block; /* inline-block으로 설정하여 텍스트 정렬 영향을 받음 */
	        text-align: left; /* 텍스트를 왼쪽 정렬로 되돌림 */
	        width: 75%; /* 페이지의 2/3 크기로 설정 */
	        max-width: 800px; /* 최대 너비 설정 (예시로 800px로 지정) */
	        margin-top: 100px;
	        padding: 20px; /* 내부 여백 설정 */
	        box-sizing: border-box; /* padding이 width에 포함되도록 box-sizing 설정 */
	    }
	</style>

<%@ include file="../myinclude/myfooter.jsp" %>   