<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>** DalDal **</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	<meta content="" name="descriptison">
  	<meta content="" name="keywords">
  	
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	
	<!-- Favicons -->
	<link href="resources/assets/img/favicon.png" rel="icon">
	<link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	<!-- Vendor CSS Files -->
	<link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- <link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet"> -->
	<link href="resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
	<link href="resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">

  	<!-- Template Main CSS File -->
	<link href="resources/assets/css/style.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
	
	<!-- <link rel="stylesheet" type="text/css" href="resources/modal/css/bootstrap.min.css"> -->
	<style type="text/css">
	#info {
	height: 45px;
    transition: all 0.5s;
    z-index: 997;
    transition: all 0.5s;
    padding: 20px 0;
    background: blue;
	}
	
	.nav-info {
	position: relative;
    top: -20px;
	}
	
	#header {
    position: fixed;
    height: 180px;
    z-index: 997;
    transition: all 0.5s;
    padding: 20px 0;
    background: #8b5700;
    top: 45px;
	}
	</style>
</head>
<body>
	<!-- header -->
	<header id="info" class="fixed-top header-transparent">
		<div class="container">
	
			<nav class="nav-info nav-menu float-right d-none d-lg-block">
				<ul>
					<c:choose>	
						<c:when test="${logID != null}">
							<li>
								<a href="mypagef">${logID}</a> 님 환영합니다.&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							</li>
							
							<li>
								<a href="mypagef">마이페이지</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							</li>
							
							<li>
								<a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
							</li>
						</c:when>
		
						<c:when test="${slogID != null}">
							<li>
								<a href="mypagef">${slogID}</a> 님 환영합니다.&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							</li>
							
							<li>
								<a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
							</li>
						</c:when>
					
						<c:when test="${logID == null}">
							<li>
								<a href="loginf">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							</li>
							
							<li>
								<a href="joinf">회원가입</a>&nbsp;&nbsp;&nbsp;
							</li>
						</c:when>
						
						<c:when test="${slogID == null}">
							<li>
								<a href="loginf">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							</li>
							
							<li>
								<a href="joinf">회원가입</a>&nbsp;&nbsp;&nbsp;
							</li>
						</c:when>		
					</c:choose>


					<c:if test="${logID=='DalDal'}">
			         	<li class="drop-down"><a href="#">관리자 페이지</a>
						    <ul>
						    	<li>
						    		<a href="pdinsertf">상품 등록</a>
						    	</li>
						    	
						    	<li>
						    		<a href="franchiseinsertf">브랜드 등록</a>
						    	</li>
				                
				                <li>
				                	<a href="eventinsertf">이벤트 등록</a>
				                </li>
						    </ul>
						</li>
					</c:if>	
				</ul>	
			</nav><!-- .nav-menu -->
		</div>	
	</header><!-- End Header -->
	
	<header id="header" class="fixed-top header-transparent">
		<div class="container">
	
			<div class="logo float-left">
	      		<h1 class="text-light"><a href="home"><span>달달행</span></a></h1>
	     		<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>
	
			<nav class="nav-menu float-right d-none d-lg-block">
				<ul>
					<li><a href="franchiseList">브랜드</a></li>
					
					<li class="drop-down"><a href="listPage">메뉴</a>
						<ul>
							<c:forEach var="list" items="${menulist}">
								<c:if test="${list.mucategory=='coffee'}">
									<li><a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">커피</a></li>
								</c:if>
								
								<c:if test="${list.mucategory=='dessert'}">
									<li><a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">디저트</a></li>
								</c:if>
								
								<c:if test="${list.mucategory=='drink'}">
									<li><a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음료</a></li>
								</c:if>
								
								<c:if test="${list.mucategory=='food'}">
									<li><a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음식</a></li>
								</c:if>
								
								<c:if test="${list.mucategory=='special'}">
									<li><a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}">스페셜</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
					
					<li><a href="maplist">매장찾기</a></li>
					
					<li class="drop-down"><a href="eventCalPage">이벤트</a>
					    <ul>
							<li><a href="eventCalPage">이벤트 달력</a></li>
							<li><a href="eventList">이벤트 모아보기</a></li>
							<!-- 서브_드롭다운 메뉴
							<li class="drop-down"><a href="#">Drop Down 2</a>
						        <ul>
									<li><a href="#">Deep Drop Down 1</a></li>
									<li><a href="#">Deep Drop Down 2</a></li>
									<li><a href="#">Deep Drop Down 3</a></li>
									<li><a href="#">Deep Drop Down 4</a></li>
									<li><a href="#">Deep Drop Down 5</a></li>
						        </ul> 
					      	</li>
							<li><a href="#">Drop Down 3</a></li>
							<li><a href="#">Drop Down 4</a></li>
							<li><a href="#">Drop Down 5</a></li>
							-->
					    </ul>
					</li>
					
					<li><a href="nlist">공지사항</a></li>
				</ul>
			</nav><!-- .nav-menu -->
			
			<!-- 검색창 -->
			<div class="row">
				<div class="col-lg-6">
					<form action="" method="post">
						<input type="email" name="email">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
		</div>
	</header><!-- End Header -->
	
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
</html>