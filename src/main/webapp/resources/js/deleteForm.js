function pwCheck() {
	var password = $("#password").val();
	var pwCheck = $("#input2").val();
	if(pwCheck!=password){
		$('#pMessage').html('비밀번호가 일치하지 않습니다.');	
		$('#input2').focus();
		return false;
	}else{
		$('#pMessage').html('');
		return true;
	}
};