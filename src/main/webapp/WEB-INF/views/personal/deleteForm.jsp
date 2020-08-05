<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="resources/css/deleteStyle.css">
<script>
var pw = ${myInfo.password};
var pwc = $("#input2").val();

function inCheck() {
	if(pwc == pw){
		return true;
	}else{
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		return false;
		location.reload();
	}
} // inCheck
</script>
</head>
<body>
	<div class="wrap">

		<div class="top"></div>

		<div class="container">

			<div class="main">

				<fieldset class="fs">

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
									<div class="input1" name="id" >
										${myInfo.id}
									</div>
								<div class="mail_wrap">
									<!-- 비밀번호 -->
									<!-- <label id="pwtitle">비밀번호</label> -->
									<input id="input2" type="text"
										name="password" placeholder="비밀번호 입력">
								</div>
								<!--  <button type="submit" class="button" name="update">탈퇴 취소</button>&nbsp;&nbsp;&nbsp; -->
							</div>
							</div>
							<button type="submit" class="button" name="delete" onclick="return inCheck()">확인</button>
						</form>
						</fieldset>
					</div>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>