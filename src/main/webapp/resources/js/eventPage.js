$(function(){
	// 이벤트 메뉴 클릭 시 바로 출력되는 이벤트 달력
	$.ajax({
		url:'calendar',
		success:function(result){
			$('#resultArea01').html(result);
		}
	}); // ajax 			
	
	// 이벤트 달력, 이벤트 탭 메뉴
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		
		if($(this).attr('data-tab')=='tab-1') {
			$.ajax({
				url: 'calendar',
				success: function(result) {
					$('#resultArea01').html(result);
				}
			}); // ajax 			
		} else if($(this).attr('data-tab')=='tab-2') {
			$.ajax({
				url: 'eventList',
				success: function(result) {
					$('#resultArea02').html(result);
				}
			}); // ajax
		}
	});
});

// 이벤트 카드형 -> 브랜드 탭 메뉴 
function eventOne(frcode) {
	console.log('frcode =>'+frcode);
	
	// 이벤트 ALL 표시
	if(frcode=='000') {
		$.ajax({
			url: 'eventList',
			success: function(result) {
				$('#resultArea02').html(result);
			}
		}); // ajax		
	}
	
	// 각 브랜드별 표시
	$.ajax({
		type: 'Get',
		url: 'eventOne',
		data:{
			frcode:frcode
		},
		success: function(data) {
			if(data.eCode=='1111') {
				$('#resultArea02').html("현재 진행 중인 이벤트가 없습니다.");		// 수정중
				alert('Null Exception');
			} else {
				$('#resultArea02').html(data);
			}
		},
		error: function(data) {
			console.log('X');
		}
	}); // ajax
}