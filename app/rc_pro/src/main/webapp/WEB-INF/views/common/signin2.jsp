<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>

<meta charset="UTF-8">
<title>회원가입 페이지</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

	<!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<h2>회원 가입</h2>
	
	
		<hr>			
		<div style="width:200px" class="input-group">
			<h4>이름:&nbsp;&nbsp;</h4>
			<input type="text" class="form-control" name="user_name"  id="user_name" placeholder="이름" required/> 
		</div>
		<div style="width:350px" class="input-group">
			<h4>아이디:&nbsp;&nbsp;</h4>
			<input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디" required>
			<button type="button" class="btn btn-secondary btn-sm" name="idcheckbtn" id="idcheckbtn">중복 체크</button>
			<h6>&nbsp;&nbsp;(9~16자의 특수 문자를 제외한 영어와 숫자)</h6>
		</div>			
		<div style="width:300px" class="input-group">
			<h4>비밀번호:&nbsp;&nbsp;</h4>
			<input type="password" class="form-control" name="user_passwd" id="user_passwd" placeholder="비밀번호" required>
			<h6>&nbsp;&nbsp;&nbsp;&nbsp;(9~16자의 대소문자,숫자와 특수문자)</h6>	
		</div>		
		<div style="width:300px" class="input-group">
			<h4>생년월일:&nbsp;&nbsp;</h4>
			<input type="text" class="form-control" name="user_birth" id="user_birth" placeholder="생년월일(6자리)" maxlength="6" required>
		</div>
		
		<div style="width:700px" class="input-group">
			<h4>전화번호:&nbsp;&nbsp;</h4>
			<!-- <input width="33%" type="text" class="form-control" name="user_pn" id="user_pn1" placeholder="010" required> -->
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
		
		<div style="width:600px" class="input-group">
			<h4>이메일:&nbsp;&nbsp;</h4>
			<input type="text" class="form-control" name="firstemail" id="firstemail" placeholder="email" aria-label="email" required>
			<span class="input-group-text">@</span>
			<select class="form-select" id="secondemail" aria-label="navigation meun">
				<option selected value="">이메일 선택</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
			</select>
		</div>
		<div style="width:300px" class="input-group">
			<h4>이용 지역:&nbsp;&nbsp;</h4>
			<select class="form-select" id="reginfo" aria-label="navigation meun">
				<option selected value="">지역 선택</option>
				<option value="관철동">관철동</option>
				<option value="1동">1동</option>
				<option value="2동">2동</option>
				<option value="2동">3동</option>
				<option value="3동">4동</option>
				<option value="4동">5동</option>
				<option value="5동">6동</option>
				<option value="6동">7동</option>
			</select>
		</div>
<!-- 				<div class="form-group mt-3">
					<textarea class="form-control" name="message" placeholder="요청사항" required></textarea>
				</div> -->
		<button class="btn btn-primary btn-lg" name="signinbtn" id="signinbtn">회원 가입</button>
		<button class="btn btn-primary btn-lg" onclick="window.location.href='/rc_pro/login';">취소</button>
	
	<script>
	
		var myCsrfHeaderName = "${_csrf.headerName}" ;
		var myCsrfToken = "${_csrf.token}" ;
	
		$(document).ajaxSend(function(e, xhr){
			xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken) ;
				
		});
		
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
				window.location.href="/rc_pro/login";
			}
		});
	</script>
</body>
</html>