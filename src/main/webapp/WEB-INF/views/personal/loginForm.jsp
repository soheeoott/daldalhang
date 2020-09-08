<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name = "google-signin-client_id" content = "771757649911-vakhnpdq4sm5bdri1m3pokbm5tj04007.apps.googleusercontent.com">

<!--  	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="resources/loginV1/css/util.css"> -->
	<link rel="stylesheet" type="text/css" href="resources/loginV1/css/main.css"> 

	<script>
	$(document).ready(function(){
		
		var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
	    $("input[name='id']").val(userInputId);
	   
		if($("input[name='notExist']").val() == "true"){
				$('#iMessage').html('가입하지 않은 아이디이거나 잘못된 비밀번호 입니다!');
		    	$('#iMessage').css('color', 'red');
		} 
		    
		if($("input[name='notVerify']").val() == "true"){
			$('#iMessage').html('이메일 인증이 되지 않았습니다. <br> 이메일을 확인하시고 인증해주시기 바랍니다!');
		   	$('#iMessage').css('color', 'red');
		}
		
		 if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                   // 아이디 저장하기 체크되어있을 시,
			$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}
		
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
	    
	    	 if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
		            var userInputId = $("input[name='id']").val();
		            setCookie("userInputId", userInputId, 1); // 1일 동안 쿠키 보관
		            //alert(userInputId);
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("userInputId");
		        }
	    }); //idSaveCheck_change

	 	// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 1); // 7일 동안 쿠키 보관
	        }
	    });
	}); //ready
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	} // setCookie
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}//deleteCookie
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}//getCookie
	</script>
	
	<style type="text/css">
	.inputInfo {
	    width: 100%;
	    position: relative;
	    border-bottom: 2px solid #d9d9d9;
	    margin-bottom: 23px;
	}
	
	.check {
	    position: relative;
	    float: left;
	}

	.socialform {
	    max-width: 300px;
	    margin: 0 auto;
	    position: relative;
	    display: block;
	    top: 40px;
	}
	
	.submit {
    color: #fff;
    font-size: 20px;
    line-height: 45px;
    width: 450px;
    background: #D1B894;
    border-radius: 3px;
    text-align: center;
    max-width: 500px;
    border: 0px;
    display: block;
    overflow: hidden;
    height: 100%;
    margin: 0 auto;
    background-position: -1px -1px;
    cursor: pointer;
	}
	
	.containerBox {
	    width: 100%;
	    min-height: 100vh;
	    display: -webkit-flex;
	    display: -moz-box;
	    display: -ms-flexbox;
	    justify-content: center;
	}
	
	#form1 {
	width: 100%;
	}
	
	.login100-form-title {
	    display: block;
	    font-size: 39px;
	    color: #333333;
	    line-height: 1.2;
	    text-align: center;
	}
	
	.p-b-49 {
	    padding-bottom: 49px;
	}
	
	.wrap-login {
	width: 500px;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    padding-right: 55px;
    padding-left: 55px;
    padding-bottom: 54px;
    padding-top: 65px;
	}
	
	.loginImg {
	display: block;
    font-size: 39px;
    color: #333333;
    line-height: 1.2;
    text-align: center;
    padding-bottom: 49px;
	}
	
	.img {
		display: block;
	    overflow: hidden;
	    width: 150px;
	    height: 100%;
	    margin: 0 auto;
	    background-position: -1px -1px;
	    font-size: 15px;
	    color: transparent;
	}
	
	.label-input {
	    padding-left: 7px;
	}
	
	input {
    outline: none;
    border: none;
	}
	
	.input100 {
	    font-size: 16px;
	    color: #333333;
	    line-height: 1.2;
	    display: block;
	    width: 100%;
	    height: 55px;
	    padding: 0 7px 0 43px;
	}
	
	.focus-input100 {
	    position: absolute;
	    display: block;
	    width: 100%;
	    height: 100%;
	    top: 0;
	    left: 0;
	    pointer-events: none;
	}
	
	.findwrap {
		text-align: right!important;
		text-align: right;
		padding-bottom: 31px;
	}
	
	a {
	    text-decoration: none;
	    background-color: transparent;
		transition: all 0.4s;
  			-webkit-transition: all 0.4s;
	}
	
	.container-login100-form-btn {
	    display: -webkit-box;
	    display: -webkit-flex;
	    display: -moz-box;
	    display: -ms-flexbox;
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: center;
	}
	
	.wrap-login100-form-btn {
	    width: 100%;
	    display: block;
	    position: relative;
	    z-index: 1;
	    border-radius: 25px;
	    overflow: hidden;
	    margin: 0 auto;

	}
	
	.login100-form-bgbtn {
	    position: absolute;
	    z-index: -1;
	    width: 300%;
	    height: 100%;
	    /* background: -webkit-linear-gradient(right, #00dbde, #fc00ff, #00dbde, #fc00ff); */
	    background: -o-linear-gradient(right, #00dbde, #fc00ff, #00dbde, #fc00ff);
	    background: -moz-linear-gradient(right, #00dbde, #fc00ff, #00dbde, #fc00ff);
	    background: linear-gradient(right, #00dbde, #fc00ff, #00dbde, #fc00ff);
	    top: 0;
	    left: -100%;
	    -webkit-transition: all 0.4s;
	    -o-transition: all 0.4s;
	    -moz-transition: all 0.4s;
	    transition: all 0.4s;
	}
	
	.login100-form-btn {
	    font-size: 16px;
	    color: #fff;
	    line-height: 1.2;
	    text-transform: uppercase;
	    display: -webkit-box;
	    display: -webkit-flex;
	    display: -moz-box;
	    display: -ms-flexbox;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    padding: 0 20px;
	    width: 100%;
	    height: 50px;
	}
	
	button {
		outline: none !important;
		border: none;
		background: transparent;
	}
	
	button:hover {
		cursor: pointer;
	}
	
	#iMessage {
	margin-top: 15px;
	}
	
	.img {
	display: block;
    overflow: hidden;
    width: 150px;
    height: 100%;
    margin: 0 auto;
    background-position: -1px -1px;
    font-size: 15px;
    color: transparent;
	}
	
	.sbtn{
	float: left;
    }
    
    .socialbtn {
   	margin-right : 2em;
   	width: 60px;
   	height: 60px;
   	float: left;
    }
    
    input[type=password] { font-family: "Iropke Batang", serif; }

	input::placeholder { font-family: 'Jeju Gothic', sans-serif; }
	
	.btnwrap {
	padding: .375rem .75rem;
	cursor: pointer;
	}
	</style>
	
	<style type="text/css">
	.limiter {
    margin: 0 auto;
    position: relative;
    top: 110px;
	}
	
	.container-login100 {
    width: 100%;
    min-height: 100vh;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
	}
	
	.wrap-login100 {
    width: 600px;
    overflow: hidden;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding: 100px;
    top: -55px;
    position: relative;
	}
	
	.login100-form {
    width: 500px;
	}
	
	.login100-form-title {
    font-size: 24px;
    color: #333333;
    line-height: 1.2;
    text-align: center;
    width: 100%;
    display: block;
    padding-bottom: 40px;
	}
	
	.validate-input {
    position: relative;
	}
	
	.wrap-input100 {
    position: relative;
    width: 100%;
    z-index: 1;
    margin-bottom: 10px;
	}
	
	.container-login100-form-btn {
    width: 100%;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding-top: 20px;
	}
	
	.text-center {
    text-align: center!important;
	}
	
	.p-t-12 {
    padding-top: 25px;
	}
	
	.p-t-136 {
    padding-top: 136px;
	}
	
	.txt1 {
    font-size: 18px;
    line-height: 1.5;
    color: #999999;
    margin-right: 5em;
	}
	
	.txt2 {
    font-size: 18px;
    line-height: 1.5;
    color: #666666;
	}
	
	a:hover {
	text-decoration: none;
  	color: #57b846;
	}
	
	button:hover {
	cursor: pointer;
	}
	
	.login100-form-btn:hover {
  	background: #333333;
	}
	
	@media (max-width: 992px) {
	  .wrap-login100 {
	    padding: 177px 90px 33px 85px;
	  }
	
	  .login100-pic {
	    width: 35%;
	  }
	
	  .login100-form {
	    width: 50%;
	  }
	}
	
	@media (max-width: 768px) {
	  .wrap-login100 {
	    padding: 100px 80px 33px 80px;
	  }
	
	  .login100-pic {
	    display: none;
	  }
	
	  .login100-form {
	    width: 100%;
	  }
	}
	
	@media (max-width: 576px) {
	  .wrap-login100 {
	    padding: 100px 15px 33px 15px;
	  }
	}

	.validate-input {
	  position: relative;
	}
	
	.alert-validate::before {
	  content: attr(data-validate);
	  position: absolute;
	  max-width: 70%;
	  background-color: white;
	  border: 1px solid #c80000;
	  border-radius: 13px;
	  padding: 4px 25px 4px 10px;
	  top: 50%;
	  -webkit-transform: translateY(-50%);
	  -moz-transform: translateY(-50%);
	  -ms-transform: translateY(-50%);
	  -o-transform: translateY(-50%);
	  transform: translateY(-50%);
	  right: 8px;
	  pointer-events: none;
	
	  color: #c80000;
	  font-size: 13px;
	  line-height: 1.4;
	  text-align: left;
	
	  visibility: hidden;
	  opacity: 0;
	
	  -webkit-transition: opacity 0.4s;
	  -o-transition: opacity 0.4s;
	  -moz-transition: opacity 0.4s;
	  transition: opacity 0.4s;
	}
	
	.alert-validate::after {
	  content: "\f06a";
	  display: block;
	  position: absolute;
	  color: #c80000;
	  font-size: 15px;
	  top: 50%;
	  -webkit-transform: translateY(-50%);
	  -moz-transform: translateY(-50%);
	  -ms-transform: translateY(-50%);
	  -o-transform: translateY(-50%);
	  transform: translateY(-50%);
	  right: 13px;
	}
	
	.alert-validate:hover:before {
	  visibility: visible;
	  opacity: 1;
	}
	
	@media (max-width: 992px) {
	  .alert-validate::before {
	    visibility: visible;
	    opacity: 1;
	  }
	}
	</style>
</head>
<body>
<%@ include file="../common/footer.jsp" %>	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">

				<form class="login100-form validate-form" action="login" name="form1" method="post">
					<span class="login100-form-title">
						로그인
					</span>

					<div class="wrap-input100 validate-input"> <!-- data-validate = "Valid email is required: ex@abc.xyz" -->
						<input class="input100" type="text" name="id" id="id" placeholder="아이디">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
						<div id="id_check"></div> <!-- placeholder="영문 또는 숫자, 4~20자 이내"  -->
					</div>

					<div class="wrap-input100 validate-input"> <!-- data-validate = "Password is required" -->
						<input class="input100" type="password" name="password" id="password" placeholder="비밀번호">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
						<div id = "iMessage"></div>
						<div id="pw_check"></div>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							<input type="checkbox" id="idSaveCheck" class="idSaveCheck" >
							아이디저장
						</span>
						
						<a class="txt2" href="#">
							아이디 / 비밀번호 찾기
						</a>
					</div>
					
					<!-- 소셜로그인  -->
					<!-- Kakao -->
       				<input type="hidden" name="kakaoAccess_token" 				id="kakakoAccess_token">
       				<input type="hidden" name="kakaoToken_type" 				id="kakakoToken_type">
       				<input type="hidden" name="kakaoRefresh_token" 				id="kakakoRefresh_token">
       				<input type="hidden" name="kakaoExpires_in" 				id="kakakoExpires_in">
       				<input type="hidden" name="kakaoRefresh_token_expires_in" 	id="kakakoRefresh_token_expires_in">
       				
       				<!-- Google -->
       				<input type="hidden" name="googleEmail" 					id="googleEmail">
       				<input type="hidden" name="googleName" 						id="googleName">
       				
       				<!-- Login Flag -->
       				<input type="hidden" name="loginFlag" 						id="loginFlag" value="L">
       				
       				<!-- notExist -->
       				<input type="hidden" name="notExist" 						id="notExist" value="${notExist}">
       				
       				<!-- notVerify -->
       				<input type="hidden" name="notVerify" 						id="notVerify" value="${notVerify}">
					
					<!-- 네이버로 로그인을 위한 설정 -->
					<%
						String clientId = "DZbaIchlFW7qOqVHBCip";//애플리케이션 클라이언트 아이디값"; 6S696taO_GdRdtrcL2WK
						// 로그인에 성공하면 만든 페이지로 돌아가는 페이지의 주소
						String redirectURI = URLEncoder.encode("http://daldalhang.appspot.com/login?loginFlag=N", "UTF-8");
						SecureRandom random = new SecureRandom();
						String state = new BigInteger(130, random).toString();
						String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
						apiURL += "&client_id=" + clientId;
						apiURL += "&redirect_uri=" + redirectURI;
						apiURL += "&state=" + state;
						session.setAttribute("state", state);
					%>
					<div class="text-center p-t-12" style="font-size: 20px;">
						간편 로그인
						<div class= "socialform">
	        					<div class= "btnwrap">
	        							
	        							 <!-- 네이버 로그인 버튼 -->
	        							<div class="sbtn">
	        								<a href="<%=apiURL%>">
		        							<img id="naver-login-btn" src="resources/image/naver_small_Green.png" class = "socialbtn" />
		        							</a>
	        							</div>
	        							
	        							<!-- 카카오 로그인 버튼 -->
			        					<div class="sbtn">
			        						<img id="kakao-login-btn" src="resources/image/login_btn_kakao.jpg" class = "socialbtn" />
			        					</div>
			        					
			        					<!-- 구글 로그인 버튼 -->
		        						<div id="my-signin2" class = "sbtn"></div>
		        						
		        					<!-- 구글 로그인 버튼 변경을 위한 설정	 -->
	 								 <script>
	  								  function onSuccess(googleUser) {
	     								//console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
	      
	    								var profile = googleUser.getBasicProfile();
										console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
										console.log('Name: ' + profile.getName());
										console.log('Image URL: ' + profile.getImageUrl()); 
										console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		
									  	document.form1.googleEmail.value 	= profile.getEmail();
	  									document.form1.googleName.value 	= profile.getName();
										document.form1.loginFlag.value 		= "G";
	
										// alert(JSON.stringify(authObj));
	
										document.form1.submit();
	    							}
	    							
	  								function onFailure(error) {
	      								console.log(error);
	    							}
	  								
	    							function renderButton() {
	      								gapi.signin2.render('my-signin2', {
	        							'scope': 'profile email',
	        							'width': 60,
	        							'height': 60,
	        							'longtitle': true,
	        							'theme': 'dark',
	        							'onsuccess': onSuccess,
	        							'onfailure': onFailure
	      								});
	    							}
	  							</script>
	
	  							<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
		        						
		      	  				</div><!-- btn -->	
		      				</div><!-- socialform -->
			      	 
							<script type='text/javascript'>
				      		  //<![CDATA[
				      		  // 사용할 앱의 JavaScript 키를 설정해 주세요.  7a1993d1c33d5ff4f8871de6ef549ab1
				        		Kakao.init('209250831acb79383c4b8e6eea532fe2');
				       		 // 카카오 로그인 버튼을 생성합니다.
				        		Kakao.Auth.createLoginButton({
				            		container: '#kakao-login-btn',
				            		success: function (authObj) {
				            
				            		document.form1.kakaoAccess_token.value 			= authObj.access_token;
				            		document.form1.kakaoToken_type.value 			= authObj.token_type;
				            		document.form1.kakaoRefresh_token.value 		= authObj.refresh_token;
				            		document.form1.kakaoExpires_in.value 			= authObj.expires_in;
				            		document.form1.kakaoRefresh_token_expires_in.value = authObj.refresh_token_expires_in;
				            		document.form1.loginFlag.value = "K";			            	
				            	
				                	//alert(JSON.stringify(authObj));
				            	
				            		document.form1.submit();
				            		},
				            		fail: function (err) {
				                		alert(JSON.stringify(err));
				            		}
				        		});
				        
				        					       			        
				      		//]]>
							</script>
					</div>

					<div class="text-center p-t-136" style="font-size: 18px;">
						아직 회원이 아니세요?
						<a class="txt2" href="#" style="color:#ff0000a1;">
							 회원가입
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="resources/loginV1/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/loginV1/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/loginV1/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/loginV1/vendor/select2/select2.min.js"></script>
	<script src="resources/loginV1/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script src="resources/loginV1/js/main.js"></script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>