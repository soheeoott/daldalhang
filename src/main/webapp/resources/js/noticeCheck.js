$(function() {

});

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