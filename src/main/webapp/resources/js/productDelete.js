function remove(drop) {
	console.log("pdseq="+drop);
	
	$.ajax({
		type: "Post",
		url: "pdelete",
		data:{
			pdseq: drop
		},
		success:function(data){
			
			if(data.deleteCode=="deleteS"){
				alert("삭제 성공");
				window.location.reload();
			}else{
				alert("삭제 실패");
				window.location.reload();
			}
		}
	}); //ajax
}