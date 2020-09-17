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
	
	<!-- Template Main CSS File -->
	<link href="resources/assets/css/style.css" rel="stylesheet">
	<link href="resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
	<!-- <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
	
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
	
	<style type="text/css">
	.row{display:-ms-flexbox;display:flex;-ms-flex-wrap:wrap;flex-wrap:wrap;}
	
	.limg{
	width: 13%;
	}
	
    #slidetit {
    font-size: 30px;
    margin: 50px;
    color: #8b5700;
    position: relative;
    top: -50px;
	}
	
	.swiper-container {
    width: 800px;
    height: 900px;
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    z-index: 1;
	}
	
	.swiper-container-horizontal>.swiper-pagination-bullets, .swiper-pagination-custom, .swiper-pagination-fraction {
    left: 0;
    width: 100%;
    position: absolute;
    top: 690px;
	}
	
	.sub {
	position: relative;
    top: 100px;
	}
	
	.third {
	position: relative;
    top: 150px;
	}

	.swiper-wrapper {
		float: left;
	    width: 25%;
	    height: 500px;
	    padding: 0 20px;
		text-align: center;
	}
	
	.modify {
	color: white;
    opacity: 0.5;
    cursor: pointer;
    background: blue;
    padding: 5px;
    width: 50px;
    float: left;
    border-radius: 3px;
	}
	
	.delete {
	color: white;
    opacity: 0.5;
    cursor: pointer;
    background: red;
    padding: 5px;
    width: 50px;
    float: left;
    margin-left: 1em;
    border-radius: 3px;
	}
	
	.mdwrap {
    position: relative;
    top: 30px;
    display: -webkit-inline-box;
	}
	
	.hashtagsplit {
   	color: gray;
   	margin: 0 auto;
   	position: relative;
   	top: 20px;
   	font-size: 15px;
   	line-height: 1.5;
	}
	
	.lbutton{
	position: relative;
   	left: 70px;
	}
	
	.pdurl{
	position: relative;
	}
	
	.namelist{
	position: relative;
   	top: 5px;
   	font-weight: bold;
	}

	.fname{
	position: relative;
   	top: -10px;
	font-size: 15px;
	font-weight: bold;
	}

	.pname{
	font-size: 22px;
	font-weight: bold;
	}

	.prname{
	font-size: 17px;
	font-weight: bold;
	}
	
	/* footer */
	#footer {
		width: 100%;
    	padding: 45px 0;
    	font-size: 12px;
    	text-align: center;
    	background-color: #262626;
		
		/* display: inline-table;
	    position: absolute;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    top: 2200px;
	    width: 100%;
	    margin-top: 280px;
	    padding: 45px 0;
	    font-size: 12px;
	    text-align: center;
	    background-color: #262626; */
	} 
	
	.footer_menu {
	    width: 100%;
	    color: white;
	    font-weight: bold;
	}
	
	#daldal{
		position: relative;
	    bottom: 610px;
	    color: black;
	    text-align: justify;
	    background-color: rgba(0,0,0,0.2);
	    padding: 40px;
	}
	
	h1{
		position: relative;
    	top: 25px;
    	font-weight: unset;
    	font-size: 35px;
    	left: 400px;
	}
	</style>
</head>
<body>
    <section id="hero-no-slider" class="d-flex justify-cntent-center align-items-center" style="margin-top: 180px;">
		<img src="resources/image/tart_back.png" id="colorblock">
		<div id="daldal">	
			<h1 style="color: antiquewhite;">달달행(行)은?</h1>
			<p style="position: relative; top: 35px; font-size: 20px; left: 400px; color: whitesmoke;">다양한 프랜차이즈 카페의 음료와 디저트를</p><br>
			<p style="position: relative; bottom: 5px; font-size: 20px; left: 400px; color:whitesmoke;">한 페이지에 모아 볼 수 있는 웹 사이트 입니다.</p><br>
			<p style="position: relative; bottom: 25px; left: 400px; color: whitesmoke;">좋아하는 브랜드의 메뉴와 가격 정보를 확인하고 가까운 매장을 찾아보세요.</p>
		</div>
	</section><!-- End Hero No Slider Sectio -->
	
			
	<!-- 신제품 -->
	<main id="slider">
		<div class="container">
			<div class="services">
				<div class="swiper-container" align="center" style="top: -420px;">
				
					<div id="slidetit">what's New</div>
					
					<div class="swiper-wrapper">
						<c:forEach var="newlist" items="${newlist}">
							<div class="swiper-slide">
								<div class="icon-box icon-box-pink">
									<div class="icon">
										<a href ="${newlist.pdurl}" target="_blank">  <!-- class="pdurl" -->
											<img src="${newlist.pduploadfile}" width="200" height="200"> <!-- class="img" -->
										</a>
									</div>
									
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
											
									<p class="pname">
										${newlist.pdname}
									</p>
									
									<p class="prname">
										${newlist.price} 원
									</p>
									
									<p class="description">
										<c:forEach var="hashtag" items="${fn:split(newlist.hashtag,'#')}">
						            		<a href="hashtagList?keyword=${hashtag}">
						            			<span class="hashtagsplit"> #${hashtag}</span>
						            		</a>
						            	</c:forEach>
									</p>
										
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
		
					<!-- Add Arrows -->
			    	<div class="swiper-button-prev"></div>
			    	<div class="swiper-button-next"></div>
		
				    <!-- Add Pagination -->
			   		<div class="swiper-pagination"></div>
			  
				</div>
			</div>
		</div>
	</main>

	<!-- 추천제품  -->
	<main id="slider">
		<div class="container">
			<div class="services">
				<div class="swiper-container" align="center" style="top: -420px;">
				
					<div id="slidetit">BEST</div>
					
					<div class="swiper-wrapper">
						<c:forEach var="bestlist" items="${bestlist}">
							<div class="swiper-slide">
								<div class="icon-box icon-box-pink">
									<div class="icon">
										<a href ="${bestlist.pdurl}" target="_blank">  <!-- class="pdurl" -->
											<img src="${bestlist.pduploadfile}" width="200" height="200"> <!-- class="img" -->
										</a>
									</div>
									
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
											
									<p class="pname">
										${bestlist.pdname}
									</p>
									
									<p class="prname">
										${bestlist.price} 원
									</p>
									
									<p class="description">
										<c:forEach var="hashtag" items="${fn:split(bestlist.hashtag,'#')}">
						            		<a href="hashtagList?keyword=${hashtag}">
						            			<span class="hashtagsplit"> #${hashtag}</span>
						            		</a>
						            	</c:forEach>
									</p>
										
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
		
					<!-- Add Arrows -->
			    	<div class="swiper-button-prev"></div>
			    	<div class="swiper-button-next"></div>
		
				    <!-- Add Pagination -->
			   		<div class="swiper-pagination"></div>
		
				</div>
			</div>
		</div>
	</main>

	<!-- 시즌제품  -->
	<main id="slider">
		<div class="container">
			<div class="services">
				<div class="swiper-container" align="center" style="top: -380px;">
				
					<div id="slidetit">SEASON</div>
					
					<div class="swiper-wrapper">
						<c:forEach var="seasonlist" items="${seasonlist}">
							<div class="swiper-slide">
								<div class="icon-box icon-box-pink">
									<div class="icon">
										<a href ="${seasonlist.pdurl}" target="_blank">  <!-- class="pdurl" -->
											<img src="${seasonlist.pduploadfile}" width="200" height="200"> <!-- class="img" -->
										</a>
									</div>
									
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
											
									<p class="pname">
										${seasonlist.pdname}
									</p>
									
									<p class="prname">
										${seasonlist.price} 원
									</p>
									
									<p class="description">
										<c:forEach var="hashtag" items="${fn:split(seasonlist.hashtag,'#')}">
						            		<a href="hashtagList?keyword=${hashtag}">
						            			<span class="hashtagsplit"> #${hashtag}</span>
						            		</a>
						            	</c:forEach>
									</p>
										
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
		
					<!-- Add Arrows -->
			    	<div class="swiper-button-prev"></div>
			    	<div class="swiper-button-next"></div>
		
				    <!-- Add Pagination -->
			   		<div class="swiper-pagination"></div>
		
				</div>
			</div>
		</div>
	</main>
	
	<script src = "resources/js/swiper.min.js"></script>
	
	<script>
	var swiper = new Swiper('.swiper-container', {
		  
	updateOnWindowResize: true,   // 창 크기 조정시 슬라이드 위치를 다시 계산
	speed: 500,
	autoplay: true,
	slidesPerView: 2,
	slidesPerGroup: 1,
	loop: true,
	loopFillGroupWithBlank: true,
	uniqueNavElements: true,
	paginationClickable: true,
	autoplayDisableOnInteraction: false,
	    pagination: {
			el: '.swiper-pagination',
	        clickable: true,
	    },
	    navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	        autoplayDisableOnInteraction: false,
	    }, 
    });
	</script>
	
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
	
	<!-- Template Main JS File -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/js/main.js"></script>
	
<%@ include file="common/footer.jsp" %>
</body>
</html>