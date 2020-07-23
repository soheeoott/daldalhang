<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/productStyle.css">
</head>
<body>
	<div class = "top">
	<%@ include file="../common/header.jsp" %>
	</div>
	
	<fieldset>
	<div id = "wrap">
		<div class="container">
			<div class="main">
				<div class="productList">
						<c:forEach var="list" items="${PList}">
						<div class = "plist">
							<p>${list.pseq}</p>
							<p class = "pname">${list.productname}</p>
							<p>${list.price} 원</p>
							<div class = "hashtag">${list.hashtag}</div>
						</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</fieldset>
<%-- 
<c:if test="${message != null}">
 => ${message}
</c:if> 
--%>
<%@ include file="../common/footer.jsp" %>
</body>
</html>