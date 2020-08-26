var id = $("#id").val();
/*var pdseq = $("#pdseq").val();*/

function like() {
	
	if(id == null){
		alert("로그인 후 이용 가능합니다.");
		return false;
		
	}else{
		
		$.ajax({
			type: "Post",
			url: "likecheck",
			data:{
				id:$("#id").val(),
				pdseq:$("#pdseq").val()
			},
			success:function(data){
				if(data.lCode=="LS"){
					$('#emptyheart').attr('src','resources/image/heart.png');
					alert("추가되었습니다.");
				}else{
					alert("실패");
				}
			}
		}); //ajax
	}
}

function likeDelete() {
	$.ajax({
		type: "Post",
		URL: "likedelete",
		data: {
			id:$("#id").val(),
			pdseq:$("#pdseq").val()
		},
		success:function(data){
			if(data.lCode=="DS"){
				$('#fullheart').attr('src','resources/image/emptyheart.png');
				alert("삭제되었습니다.");
			}else{
				
			}
		}
		
	});
}