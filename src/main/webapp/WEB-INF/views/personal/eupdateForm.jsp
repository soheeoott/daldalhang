<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 변경</title>
<link rel="stylesheet" type="text/css" href="resources/css/eupdateStyle.css">
</head>
<body>
    <div class="wrap">

      <div class="top">
      </div>

      <div class="container">

        <div class="main">

        <fieldset class="fs">

        <div class="mypage">
          <strong class="j_title">이메일 변경</strong>
          <form class="info" action="#" method="post">
            <img class="icon" src="resources/image/mail.png" alt="">
            <div class="id_wrap">
                <input class="input" type="text" name="id" readonly="readonly" value="DalDalHang@gmail.com" style="vertical-align:middle;">

            </div>
            <div class="mail_wrap">

                <input class="input2" type="text" name="email" value="새 이메일 주소" style="vertical-align:middle;">
            </div>
          </form>
          <button type="submit" class="button" name="update">확인</button>&nbsp;&nbsp;&nbsp;

        </div>
        </fieldset>
      </div>
    </div>
   </div> 
</body>
</html>