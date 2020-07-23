<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<html>
  <head>
    <title>네이버/카카오 로그인</title>
     <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
     <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
     <style>
     .login_input {
     	border : 0px
     }
     
     input {
     	border : 2px solid #F1BCD5;
     	box-shadow : none;
     }
     </style>
     <script>
     function inCheck(){
    		// input Tag의 value에  default값을 준경우 focusout 없이 submit 누르는 경우 
    		if (iCheck==false) {iCheck=idCheck() };
    		if (pCheck==false) {pCheck=pwCheck() };
    		
    		if(iCheck==true  && pCheck==true){
    			return true;
    		}else return false;
    	}//inCheck()
     
     </script>
  </head>
  <body>
 
<div align="center" style="border:1px; width:100%;">
<form  action="login" method="post"> 
	<img src="resources/image/logo2.png" width="200">
	<div align="center" style="font-size: 20px; margin-left: -310px">일반로그인</div><br>

	<div align="center">
		<input type="text" name="id" id="id" value=""  placeholder="아이디" style="width: 400px; height: 40px; border-radius: 5px">
		<span id="iMessage" class="eMessage"></span>
	</div><br>

	<div align="center">
		<input type="password" name="password" id="password" value="" placeholder="비밀번호" style="width: 400px; height: 40px; border-radius: 5px">
		<span id="iMessage" class="eMessage"></span>
	</div><br>
	
	<div align="center" style="margin-left: -300px" >
	
	<input type="checkbox" id="idSaveCheck" name="idSaveCheck" class="checkbox" >
   	<label class="keepLogin">아이디 저장
	
	</div><br>

	<div align="center" >
		<input type="submit" class="login_input" value="로 그 인" style="background-color: #E5E1E6 ; width: 400px; height: 50px; font-size: 20px; " onclick="return inCheck()">
	</div><br>
</form>  
<c:if test="${message != null}">
 ${message}
</c:if>

	<div align="center" style="font-size: 20px; margin-left: -310px">간편로그인</div><br>

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
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  
  <a id="kakao-login-btn"></a>

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
</div>
	<%@ include file="../common/footer.jsp" %>
   </body>
</html>