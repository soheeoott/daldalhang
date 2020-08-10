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
		<div class="btn_nlist" align="right">
			<c:if test="${logID=='DalDal'}">
				<input type="button" value="상품 등록" class="buttonStyle" onclick="location.href='pdinsertf'">
			</c:if>
		</div>
		
		<!-- 2020.08.03 product menu name 출력 -->
		<div class="menu_css">
			<c:forEach var="list" items="${mulist}" end="5">
					<c:if test="${list.mucategory=='coffee'}"><a href="pdlist?mucategory=${list.mucategory}" value="coffee">커피</a></c:if>
					<c:if test="${list.mucategory=='dessert'}"><a href="pdlist?mucategory=${list.mucategory}" value="dessert">디저트</a></c:if>
					<c:if test="${list.mucategory=='drink'}"><a href="pdlist?mucategory=${list.mucategory}" value="drink">음료</a></c:if>
					<c:if test="${list.mucategory=='food'}"><a href="pdlist?mucategory=${list.mucategory}" value="food">음식</a></c:if>
					<c:if test="${list.mucategory=='special'}"><a href="pdlist?mucategory=${list.mucategory}" value="special">특별!</a></c:if>		
			</c:forEach>
			<hr>
			<c:forEach var="cpdlist" items="${cpdlist}" end="5">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach>
			<br>
			<c:forEach var="cpdlist" items="${cpdlist}" begin="6">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach>		
		</div>
		<br><br>
		<div class="container">
			<div class="main">
			
				<div class="productList">
						<c:forEach var="list" items="${pdlist}">
						
						<%-- <c:if test = "${list.bcode == 1}">
							<hr>
								<div>
									음료
								</div>
							<hr>
						</c:if>
						
						<c:if test = "${list.bcode == 2}">
							<hr>
								<div>
									빙수
								</div>
							<hr>
						</c:if>
						
						<c:if test = "${list.bcode == 3}">
							<hr>
								<div>
									디저트
								</div>
							<hr>
						</c:if>
						
						<c:if test = "${list.bcode == 4}">
							<hr>
								<div>
									상품
								</div>
							<hr>
						</c:if> --%>
						
						<div class = "plist">
							<p>
								<a href = "${list.pdurl}" target="_blank">
								<img src="${list.pduploadfile}" width="200" height="200">
								</a>
							</p>
							<p class = "pname">${list.pdname}</p>
							<p>${list.price} 원</p>
							
							<div class = "hashtag">
				            	<c:forEach var="hashtag" items="${fn:split(list.hashtag,'#')}">
				            		<a href="hashtagList?keyword=${hashtag}">
				            			<span class = "hashtagsplit"># ${hashtag}</span>
				            		</a>
				            	</c:forEach>
				            </div>
				            
<%-- 							<div class = "hashtag">${list.hashtag}</div> --%>
						</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
<%-- 
<c:if test="${message != null}">
 => ${message}
</c:if> 
--%>
</div><br><hr><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>