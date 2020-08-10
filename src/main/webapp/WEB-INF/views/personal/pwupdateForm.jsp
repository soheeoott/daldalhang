<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css" href="resources/css/pwupdateStyle.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/pwupdateForm.js"></script>
<script>
var pCheck=false;
var pCheck2=false;

$(function() {
	$("#password").blur(function() {
		pCheck=pwCheck();
	}); // pw_focusout
	
	$("#pwCheck").blur(function() {
		pCheck2=pwCheck2();
	}); // pw_focusout	
}); // ready

function inCheck() {
	if(pCheck==false || pCheck2==false){
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		return false;
	}else{
		
		$.ajax({
			type: "Post",
			url: "pwupdate",
			data:{
				id:$("#id").val(),
				password : $("#password").val()
			},
			success:function(data){
				if(data.fCode=="PS"){
					alert("비밀번호가 변경되었습니다");
					location.href="mypagef";
				}else{
					location.reload();
					alert("비밀번호 변경에 실패했습니다. 다시 시도하세요.");
				}
			}
		}); //ajax
	}
}

/* $(document).ready(function(){
    $('#button').click(function() {
    	inCheck();
    });
}); */

</script>
</head>
<body>
   <div id="wrap">

      <div class="container">

        <div class="main">

          <strong class="j_title">비밀번호 변경</strong>
          
          <form class="info" name="pwCheckForm" id="pwCheckForm" method="post">
	          <div class="mypage">
	            <img class="icon" src="resources/image/lock.png" alt="">
	            
	            <div class="password_wrap">
	            	<input type="text" name="id" id="id" value="${myInfo.id}" hidden=true>
	                <input id="password" name = "password" type="password" placeholder="새 비밀번호" style="vertical-align:middle;">
	            	<span id="pMessage"></span>
	            </div>
	            
	            <div class="pwcheck_wrap">
	                <input id="pwCheck" type="password" name="pwCheck" placeholder="비밀번호 확인" style="vertical-align:middle;">
	            	<span id="pcMessage"></span>
	            </div>
	            
	            </div>
	            	 <input type="button" class="button" name="button" id="button" onclick="return inCheck()" value="확인">&nbsp;&nbsp;&nbsp;
          </form>
      </div>
    </div>
   </div>
<%@ include file="../common/footer.jsp" %>   
</body>
</html>