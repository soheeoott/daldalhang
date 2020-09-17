
$(function () {
	$("#email_id").blur(function() {
		
		var id = $('#email_id').val();
		var domain = $('#email_domain').val();
		var mailCheck1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])/;
		var mailCheck2 = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
		// 비밀번호 정규식 (영문, 숫자)
		if(!mailCheck1.test(id)) {
			$(".button").attr("disabled", false);
			return false;
		
		} else if(!mailCheck2.test(domain)) {
			$(".button").attr("disabled", false);
			return false;
			
		} else {
			$(".button").attr("disabled", true);
			return true;
		}
	}); // blur
});

verifyEmail = function() {
	  // 이메일 검증 스크립트 작성
	var id = $("#email_id").val();
	var domain = $('#email_domain').val();
	var mailCheck1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var mailCheck2 = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 검증에 사용할 정규식 변수 regExp에 저장

	if (id.match(mailCheck1) == null) {
		$(".button").attr("disabled", false);
		return false;
		
	}else if(!mailCheck2.test(domain)) {
		$(".button").attr("disabled", false); 
		return false;
	}else {
		$(".button").attr("disabled", true);
		return true;
	}
};



