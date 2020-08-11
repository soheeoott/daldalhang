<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>네이버/카카오 로그인</title>
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
	</head>
<body>
	<div id = "wrap">

          <div class="container">

          	<div class="form">  
          
      			<form action="login" name="form1" method="post"> 
             	   <section class="loginform">
                
              	 	 	<div class= "img_wrap">
              	 	  	 <img src="resources/image/logo2.png" width="200" class="img">
              	 	 	</div>
            		
            			<div class="input_box id" align="center">
            				<input type="text" name="id" id="id" placeholder="아이디">
            				<div id="id_check"></div> <!-- placeholder="영문 또는 숫자, 4~20자 이내"  -->
            			</div>
            		
            			<div class="input_box pw">
            				<input type="password" name="password" id="password" placeholder="비밀번호">
            				<div id = "iMessage"></div>
            				
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
						
						<div class = "find">
							<div class = "find_id">	
								<a href="findidf">아이디/비밀번호 찾기</a> 
									<span class = "stick">|</span>
							</div>
							
							<div class = "joinf">
								<a href="joinf">회원가입</a>
							</div>
						</div>
						
						<div class="form_end">
            				<input type="submit" class="submit" id="submit" value="로그인">
            			</div>
    					
    					<!-- 네이버로 로그인을 위한 설정 -->
						<%
   							String clientId = "6S696taO_GdRdtrcL2WK";//애플리케이션 클라이언트 아이디값";
  							String redirectURI = URLEncoder.encode("http://localhost:8080/daldal/login?loginFlag=N", "UTF-8");
  							SecureRandom random = new SecureRandom();
   							String state = new BigInteger(130, random).toString();
   							String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
   							apiURL += "&client_id=" + clientId;
   							apiURL += "&redirect_uri=" + redirectURI;
   							apiURL += "&state=" + state;
   							session.setAttribute("state", state);
  						%>

    		
    					<div class = "socialform">
        					<div class = "btn" align="center">
        							
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
			      		  // 사용할 앱의 JavaScript 키를 설정해 주세요.
			        		Kakao.init('7a1993d1c33d5ff4f8871de6ef549ab1');
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
    				</section>
  		  		</form>
  			 </div> <!-- form   -->
		 </div>  <!-- container -->
  	</div> <!-- wrap -->
  	
<%@ include file="../common/footer.jsp" %>
</body>
</html>