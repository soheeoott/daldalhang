<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
<link rel="stylesheet" type="text/css" href="resources/css/findAStore.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body>
<div align="center">
	<span id="notice_title">매장찾기</span><br><br>
	
	<!-- 지도 API를 담을 div -->
	<div id="map"></div>
	
	<!-- 발급받은 APP KEY : 413ce0be2c092b82f28788db5277bb82 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=413ce0be2c092b82f28788db5277bb82"></script>
	<script>
		// 카카오맵 띄우기
		var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
		var options = { // 지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.350177, 127.108960), // 지도의 중심좌표 => '미금역'으로 설정.
			level: 3 // 지도의 레벨 (확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 마커가 표시될 위치 지정 
		var markerPosition  = new kakao.maps.LatLng(37.350177, 127.108960); 

		// 마커 생성
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);
	</script>
	<br>
	<!-- 프랜차이즈 카페 목록 나열 -->
	<div id="franchiseList">
		<c:forEach var="list" items="${franchiseList}">
			<c:if test="${list.fcode=='A01'}">
				<a href="#" id="franchiseName">공차</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A02'}">
				<a href="#" id="franchiseName">던킨</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A03'}">
				<a href="#" id="franchiseName">뚜레쥬르</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A04'}">
				<a href="#" id="franchiseName">메가커피</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A05'}">
				<a href="#" id="franchiseName">빽다방</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A06'}">
				<a href="#" id="franchiseName">스타벅스</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A07'}">
				<a href="#" id="franchiseName">이디야</a><br>
			</c:if>
			<c:if test="${list.fcode=='A08'}">
				<a href="#" id="franchiseName">쥬씨</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A09'}">
				<a href="#" id="franchiseName">설빙</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A10'}">
				<a href="#" id="franchiseName">투썸플레이스</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A11'}">
				<a href="#" id="franchiseName">파리바게트</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A12'}">
				<a href="#" id="franchiseName">파스쿠찌</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${list.fcode=='A13'}">
				<a href="#" id="franchiseName">흑화당</a>&nbsp;&nbsp;&nbsp;
			</c:if>
		</c:forEach>	
	</div>

</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>