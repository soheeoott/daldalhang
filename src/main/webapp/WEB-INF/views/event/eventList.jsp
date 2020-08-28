<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div align="center" id="eventListDiv">
	<!-- 이벤트 카드형 -->
	<c:forEach var="eventList" items="${eventList}">
		<div id="eventDiv">
			<table id="eventTable">
				<tr>
		    		<td id="eventImg"><a href="${eventList.editurl}" target="_blank"><font align="center">NO IMAGE</font><img src="${eventList.eventImg}"></a></td>
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
</body>
</html>