function initMap(frkname, llname, fruploadfile, lladdr, latvalue, lngvalue) {
	/*
	 * console.log("전달받은 값 => "+frkname+", "+llname+", "+fruploadfile+",
	 * "+lladdr+", "+latvalue+", "+lngvalue);
	 */

	// 초기 map 설정 => 성남 분당 미금역
	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(37.350048, 127.106433),
		zoom : 17,
		scaleControl : false,
		logoControl : false,
		minZoom : 10
	});

	// Store 정보 표시될 마커 생성
	var marker = new naver.maps.Marker(
			{
				position : new naver.maps.LatLng(latvalue, lngvalue),
				content : '<div style="width:320px; border:0; background:rgba(255, 255, 255, 0.8); font-size:14px;">'
						+ '<img src="'
						+ fruploadfile
						+ '" width="100px" align="left" hspace="5" vspace="5">'
						+ '<div style="padding-top:25px;">'
						+ frkname
						+ ' '
						+ llname + '<br><br>' + lladdr + '</div></div>',
				map : map
			});

	// 마커 표시할 infowindow 생성
	var infowindow = new naver.maps.InfoWindow({
		content : marker.content
	});

	// 마커 클릭 시 발생하는 이벤트 리스너
	naver.maps.Event.addListener(marker, "click", function(e) {
		map.panTo(e.coord); // 마커 클릭 시 해당 좌표를 중심점(coord)으로 지도를 이동 > 이동 거리가 가까우면
							// 부드럽게 이동
		if (infowindow.getMap()) {
			infowindow.close();
		} else {
			infowindow.open(map, marker);
		}
	});
}

$(function() {
	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	});

	// 브랜드명으로 매장찾기
	$('#BSearchMapBtn').click(function() {
		var mapBKeyword = $('#mapBKeyword').val();
		if(mapBKeyword==null) {
			alert('브랜드명을 입력해 주세요.');
		} else {
			$.ajax({
				type: 'GET',
				url: 'mapBSearch',
				dataType: 'JSON',
				data: {
					mapBKeyword: mapBKeyword
				},
				success: function(data) {
					$.each(data, storeList) {
						alert('storeList =>'+storeList);
					}
				},
				error: function() {
					alert("ERROR 출력되지 않음 ERROR");
				}
			});			
		} // if-else
	});
	
	// 매장명으로 매장찾기
	$('#FSearchMapBtn').click(function() {
		var mapFKeyword = $('#mapFKeyword').val();
		if(mapFKeyword==null) {
			alert('매장명을 입력해 주세요.');
		} else {
			$.ajax({
				type: 'GET',
				url: 'mapFSearch',
				dataType: 'JSON',
				data: {
					mapFKeyword: mapFKeyword
				},
				success: function(data) {
					$.each(data, function()) {
						alert('llname =>'+llname);
					}
				},
				error: function() {
					alert("ERROR 출력되지 않음 ERROR");
				}
			});			
		} // if-else
	});
}); // ready