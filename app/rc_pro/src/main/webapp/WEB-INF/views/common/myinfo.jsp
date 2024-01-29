<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<head>

<meta charset="UTF-8">
<title>마이 페이지</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

	<!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<br> 
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<header class="card-header">
					<h4 class="card-title mt-2">나의 정보</h4>
				</header>
				<article class="card-body">
				<form class="row g-3">
					<div style="display: block;" id="userinfo">
				    <input type="hidden" id="user_id" value='<sec:authentication property="principal.username"/>'/>
					  	<div class="col-md-12">
					    	<label class="form-label">이름 : </label>
					    	<c:out value="${userinfo.user_name }"/>
					  	</div>
					  	<hr>
					  	<div class="col-md-12">
					    	<label class="form-label">생년월일 : </label>
						    <c:out value="${userinfo.user_birth }"/>
						</div>
					 	<hr>
					  	<div class="col-12">
					    	<label class="form-label">아이디 : </label>
							<c:out value="${userinfo.user_id }"/>
					  	</div>
					  	<hr>
	  				  	<div class="col-12">
						    <label class="form-label">전화번호 : </label>
							<c:out value="${userinfo.user_pn }"/>
					  	</div>
					  	<hr>
	   				  	<div class="col-12">
					    	<label class="form-label">주소 : </label>
							<c:out value="${userinfo.user_address }"/>
					  	</div>
					  	<hr>
	   				  	<div class="col-12">
					    	<label class="form-label">이메일 : </label>
							<c:out value="${userinfo.user_email }"/>
					  	</div>
					  	<hr>
	   				  	<div class="col-12">
					    	<label class="form-label">회원가입일자 : </label>
					    	<fmt:formatDate value="${userinfo.user_regdate }" pattern="yyyy년 MM월 dd일 HH시mm분"/>
					  	</div>
					  	<hr>
					  	<div class="col-md-6">
						    <label class="form-label">기존 비밀번호</label>
						    <input type="password" class="form-control" name="user_passwd" id="user_passwd" required>
						</div>
						<hr>
						<label class="form-label">내가 쓴 글 </label>
						<div>
							<c:if test="${param.sortmenu eq 'post_id'}">
								<select id="sortmenu">
									<option selected value="post_id">글 번호순</option>
									<option value="post_view">조회수순</option>
									<option value="post_date">작성 날짜순</option>
								</select>
							</c:if>
							<c:if test="${param.sortmenu eq 'post_view'}">
								<select id="sortmenu">
									<option value="post_id">글 번호순</option>
									<option selected value="post_view">조회수순</option>
									<option value="post_date">작성 날짜순</option>
								</select>
							</c:if>
							<c:if test="${param.sortmenu eq 'post_date'}">
								<select id="sortmenu">
									<option value="post_id">글 번호순</option>
									<option value="post_view">조회수순</option>
									<option selected value="post_date">작성 날짜순</option>
								</select>
							</c:if>
							<select id="mypostinfo" aria-label="navigation meun">
								<option selected value="" >내가 쓴 글 선택</option>
								<c:forEach var="post" items="${postinfolist}">
									<option value="${post }">글번호 : <c:out value="${post.post_id }"/> 글 제목: <c:out value="${post.post_title }"/> 글 조회수 : <c:out value="${post.post_view }"/></option>
								</c:forEach>
							</select>	
							<hr>				
							<select id="myscrapeinfo" aria-label="navigation meun">
								<option selected value="">즐겨찾기 글 선택</option>
								<c:forEach var="scrape" items="${scrapelist}">	
									<option value="${scrape}">글번호 : <c:out value="${scrape.post_id }"/> 글 제목: <c:out value="${scrape.post_title }"/> 글 조회수 : <c:out value="${scrape.post_view }"/></option>
								</c:forEach>
							</select>
						</div>                      
					  	<hr>
				  	</div>
				  <div style="display: none" id="modifyinfo">				  
	  				  <div class="col-md-12">
					    <label class="form-label">변경할 비밀번호</label>
					    <input type="password" class="form-control" name="user_passwdch" id="user_passwdch" placeholder="9~16자의 대소문자,숫자와 특수문자">
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">비밀번호 확인</label>
					    <input type="password" class="form-control" name="user_passwdck" id="user_passwdck" placeholder="비밀번호 다시입력">
					  </div>
					  <div class="col-12">
					    <label class="form-label">변경할 전화번호</label>
					    <div class="col-12 input-group">
		    			<select class="form-select" id="user_pn1" aria-label="Default select example">
							<option selected value="">전화 번호</option>
							<option value="030">030</option>
							<option value="011">011</option>
							<option value="010">010</option>
						</select>
						<span class="input-group-text">-</span>
						<input type="text" maxlength="4" class="form-control" name="user_pn2" id="user_pn2" placeholder="xxxx" required>
						<span class="input-group-text">-</span>
						<input type="text" maxlength="4" class="form-control" name="user_pn3" id="user_pn3" placeholder="xxxx" required>
						</div>
					  </div>
					  
	  				  <div class="col-12">
					    <label class="form-label">이메일</label>
					    <div class="col-12 input-group">
		    			<input type="text" class="form-control" name="firstemail" id="firstemail" placeholder="email" aria-label="email" required>
						<span class="input-group-text">@</span>
						<select class="form-select" id="secondemail" aria-label="navigation meun">
							<option selected value="">이메일 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
						</div>
					  </div>
					  <div class="col-md-4">
					    <label class="form-label">이용 지역</label>
						<select class="form-select" id="reginfo" aria-label="navigation meun">
							<option selected value="">지역 선택</option>
							<option value="관철동">관철동</option>
							<option value="청진동">청진동</option>
							<option value="공평동">공평동</option>
							<option value="관수동">관수동</option>
							<option value="인사동">인사동</option>
							<option value="종로2가">종로2가</option>
							<option value="삼각동">삼각동</option>
							<option value="서린동">서린동</option>
						</select>
					  </div>
				  </div>
				  <div class="col-12 btn-toolbar" >
				    <button class="btn btn-primary" type="button" name="modifybtn" id="modifybtn" style="display:block;">정보 변경</button>
				    <button class="btn btn-primary" type="button" name="storebtn" id="storebtn" style="display:none;">변경 저장</button>
				    <button class="btn btn-primary" type="button" name="closebtn" id="closebtn">뒤로 가기</button>
				  </div>
				</form>
				</article> <!-- card-body end .// -->
			</div> <!-- card.// -->
		</div> <!-- col.//-->
	</div> <!-- row.//-->
</div> 
<!--container end.//-->

<br><br><br><br>
	<article class="bg-primary mb-3">  
		<div class="card-body text-center">
		    <h3 class="text-white mt-3">색조정하기</h3>
			<p class="h5 text-white">쓸말정하기</p><br><br>
		</div>
	</article>
	<script>
		var myCsrfHeaderName = "${_csrf.headerName}" ;
		var myCsrfToken = "${_csrf.token}" ;
	
		$(document).ajaxSend(function(e, xhr){
			xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken) ;
				
		});
	
	
		function checkuser_email(user_email){
			
			var myresult;
			
			$.ajax({
				url : "/rc_pro/emaildupcheck",
				data : {user_email : user_email},
				type : "post",
				dataType : "json",
				async: false,
				success: function(result){ //result 0 : 사용가능
					myresult = result;
				}
				
			});
			if(myresult == 0){
				return true;
			}else{
				return false;
			}	
		}
		
		function checkmodify(user_passwd,pn2,pn3,email1){
			var exppassword = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{9,16}$/;
			var expnumber = /^\d{4}$/;
			var expemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i;
			
			var pn1 = document.getElementById("user_pn1").value;
			var email2 = document.getElementById("secondemail").value;
			var reginfo = document.getElementById("reginfo").value;
			
			if(!exppassword.test(user_passwd)){
				alert("비밀번호가 대소문자,숫자와 특수문자로 이루어진 9~16글자가 아니거나 사용할수없는 특수문자가 사용되었습니다.");
				return false;
			}else if(!(expnumber.test(pn2)&&expnumber.test(pn3))){
				alert("전화번호를 확인해주세요.");
				return false;
			}else if(!expemail.test(email1)){
				alert("이메일을 확인해주세요.");
				return false;
			}
			
			if(pn1.length==0){
				alert("전화번호 앞자리를 선택해주세요.");
				return false;
			}else if(email2.length == 0){
				alert("이메일을 선택해주세요.");
				return false;
			}else if(reginfo.length == 0){
				alert("지역을 선택해주세요.")
				return false;
			}
			return true;
		}
		
		function closescript(){
			self.opener=self;
			window.close();	
		}
		
		function checkpw(user_passwd){
			var myresult;
			var exppassword = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{9,16}$/;
			var user_id = "${userinfo.user_id }";
			
//			alert("user_id : " + user_id);
			if(!exppassword.test(user_passwd)){
				alert("비밀번호를 확인해주세요.");
				return false;
			}
			
			$.ajax({
				url : "/rc_pro/pwcheck",
				data : {user_id : user_id,
					user_passwd : user_passwd},
				type : "post",
				dataType : "json",
				async: false,
				success: function(result){
					myresult = result;
				}				
			});
			if(myresult == 1){
				return true;
			}else{
				alert("비밀번호를 확인해주세요.");
				return false;
			}
		}
	
		$("#modifybtn").on("click",function(){
			var storebtn = document.getElementById("storebtn");
			var modifybtn = document.getElementById("modifybtn");
			var user_passwd = document.getElementById("user_passwd").value;
			var userinfo = document.getElementById("userinfo");
			var modifyinfo = document.getElementById("modifyinfo");
			
			
			if(!checkpw(user_passwd)){
				return;
			}
			userinfo.style.display = "none";
			modifyinfo.style.display = "block";
			storebtn.style.display = "block";
			modifybtn.style.display = "none";
		});
		
	
		$("#storebtn").on("click",function(){
			var storebtn = document.getElementById("storebtn");
			var modifybtn = document.getElementById("modifybtn");
			var user_passwd = document.getElementById("user_passwdch").value; 
			var user_passwdck = document.getElementById("user_passwdck").value;
			var pn2 = document.getElementById("user_pn2").value;
			var pn3 = document.getElementById("user_pn3").value;
			var email1 = document.getElementById("firstemail").value;
			var email2 = document.getElementById("secondemail").value;
			var pn1 = document.getElementById("user_pn1").value;
			var user_address = document.getElementById("reginfo").value;
			var user_id = "${userinfo.user_id }";
			
			var myresult;
			
			if(!(user_passwd == user_passwdck)){
				alert("비밀번호 과 비밀번호 확인이 일치하지않습니다.")
				return;
			}	
			
			if(!checkmodify(user_passwd,pn2,pn3,email1)){
				return;
			}
			var user_pn = pn1;
				user_pn += "-";
				user_pn += pn2;
				user_pn += "-";
				user_pn += pn3;
			var user_email = email1;
				user_email += "@";
				user_email += email2;
				
			if(!checkuser_email(user_email)){
				alert("이미 가입된 이메일입니다.");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "/rc_pro/myinfo",
				data : {user_id : user_id,
						user_passwd : user_passwd,
						user_pn : user_pn,
						user_email : user_email,
						user_address : user_address
				},
				dataType : "json",
				async: false,
				success: function(result){	
					myresult=result;
				}
			});
			if(myresult){
				alert("회원정보가 변경되었습니다.");
				location.reload();
			}
		});	
		$("#closebtn").on("click",function(){
			window.location.href="/rc_pro/";
		});
		
		$("#sortmenu").on("change",function(){
			
			var sortmenu = document.getElementById("sortmenu").value;
			var user_id = '<c:out value="${userinfo.user_id}"/>';

			if(sortmenu == ("post_id")){
				window.location.href="/rc_pro/myinfo?user_id="+user_id+"&sortmenu=post_id";
			}else if(sortmenu == ("post_view")){
				window.location.href="/rc_pro/myinfo?user_id="+user_id+"&sortmenu=post_view";
			}else if(sortmenu == ("post_date")){
				window.location.href="/rc_pro/myinfo?user_id="+user_id+"&sortmenu=post_date";
			}
			return;
		});
		
		$("#mypostinfo").on("change",function(){
			var mypostinfo = document.getElementById("mypostinfo").value;
			var pos1 = mypostinfo.indexOf('post_id')+8;//number, +8
			var pos2 = mypostinfo.indexOf(',');
			var pos3 = mypostinfo.indexOf('category_id')+12; //+12
			var pos4 = mypostinfo.indexOf(',',pos2+1);
			var pos5 = mypostinfo.indexOf('region_id')+10; // +10
			var pos6 = mypostinfo.indexOf(',',pos4+1);
			var post_id = mypostinfo.slice(pos1,pos2);
			var category_id = mypostinfo.slice(pos3,pos4);
			var region_id = mypostinfo.slice(pos5,pos6);
 			window.location.href="/rc_pro/board/detail?category_id="+category_id+"&region_id="+region_id +"&post_id="+post_id;
		});
		
		$("#myscrapeinfo").on("change",function(){
			var myscrapeinfo = document.getElementById("myscrapeinfo").value;
			var pos1 = myscrapeinfo.indexOf('post_id')+8;//number, +8
			var pos2 = myscrapeinfo.indexOf(',');
			var pos3 = myscrapeinfo.indexOf('category_id')+12; //+12
			var pos4 = myscrapeinfo.indexOf(',',pos2+1);
			var pos5 = myscrapeinfo.indexOf('region_id')+10; // +10
			var pos6 = myscrapeinfo.indexOf(',',pos4+1);
			var post_id = myscrapeinfo.slice(pos1,pos2);
			var category_id = myscrapeinfo.slice(pos3,pos4);
			var region_id = myscrapeinfo.slice(pos5,pos6);
 			window.location.href="/rc_pro/board/detail?category_id="+category_id+"&region_id="+region_id +"&post_id="+post_id;
		});
	</script>
	
</body>
</html>