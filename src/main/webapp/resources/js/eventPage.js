$(function(){
	// '이벤트 달력' 메뉴 클릭 시 바로 출력되는 이벤트 달력
	$.ajax({
		url:'calendar',
		success:function(result){
			$('#resultArea01').html(result);
		}
	}); // calendar_ajax
	
	// '이벤트 모아보기' 메뉴 클릭 시 바로 출력되는 카드형 이벤트 리스트
	$.ajax({
		type: 'GET',
		url: 'eventOne',
		data:{
			frcode:'A'
		},
		success: function(data) {
			if(data.eCode=='1111') {
				$('#resultArea02').html('');
				$('#resultArea02').append(
					'<div id="event_null"><span>현재 진행 중인 이벤트가 없습니다.</span></div>'
				);
			} else {
				$('#resultArea02').html('');
				
				// controller에서 return 받은 eventList를 배열에 저장
				var eData = [];
				eData = data.eventList;
				
				// 현재 날짜 구하기
				var date = new Date();
				let today = date.toISOString().slice(0,10);

				// 선택한 브랜드 표시
				$('#resultArea02').append(
					'<div id="fr_choice"><span>ALL EVENT</span></div><br>'
				);
				
				// 이벤트 출력
				for(var i in eData) {
					if (today > eData[i].end_date) {		// 이벤트 종료
						$('#resultArea02').append(
								'<div id="eventDiv"><table id="eventTable"><tr><td>'+
								'<div id="eventImg_Div">'+
								'<img src="'+eData[i].eventImg+'" width="250px" height="250px">'+
								'<div id="end_event"></div></div></td></tr>'+
								'<tr><td id="eventTitle">'+eData[i].caltitle+'</td></tr>'+
								'<tr><td id="eventDate">'+eData[i].start_date+' ~ '+eData[i].end_date+'</td></tr>'+
								'<tr><td id="eventContent">'+eData[i].calcontent+'</td></tr>'+   	
								'</table></div>'
						);
					} else {								// 이벤트 진행 중
						$('#resultArea02').append(
							'<div id="eventDiv">'+
							'<table id="eventTable">'+
							'<tr><td id="eventImg">'+
							'<a href="'+eData[i].editurl+'" target="_blank">'+
							'<img src="'+eData[i].eventImg+'" width="250px" height="250px"></a></td></tr>'+	
						    '<tr><td id="eventTitle">'+eData[i].caltitle+'</td></tr>'+
							'<tr><td id="eventDate">'+eData[i].start_date+' ~ '+eData[i].end_date+'</td></tr>'+
							'<tr><td id="eventContent">'+eData[i].calcontent+'</td></tr>'+   	
							'</table></div>'
						);
					}
				}
			}
		}
	}); // eventList_ajax
});

// 선택형 이벤트 리스트 -> 브랜드 탭 메뉴 
function eventOne(frcode) {
	var fr_choice = "";				// 선택한 이벤트의 브랜드명을 표시하기 위한 변수
	
	if(frcode=='A') {
		fr_choice="ALL EVENT";
	} else if(frcode=='A01') {
		fr_choice='공차 이벤트';
	} else if(frcode=='A02') {
		fr_choice='던킨도너츠 이벤트';
	} else if(frcode=='A03') {
		fr_choice='뚜레쥬르 이벤트';
	} else if(frcode=='A04') {
		fr_choice='메가커피 이벤트';
	} else if(frcode=='A05') {
		fr_choice='빽다방 이벤트';
	} else if(frcode=='A06') {
		fr_choice='스타벅스 이벤트';
	} else if(frcode=='A07') {
		fr_choice='이디야 이벤트';
	} else if(frcode=='A08') {
		fr_choice='쥬씨 이벤트';
	} else if(frcode=='A09') {
		fr_choice='설빙 이벤트';
	} else if(frcode=='A10') {
		fr_choice='투썸플레이스 이벤트';
	} else if(frcode=='A11') {
		fr_choice='파리바게뜨 이벤트';
	} else if(frcode=='A12') {
		fr_choice='파스쿠찌 이벤트';
	} else if(frcode=='A13') {
		fr_choice='흑화당 이벤트';
	} else {
		fr_choice='브랜드를 다시 선택해 주세요.';
	}
	
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
					'<div id="event_null"><span>현재 진행 중인 이벤트가 없습니다.</span></div>'
				);
			} else {
				$('#resultArea02').html('');
				
				// controller에서 return 받은 eventList를 배열에 저장
				var eData = [];
				eData = data.eventList;
				
				// 현재 날짜 구하기
				var date = new Date();
				let today = date.toISOString().slice(0,10);

				// 선택한 브랜드 표시
				$('#resultArea02').append(
					'<div id="fr_choice"><span>'+fr_choice+'</span></div><br>'
				);
				
				// 이벤트 출력
				for(var i in eData) {
					if (today > eData[i].end_date) {		// 이벤트 종료
						$('#resultArea02').append(
								'<div id="eventDiv"><table id="eventTable"><tr><td>'+
								'<div id="eventImg_Div">'+
								'<img src="'+eData[i].eventImg+'" width="250px" height="250px">'+
								'<div id="end_event"></div></div></td></tr>'+
								'<tr><td id="eventTitle">'+eData[i].caltitle+'</td></tr>'+
								'<tr><td id="eventDate">'+eData[i].start_date+' ~ '+eData[i].end_date+'</td></tr>'+
								'<tr><td id="eventContent">'+eData[i].calcontent+'</td></tr>'+   	
								'</table></div>'
						);
					} else {								// 이벤트 진행 중
						$('#resultArea02').append(
							'<div id="eventDiv">'+
							'<table id="eventTable">'+
							'<tr><td id="eventImg">'+
							'<a href="'+eData[i].editurl+'" target="_blank">'+
							'<img src="'+eData[i].eventImg+'" width="250px" height="250px"></a></td></tr>'+	
						    '<tr><td id="eventTitle">'+eData[i].caltitle+'</td></tr>'+
							'<tr><td id="eventDate">'+eData[i].start_date+' ~ '+eData[i].end_date+'</td></tr>'+
							'<tr><td id="eventContent">'+eData[i].calcontent+'</td></tr>'+   	
							'</table></div>'
						);
					}
				}
			}
		}
	}); // ajax
}