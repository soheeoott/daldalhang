<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ include file="../common/header.jsp" %>
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
<div id = "wrap">
	<div id="product_box" align="center">
		<div class="btn_nlist" align="left">
			<c:if test="${logID=='DalDal'}">
				<input type="button" value="상품 등록" class="buttonStyle" onclick="location.href='pdinsertf'">
			</c:if>
		</div>
		
		<!-- 2020.08.03 product menu name 출력 -->
		<div class="menu_css">
			<c:forEach var="list" items="${menulist}">
				<c:if test="${list.mucategory=='coffee'}">
					<a href="category?mubcode=${list.mubcode}">커피</a>
				</c:if>
				
				<c:if test="${list.mucategory=='dessert'}">
					<a href="category?mubcode=${list.mubcode}">디저트</a>
				</c:if>
				
				<c:if test="${list.mucategory=='drink'}">
					<a href="category?mubcode=${list.mubcode}">음료</a>
				</c:if>
				
				<c:if test="${list.mucategory=='food'}">
					<a href="category?mubcode=${list.mubcode}">음식</a>
				</c:if>
				
				<c:if test="${list.mucategory=='special'}">
					<a href="category?mubcode=${list.mubcode}">스페셜</a>
				</c:if>							
			</c:forEach>
			<hr><br>
			<c:forEach var="cpdlist" items="${cpdlist}" end="5">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach>
			<br>
			<c:forEach var="cpdlist" items="${cpdlist}" begin="6">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach>		
		</div>
		<br><br><br>
		<div class="container">
			<div class="main">
				<div class="productList">
						<c:forEach var="list" items="${pdlist}">
						
						<div class = "plist">
							<p>
								<a href = "${list.pdurl}" target="_blank">
								<img src="${list.pduploadfile}" width="200" height="200">
								</a>
							</p>
							
							<c:if test="${list.frcode=='A01'}"><p>공차</p></c:if>
				            <c:if test="${list.frcode=='A02'}"><p>던킨도너츠</p></c:if>
				            <c:if test="${list.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
				            <c:if test="${list.frcode=='A04'}"><p>메가커피</p></c:if>
				            <c:if test="${list.frcode=='A05'}"><p>빽다방</p></c:if>
				            <c:if test="${list.frcode=='A06'}"><p>스타벅스</p></c:if>
				            <c:if test="${list.frcode=='A07'}"><p>이디야</p></c:if>
				            <c:if test="${list.frcode=='A08'}"><p>쥬씨</p></c:if>
				            <c:if test="${list.frcode=='A09'}"><p>설빙</p></c:if>
				            <c:if test="${list.frcode=='A10'}"><p>투썸 플레이스</p></c:if>
				            <c:if test="${list.frcode=='A11'}"><p>파리바게뜨</p></c:if>
				            <c:if test="${list.frcode=='A12'}"><p>파스쿠찌</p></c:if>
				            <c:if test="${list.frcode=='A13'}"><p>흑화당</p></c:if>

							<p class = "pname">${list.pdname}</p>
							<p>${list.price} 원</p>
							
			            	<c:forEach var="hashtag" items="${fn:split(list.hashtag,'#')}">
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