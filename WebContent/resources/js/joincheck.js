$(function() {
	
	$("#id").focusout(function() {
		
		//모든 공백 체크 정규식
		var empCheck = RegExp(/\s/g);
		
		//아이디 정규식
		var idCheck = RegExp(/^[a-z0-9]{4,12}$/);
		
		// 비밀번호 정규식
		var pwCheck = RegExp(/^[A-Za-z0-9]{4,12}$/); 
	
		// 이메일 검사 정규식
		var mailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		
		var id = $('#id').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/personal/idCheck?Id='+ id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#iMessage").html("사용중인 아이디입니다. ");
						$("#iMessage").css("color", "red");
						$("#submit").attr("disabled", true);
						$('#id').focus();
					
					} else {
						
						if(id == "") {
							$('#iMessage').html('아이디를 입력해주세요.'); // html : 태그와 태그사이
							$('#iMessage').css('color', 'red');
							$("#submit").attr("disabled", true);
							$('#id').focus();
							return false;
							
						} else if (id.replace(/[a-z.0-9]/gi, '').length > 0) {
							$('#iMessage').html('ID는 영문자와 숫자로만 입력하세요.');
							$('#id').focus();
							return false;
							
						} else if(id.length < 4){
							$('#iMessage').html('4글자 이상 입력하세요.');
							$('#iMessage').css('color', 'red');
							$("#submit").attr("disabled", true);
							$('#id').focus();
							return false;
							
						} else {
							$('#iMessage').html('');
							return true;
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
});