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
<script src="resources/js/likeFunc.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/likeListStyle.css">
<script>
$(function() {
	$(".plist").slice(0,6).show();
	$("#more_btn").click(function(e) {
		e.preventDefault();
		$(".plist:hidden").slice(0,6).show();
		if($(".plist:hidden").length==0){
			alert("마지막 상품 입니다.");
		}
	});
});	
</script>
</head>
<body>
<div id = "wrap">
		
	<div class="container">

        <div class="main">
			<strong class="j_title">내 찜 목록</strong>
			  <div class="mypage">
				<div class="productList">
						<c:forEach var="list" items="${llist}">
						
						<div class = "plist">
							<p>
								<a href = "${list.pdurl}" target="_blank" class="pdurl">
									<img src="${list.pduploadfile}" width="200" height="200">
								</a>
								
								<input type="hidden" name="id" id="id" value="${logID}">
								<form id="form" name="form" method="post" onsubmit="return false;">
								
								<div class="lbutton">
										<input type="image" src="resources/image/fullheart.png" class="limg" id="${list.pdseq}" onclick="like(${list.pdseq})">
								</div>
								</form>
							 </p>
							
							<div class="namelist">
							<div class="fname">
								<c:if test="${list.frcode=='A01'}"><p>공차</p></c:if>
					            <c:if test="${list.frcode=='A02'}"><p>던킨도너츠</p></c:if>
					            <c:if test="${list.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
					            <c:if test="${list.frcode=='A04'}"><p>메가커피</p></c:if>
					            <c:if test="${list.frcode=='A05'}"><p>빽다방</p></c:if>
					            <c:if test="${list.frcode=='A06'}"><p>스타벅스</p></c:if>
					            <c:if test="${list.frcode=='A07'}"><p>이디야</p></c:if>
					            <c:if test="${list.frcode=='A08'}"><p>쥬씨</p></c:if>
					            <c:if test="${list.frcode=='A09'}"><p>설빙</p></c:if>
					            <c:if test="${list.frcode=='A10'}"><p>투썸플레이스</p></c:if>
					            <c:if test="${list.frcode=='A11'}"><p>파리바게뜨</p></c:if>
					            <c:if test="${list.frcode=='A12'}"><p>파스쿠찌</p></c:if>
					            <c:if test="${list.frcode=='A13'}"><p>흑화당</p></c:if>
				            </div>
							<p class = "pname">${list.pdname}</p>
							<p class="prname">${list.price} 원</p>
							</div>
							
			            	<c:forEach var="hashtag" items="${fn:split(list.hashtag,'#')}">
			            		<a href="hashtagList?keyword=${hashtag}">
			            			<span class = "hashtagsplit">#${hashtag} </span>
			            		</a>
			            	</c:forEach>
			            	
						</div>
					</c:forEach>
				</div>
			</div>
				<a id="more_btn">+ 더 보기</a>
		</div>	
	</div>
</div><hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>