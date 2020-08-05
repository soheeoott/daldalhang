<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 변경</title>
<link rel="stylesheet" type="text/css" href="resources/css/eupdateStyle.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body>
    <div class="wrap" id="wrap">

      <div class="container">

        <div class="main">

        <fieldset class="fs">

        <div class="mypage">
          <strong class="j_title">이메일 변경</strong>
          <form class="info" action="eupdateM" method="post">
            <img class="icon" src="resources/image/mail.png" alt="">
            <div class="id_wrap">
                <input class="input" type="text" name="email" readonly="readonly" value="${myInfo.email_id}@${myInfo.email_domain}" style="vertical-align:middle;">
	            <input type="text" name="id" value="${myInfo.id}" hidden=true>
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
										
						<script type ="text/javascript">
						$("#selectEmail").change(function(){
				            var selectEmail = $(this).val();
				            var email_domain = $('input[name=email_domain]');
				            
				            if(selectEmail == "1") { //직접입력일때
				                $(email_domain).attr('readonly', false); //직접입력 가능하도록 readonly막기
				                $(email_domain).val('');  //이메일 도메인입력박스 초기화.
				            } 
				            
				            else {
					            $(email_domain).attr('readonly', true); //readonly로 직접입력 막기.
					            $(email_domain).val(selectEmail); //이메일 도메인 입력박스에 선택된 호스트등록.
					        }
				      	 });
						</script>	
		         </div>
            </div>
           		<button type="submit" class="button" name="update" id="eupdate">확인</button>&nbsp;&nbsp;&nbsp;
          </form>
        </div>
        </fieldset>
      </div>
    </div>
   </div> 
<%@ include file="../common/footer.jsp" %>
</body>
</html>