// 공지사항 삭제 버튼
// => 삭제 버튼 클릭 시, confirm Dialog로 메세지 표시 => 확인 후 삭제 완료하기
function ndelete(seq) {
	if(confirm("선택한 공지사항 게시글을 삭제하시겠습니까?")==true) {
		location.href='ndelete?seq='+seq;
		alert("선택한 게시글이 삭제되었습니다.");
		location.href='nlist';
	} else {
		alert("게시글 삭제가 취소되었습니다.");
	}
} // ndelete

// 공지사항 write, update 오류 확인사항 - 정규식
// title : 길이(4~50자), 한글/영문자/숫자/특수문자 입력
// content : 길이(4~2000자), 한글/영문자/숫자/특수문자 입력
// 작성 규칙 : JavaScript function으로 정의하고 결과를 true or false로 return
function titleCheck() {
	var title = $('#title').val();
	if(title.length<4 || title.length>50) {
		$('#tMessage').html('제목은 4글자 이상, 50자 이내로 입력하세요.');
		$('#title').focus();
		return false;
	} else if(title.replace(/[ㄱ-ㅎ,가-힣,A-Z,a-z,0-9,!-*,\s]/gi,'').length>0) {
		$('#tMessage').html('제목은 한글, 영문자, 숫자, 특수문자로만 입력하세요.');
		$('#title').focus();
		return false;
	} else {
		$('#tMessage').html('');
		return true;
	}
} // titleCheck()

// TinyMCE에서 작동하지 않음 - 수정 중 
function contentCheck() {
	var content = $('#content').val();
	if(content.length<4 || content.length>2001) {
		$('#cMessage').html('내용은 4글자 이상, 2000자 이내로 입력하세요.');
		$('#content').focus();
		return false;
	} else if(content.replace(/[ㄱ-ㅎ,가-힣,A-z,a-z,0-9,!-*,\s]/gi,'').length>0) {
		$('#cMessage').html('내용은 한글, 영문자, 숫자, 특수문자로만 입력하세요.');
		$('#content').focus();
		return false;
	} else {
		$('#cMessage').html('');
		return true;
	}
} // contentCheck()
