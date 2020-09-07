<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<style>
	#more_btn {
    border: 1px solid lightgray;
    border-radius: 20px;
    padding: 10px 40px;
    position: relative;
    font-size: 20px;
	}
	
	.more {
    width: 100%;
    height: 100%;
    display: block;
    position: inherit;
    position: relative;
    margin-bottom: 15px;
	}
	
	.pagination {
		margin: 0 auto;
	}
	
	.page {
		align-content: center;
	}
	
	.npn_img {
		margin-bottom:-10px;
	}
	
	#paging_num {
		font-size:15px;
		margin-left: 2em;
	}
	
	#paging_numClick {
		font-size:15px;
		cursor:pointer;
		color:#F1BCD5;
		margin-left: 2em;
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
	width: 13%;
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

	.pagingWrap {
	margin: 30px;
	}

	.pname{
	font-size: 19px;
	}

	.prname{
	font-size: 17px;
	}
	
	/* 메뉴 */
	#topMenu {
    height: 30px;
    width: 850px;
    margin-bottom: 60px;
    margin-top: -30px;
	}
	
	#topMenu  ul li {
	background: rgb(51 38 2 / 70%);
    list-style: none;
    float: left;
    line-height: 45px;
    vertical-align: middle;
    text-align: center;
    }
    
    #topMenu  .menuLink {        
    color: white;   
	text-decoration: none;
    display: block;
    width: 150px;
    font-size: 15px;
    border-right: 1px solid #ffffff3d;
    border-bottom: 1px solid #ffffff3d;
    }
    
    #topMenu  .menuLink:hover {     
	background: white;      
	color: black;    
	transition:background .5s ease;
	-webkit-transition:background .5s ease;
	border: 0;
    }
    
    /* 서브 메뉴 */
	#SubMenu  {
    height: 30px;
    width: 850px;
    margin-bottom: 180px;
	}
	
	#SubMenu  ul li {
	background: rgb(179 153 83 / 70%);
    list-style: none;
    float: left;
    line-height: 45px;
    vertical-align: middle;
    text-align: center;
    }
    
    #SubMenu  .menuLink {           
	color: white;
	text-decoration: none;
    display: block;
    width: 150px;
    font-size: 15px;
    border-right: 1px solid #ffffff3d;
    border-bottom: 1px solid #ffffff3d;
    }
    
    #SubMenu  .menuLink:hover {
    background: white;           
    color: black;   
	transition:background .5s ease;
	-webkit-transition:background .5s ease;
	border: 0;
    }
    
    #hero-no-slider {
    width: 100%;
    height: 100%;
    overflow: hidden;
    position: relative;
    text-align: center;
	}
	
	#hero-no-slider::before {
    background: white;
	}
	
	#hero-no-slider p {
    color: black;
	}
	
	#productSlider {
	width: 100%;
    height: 100%;
    overflow: hidden;
    position: relative;
    text-align: center;
	}
	
	#hero-no-slider::before {
	  content: '';
	  position: absolute;
	  left: 0;
	  top: 0;
	  right: 0;
	  bottom: 0;
	}
	
	.services .description {
	}
	
	.row{display:-ms-flexbox;display:flex;-ms-flex-wrap:wrap;flex-wrap:wrap;}
	
	.plist {
	display: none;
    }
    
    .count {
    margin-bottom: 50px;
    }
	</style>
</head>
<body>
<main id="main">
	<section class="services">
		<div class="count" align="center">
		    <!-- 레코드의 갯수를 출력 -->
		    ${count}개의 
			<c:choose>
				<c:when test="${mubcode =='C'}">
					커피가
				</c:when>
				
				<c:when test="${mubcode =='DE'}">
					디저트가
				</c:when>
				
				<c:when test="${mubcode =='DR'}">
					음료가
				</c:when>
				
				<c:when test="${mubcode =='F'}">
					음식이
				</c:when>
				
				<c:when test="${mubcode =='S'}">
					스페셜이
				</c:when>
			</c:choose>					
		         있습니다.
	    </div>
	    
	    <div align="center">
	    	<nav id="topMenu" > <!-- topMenu -->
				<ul>
					<c:forEach var="list" items="${menulist}">
						<c:if test="${list.mucategory=='coffee'}">
							<li>
								<a class="menuLink" href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">커피</a>
							</li>
						</c:if>
						
						<c:if test="${list.mucategory=='dessert'}">
							<li>
								<a class="menuLink" href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">디저트</a>
							</li>
						</c:if>
						
						<c:if test="${list.mucategory=='drink'}">
							<li>
								<a class="menuLink" href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음료</a>
							</li>
						</c:if>
						
						<c:if test="${list.mucategory=='food'}">
							<li>
								<a class="menuLink" href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음식</a>
							</li>
						</c:if>
						
						<c:if test="${list.mucategory=='special'}">
							<li>
								<a class="menuLink" href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">스페셜</a>
							</li>
						</c:if>	
					</c:forEach>
				</ul>
			</nav>
			
			<!-- 서브메뉴 -->	
			<nav id="SubMenu" > <!-- topMenu -->
				<ul>
					<c:forEach var="cpdlist" items="${cpdlist}" end="4">
						<li>
							<a class="menuLink" href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
						</li>
					</c:forEach> 
				</ul>
				
				<ul>	
					<c:forEach var="cpdlist" items="${cpdlist}" begin="5" end="9">
						<li>
							<a class="menuLink" href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
						</li>
					</c:forEach>
				</ul>
				
				<ul>	
					<c:forEach var="cpdlist" items="${cpdlist}" begin="10">
						<li>
							<a class="menuLink" href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
						</li>
					</c:forEach>
				</ul>
			</nav>
	    </div>
	    
	    <div class="container">
	    	<div class="row">
	    		<c:forEach var="list" items="${ctlist}">
	    			<div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
       					<div class="icon-box icon-box-pink">
       						
       						<div class="icon">
								<a href ="${list.pdurl}" target="_blank">  <!-- class="pdurl" -->
									<img src="${list.pduploadfile}" width="200" height="200"> <!-- class="img" -->
								</a>
							</div>
							
							<form id="form" name="form" method="post" onsubmit="return false;">
								<div class="lbutton">
									<c:choose>
										<c:when test="${logID ne null}">
											<c:if test="${list.liked=='t'}" >
												<input type="image" src="resources/image/fullheart.png" class="limg" id="${list.pdseq}" onclick="like(${list.pdseq})">
											</c:if>
											<c:if test="${list.liked!='t'}">
												<input type="image" src="resources/image/emptyheart.png" class="limg" id="${list.pdseq}" onclick="like(${list.pdseq})">
											</c:if>
										</c:when>
										<c:otherwise>
											<a onclick="login()"><img src="resources/image/emptyheart.png" class="limg"></a>
										</c:otherwise>
									</c:choose>
								</div>
							</form>	
							
							<h4 class="title">
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
							</h4>
							
							<p class="description">
								${list.pdname}
							</p>
							
							<p class="description">
								${list.price} 원
							</p>
							
							<p class="description">
								<c:forEach var="hashtag" items="${fn:split(list.hashtag,'#')}">
				            		<a href="hashtagList?keyword=${hashtag}">
				            			<span class="hashtagsplit"> #${hashtag}</span>
				            		</a>
				            	</c:forEach>
							</p>
							
							<c:if test="${logID == 'DalDal'}">
								<div class="mdwrap">
									<a href="pdetail?pdseq=${list.pdseq}">
										<div class = "modify">수정</div>
									</a>

									<a onclick="remove(${list.pdseq})">
										<div class = "delete">삭제</div>
									</a>
								</div>
							</c:if>
       					</div>
       				</div>	
	    		</c:forEach>
	    	</div>
	    </div>
	    
	    <!--
		      이전 버튼이 클릭가능한 조건이면, a태그를 이용해 이전 버튼이 뜨도록 하고, href 로 링크를 걸되
		      아까 만든 makeQuery 메서드를 이용해서 쿼리문자열을 만들어 줍니다.
		      ?page=어쩌고&perPageNum=어쩌고 이 부분을 생성해서 넣게 되는데 단 이전 버튼을 클릭하면
		      현재 페이지가 시작페이지의 -1 이 되도록 되어야 함으로 그 부분만 신경써 주면 됩니다.
		-->
		   
		<div class="pagingWrap" align="center">
		
			<c:if test="${pageMaker.start}">
				<a href="categorylist${pageMaker.makeQuery(1)}&mubcode=${mubcode}&mucategory=${mucategory}" id="paging_num">
	          	&nbsp;
	          	처음
				</a>
			</c:if>
	  
			<c:if test="${pageMaker.prev}">
				<a href="categorylist${pageMaker.makeQuery(startPage-1)}&mubcode=${mubcode}&mucategory=${mucategory}">
          		&nbsp;
          		<img src="resources/image/prev.jpg" class="npn_img" id="paging_num">
				</a>
 			</c:if>
		
		  	<!--
		      [1][2][3]....[10] 이 부분을 삽입하는 부분이다. jstl 이용해for문을 돌면서 startPage ~ endPage까지
		      	표시해주되, a태그 눌렀을 때 이동하는 page 부분에 index 지정하는 부분을 유의
		   	-->
		
			<c:forEach var="index" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<c:choose>
					<c:when test="${pageMaker.page == index}">
						&nbsp;<span id="paging_numClick">${index}</span>&nbsp;
					</c:when>
					<c:otherwise>
					 	&nbsp;
					 	
					 	<%-- 
					 	<a href="categorylist${pageMaker.makeQuery(index)}" id="paging_num">${index}</a> 
					 	--%>
					 	
					 	<a href="categorylist${pageMaker.makeQuery(index)}&mubcode=${mubcode}&mucategory=${mucategory}" id="paging_num">${index}</a>
					 	&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
		  	<!--
	                  이전버튼과 마찬가지로 다음버튼을 끝 페이지보다1개 큰게 현재 페이지가 되도록 makeQuery에 page를 넣어줍시다.
	      	-->
		  	<c:if test="${pageMaker.next}">
		      <!--
		                  이전버튼과 마찬가지로 다음버튼을 끝 페이지보다1개 큰게 현재 페이지가 되도록 makeQuery에 page를 넣어줍시다.
		       -->
				<a href="categorylist${pageMaker.makeQuery(pageMaker.endPage+1)}&mubcode=${mubcode}&mucategory=${mucategory}">
		          	&nbsp;
		          	<img src="resources/image/next.jpg" class="npn_img" id="paging_num">
				</a>
			</c:if>

			<c:if test="${pageMaker.end}">
				<a href="categorylist${pageMaker.makeQuery(pageMaker.tempEndPage)}&mubcode=${mubcode}&mucategory=${mucategory}" id="paging_num">
					끝
				</a>
			</c:if>
		</div>
	    
	</section>
</main>	
		
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
</body>
<%@ include file="../common/footer.jsp" %>
</html>