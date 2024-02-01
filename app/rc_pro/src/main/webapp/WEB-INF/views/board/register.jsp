<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../myinclude/myheader.jsp" %>

<!-- myheader.jsp 에서 
<body> -->
	<section>
		<header style="border-bottom: 1px solid #ccc;">
	        <c:choose>
				<c:when test="${pagingCreator.boardPaging.category_id == '2'}" >
					<h1><a href="/rc_pro/board/list?category_id=2&region_id=${region_id}">홍보게시판</a></h1>
				</c:when>
				<c:when test="${pagingCreator.boardPaging.category_id == '3'}" >
					<h1><a href="/rc_pro/board/newslist?category_id=3&region_id=${region_id}">뉴스</a></h1>
				</c:when>
				<c:otherwise>
					<h1><a href="/rc_pro/board/list?category_id=1&region_id=${region_id}">자유게시판</a></h1>
				</c:otherwise>
			</c:choose>
		</header>
		<article style="margin-top: 10px;">
			<div class="form-group">
				<label>제목</label> <input class="form-control" name="btitle" id="btitle" style="border: 1px solid #007bff;">
			</div>
			
			<div class="form-group" style="margin-top:10px;">
				<label>내용</label> <textarea class="form-control" rows="3" name="bcontent" id="bcontent" style="height:500px;resize:none; border: 1px solid #007bff;"></textarea>
			</div>
			
			<c:choose>
				<c:when test="${pagingCreator.boardPaging.category_id == '3'}">
					<div style="margin-top: 10px;">
						<div class="uploadDiv"><%-- form이 없습니다 --%>
							<input id="inputFile" type="file" name="files" multiple><br>
						</div>
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			
			<button name="register" id="register" class="btn btn-primary" style="margin-top: 10px;">등록</button>
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
	    #register{
	    	border : none;
			background-color : #0ea2bd;
	    }
	</style>
<script>
	var myCsrfHeaderName = "${_csrf.headerName}";
	var myCsrfToken = "${_csrf.token}";
	
	$(document).ajaxSend(function(e, xhr){
	   xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken);
	});
	
	$("#register").on('click', function() {
		var region_id = ${region_id};
		var category_id = ${category_id};
		var post_title = document.getElementById("btitle").value;
		var post_content = document.getElementById("bcontent").value;
		var post_file;
		
		//uploadFiles 이름의 file 유형 input 요소를 변수에 저장
		try {
			if (category_id == 3){
				//파일업로드 처리
				//FormData() Ajax 파일 전송 시에 사용되는 Web API 클래스의 생성자
				var formData = new FormData();
				
				var inputFiles = $("input[name='files']");
			
				//inputFiles에 저장된 파일들을 files 변수에 저장.
				//inputFiles[0]은 첫번째 input 요소를 의미(input 요소가 하나만 있더라도 [0]을 명시해야 함).
				var files = inputFiles[0].files;
				
				if (files.length > 1) {
					alert("이미지는 한개만 업로드 해주세요");
					return;
				}
			 
				//formdata 객체에 파일추가
				/*
				for(var i = 0; i < files.length ; i++) {
					//uploadFiles 파라미터로 file 정보 추가
					formData.append("uploadFiles", files[i]);
				}
				*/
				// 파일 하나만 업로드하게 했습니다. 
				formData.append("uploadFiles", files[0]);
				console.log("files[0] : " + files[0].name);
				post_file = files[0].name;	
			}
		}
		catch {
			alert("썸네일을 업로드 해주세요");
			return;
		}
	 	
		if (category_id == 3){}
		else { post_file = 0; }
		
		console.log('서버 응답:', region_id);
		console.log('서버 응답:', category_id);
		console.log('서버 응답:', post_title);
		console.log('서버 응답:', post_content);
		console.log('서버 응답:', post_file);
	
		//url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.
		$.ajax({
			type: 'post',
			url: '${contextPath}/board/register/fileUploadAjaxAction',
			processData: false, //contentType에 설정된 형식으로 data를 처리하지 않음.
			contentType: false, //contentType에 MIME 타입을 지정하지 않음.
			data: formData,
			dataType: 'text',
			success: function(uploadResult, status){
			}
		})
		
		//insert post_info 
		$.ajax({
			type : "post",
			url : "/rc_pro/board/register?category_id=${category_id}&region_id=${region_id}",
			data : {
				region_id : region_id,
				category_id : category_id,
				post_title : post_title,
				post_content : post_content,
				post_file : post_file
			},
			dataType : "json",
			async: false,
			success : function(result) { 
				// 결과 성공 콜백함수        
				alert("등록되었습니다.") 
				if (category_id == 3) {
					window.location.href="/rc_pro/board/newslist?category_id=3&region_id=${region_id}";
				}
				else {
					window.location.href="/rc_pro/board/list?category_id=${category_id}&region_id=${region_id}"
				}}
		});
	});
</script>
<!--
</body>
 myfooter.jsp에서 
 -->
<%@ include file="../myinclude/myfooter.jsp" %>   