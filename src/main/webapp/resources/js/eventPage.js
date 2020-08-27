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
	})
});