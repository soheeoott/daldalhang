<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
	
	<!-- 모바일 화면을 위해 Viewport 사용 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 공통 css  -->
	<link rel="stylesheet" type="text/css" href="resources/css/commonStyle.css">
	
	<!-- 헤더 css -->
	<link rel="stylesheet" type="text/css" href="resources/css/headerStyle.css">
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	
	<!-- fade (in/out) -->
	<script> 
	$(document).ready(function(){
		$('.dropdown').hover(function(){
		        if(!$(this).hasClass('open')) { // Keeps it open when hover it again
		            $('.dropdown-toggle', this).trigger('click');
		        }
		});  
	});
	
	var scrollUpDelay = 1;
	var scrollUpSpeed = 30;
	
	function scrollUp()
	{
		if(document.body.scrollTop<1)
		{
			return;
		}
		document.body.scrollTop=document.body.scrollTop-scrollUpSpeed;
		setTimeout('scrollUp()',scrollUpDelay);
	}

	jQuery(document).ready(function() {
		jQuery(window).scroll(function() {
			if(jQuery(document).scrollTop() > 100) {
				jQuery('#headerBg2').fadeIn();
			} else {
				jQuery('#headerBg2').fadeOut();
			};
		});
	});
	
	function scrollUp2()
	{
		if(document.body.scrollTop<1)
		{
			return;
		}
		document.body.scrollTop=document.body.scrollTop-scrollUpSpeed;
		setTimeout('scrollUp()',scrollUpDelay);
	}

	jQuery(document).ready(function() {
		jQuery(window).scroll(function() {
			if(jQuery(document).scrollTop() > 100) {
				jQuery('#searchform').fadeIn();
			} else {
				jQuery('#searchform').fadeOut();
			};
		});
	});
	</script>
		
</head>
<body>
	<!-- header -->
	<header id="header" align="center">
		<div id="header-css">
			
			<div id="headerBg"></div>	<!-- fade (in/out) --> 
			<div id="headerBg2" onclick="scrollUp();"></div>
			
			<!-- 상단 -->
			<div id="personalBar" align="right">
			
				<div id="personalBlock">
					<c:choose>	
						<c:when test="${logID != null}">
							<div id="login_success">
								<a href="mypagef" class="personal_menu">${logID} 님 환영합니다.</a>&nbsp;&nbsp;&nbsp;<p id="psmenu_login">│</p>&nbsp;&nbsp;&nbsp;
								<a href="mypagef" class="personal_menu">마이페이지</a>&nbsp;&nbsp;&nbsp;<p id="psmenu">│</p>&nbsp;&nbsp;&nbsp;
								<a href="logout" class="personal_menu">로그아웃</a>
							</div>
						</c:when>
		
						<c:when test="${slogID != null}">
							<div id="login_success">
								<a href="mypagef" class="personal_menu">${slogID} 님 환영합니다.</a>&nbsp;&nbsp;&nbsp;<p id="psmenu_login">│</p>&nbsp;&nbsp;&nbsp;
								<a href="logout" class="personal_menu">로그아웃</a>
							</div>
						</c:when>
					
						<c:when test="${logID == null}">
							<div id="login_before">
								<a href="loginf" class="personal_menu">로그인</a>&nbsp;&nbsp;&nbsp;<p id="psmenu">│</p>&nbsp;&nbsp;&nbsp;
								<a href="joinf" class="personal_menu">회원가입</a>
							</div>
						</c:when>
						
						<c:when test="${slogID == null}">
							<div id="login_before">
								<a href="loginf" class="personal_menu">로그인</a>&nbsp;&nbsp;&nbsp;<p id="psmenu">│</p>&nbsp;&nbsp;&nbsp;
								<a href="joinf" class="personal_menu">회원가입</a>
							</div>
						</c:when>		
					</c:choose>
				</div>
			
				<!-- 관리자 -->
		         <c:if test="${logID=='DalDal'}">
		         	<div class="Admin_dropdown">
			            <a class="btn btn-default dropdown toggle admin" data-toggle="dropdown" href="#">관리자 페이지</a>
			            <div class="Admin_menu_dropdown" role="menu">
			                <a href="pdinsertf">상품 등록</a>
			                <a href="franchiseinsertf">브랜드 등록</a>
			                <a href="eventinsertf">이벤트 등록</a>
			            </div>
		        	</div>
				 </c:if>
			</div> <!-- #personalBar -->
			
			<!-- 메인 메뉴 -->
			<div id="menubar">
				<a class="logo" href="home">달달행(行)</a>
				
					<div class = "menu">
						<a href="franchiseList" class="main_menu">FRANCHISE</a>
						
						<div class="dropdown">
							<a href="listPage" class="main_menu">MENU</a>
							
							<div class="menu_dropdown">
								<c:forEach var="list" items="${menulist}">
									<c:if test="${list.mucategory=='coffee'}">
										<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">커피</a>
									</c:if>
									
									<c:if test="${list.mucategory=='dessert'}">
										<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">디저트</a>
									</c:if>
									
									<c:if test="${list.mucategory=='drink'}">
										<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음료</a>
									</c:if>
									
									<c:if test="${list.mucategory=='food'}">
										<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음식</a>
									</c:if>
									
									<c:if test="${list.mucategory=='special'}">
										<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">스페셜</a>
									</c:if>					
								</c:forEach>
							 </div>
						</div>
						
						<div class="dropdown">
							<a href="eventCalPage" class="main_menu">EVENT</a>
							<div class="menu_dropdown" align="center">
								<a href="eventCalPage">이벤트 달력</a>
								<a href="eventList">이벤트 모아보기</a>
							</div>
						</div>
						
						<a href="maplist" class="main_menu">STORE</a>
						<a href="nlist" class="main_menu">NOTICE</a>
					</div>
			</div> <!-- #menubar -->
			
			<!-- 검색창 -->
			<div class="searchWrap">
				
				<form name="searchform" id="searchform" method="post" action="searchList" onsubmit="return check();" onclick="scrollUp2()">
					<div class="searchSelect">
				        <select name="searchOption" class="searchOption">
					            <!-- 검색조건을 검색 처리후 결과화면에 보여주기 위해 c:out 출력태그 사용, 삼항연산자 -->
				           		<option value="hashtag" <c:out value="${map.searchOption == 'hashtag'?'selected':''}"/> >&nbsp;&nbsp;해시태그</option>
				           		<option value="franchise" <c:out value="${map.searchOption == 'franchise'?'selected':''}"/> >&nbsp;&nbsp;&nbsp;브랜드</option>
								<option value="pdname" <c:out value="${map.searchOption == 'pdname'?'selected':''}"/> >&nbsp;&nbsp;&nbsp;상품명</option>
			        	</select>
			       </div>
				       
			       <div class="search">
			       		<input name="keyword" value="${map.keyword}" id="searchInput" class="searchInput" placeholder="검색어를 입력해주세요." value="searchInputCheck">
			       </div>
				       
			       <div class= "searchB">
			       		<button class="searchBtn" id="searchBtn">
			       			<img src="resources/image/search.png" width= "23" height = "23">
			      		</button>
			       </div>
				</form>
								
				<script>
				$(function(){
			        $('form[name="searchform"]').on('submit', function(e){
			            var keyword = $('input[name="keyword"]', this).val();
			
			            if ( keyword.split(' ').join('')  == '' || keyword.split(' ').join('').length < 1) {
			                alert('검색어를 입력해주세요!');
			                e.preventDefault();
			                return false;
			            }
			        });
    			});
				</script>
    		</div>
		</div>
	</header>
	<!-- /header -->
</body>
</html>