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
	     <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	     <script>
				$(document).ready(function(){
			    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
			    $("input[name='id']").val(userInputId); 
			     
			    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
			                                           // 아이디 저장하기 체크되어있을 시,
			        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			    }
			     
			    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
			        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
			            var userInputId = $("input[name='id']").val();
			            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			        }else{ // ID 저장하기 체크 해제 시,
			            deleteCookie("userInputId");
			        }
			    });//idSaveCheck_change
			     
			    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
			    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
			        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			            var userInputId = $("input[name='id']").val();
			            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
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
          
      		<form action="login" method="post"> 
                <section class="loginform">
                
                <div class = "img_wrap">
                  <img src="resources/image/logo2.png" width="200" class="img">
                 </div>
            		
            			<div class="input_box id">
            				<input type="text" name="id" id="id" placeholder="아이디">
            				<div id="id_check"></div> <!-- placeholder="영문 또는 숫자, 4~20자 이내"  -->
            			</div>
            		
            			<div class="input_box pw">
            				<input type="password" name="password" id="password" placeholder="비밀번호">
            				<div id="pw_check"></div>
            			</div>
            			
            			<div class="check">
            				<label class ="idsave_check">
            					<input type="checkbox" id="idSaveheck" class="idSaveCheck" >
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
								<a href="findIdReady">아이디 찾기</a> 
									<span class = "stick">|</span>
							</div>
							
							<div class = "find_pw">
								<a href="findPwReady" >비밀번호 찾기</a>
									<span class = "stick">|</span>
							</div>
							
							<div class = "joinf">
								<a href="joinForm">회원가입</a>
							</div>
						</div>
						
						<div class="form_end">
            				<input type="submit" class="submit" value="로그인">
            			</div>
    	
		  <%
		    String clientId = "6S696taO_GdRdtrcL2WK";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://localhost:8080/naverapi/callback.jsp", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    session.setAttribute("state", state);
		   %>
			
			<div class = "socialform">
        		<div class = "btn">
	        		<a href="<%=apiURL%>">
	        			<img height="50" class="naver-login-btn" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/>
	        		</a>
	        		
	        		<a id="kakao-login-btn" class = "kakao-login-btn"></a>
	      	  	</div>
		      	 	
				<script type='text/javascript'>
			        //<![CDATA[
			        // 사용할 앱의 JavaScript 키를 설정해 주세요.
			        Kakao.init('7a1993d1c33d5ff4f8871de6ef549ab1');
			        // 카카오 로그인 버튼을 생성합니다.
			        Kakao.Auth.createLoginButton({
			            container: '#kakao-login-btn',
			            success: function (authObj) {
			                alert(JSON.stringify(authObj));
			            },
			            fail: function (err) {
			                alert(JSON.stringify(err));
			            }
			        });
			      //]]>
				</script>
    		</div> <!-- socialform -->
    		
    		</section>
      		</form>
          </div> <!-- form   -->
          </div>  <!-- container -->
  	</div> <!-- wrap -->
<%@ include file="../common/footer.jsp" %>
</body>
</html>