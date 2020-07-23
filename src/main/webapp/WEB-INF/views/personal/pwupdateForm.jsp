<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css" href="resources/css/pwupdateStyle.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body>
   <div class="wrap">

      <div class="container">

        <div class="main">

        <fieldset class="fs">

        <div class="mypage">
          <strong class="j_title">비밀번호 변경</strong>
          <form class="info" action="#" method="post">
            <img class="icon" src="resources/image/lock.png" alt="">
            <div class="id_wrap">
                <input class="input" type="text" name="newpw" readonly="readonly" value="새 비밀번호" style="vertical-align:middle;">
            </div>
            <div class="mail_wrap">
                <input class="input" type="text" name="cpw" value="비밀번호 확인" style="vertical-align:middle;">
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