<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="common/header.jsp" %>
<html>
<head>
<title>** DalDal **</title>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
 	<link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
 	<link rel="stylesheet" type="text/css" href="resources/css/productStyle.css">
 	<link rel="stylesheet" type="text/css" href="resources/css/swiper.min.css">
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script> -->
	
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
	
	<style type="text/css">
	.third {
	position: relative;
    top: 50px;
	}

	.mdwrap {
    position: relative;
    top: 30px;
    display: -webkit-inline-box;
	}
	
	.limg{
	width: 7%;
	}
	</style>
</head>
<body>
<div class="wrap">
	
	<!-- 신제품 -->
	<div class="swiper-container" align="center">
	
	<div id="slidetit" style="font-size: 23px;">신제품</div>
	
	    <div class="swiper-wrapper">
	    	
        	<c:forEach var="newlist" items="${newlist}">
	        	<div class="swiper-slide">
	        	
	        		<div>
						<p>
							<a href = "${newlist.pdurl}" target="_blank">
								<img src="${newlist.pduploadfile}" width="200" height="200">
							</a>
							
							<input type="hidden" name="id" id="id" value="${logID}">
									
							<form id="form" name="form" method="post" onsubmit="return false;">
							<%-- <input type="hidden" name="pdseq" id="${list.pdseq}"> --%>
							
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
						</p>
						
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
	
								<%-- pdelete?pdseq=${list.pdseq}"> --%>
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
    	
	</div>  <!-- swiper-container -->
	
	
	<!-- 추천 -->
		<div class="swiper-container" align="center">
	
	<div id="slidetit" style="font-size: 23px;">추천제품</div>
	
	    <div class="swiper-wrapper">
	    	
        	<c:forEach var="bestlist" items="${bestlist}">
	        	<div class="swiper-slide">
	        	
	        		<div>
						<p>
							<a href = "${bestlist.pdurl}" target="_blank">
								<img src="${bestlist.pduploadfile}" width="200" height="200">
							</a>
							
							<input type="hidden" name="id" id="id" value="${logID}">
									
							<form id="form" name="form" method="post" onsubmit="return false;">
							<%-- <input type="hidden" name="pdseq" id="${list.pdseq}"> --%>
							
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
						</p>
						
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
								<a href="pdetail?pdseq=${bestlist.pdseq}">
									<div class = "modify">수정</div>
								</a>
	
								<%-- pdelete?pdseq=${list.pdseq}"> --%>
								<a href="#" onclick="remove(${bestlist.pdseq})">
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
    	
	</div>  <!-- swiper-container -->

	
	<!-- 시즌 -->
	<div class="third">
		<div class="swiper-container " align="center">
	
		<div id="slidetit" style="font-size: 23px;">시즌제품</div>
		
		    <div class="swiper-wrapper">
		    	
	        	<c:forEach var="seasonlist" items="${seasonlist}">
		        	<div class="swiper-slide">
		        	
		        		<div>
							<p>
								<a href = "${seasonlist.pdurl}" target="_blank">
									<img src="${seasonlist.pduploadfile}" width="200" height="200">
								</a>
								
								<input type="hidden" name="id" id="id" value="${logID}">
										
								<form id="form" name="form" method="post" onsubmit="return false;">
								<%-- <input type="hidden" name="pdseq" id="${list.pdseq}"> --%>
								
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
							</p>
							
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
									<a href="pdetail?pdseq=${seasonlist.pdseq}">
										<div class = "modify">수정</div>
									</a>
		
									<%-- pdelete?pdseq=${list.pdseq}"> --%>
									<a href="#" onclick="remove(${seasonlist.pdseq})">
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
	    	
		</div>  <!-- swiper-container -->
	</div>
	
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
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>