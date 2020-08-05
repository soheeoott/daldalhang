<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="../common/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" type="text/css" href="resources/css/mypageStyle.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
</head>
<body>
  <div class="wrap">

      <div class="container">

        <div class="main">

        <fieldset class="fs">

        <div class="mypage">
          <strong class="j_title">마이 페이지</strong>
          <form class="info" action="#" method="post">
            <img id="icon" src="resources/image/user.png" alt="">
            <div class="id_wrap">
                <%-- <input id="input1" type="text" name="id" readonly="readonly" value="${myInfo.id}" style="vertical-align:middle;"> --%>
                <div id="input1">${myInfo.id}</div>
            </div>
            <div class="mail_wrap">
                <%-- <input id="input2" type="text" name="email" readonly="readonly" value="${myInfo.email}" style="vertical-align:middle;"> --%>
                 <div id="input2">${myInfo.email_id}@${myInfo.email_domain}</div>
            </div>
        <!--  <button type="submit" class="button" name="update">내가 즐겨찾는 메뉴</button>&nbsp;&nbsp;&nbsp; -->
          
          	<input type="button" class="button" value="이메일 변경" onclick="location.href='mypagef?code=M'">
          		&nbsp;&nbsp;&nbsp;
          	<input type="button" class="button" value="비밀번호 변경" onclick="location.href='mypagef?code=P'">
          		&nbsp;&nbsp;&nbsp;
          	<input type="button" class="button" value="회원 탈퇴" onclick="location.href='mypagef?code=D'">
         </form>
       	 </div>
        </fieldset>
      </div>
    </div>
  </div> 
  <%@ include file="../common/footer.jsp" %>
</body>
</html>