<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="./common/header.jsp" %>
<html lang="ko">
<head>
<title>** DalDal **</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	<meta content="" name="descriptison">
  	<meta content="" name="keywords">
  	
 	<!-- Vendor CSS Files -->
	<link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
	<link href="resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">

  	<!-- Template Main CSS File -->
	<link href="resources/assets/css/style.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
	
	<!--   
 	<link rel="stylesheet" type="text/css" href="resources/css/swiper.min.css">
 	-->
	
	<!-- 좋아요 -->
	<script type="text/javascript" src="resources/js/likeFunc.js"></script>
	
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
	
	<link rel="stylesheet" type="text/css" href="resources/css/swiper.min.css">
	
</head>

<body>
<!-- ======= Hero No Slider Section ======= -->
<section id="hero-no-slider" class="d-flex justify-cntent-center align-items-center" style="margin-top: 180px;">
	<div class="container position-relative" data-aos="fade-up" data-aos-delay="100" style="top: 30px;">
		<div class="row justify-content-center">
			<div class="col-xl-8">
				<h2>홈페이지 설명</h2>
				<p>디저트 통합 홈페이지로 로그인하여 나만의 찜 목록을 만들어 좋아하는 상품을 모아볼 수 있습니다.</p>
				<a href="loginf" class="btn-get-started ">로그인</a>
			</div>
		</div>
	</div>
</section><!-- End Hero No Slider Sectio -->

<!-- 신제품  -->
<section id="swiperSlider" class="swiperwrap d-flex justify-cntent-center align-items-center">
	<div class="swiper-container" align="center">
	
	<div id="slidetit">신제품</div>
		
		<div class="swiper-wrapper">
			<c:forEach var="newlist" items="${newlist}">
				<div class="swiper-slide">
					<div>
						<a href = "${newlist.pdurl}" target="_blank">
							<img src="${newlist.pduploadfile}" width="200" height="200">
						</a>
						
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
						
						<div class="namelist">
							<div class="fname">
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
							</div>
							
							<p class="pname">${newlist.pdname}</p>
							<p class="prname">${newlist.price} 원</p>
						</div>
						
						<c:forEach var="hashtag" items="${fn:split(newlist.hashtag,'#')}">
		            		<a href="hashtagList?keyword=${hashtag}">
		            			<span class="hashtagsplit"> #${hashtag}</span>
		            		</a>
	            		</c:forEach>
						
						<br>
						
						<c:if test="${logID == 'DalDal'}">
							<div class="mdwrap">
								<a href="pdetail?pdseq=${newlist.pdseq}">
									<div class = "modify">수정</div>
								</a>
	
								<a href="#" onclick="remove(${newlist.pdseq})">
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
		
	</div> <!-- swiper-container -->
</section><!-- End Hero No Slider Sectio -->

<!-- 추천제품  -->
<section id="swiperSlider" class="swiperwrap d-flex justify-cntent-center align-items-center">
	<div class="swiper-container" align="center">
	
	<div id="slidetit">추천제품</div>
		
		<div class="swiper-wrapper">
			<c:forEach var="bestlist" items="${bestlist}">
				<div class="swiper-slide">
					<div>
						<a href = "${bestlist.pdurl}" target="_blank">
							<img src="${bestlist.pduploadfile}" width="200" height="200">
						</a>
						
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
						
						<div class="namelist">
							<div class="fname">
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
							</div>
							
							<p class="pname">${bestlist.pdname}</p>
							<p class="prname">${bestlist.price} 원</p>
						</div>
						
						<c:forEach var="hashtag" items="${fn:split(bestlist.hashtag,'#')}">
		            		<a href="hashtagList?keyword=${hashtag}">
		            			<span class="hashtagsplit"> #${hashtag}</span>
		            		</a>
	            		</c:forEach>
						
						<br>
						
						<c:if test="${logID == 'DalDal'}">
							<div class="mdwrap">
								<a href="pdetail?pdseq=${newlist.pdseq}">
									<div class = "modify">수정</div>
								</a>
	
								<a href="#" onclick="remove(${newlist.pdseq})">
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
		
	</div> <!-- swiper-container -->
</section><!-- End Hero No Slider Sectio -->

<!-- 시즌제품  -->
<section id="swiperSlider" class="swiperwrap d-flex justify-cntent-center align-items-center">
	<div class="swiper-container" align="center">
	
	<div id="slidetit">시즌제품</div>
		
		<div class="swiper-wrapper">
			<c:forEach var="seasonlist" items="${seasonlist}">
				<div class="swiper-slide">
					<div>
						<a href = "${seasonlist.pdurl}" target="_blank">
							<img src="${seasonlist.pduploadfile}" width="200" height="200">
						</a>
						
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
						
						<div class="namelist">
							<div class="fname">
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
							</div>
							
							<p class="pname">${seasonlist.pdname}</p>
							<p class="prname">${seasonlist.price} 원</p>
						</div>
						
						<c:forEach var="hashtag" items="${fn:split(seasonlist.hashtag,'#')}">
		            		<a href="hashtagList?keyword=${hashtag}">
		            			<span class="hashtagsplit"> #${hashtag}</span>
		            		</a>
	            		</c:forEach>
						
						<br>
						
						<c:if test="${logID == 'DalDal'}">
							<div class="mdwrap">
								<a href="pdetail?pdseq=${newlist.pdseq}">
									<div class = "modify">수정</div>
								</a>
	
								<a href="#" onclick="remove(${newlist.pdseq})">
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
		
	</div> <!-- swiper-container -->
</section><!-- End Hero No Slider Sectio -->

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
      freeMode: true,
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

<!-- <main id="main">
	<section class="services">
		<div class="container">
        	
        	<div class="row">
				<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up">
            		<div class="icon-box icon-box-pink">
						<div class="icon"><i class="bx bxl-dribbble"></i></div>
						<h4 class="title"><a href="">Lorem Ipsum</a></h4>
						<p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
           			</div>
         		</div>

          		<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            		<div class="icon-box icon-box-cyan">
						<div class="icon"><i class="bx bx-file"></i></div>
						<h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
						<p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
            		</div>
          		</div>

				<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
					<div class="icon-box icon-box-green">
						<div class="icon"><i class="bx bx-tachometer"></i></div>
						<h4 class="title"><a href="">Magni Dolores</a></h4>
						<p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
					</div>
				</div>

				<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
					<div class="icon-box icon-box-blue">
						<div class="icon"><i class="bx bx-world"></i></div>
						<h4 class="title"><a href="">Nemo Enim</a></h4>
						<p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
					<div class="icon-box icon-box-blue">
						<div class="icon"><i class="bx bx-world"></i></div>
						<h4 class="title"><a href="">Nemo Enim</a></h4>
						<p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
					<div class="icon-box icon-box-blue">
						<div class="icon"><i class="bx bx-world"></i></div>
						<h4 class="title"><a href="">Nemo Enim</a></h4>
						<p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
					<div class="icon-box icon-box-blue">
						<div class="icon"><i class="bx bx-world"></i></div>
						<h4 class="title"><a href="">Nemo Enim</a></h4>
						<p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
					<div class="icon-box icon-box-blue">
						<div class="icon"><i class="bx bx-world"></i></div>
						<h4 class="title"><a href="">Nemo Enim</a></h4>
						<p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
					</div>
				</div>
        	</div>
        	
		</div>
    </section>

    <section class="why-us section-bg" data-aos="fade-up" date-aos-delay="200">
		<div class="container">

			<div class="row">
				<div class="col-lg-6 video-box">
					<img src="assets/img/why-us.jpg" class="img-fluid" alt="">
					<a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="venobox play-btn mb-4" data-vbtype="video" data-autoplay="true"></a>
				</div>

	          	<div class="col-lg-6 d-flex flex-column justify-content-center p-5">
		            <div class="icon-box">
						<div class="icon"><i class="bx bx-fingerprint"></i></div>
						<h4 class="title"><a href="">Lorem Ipsum</a></h4>
						<p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
		            </div>
		
		            <div class="icon-box">
						<div class="icon"><i class="bx bx-gift"></i></div>
						<h4 class="title"><a href="">Nemo Enim</a></h4>
						<p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
		            </div>
	          	</div>
			</div>

		</div>
    </section>

    <section class="features">
		<div class="container">

			<div class="section-title">
				<h2>Features</h2>
				<p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
			</div>

			<div class="row" data-aos="fade-up">
				<div class="col-md-5">
					<img src="assets/img/features-1.svg" class="img-fluid" alt="">
				</div>
			  
				<div class="col-md-7 pt-4">
					<h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
					<p class="font-italic">
					  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
					  magna aliqua.
					</p>
					<ul>
					  <li><i class="icofont-check"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
					  <li><i class="icofont-check"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
					</ul>
				</div>
			</div>

			<div class="row" data-aos="fade-up">
				<div class="col-md-5 order-1 order-md-2">
					<img src="assets/img/features-2.svg" class="img-fluid" alt="">
				</div>
			  
				<div class="col-md-7 pt-5 order-2 order-md-1">
					<h3>Corporis temporibus maiores provident</h3>
					<p class="font-italic">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
						magna aliqua.
					</p>
					<p>
						Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
						velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
						culpa qui officia deserunt mollit anim id est laborum
					</p>
				</div>
			</div>

			<div class="row" data-aos="fade-up">
				<div class="col-md-5">
					<img src="assets/img/features-3.svg" class="img-fluid" alt="">
				</div>
			  
				<div class="col-md-7 pt-5">
					<h3>Sunt consequatur ad ut est nulla consectetur reiciendis animi voluptas</h3>
					<p>Cupiditate placeat cupiditate placeat est ipsam culpa. Delectus quia minima quod. Sunt saepe odit aut quia voluptatem hic voluptas dolor doloremque.</p>
						<ul>
							<li><i class="icofont-check"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
							<li><i class="icofont-check"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
							<li><i class="icofont-check"></i> Facilis ut et voluptatem aperiam. Autem soluta ad fugiat.</li>
						</ul>
				</div>
			</div>

			<div class="row" data-aos="fade-up">
				<div class="col-md-5 order-1 order-md-2">
					<img src="assets/img/features-4.svg" class="img-fluid" alt="">
				</div>
			  
				<div class="col-md-7 pt-5 order-2 order-md-1">
					<h3>Quas et necessitatibus eaque impedit ipsum animi consequatur incidunt in</h3>
					<p class="font-italic">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
						magna aliqua.
					</p>
					<p>
						Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
						velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
						culpa qui officia deserunt mollit anim id est laborum
					</p>
				</div>
			</div>

		</div>
    </section>
</main> -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
	
	<!-- Vendor JS Files -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="resources/assets/vendor/venobox/venobox.min.js"></script>
	<script src="resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="resources/assets/vendor/counterup/counterup.min.js"></script>
	<script src="resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/assets/vendor/aos/aos.js"></script>
	
	<!-- Template Main JS File -->
	<script src="resources/assets/js/main.js"></script>
	
<%@ include file="./common/footer.jsp" %>	
</body>
</html>