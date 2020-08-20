<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="common/header.jsp" %>
<html>
<head>
<title>** DalDal **</title>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
 	
 	<style>
 	
 	.swiper-container {
      width: 800px;
      height:420px;
    }
    
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
    .first {
    	padding-top: 200px;
    }
    
    .sub {
    	padding-top: 100px;
    }
 	</style>
</head>
<body>
	<div class="swiper-container first">
	
	<h2>신제품</h2>
	
	    <ul class="swiper-wrapper">
        	<c:forEach var="newlist" items="${newlist}">
	        	<li class="swiper-slide plist">
	        		<div>
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
            	</li>
			</c:forEach>
	    </ul>
	    
	    <hr>
	    
	    <!-- Add Pagination -->
   		<div class="swiper-pagination"></div>
    
    	<!-- Add Arrows -->
    	<div class="swiper-button-prev"></div>
    	<div class="swiper-button-next"></div>
	    
	</div>  <!-- swiper-container -->
	
	<div class="swiper-container sub">
	    
	    <h2>추천제품</h2>
	    
	    <ul class="swiper-wrapper">
        	<c:forEach var="bestlist" items="${bestlist}">
	        	<li class="swiper-slide plist">
	        		<div>
	        			<p>
							<a href= "${bestlist.pdurl}" target="_blank">
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
		         </li>   	
	        </c:forEach>	
        </ul>
    	
    	<hr>
    	
    	<!-- Add Pagination -->
   		<div class="swiper-pagination"></div>
    
    	<!-- Add Arrows -->
    	<div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

    </div>
	
	<div class="swiper-container sub">
	    
	    <h2>시즌제품</h2>
	    
	    <ul class="swiper-wrapper">
	        <c:forEach var="seasonlist" items="${seasonlist}">
		        <li class="swiper-slide plist">
		        	<div>
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
		         </li>   	
			</c:forEach>
	    </ul>
		
		<hr>
		
		<!-- Add Pagination -->
   		<div class="swiper-pagination"></div>
    
    	<!-- Add Arrows -->
    	<div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    	
	</div>   <!-- swiper-container -->       
	
	<script src = "resources/js/swiper.min.js"></script>
	
	<script>
		 var swiper = new Swiper('.swiper-container', {
		      
			  speed: 500,
			  autoplay: true,
			  slidesPerView: 3,
		      /* spaceBetween: 500, */
		      slidesPerGroup: 1,
		      loop: true,
		      loopFillGroupWithBlank: true,
		      pagination: {
		        el: '.swiper-pagination',
		        clickable: true,
		      },
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		      },
		    });
	</script>
	
	<hr>
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
