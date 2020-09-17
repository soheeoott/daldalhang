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
	<link rel="stylesheet" type="text/css" href="resources/css/productStyle.css">
	
	<!-- 좋아요 -->
	<script src="resources/js/likeFunc.js"></script>
	
	<!-- 상품 삭제 -->
	<script src="resources/js/productDelete.js"></script>
	
	<!-- 외부 주소 인식 안됨 -->
	<script>
	function login() {
		if (confirm("로그인 후 이용해주세요.")) {
			window.location.href ="/daldal/loginf";
		}
		return false;
	}
	</script>
	
	<script>
	$(function() {
		$(".plist").slice(0,12).show();
		$("#more_btn").click(function(e) {
			e.preventDefault();
			$(".plist:hidden").slice(0,12).show();
			if($(".plist:hidden").length==0){
				alert("마지막 상품 입니다.");
			}
		});
	});	
	</script>
	
	<style type="text/css">
	.plist {
	display: none;
    }
	</style>
</head>
<body>
<main>
	<div class="services">
		<div id="wrap">
		<div id="product_box" align="center">
	    <div class="container">
	    	
	    		<div class="count">
				    <!-- 레코드의 갯수를 출력 -->
				    <c:if test="${map.count > 0}">${map.count}개의 ${keyword}(이)가 있습니다.</c:if>
				    <c:if test="${map.count == 0}">검색 결과가 없습니다.</c:if>
			    </div>
			    
			    <div class="container">
			    <div class="main">
			    <div class="productList">
			        <c:forEach var="map" items="${map.pdlist}">
				        
				        <div class = "plist">
				        	<div class="icon-box icon-box-pink">
				            	<a href="${map.pdurl}" target="_blank" class="pdurl">
				            		<img src="${map.pduploadfile}" width="200" height="200"
				            		onmouseover="this.src='resources/image/home_move.png'" onmouseout="this.src='${map.pduploadfile}'">
				            	</a>
									
									<form id="form" name="form" method="post" onsubmit="return false;">
										<div class="lbutton">
											<c:choose>
												<c:when test="${logID ne null}">
													<c:if test="${map.liked=='t'}" >
													<input type="image" src="resources/image/fullheart.png" class="limg" id="${map.pdseq}" onclick="like(${map.pdseq})">
													</c:if>
													<c:if test="${map.liked!='t'}">
													<input type="image" src="resources/image/emptyheart.png" class="limg" id="${map.pdseq}" onclick="like(${map.pdseq})">
													</c:if>
												</c:when>
												<c:otherwise>
													<a onclick="login()"><img src="resources/image/emptyheart.png" class="limg"></a>
												</c:otherwise>
											</c:choose>
										</div>
									</form>
					            
					            <div class="namelist">
									<div class="fname">
										<c:if test="${map.frcode=='A01'}"><p>공차</p></c:if>
							            <c:if test="${map.frcode=='A02'}"><p>던킨도너츠</p></c:if>
							            <c:if test="${map.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
							            <c:if test="${map.frcode=='A04'}"><p>메가커피</p></c:if>
							            <c:if test="${map.frcode=='A05'}"><p>빽다방</p></c:if>
							            <c:if test="${map.frcode=='A06'}"><p>스타벅스</p></c:if>
							            <c:if test="${map.frcode=='A07'}"><p>이디야</p></c:if>
							            <c:if test="${map.frcode=='A08'}"><p>쥬씨</p></c:if>
							            <c:if test="${map.frcode=='A09'}"><p>설빙</p></c:if>
							            <c:if test="${map.frcode=='A10'}"><p>투썸 플레이스</p></c:if>
							            <c:if test="${map.frcode=='A11'}"><p>파리바게뜨</p></c:if>
							            <c:if test="${map.frcode=='A12'}"><p>파스쿠찌</p></c:if>
							            <c:if test="${map.frcode=='A13'}"><p>흑화당</p></c:if>
									</div>
									
									<p class="pname">${map.pdname}</p>
					            	<p class="prname">${map.price} 원</p>
									
								</div>
					            
					            <div>
				            	<c:forEach var="hashtag" items="${fn:split(map.hashtag,'#')}">
				            		<a href="hashtagList?keyword=${hashtag}">
				            			<span class="hashtagsplit"> #${hashtag}</span>
				            		</a>
				            	</c:forEach>
				            	</div>
				            	
				            <c:if test="${logID == 'DalDal'}">
								<div class="mdwrap">
									<a href="pdetail?pdseq=${map.pdseq}">
										<div class = "modify">수정</div>
									</a>
									
									<a onclick="remove(${map.pdseq})">
									<%-- <a href="javascript:void(0);" onclick="remove(${map.pdseq})"> --%>
										<div class = "delete">삭제</div>
									</a>
								</div>
							</c:if>
				        </div>
				        </div>    
			        </c:forEach>
			    </div> 
			    
			    <div class="more">
					<a id="more_btn">+ 더 보기</a>
				</div>
			    
			</div>
		</div>
	</div>		
</div>
</div>		
	</div>
</main>	
<%@ include file="../common/footer.jsp" %>
</body>
</html>