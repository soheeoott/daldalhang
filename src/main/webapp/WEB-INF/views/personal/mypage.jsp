<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" type="text/css" href="resources/css/mypageStyle.css">
</head>
<body>
  <div class="wrap">

      <div class="top">
      </div>

      <div class="container">

        <div class="main">

        <fieldset class="fs">

        <div class="mypage">
          <strong class="j_title">마이 페이지</strong>
          <form class="info" action="#" method="post">
            <img id="icon" src="resources/image/user.png" alt="">
            <div class="id_wrap">
                <input id="input1" type="text" name="id" readonly="readonly" value="DalDalHang" style="vertical-align:middle;">
            </div>
            <div class="mail_wrap">
              <!-- <img class="icon" src="mail.png" alt="">-->
                <input id="input2" type="text" name="email" readonly="readonly" value="DalDalHang@gmail.com" style="vertical-align:middle;">
            </div>
         
        <!--  <button type="submit" class="button" name="update">내가 즐겨찾는 메뉴</button>&nbsp;&nbsp;&nbsp; -->
          <button type="submit" class="button" name="update">
          	<a href="detail?code=M">이메일 변경</a></button>&nbsp;&nbsp;&nbsp;
          <button type="submit" class="button" name="update">
          	<a href="detail?code=P">비밀번호 변경</a></button>
        	 </form>
        </div>
        </fieldset>
      </div>
    </div>
  </div> 
</body>
</html>