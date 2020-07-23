$(function(){
	$('#amlist').click(function(){
		$.ajax({
			type : "Get",
			url : "amlist",
			success:function(result){
				$('#resultArea').html(result);
			}
		});
	});
});