function remove(pdseq) {
	console.log("pdseq="+pdseq);
	
	if (confirm("삭제 하시겠습니까 ?")) {
		$.ajax({
			type: "Post",
			url: "pdelete",
			data:{
				pdseq: pdseq
			},
			success:function(data){
				
				if(data.deleteCode=="deleteS"){
					alert("삭제 성공");
					location.reload()
				}else{
					alert("삭제 실패");
					location.reload()
				}
			}
		});
	}
	return false;
}