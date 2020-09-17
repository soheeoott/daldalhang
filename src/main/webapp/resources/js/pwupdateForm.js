function pwCheck() {
	var password=$('#password').val();	
	var pLength=password.length ; 
	if (password.length<4) {
		$('#pMessage').html('비밀번호는 4 글자 이상 입력하세요.');	
		//$('#password').focus();
		return false;
	}else if (password.replace(/[0-9.!-*]/gi,'').length>0) {
		$('#pMessage').html('숫자와 특수문자 로만 입력하세요.');	
		//$('#password').focus();
		return false;
	}else {
		$('#pMessage').html('');	
		return true;
	} 
}; // pwCheck()

function pwCheck2() {
	var password=$('#password').val();
	var pwCheck=$('#pwCheck').val();	
	if(password!=pwCheck){
		$('#pcMessage').html('비밀번호가 일치하지 않습니다.');	
		//$('#pwCheck').focus();
		return false;
	}else{
		$('#pcMessage').html('');
		return true;
	}
}; //pwCheck2()