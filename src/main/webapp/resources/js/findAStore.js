function initMap(frkname, llname, fruploadfile, lladdr, latvalue, lngvalue) {
	
	console.log("전달받은 값 => "+frkname+", "+llname+", "+fruploadfile+","+lladdr+", "+latvalue+", "+lngvalue);
	
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
						+ frkname+' '+ llname + '<br><br>' + lladdr + '</div></div>',
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
	// 브랜드명/매장명 swipe 메뉴
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
		if(mapBKeyword=='') {
			alert('브랜드명을 입력해 주세요.');
		} else {
			$.ajax({
				type: 'GET',
				url: 'mapBSearch',
				data: {
					mapBKeyword: mapBKeyword
				},
				success: function(data) {
					
					$('#mapBSearchResult').html('');

					var bData = [];
					bData = data.storeList;

					for(var i in bData) {
						$('#mapBSearchResult').append(
							'<a href="javascript:void(0);" onclick="initMap(\''+bData[i].frkname+'\',\''+bData[i].llname+'\',\''+
							bData[i].fruploadfile+'\',\''+bData[i].lladdr+'\',\''+bData[i].latvalue+'\',\''+bData[i].lngvalue+'\')">'+
							'<table class="tab_table"><tr><td rowspan="2" width="70px">'+
							'<img src="'+bData[i].fruploadfile+'" width="60px" align="middle"></td>'+
							'<td>'+bData[i].frkname+'&nbsp;'+bData[i].llname+'</td></tr>'+
							'<tr><td id="addr_css">'+bData[i].lladdr+'</td></tr></table></a>'
						);
					}
				},	
				error: function() {
					alert('검색 결과가 없습니다.');
				}
			});			
		} // if-else
	});
	
	// 매장명으로 매장찾기
	$('#FSearchMapBtn').click(function() {
		var mapFKeyword = $('#mapFKeyword').val();
		if(mapFKeyword=='') {
			alert('매장명을 입력해 주세요.');
		} else {
			$.ajax({
				type: 'GET',
				url: 'mapFSearch',
				data: {
					mapFKeyword: mapFKeyword
				},
				success: function(data) {
					
					$('#mapFSearchResult').html('');

					var fData = [];
					fData = data.storeList;

					for(var i in fData) {
						$('#mapFSearchResult').append(
							'<a href="javascript:void(0);" onclick="initMap(\''+fData[i].frkname+'\',\''+fData[i].llname+'\',\''+
							fData[i].fruploadfile+'\',\''+fData[i].lladdr+'\',\''+fData[i].latvalue+'\',\''+fData[i].lngvalue+'\')">'+
							'<table class="tab_table"><tr><td rowspan="2" width="70px">'+
							'<img src="'+fData[i].fruploadfile+'" width="60px" align="middle"></td>'+
							'<td>'+fData[i].frkname+'&nbsp;'+fData[i].llname+'</td></tr>'+
							'<tr><td id="addr_css">'+fData[i].lladdr+'</td></tr></table></a>'
						);
					}		
				},
				error: function() {
					alert('검색 결과가 없습니다.');					
				}
			});			
		} // if-else
	});
}); // ready