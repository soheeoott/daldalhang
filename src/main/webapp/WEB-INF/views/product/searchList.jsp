<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/searchproductStyle.css">
</head>
<body>
<div id="wrap">
	<div id="product_box" align="center">
	    <div class="container">
	    	<div class="main">
	    		<div class="count">
				    <!-- 레코드의 갯수를 출력 -->
				    ${map.count}개의 음료/디저트가 있습니다.
			    <br><br><br>
			    </div>
			    
			    <div class="productList">
			        <c:forEach var="map" items="${map.pdlist}">
				        
				        <div class = "plist">
				            <p>
				            	<a href = "${map.pdurl}">
				            		<img src="${map.pduploadfile}" width="200" height="200">
				            	</a>
				            </p>
				            
				            <c:if test="${map.frcode=='A01'}"><p>공차</p></c:if>
				            <c:if test="${map.frcode=='A02'}"><p>던킨도너츠</p></c:if>
				            <c:if test="${map.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
				            <c:if test="${map.frcode=='A04'}"><p>메가커피</p></c:if>
				            <c:if test="${map.frcode=='A05'}"><p>빽다방</p></c:if>
				            <c:if test="${map.frcode=='A06'}"><p>스타벅스</p></c:if>
				            <c:if test="${map.frcode=='A07'}"><p>이디야</p></c:if>
				            <c:if test="${map.frcode=='A08'}"><p>쥬씨</p></c:if>
				            <c:if test="${map.frcode=='A09'}"><p>설빙</p></c:if>
				            <c:if test="${map.frcode=='A10'}"><p>투썸</p></c:if>
				            <c:if test="${map.frcode=='A11'}"><p>파리바게뜨</p></c:if>
				            <c:if test="${map.frcode=='A12'}"><p>파스쿠찌</p></c:if>
				            <c:if test="${map.frcode=='A13'}"><p>흑화당</p></c:if>
				            
				            <p class = "pname">${map.pdname}</p>
				            <p>${map.price} 원</p>
				            
				            
			            	<c:forEach var="hashtag" items="${fn:split(map.hashtag,'#')}">
			            		<a href="hashtagList?keyword=${hashtag}">
			            			<span class = "hashtagsplit"># ${hashtag}</span>
			            		</a>
			            	</c:forEach>
				            
				        </div>    
			        </c:forEach>
			    </div> 
			</div>
		</div>
	</div>		
</div><hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>