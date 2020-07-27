var map = null;

// 콜백 함수 설정/비동기 방식으로 로드
function initMap(id) {
	console.log("클릭한 카페의 frcode => "+id);
	
	var map = new naver.maps.Map('map', {
		center: new naver.maps.LatLng(37.350177, 127.108960),
		zoom: 17,
		scaleControl: false,
		logoControl: false,
		zoomControl: true,
		zoomControlOptions: {
		  position : naver.maps.Position.TOP_RIGHT
		},
		minZoom: 10
	});
	    
	var A01 = new naver.maps.LatLng(37.350177, 127.108960);		// 공차
	var A02 = new naver.maps.LatLng(37.350018, 127.108928);		// 던킨
	var A03 = new naver.maps.LatLng(37.349191, 127.107484);		// 뚜레쥬르
	var A04 = new naver.maps.LatLng(37.349766, 127.109664);		// 메가커피
	var A05 = new naver.maps.LatLng(37.350897, 127.108298);		// 빽다방
	var A06 = new naver.maps.LatLng(37.348975, 127.108689);		// 스타벅스
	var A07 = new naver.maps.LatLng(37.350374, 127.109857);		// 이디야
	var A08 = new naver.maps.LatLng(37.349733, 127.109188);		// 쥬씨
	var A09 = new naver.maps.LatLng(37.349695, 127.108278);		// 설빙
	var A10 = new naver.maps.LatLng(37.349708, 127.106929);		// 투썸	
	var A11 = new naver.maps.LatLng(37.349635, 127.109519);		// 파리바게트
	var A12 = new naver.maps.LatLng(37.350951, 127.109273);		// 파스쿠찌
	var A13 = new naver.maps.LatLng(37.350270, 127.107106);		// 흑화당

	/* 	// 마커 설명
		var positions = [
			{
				title: '공차',
				latlng: A01
			},
			{
				title: '던킨도너츠',
				latlng: A02
			},
			{
				title: '뚜레쥬르',
				latlng: A03
			},				
			{
				title: '메가커피',
				latlng: A04
			}				
		];
	
		// 마커 생성
		for (var i=0; i<positions.length; i++) {
			var marker = new naver.maps.Marker({
				map: map,
		        position: positions[i].latlng
			});
		}
		 */
	if(id=='A01') {
		var marker = new naver.maps.Marker({
		    position: A01,
		    content: '<div>공차</div>',
		    map: map
		});
		
		// 마커 표시할 infowindow 생성
		var infowindow = new naver.maps.InfoWindow({
		    content: marker.content
		});
		
		// 마커 클릭 시 발생하는 이벤트 리스너
		naver.maps.Event.addListener(marker, "click", function(e) {
		    if (infowindow.getMap()) {
		    	infowindow.close();
		    } else {
		    	infowindow.open(map, marker);
		    }
		});
	}
	/*var marker = new naver.maps.Marker({
	    position: A01,
	    content: '<div>공차</div>',
	    map: map
	});*/
	 

}