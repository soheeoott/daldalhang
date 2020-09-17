<!-- 
	슬라이드 이전/다음, 페이지번호 클릭 시 슬라이드 멈춤
	슬라이드 간격 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="common/header.jsp" %>
<html>
<head>
<title>** DalDal **</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="descriptison">
  	<meta content="" name="keywords">

 	<link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
 	<link rel="stylesheet" type="text/css" href="resources/css/swiper.min.css">
	
	<!-- Template CSS -->
	<link href="resources/assets/css/style.css" rel="stylesheet">
	<link href="resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
	
	<!-- 좋아요  -->
	<script src="resources/js/productDelete.js"></script>
	
	<!-- 상품 삭제 -->
	<script src="resources/js/productLike.js"></script>
	
	<!-- 좋아요 회원제 = 외부 주소 인식 안됨 -->
	<script>
	function login() {
		if (confirm("로그인 후 이용해주세요.")) {
			window.location.href ="/daldal/loginf";
		}
		return false;
	}
	</script>
</head>
<body>
	<main>
		<section id="hero-no-slider" class="d-flex justify-cntent-center align-items-center" style="margin-top: 180px;">
			<img src="resources/image/tart_back.png" id="colorblock">
			
			<div id="daldal">	
				<h1>달달행(行)은?</h1>
				<p style="position: relative; top: 35px; font-size: 20px; left: 400px; color: whitesmoke;">다양한 프랜차이즈 카페의 음료와 디저트를</p><br>
				<p style="position: relative; bottom: 5px; font-size: 20px; left: 400px; color:whitesmoke;">한 페이지에 모아 볼 수 있는 웹 사이트 입니다.</p><br>
				<p style="position: relative; bottom: 25px; left: 400px; color: whitesmoke;">좋아하는 브랜드의 메뉴와 가격 정보를 확인하고 가까운 매장을 찾아보세요.</p>
			</div>
		</section><!-- hero-no-slider -->
	
		<!-- 신제품 -->
		<main id="slider">
			<div class="container">
				<div class="services">
					<div class="swiper-container" align="center" style="top: -420px;"> <!-- 첫번째 슬라이드 간격 조정 -->
					
						<div id="slidetit">what's New</div>
						
						<div class="swiper-wrapper">
							<c:forEach var="newlist" items="${newlist}">
								<div class="swiper-slide">
									<div class="icon-box icon-box-pink">
										
										<div class="icon">
											<a href ="${newlist.pdurl}" target="_blank">
												<img src="${newlist.pduploadfile}" width="200" height="200"
													onmouseover="this.src='resources/image/home_move.png'" onmouseout="this.src='${newlist.pduploadfile}'"> <!-- 홈페이지로 이동 :hover -->
											</a>
										</div>
										
										<!-- 좋아요 -->
										<form id="form" name="form" method="post" onsubmit="return false;">
											<div class="lbutton">
												<c:choose>
													<c:when test="${logID ne null}">
														<c:if test="${newlist.liked=='t'}" >
															<input type="image" src="resources/image/fullheart.png" class="limg" id="${newlist.pdseq}" onclick="like(${newlist.pdseq})">
														</c:if>
														<c:if test="${newlist.liked!='t'}">
															<input type="image" src="resources/image/emptyheart.png" class="limg" id="${newlist.pdseq}" onclick="like(${newlist.pdseq})">
														</c:if>
													</c:when>
													<c:otherwise>
														<a onclick="login()"><img src="resources/image/emptyheart.png" class="limg"></a>
													</c:otherwise>
												</c:choose>
											</div>
										</form>	
										
										<!-- 브랜드명  -->
										<h4 class="title">
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
										</h4>
										
										<!-- 상품명 -->		
										<p class="pname">
											${newlist.pdname}
										</p>
										
										<!-- 가격 -->
										<p class="prname">
											${newlist.price} 원
										</p>
										
										<!-- 해시태그 -->
										<p class="description">
											<c:forEach var="hashtag" items="${fn:split(newlist.hashtag,'#')}">
							            		<a href="hashtagList?keyword=${hashtag}">
							            			<span class="hashtagsplit"> #${hashtag}</span>
							            		</a>
							            	</c:forEach>
										</p>
											
										<!-- 관리자 : 수정/삭제 -->	
										<c:if test="${logID == 'DalDal'}">
											<div class="mdwrap">
												<a href="pdetail?pdseq=${newlist.pdseq}">
													<div class = "modify">수정</div>
												</a>
					
												<a onclick="remove(${newlist.pdseq})">
													<div class = "delete">삭제</div>
												</a>
											</div>
										</c:if>		
									</div>
								</div>
							</c:forEach>
						</div>
			
						<!-- 슬라이드 이전/다음 -->
				    	<div class="swiper-button-prev"></div>
				    	<div class="swiper-button-next"></div>
			
					    <!-- 슬라이드 페이지번호 -->
				   		<div class="swiper-pagination"></div>
				  
					</div>
				</div>
			</div>
	
			<!-- 추천제품  -->
			<div class="container">
				<div class="services">
					<div class="swiper-container" align="center" style="top: -420px;"> <!-- 두번째 슬라이드 간격 조정 -->
					
						<div id="slidetit">BEST</div>
						
						<div class="swiper-wrapper">
							<c:forEach var="bestlist" items="${bestlist}">
								<div class="swiper-slide">
									<div class="icon-box icon-box-pink">
										
										<div class="icon">
											<a href ="${bestlist.pdurl}" target="_blank">
												<img src="${bestlist.pduploadfile}" width="200" height="200"
													onmouseover="this.src='resources/image/home_move.png'" onmouseout="this.src='${bestlist.pduploadfile}'"> <!-- 홈페이지로 이동 :hover -->
											</a>
										</div>
										
										<!-- 좋아요 -->
										<form id="form" name="form" method="post" onsubmit="return false;">
											<div class="lbutton">
												<c:choose>
													<c:when test="${logID ne null}">
														<c:if test="${bestlist.liked=='t'}" >
															<input type="image" src="resources/image/fullheart.png" class="limg" id="${bestlist.pdseq}" onclick="like(${bestlist.pdseq})">
														</c:if>
														<c:if test="${bestlist.liked!='t'}">
															<input type="image" src="resources/image/emptyheart.png" class="limg" id="${bestlist.pdseq}" onclick="like(${bestlist.pdseq})">
														</c:if>
													</c:when>
													<c:otherwise>
														<a onclick="login()"><img src="resources/image/emptyheart.png" class="limg"></a>
													</c:otherwise>
												</c:choose>
											</div>
										</form>	
										
										<!-- 브랜드명  -->
										<h4 class="title">
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
										</h4>
											
										<!-- 상품명  -->		
										<p class="pname">
											${bestlist.pdname}
										</p>
										
										<!-- 가격 -->
										<p class="prname">
											${bestlist.price} 원
										</p>
										
										<!-- 해시태그 -->
										<p class="description">
											<c:forEach var="hashtag" items="${fn:split(bestlist.hashtag,'#')}">
							            		<a href="hashtagList?keyword=${hashtag}">
							            			<span class="hashtagsplit"> #${hashtag}</span>
							            		</a>
							            	</c:forEach>
										</p>
											
										<!-- 관리자 수정/삭제 -->	
										<c:if test="${logID == 'DalDal'}">
											<div class="mdwrap">
												<a href="pdetail?pdseq=${bestlist.pdseq}">
													<div class = "modify">수정</div>
												</a>
					
												<a onclick="remove(${bestlist.pdseq})">
													<div class = "delete">삭제</div>
												</a>
											</div>
										</c:if>		
									</div>
								</div>
							</c:forEach>
						</div>
			
						<!-- 슬라이드 이전/다음 -->
				    	<div class="swiper-button-prev"></div>
				    	<div class="swiper-button-next"></div>
			
					    <!-- 슬라이드 페이지번호 -->
				   		<div class="swiper-pagination"></div>
			
					</div>
				</div>
			</div>
	
			<!-- 시즌제품  -->
			<div class="container">
				<div class="services">
					<div class="swiper-container" align="center" style="top: -380px;"> <!-- 세번째 슬라이드 간격 조정 -->
					
						<div id="slidetit">SEASON</div>
						
						<div class="swiper-wrapper">
							<c:forEach var="seasonlist" items="${seasonlist}">
								<div class="swiper-slide">
									<div class="icon-box icon-box-pink">
										
										<div class="icon">
											<a href ="${seasonlist.pdurl}" target="_blank">
												<img src="${seasonlist.pduploadfile}" width="200" height="200"
												onmouseover="this.src='resources/image/home_move.png'" onmouseout="this.src='${seasonlist.pduploadfile}'"> <!-- 홈페이지로 이동 :hover -->
											</a>
										</div>
										
										<!-- 좋아요 -->
										<form id="form" name="form" method="post" onsubmit="return false;">
											<div class="lbutton">
												<c:choose>
													<c:when test="${logID ne null}">
														<c:if test="${seasonlist.liked=='t'}" >
															<input type="image" src="resources/image/fullheart.png" class="limg" id="${seasonlist.pdseq}" onclick="like(${seasonlist.pdseq})">
														</c:if>
														<c:if test="${seasonlist.liked!='t'}">
															<input type="image" src="resources/image/emptyheart.png" class="limg" id="${seasonlist.pdseq}" onclick="like(${seasonlist.pdseq})">
														</c:if>
													</c:when>
													<c:otherwise>
														<a onclick="login()"><img src="resources/image/emptyheart.png" class="limg"></a>
													</c:otherwise>
												</c:choose>
											</div>
										</form>	
										
										<!-- 브랜드명 -->
										<h4 class="title">
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
										</h4>
											
										<!-- 상품명 -->		
										<p class="pname">
											${seasonlist.pdname}
										</p>
										
										<!-- 가격 -->
										<p class="prname">
											${seasonlist.price} 원
										</p>
										
										<!-- 해시태그 -->
										<p class="description">
											<c:forEach var="hashtag" items="${fn:split(seasonlist.hashtag,'#')}">
							            		<a href="hashtagList?keyword=${hashtag}">
							            			<span class="hashtagsplit"> #${hashtag}</span>
							            		</a>
							            	</c:forEach>
										</p>
											
										<!-- 관리자 수정/삭제 -->											
										<c:if test="${logID == 'DalDal'}">
											<div class="mdwrap">
												<a href="pdetail?pdseq=${seasonlist.pdseq}">
													<div class = "modify">수정</div>
												</a>
					
												<a onclick="remove(${seasonlist.pdseq})">
													<div class = "delete">삭제</div>
												</a>
											</div>
										</c:if>		
									</div>
								</div>
							</c:forEach>
						</div>
			
						<!-- 슬라이드 이전/다음 -->
				    	<div class="swiper-button-prev"></div>
				    	<div class="swiper-button-next"></div>
			
					    <!-- 슬라이드 페이지번호 -->
				   		<div class="swiper-pagination"></div>
			
					</div>
				</div>
			</div>
		</main>
	</main>
	
	<!-- Swiper -->
	<script src = "resources/js/swiper.min.js"></script>
	
	<script>
	var swiper = new Swiper('.swiper-container', {
		  
	updateOnWindowResize: true,   // 창 크기 조정시 슬라이드 위치를 다시 계산
	speed: 500,
	autoplay: true,
	slidesPerView: 2, // 보여지는 개수
	slidesPerGroup: 1,
	loop: true,
	loopFillGroupWithBlank: true,
	uniqueNavElements: true,
	paginationClickable: true,
	autoplayDisableOnInteraction: false,
	    pagination: { // 페이지번호
			el: '.swiper-pagination',
	        clickable: true,
	    },
	    navigation: { // 이전_다음
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	        autoplayDisableOnInteraction: false,
	    }, 
    });
	</script>
	
<%@ include file="common/footer.jsp" %>
</body>
</html>