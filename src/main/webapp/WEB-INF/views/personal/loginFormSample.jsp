<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	    <title></title>
	    <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <link rel="icon" href="resources/login/images/icons/favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="resources/login/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
		<link rel="stylesheet" type="text/css" href="resources/login/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="resources/login/vendor/css-hamburgers/hamburgers.min.css">
		<link rel="stylesheet" type="text/css" href="resources/login/vendor/animsition/css/animsition.min.css">
		<link rel="stylesheet" type="text/css" href="resources/login/vendor/select2/select2.min.css">
		<link rel="stylesheet" type="text/css" href="resources/login/vendor/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" type="text/css" href="resources/login/css/util.css">
		<link rel="stylesheet" type="text/css" href="resources/login/css/main.css">
	    
	     <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	     <link rel="stylesheet" type="text/css" href="resources/css/loginStyle.css">
	     <script src="https://apis.google.com/js/platform.js" async defer></script>
		 <meta name = "google-signin-client_id" content = "771757649911-vakhnpdq4sm5bdri1m3pokbm5tj04007.apps.googleusercontent.com">
	     <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	     
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
		.limiter {
			margin-top: 300px;
		}

		.containerBox {
		    width: 100%;
		    min-height: 100vh;
		    display: -webkit-flex;
		    display: -moz-box;
		    display: -ms-flexbox;
		    justify-content: center;
		}
		</style>
	</head>
<body>
  	
  	<div class="limiter">
		<div class="containerBox">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">아이디</span>
						<input class="input100" type="text" name="username" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">비밀번호</span>
						<input class="input100" type="password" name="pass" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							아이디/비밀번호 찾기
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							간편 로그인
						</span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

					<div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17">
							Or Sign Up Using
						</span>

						<a href="#" class="txt2">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
  	
  	<script src="resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/login/vendor/animsition/js/animsition.min.js"></script>
	<script src="resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/login/vendor/select2/select2.min.js"></script>
	<script src="resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/login/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="resources/login/vendor/countdowntime/countdowntime.js"></script>
	<script src="resources/login/js/main.js"></script>
  	
</body>
<%@ include file="../common/footer.jsp" %>
</html>