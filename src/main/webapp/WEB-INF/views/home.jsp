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
 	<link rel="stylesheet" type="text/css" href="resources/css/swiper.min.css">
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script> -->
	
	<script src="resources/js/productDelete.js"></script>
	<script src="resources/js/productLike.js"></script>
	
	<style type="text/css">
	
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
	
	.swiper-wrapper p {
	margin: 8px 0px 8px 0px;
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
   	font-size: 14px;
	}
	
	.lbutton{
	position: relative;
   	left: 70px;
	}
	
	.limg{
	/* width: 10%; */
	width: 7%;
	}
	
	.pdurl{
	position: relative;
	}
	
	.namelist{
	position: relative;
   	top: 5px;
	}

	.fname{
	position: relative;
   	top: -10px;
	font-size: 15px;
	}

	.pname{
	font-size: 19px;
	}

	.prname{
	font-size: 17px;
	}
	
	/* footer */
	#footer {
		display: inline-table;
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
	    background-color: #262626;
	} 
	
	.footer_menu {
	    width: 100%;
	    color: white;
	    font-weight: bold;
	}
	</style>
</head>
<body>
<div class = "homeWrap">
	<div class="swiper-container" align="center">
	
	<div id="slidetit" style="font-size: 23px;">신제품</div>
	
	    <div class="swiper-wrapper first">
	    	
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
											<a href="loginf" ><img src="resources/image/emptyheart.png" class="limg"></a>
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
		            			<span class = "hashtagsplit" style="color: gray;"># ${hashtag}</span>
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
	<!-- 신제품 -->
	
	<div class="swiper-container sub" align="center">
	
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
											<a href="loginf" ><img src="resources/image/emptyheart.png" class="limg"></a>
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
		            			<span class = "hashtagsplit" style="color: gray;"># ${hashtag}</span>
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
	<!-- 추천 -->
	
	<div class="swiper-container third" align="center">
	
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
											<a href="loginf" ><img src="resources/image/emptyheart.png" class="limg"></a>
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
		            			<span class = "hashtagsplit" style="color: gray;"># ${hashtag}</span>
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
</div>	
<%@ include file="common/footer.jsp" %>
</body>
</html>

<!-- <script>
$(function(){
	var swiper = new Swiper('.swiper-container', {
	      
	  effect: 'fade',
	  speed: 500,
	  crossEffect: { crossFade: true },
	  autoplay: true,
	  slidesPerView: 1,
      spaceBetween: 500,
      slidesPerGroup: 1,
      loop: true,
      loopFillGroupWithBlank: true,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      pagination: {
    	  el: '.swiper-container .swiper-pagination',
             clickable: true,
	  },
	  on: {
              init: function(){
                  //console.log("slide init");
                  //console.log(this.$wrapperEl[0]);
                  var slide = $(this.$wrapperEl[0]).find(".swiper-slide-active");
                  var bg = slide.data("left");
                  if(bg=="1") {
                      $("header").addClass("bg-white");
                  } else {
                      $("header").removeClass("bg-white");
                  }
              },
          },
	 });
	
	swiper.on('slideChange', function(){
           //console.log("slide change");
           //console.log(swiper.realIndex);
           var r_idx = swiper.activeIndex;
           var slide = swiper.slides[r_idx];
           //console.log(swiper.$wrapperEl);
           //console.log($(slide));
           var bg = $(slide).data("left");
           //console.log("r_idx=" + r_idx + ", bg=" + bg + ", src=" + $(slide).css("background"));
           if(bg=="1") {
               $("header").addClass("bg-white");
           } else {
               $("header").removeClass("bg-white");
           }
       });
});
</script> -->
