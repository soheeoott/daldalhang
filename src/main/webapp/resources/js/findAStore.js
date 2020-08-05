function initMap(frkname, llname, lladdr, streetnum, latvalue, lngvalue) {
/*	console.log("전달받은 값 => "+frkname+", "+llname+", "+lladdr+", "+streetnum+", "+latvalue+", "+lngvalue);*/

	var HOME_PATH = window.HOME_PATH || '.';

	// 초기 map 설정 => 성남 분당 미금역
	var map = new naver.maps.Map('map', {
		center: new naver.maps.LatLng(37.350177, 127.108960),
		zoom: 17,
		scaleControl: false,
		logoControl: false,
		minZoom: 10
	});
	 
	// Store 정보 표시될 마커 생성
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(latvalue, lngvalue),
	    content: '<div style="margin:10px; background:rgba(255, 255, 255, 0.8);"><div style="">'+
	    		 frkname+' '+llname+'</div><div>'+lladdr+'</div></div>',
	    map: map
	});
	
	// 마커 표시할 infowindow 생성
	var infowindow = new naver.maps.InfoWindow({
	    content: marker.content
	});
	
	// 마커 클릭 시 발생하는 이벤트 리스너
	naver.maps.Event.addListener(marker, "click", function(e) {
		map.panTo(e.coord);					// 마커 클릭 시 해당 좌표가 있는 지도로 이동
	    if (infowindow.getMap()) {
	    	infowindow.close();
	    } else {
	    	infowindow.open(map, marker);	    	
	    }
	});
}

$(document).ready(function(){
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})