$(function(){
	// 이벤트 메뉴 클릭 시 바로 출력되는 이벤트 달력
	$.ajax({
		url:'calendar',
		success:function(result){
			$('#resultArea01').html(result);
		}
	}); // ajax 			
});

// 이벤트 카드형 -> 브랜드 탭 메뉴 
function eventOne(frcode) {
	
	// 각 브랜드별 탭 클릭시 이벤트 표시
	$.ajax({
		type: 'GET',
		url: 'eventOne',
		data:{
			frcode:frcode
		},
		success: function(data) {
			if(data.eCode=='1111') {
				$('#resultArea02').html('');
				$('#resultArea02').append(
					'<div id="eventDiv"><div width="1000px" height="500px" align="center">'+
					'<span align="center">현재 진행 중인 이벤트가 없습니다.</span></div></div>'
				);
			} else {
				$('#resultArea02').html('');
				
				var eData = [];
				eData = data.eventList;
				
				for(var i in eData) {
					$('#resultArea02').append(
						'<div id="eventDiv"><table id="eventTable">'+
						'<tr><td id="eventImg"><a href="'+eData[i].editurl+'" target="_blank">'+
						'<img src="'+eData[i].eventImg+'" width="250px" height="250px"></a></td></tr>'+
					    '<tr><td id="eventTitle">'+eData[i].caltitle+'</td></tr>'+
						'<tr><td id="eventDate">'+eData[i].start_date+' ~ '+eData[i].end_date+'</td></tr>'+
						'<tr><td id="eventContent">'+eData[i].calcontent+'</td></tr>'+   	
						'</table></div>'
					);
				}
			}
		},
		error: function(data) {
			console.log('X');
		}
	}); // ajax
}