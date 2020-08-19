<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="common/header.jsp" %>
<html>
<head>
<title>** DalDal **</title>
	<link rel="stylesheet" type="text/css" href="resources/css/productStyle.css">
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

</head>
<body>
	<div align="center" id="wrap">
		<div id="product_box" align="center">
			<div class="container">
				<div class="main">
					
					<div class="productList">
					
					<div>신제품</div>
					
						<c:forEach var="newlist" items="${newlist}" end="3">
							<div class = "plist">
								<p>
									<a href = "${newlist.pdurl}" target="_blank">
									<img src="${newlist.pduploadfile}" width="200" height="200">
									</a>
								</p>
								
								<c:if test="${newlist.frcode=='A01'}"><p>공차</p></c:if>
					            <c:if test="${newlist.frcode=='A02'}"><p>던킨도너츠</p></c:if>
					            <c:if test="${newlist.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
					            <c:if test="${newlist.frcode=='A04'}"><p>메가커피</p></c:if>
					            <c:if test="${newlist.frcode=='A05'}"><p>빽다방</p></c:if>
					            <c:if test="${newlist.frcode=='A06'}"><p>스타벅스</p></c:if>
					            <c:if test="${newlist.frcode=='A07'}"><p>이디야</p></c:if>
					            <c:if test="${newlist.frcode=='A08'}"><p>쥬씨</p></c:if>
					            <c:if test="${newlist.frcode=='A09'}"><p>설빙</p></c:if>
					            <c:if test="${newlist.frcode=='A10'}"><p>투썸 플레이스</p></c:if>
					            <c:if test="${newlist.frcode=='A11'}"><p>파리바게뜨</p></c:if>
					            <c:if test="${newlist.frcode=='A12'}"><p>파스쿠찌</p></c:if>
					            <c:if test="${newlist.frcode=='A13'}"><p>흑화당</p></c:if>
			
								<p class = "pname">${newlist.pdname}</p>
								<p>${newlist.price} 원</p>
								
				            	<c:forEach var="hashtag" items="${fn:split(newlist.hashtag,'#')}">
				            		<a href="hashtagList?keyword=${hashtag}">
				            			<span class = "hashtagsplit"># ${hashtag}</span>
				            		</a>
				            	</c:forEach>
				            	
							</div>
						</c:forEach>
					</div>
					
					<div class="productList">
					
					<div>추천제품</div>
					
						<c:forEach var="bestlist" items="${bestlist}" end="3">
							<div class = "plist">
								<p>
									<a href = "${bestlist.pdurl}" target="_blank">
									<img src="${bestlist.pduploadfile}" width="200" height="200">
									</a>
								</p>
								
								<%-- <p>${bestlist.frkname}</p> --%>
								
								<!-- 
								<c:if test="${bestlist.frcode=='A01'}"><p>공차</p></c:if>
					            <c:if test="${bestlist.frcode=='A02'}"><p>던킨도너츠</p></c:if>
					            <c:if test="${bestlist.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
					            <c:if test="${bestlist.frcode=='A04'}"><p>메가커피</p></c:if>
					            <c:if test="${bestlist.frcode=='A05'}"><p>빽다방</p></c:if>
					            <c:if test="${bestlist.frcode=='A06'}"><p>스타벅스</p></c:if>
					            <c:if test="${bestlist.frcode=='A07'}"><p>이디야</p></c:if>
					            <c:if test="${bestlist.frcode=='A08'}"><p>쥬씨</p></c:if>
					            <c:if test="${bestlist.frcode=='A09'}"><p>설빙</p></c:if>
					            <c:if test="${bestlist.frcode=='A10'}"><p>투썸 플레이스</p></c:if>
					            <c:if test="${bestlist.frcode=='A11'}"><p>파리바게뜨</p></c:if>
					            <c:if test="${bestlist.frcode=='A12'}"><p>파스쿠찌</p></c:if>
					            <c:if test="${bestlist.frcode=='A13'}"><p>흑화당</p></c:if>
								-->
								
								<p class = "pname">${bestlist.pdname}</p>
								<p>${bestlist.price} 원</p>
								
				            	<c:forEach var="hashtag" items="${fn:split(bestlist.hashtag,'#')}">
				            		<a href="hashtagList?keyword=${hashtag}">
				            			<span class = "hashtagsplit"># ${hashtag}</span>
				            		</a>
				            	</c:forEach>
				            	
							</div>
						</c:forEach>
					</div>	
					
					<div class="productList">
					
					<div>시즌제품</div>
					
						<c:forEach var="seasonlist" items="${seasonlist}" end="3">
							<div class = "plist">
								<p>
									<a href = "${seasonlist.pdurl}" target="_blank">
									<img src="${seasonlist.pduploadfile}" width="200" height="200">
									</a>
								</p>
								
								<c:if test="${seasonlist.frcode=='A01'}"><p>공차</p></c:if>
					            <c:if test="${seasonlist.frcode=='A02'}"><p>던킨도너츠</p></c:if>
					            <c:if test="${seasonlist.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
					            <c:if test="${seasonlist.frcode=='A04'}"><p>메가커피</p></c:if>
					            <c:if test="${seasonlist.frcode=='A05'}"><p>빽다방</p></c:if>
					            <c:if test="${seasonlist.frcode=='A06'}"><p>스타벅스</p></c:if>
					            <c:if test="${seasonlist.frcode=='A07'}"><p>이디야</p></c:if>
					            <c:if test="${seasonlist.frcode=='A08'}"><p>쥬씨</p></c:if>
					            <c:if test="${seasonlist.frcode=='A09'}"><p>설빙</p></c:if>
					            <c:if test="${seasonlist.frcode=='A10'}"><p>투썸 플레이스</p></c:if>
					            <c:if test="${seasonlist.frcode=='A11'}"><p>파리바게뜨</p></c:if>
					            <c:if test="${seasonlist.frcode=='A12'}"><p>파스쿠찌</p></c:if>
					            <c:if test="${seasonlist.frcode=='A13'}"><p>흑화당</p></c:if>
			
								<p class = "pname">${seasonlist.pdname}</p>
								<p>${seasonlist.price} 원</p>
								
				            	<c:forEach var="hashtag" items="${fn:split(seasonlist.hashtag,'#')}">
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
	</div>
	<hr>
	<%@ include file="common/footer.jsp" %>
</body>
</html>
