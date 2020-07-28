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
<div align="center" id="wrap">
	<span id="notice_title">매장찾기</span><br><br>

	<!-- 지도 API를 담을 div -->
	<div id="map">
		<div class="map_wrap">
			<div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		            	<table width="100%">
		            		<tr>
		            			<td>매장명</td>
		            			<td>블라블라</td>
		            		</tr>
		            		<tr>
		            			<td colspan="2">키워드 : <input type="text" value="미금역 카페" id="keyword" size="15">
		            			<button type="submit">검색하기</button></td>
		            		</tr>
		            	
		            	</table>
		            	<!-- ------------------- -->
		            	<div class="tab_wrap">
							<div class="tab_menu_container">
							  <button class="tab_menu_btn1 tab_menu_btn" type="button">매장명</button>
							  <button class="tab_menu_btn2 tab_menu_btn on" type="button">주소</button>
							</div> <!-- tab_menu_container e -->
							
							<div class="tab_box_container">
							  <div class="tab_box1 tab_box">테스트1</div>
							  <div class="tab_box2 tab_box on">테스트2</div>
							</div>
						</div>
						<!-- ------------------- -->
						
		                <form onsubmit="searchPlaces(); return false;">
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
	    </div>
	</div>
	<!-- 프랜차이즈 카페 목록 나열 -->
	<div id="franchiseList">
		<c:forEach var="list" items="${franchiseList}">
			<a href="javascript:void(0);" id="${list.frcode}" onclick="initMap(id)">${list.frkname}</a>&nbsp;&nbsp;&nbsp;
		</c:forEach>
	</div>

	<input type="button" value="reset" onclick="initMap()">
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>