<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>네이버/카카오 로그인</title>
	     <!-- <link rel="stylesheet" type="text/css" href="resources/css/loginStyle.css"> -->
	     <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
		    background: transparent;
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
		
	</head>
<body>

<main id="main">
	<section class="services">
		<div class="container">
			<div class="containerBox">
				<div class="wrap-login">
					
					<form action="login" id="form1" name="form1" method="post"> 
	                
              	 	 	<div class= "loginImg">
              	 	  		<img src="resources/image/logo2.png" width="200" class="img">
              	 	 	</div>
	            		
	            		<div class="inputInfo" data-validate = "Username is reauired">
							<!-- <span class="label-input">아이디</span> -->
							<input class="input100" type="text" name="username" placeholder="아이디">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
							<div id="id_check"></div> <!-- placeholder="영문 또는 숫자, 4~20자 이내"  -->
						</div>
	
						<div class="inputInfo" data-validate="Password is required">
							<!-- <span class="label-input">비밀번호</span> -->
							<input class="input100" type="password" name="pass" placeholder="비밀번호">
							<span class="focus-input100" data-symbol="&#xf190;"></span>
						</div>
						
						<div id = "iMessage">
	            				
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
	            				
	            				<div id="pw_check"></div>
	            			</div>
	            			
	            			<div class="check" >
	            				<label class ="idsave_check">
	            					<input type="checkbox" id="idSaveCheck" class="idSaveCheck" >
	            		   			아이디 저장
	            		   		</label>
	            			</div>
	            			
	            			<div align = "center">
								<c:if test="${message != null}">
								 ${message}
								</c:if>
							</div>
							
							<div class = "findwrap">
								<a href="#">
								아이디/비밀번호 찾기
								</a>
								
								<!-- <div class = "joinf">
									<a href="joinf">회원가입</a>
								</div> -->
							</div>
							
	            			<div class="container-login100-form-btn">
								<div class="wrap-login100-form-btn">
									<div class="login100-form-bgbtn"></div>
										<input type="button" class="submit login100-form-btn" id="submit" value="로그인">
								</div>
							</div>
	    					
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
	  		  		</form>
				</div>
			</div>
		</div>
	</section>
</main>	
      			
</body>
<%@ include file="../common/footer.jsp" %>
</html>