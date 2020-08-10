<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	
<%@ include file="../common/header.jsp" %>   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="resources/css/deleteStyle.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/deleteForm.js"></script>
<script>
var pCheck=false;

$(function() {
	$("#input2").focusout(function() {
		pCheck=pwCheck();
	}); // pw_focusout
}); 

function inCheck() {
	if(pCheck==false){
		location.reload();
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="main">
				<strong class="j_title">회원 탈퇴</strong>
					<div class="comment_wrap">
						<div class="comment">안전한 회원 탈퇴를 위해 비밀번호를 확인해주세요</div>
					</div>
				
				<form class="info" action="delete" method="post">
					<div class="mypage">
						<img id="icon" src="resources/image/user.png" alt="">
						<!-- <img class="icon" src="resources/image/mail.png" alt=""> -->
						<div class="id_wrap">
								<!--아이디-->
								<input type="text" class="input1" name="id" value="${myInfo.id}" readonly="readonly" >
								<input type="text" name="password" id="password" value="${myInfo.password}" hidden=true>
							<div class="mail_wrap">
								<!-- 비밀번호 -->
								<input id="input2" type="password" placeholder="비밀번호 입력">
							</div>
							<!--  <button type="submit" class="button" name="update">탈퇴 취소</button>&nbsp;&nbsp;&nbsp; -->
						</div>
					</div>
					<input type="submit" class="button" name="delete" onclick="return inCheck()" value="확인">
				</form>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>