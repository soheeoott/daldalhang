<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>이메일 변경 성공</title>
    <link rel="stylesheet" type="text/css" href="resources/css/mypageStyle.css">
    <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
    <script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="wrap"  id="wrap">

      <div class="container">

        <div class="main">

	        <fieldset class="fs">
			
			<div class="mypage">
	          <strong class="j_title">이메일 변경</strong>
	          <form class="info" action="eupdate" method="post">
	            <img class="icon" src="resources/image/mail.png" alt="">
	            <div class="id_wrap">
	                <input class="input" type="text" name="email" readonly="readonly" value="${myInfo.email_id}@${myInfo.email_domain}" style="vertical-align:middle;">
	            </div>
	            <div class="mail_wrap">
	                <div class="input_box email">
				                  	<input type="text" name="email_id" id="email_id" class="email_id input_warn" required style = "width:182px;">
				                  	@
				                  	<input type="text" name="email_domain" id="email_domain" class="email_domain" required style = "width:182px;">
				                  	 	<select style="margin-right: 10px; margin-left: 10px; height: 50px; border: 1px;" name="selectEmail" id="selectEmail">
											<option value="1" selected>직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
										</select>
		               </div>
	            </div>
	         	</div>
	         		<button type="submit" class="button" name="update">확인</button>&nbsp;&nbsp;&nbsp;
	          </form>
	        </fieldset>
     	 </div>
    	</div>
  	 </div> 
  	 
    <%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>