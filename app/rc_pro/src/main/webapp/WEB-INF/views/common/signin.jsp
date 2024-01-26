<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="kr" data-bs-theme="auto">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<head><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<meta charset="utf-8">
	<title>회원가입 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/signup.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>    
	<div class="container">
		<div class="screen">
			<div class="screen__content">
				<form class="login">
					<div class="login__field">
						<label class="login__inputcontent">이름 : </label>
				    	<input type="text" class="login__inputname" name="user_name"  id="user_name" required/>
					</div>
					<div class="login__field">
						<label class="login__inputcontent">생년월일 : </label>
						<input type="text" class="login__inputname" name="user_birth" id="user_birth" placeholder="ex)970627" maxlength="6" required>
					</div>
					<div class="login__field btn-group">
						<label class="login__inputidlabel">아이디 : </label>
						<input type="text" class="login__inputid" name="user_id" id="user_id" placeholder="9~16자의 영어와 숫자" required>
						<button type="button" class="button login__submit" name="idcheckbtn" style="width: 105px;" id="idcheckbtn">중복 체크</button>
					</div>
					<div class="login__field">
						<div class="input-group">
							<div class="col-md-6">
								<label class="login__inputcontent">비밀번호 : </label>
								<input type="password" class="login__inputname" name="user_passwd" id="user_passwd" required>
							</div>
							<div class="col-md-6">	
								<label class="login__inputcontent">비밀번호 확인 : </label>
								<input type="password" class="login__inputname" name="user_passwdck" id="user_passwdck" required>
							</div>
						</div>
					</div>
					<label class="login__inputcontent">9~16자의 대소문자,숫자와 특수문자</label>
					<div class="login__field">
				    	<label class="login__inputcontent">전화번호 : &nbsp;</label>
		    			<select class="login__inputfirstnumber" id="user_pn1" aria-label="Default select example">
							<option selected value="">선택</option>
							<option value="030">030</option>
							<option value="011">011</option>
							<option value="010">010</option>
						</select>
						<span class="span__tag">-</span>
						<input class="login__inputnumber" type="text" maxlength="4" class="form-control" name="user_pn2" id="user_pn2" placeholder="xxxx" required>
						<span class="span__tag">-</span>
						<input class="login__inputnumber" type="text" maxlength="4" class="form-control" name="user_pn3" id="user_pn3" placeholder="xxxx" required>
					</div>
					<div class="login__field">
					    	<label class="login__inputcontent">이메일 : &nbsp;</label>
    		    			<input type="text" class="login__inputname" name="firstemail" id="firstemail" placeholder="email" aria-label="email" required>
							<span class="span__tag">@</span>
							<select class="login__inputemail" id="secondemail" aria-label="navigation meun">
								<option selected value="">이메일 선택</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
							</select>
					</div>
					<div class="login__field">
					    <label class="login__inputcontent">이용 지역 : </label>
						<select class="login__inputemail" id="reginfo" aria-label="navigation meun">
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
					
					<div class="btn-toolbar">
						<button class="button login__submit" type="button" style="width: 105px;" name="signinbtn" id="signinbtn">회원 가입</button>
						<button class="button login__submit" type="button" style="width: 100px;" name="closebtn" id="closebtn">창 닫기</button>
					</div>
					<sec:csrfInput/>       
				</form>
			</div> <!-- screen content div-end -->
			<div class="screen__background">
				<span class="screen__background__shape screen__background__shape4"></span>
				<span class="screen__background__shape screen__background__shape3"></span>    
				<span class="screen__background__shape screen__background__shape2"></span>
				<span class="screen__background__shape screen__background__shape1"></span>
			</div>    <!--screen__background div-end  -->
		</div><!-- screen div-end -->
	</div><!--container div-end  -->
	
	
<script>
	
		var myCsrfHeaderName = "${_csrf.headerName}" ;
		var myCsrfToken = "${_csrf.token}" ;
	
		$(document).ajaxSend(function(e, xhr){
			xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken) ;
				
		});
		
		function closescript(){
			self.opener=self;
			window.close();	
		}
		
		function checkuser_id(user_id){
			
			var myresult;
			var expid = /^[a-zA-Z0-9]{9,16}$/;
			if(!expid.test(user_id)){
				alert("아이디가 영어,숫자로 이루어진 9~16글자인지 확인해주세요.");
				return;
			}
			$.ajax({
				url : "/rc_pro/iddupcheck",
				data : {user_id : user_id},
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
		
		function checksignin(name,user_id,pw,birth,number1,number2,email){
			
			var expid = /^[a-zA-Z0-9]{9,16}$/;
			var exppassword = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{9,16}$/;
			var expbirth = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
			var expnumber = /^\d{4}$/;
			var expemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i;	
			
			var pn1 = document.getElementById("user_pn1").value;
			var email2 = document.getElementById("secondemail").value;
			var reginfo = document.getElementById("reginfo").value;
			
			if(name.length == 0){
				alert("이름을 입력해주세요.");
				return false;
			}
			
			<%--표현식으로 양식에 맞는지 확인--%>
			console.log("user_id2 :" + user_id);
			if(!expid.test(user_id)){
				alert("아이디가 영어,숫자로 이루어진 9~16글자인지 확인해주세요.");
				return false;
			}else if(!exppassword.test(pw)){
				alert("비밀번호가 대소문자,숫자와 특수문자로 이루어진 9~16글자가 아니거나 사용할수없는 특수문자가 사용되었습니다.");
				return false;
			}else if(!expbirth.test(birth)){
				alert("생년월일을 확인해주세요.(ex.040101)");
				return false;
			}else if(!(expnumber.test(number1)&&expnumber.test(number2))){
				alert("전화번호를 확인해주세요.");
				return false;
			}else if(!expemail.test(email)){
				alert("이메일을 확인해주세요.");
				return false;
			}
			
			<%--select 절이 입력됐는지 확인--%>
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
			
			<%--가입버튼이 눌렸을때 아이디 중복이 됐는지 다시 확인--%>
			console.log("user_id3 :" + user_id);
			if(!checkuser_id(user_id)){
				alert("아이디 중복체크후 다시 시도해주세요.")
				return false;
			}
			
			return true;
			
		}
		
		<%--아이디 중복 체크 버튼 클릭--%>
		$("#idcheckbtn").on("click",function(){		
			var user_id = document.getElementById("user_id").value;
			if(checkuser_id(user_id)){
				alert("사용 가능한 아이디입니다.")
			}else{
				alert("사용할수 없는 아이디입니다.")
			}
		});
		
		
		
		<%--회원가입 버튼 클릭--%>
		$("#signinbtn").on("click",function(){
			
			var user_name = document.getElementById("user_name").value;
			var user_id = document.getElementById("user_id").value;
			var user_passwd = document.getElementById("user_passwd").value;
			var user_passwdck = document.getElementById("user_passwdck").value;
			var user_birth = document.getElementById("user_birth").value;
			var pn1 = document.getElementById("user_pn1").value;
			var user_address = document.getElementById("reginfo").value;
			var pn2 = document.getElementById("user_pn2").value;
			var pn3 = document.getElementById("user_pn3").value;
			var email1 = document.getElementById("firstemail").value;
			var email2 = document.getElementById("secondemail").value;
//			var memberfrm = $("#memberform"); 
			var myresult;
			
			
			if(!checksignin(user_name,user_id,user_passwd,user_birth,pn2,pn3,email1)){
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
			
			if(!(user_passwd == user_passwdck)){
				alert("비밀번호 과 비밀번호 확인이 일치하지않습니다.")
				return;
			}	
				
			if(!checkuser_email(user_email)){
				alert("이미 가입된 이메일입니다.");
				return;
			}			
			
			
			$.ajax({
				type : "post",
				url : "/rc_pro/signin",
				data : {user_name : user_name,
						user_id : user_id,
						user_passwd : user_passwd,
						user_birth : user_birth,
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
				alert("회원가입이 완료되었습니다.")
				closescript();
			}
		});
		
		$("#closebtn").on("click",function(){
			closescript();
		});
	</script>
</body>
</html>
