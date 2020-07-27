<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>** DalDal **</title>
<!-- 발급받은 Client ID : j271ilogb7
	 비동기 방식으로, 지정한 콜백 함수를 호출함 -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j271ilogb7&callback=initMap"></script>
<link rel="stylesheet" type="text/css" href="resources/css/findAStore.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/findAStore.js"></script>
</head>
<body>
<div align="center">
	<span id="notice_title">매장찾기</span><br><br>

	<!-- 지도 API를 담을 div -->
	<div id="map"></div>
	<!-- <script src="resources/js/findAStore.js"></script> -->
	<br>
	<!-- 프랜차이즈 카페 목록 나열 -->
	<div id="franchiseList">
		<c:forEach var="list" items="${franchiseList}">
			<a href="javascript:void(0);" id="${list.frcode}" onclick="initMap(id)">${list.frkname}</a>&nbsp;&nbsp;&nbsp;
		</c:forEach>
	</div>

	<input type="button" value="다시다시" onclick="initMap()">
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>