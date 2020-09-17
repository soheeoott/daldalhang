<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
	<link rel="stylesheet" type="text/css" href="resources/css/eventStyle.css">
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/eventPage.js"></script>
</head>
<body>
	<div id="eventListwrap" align="center">
		<div class="eContainer">
			<div id="eventListDiv">
				<div class="eventB_div">
					<p class="eventB_menu">브랜드 선택 ▼</p>
					<div class="event_dropdown">
						<a onclick="eventOne('A')">ALL</a>
						<c:forEach var="fvoList" items="${fvoList}">
							<a onclick="eventOne('${fvoList.frcode}')">${fvoList.frkname}</a>
						</c:forEach>
					</div>	
				</div>
				<br><br>
				
				<div id="resultArea02">
					<!-- 브랜드별 이벤트 탭 -->
		
					<!-- 이벤트 카드형 -->
					<c:forEach var="eventList" items="${eventList}">
						<div id="eventDiv">
							<table id="eventTable">
								<tr>
						    		<td id="eventImg">
						    			<a href="${eventList.editurl}" target="_blank"><img src="${eventList.eventImg}" width="250px" height="250px"></a>
						    		</td>
								</tr>
								<tr>
									<td id="eventTitle">${eventList.caltitle}</td>
								</tr>
								<tr>
									<td id="eventDate">${eventList.start_date} ~ ${eventList.end_date}</td>
								</tr>
								<tr>
									<td id="eventContent">${eventList.calcontent}</td>
								</tr>   	
							</table>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<hr>

	<div id="eventFooter">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>