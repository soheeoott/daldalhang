<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
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
<div id="eWrap" align="center" id="eventAllTab">
	<div class="container">
		<ul class="tabs" align="center">
			<li class="tab-link current" data-tab="tab-1"><a>이벤트 달력</a></li>
			<li class="tab-link" data-tab="tab-2"><a>이벤트</a></li>
		</ul>

		<div align="center">
			<div id="tab-1" class="tab-content current">
				<div id="resultArea01"></div>
			</div>
			<div id="tab-2" class="tab-content">
				<div id="resultArea02"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>