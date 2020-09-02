function like(s) {
		console.log("pdseq="+s);
		
		$.ajax({
			type: "Post",
			url: "like",
			data:{
				pdseq:s
			},
			success:function(data){
				
				var limg = '';
				
				if(data.lCode=="LL"){
					alert("좋아요 성공");
					limg="resources/image/fullheart.png";
				}else{
					alert("좋아요 취소");
					limg="resources/image/emptyheart.png";
				}
				
				$("#"+s).attr('src',limg);
			}
		}); //ajax
}