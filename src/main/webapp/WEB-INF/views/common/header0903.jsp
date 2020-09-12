<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/js/home.js"></script>
	
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

	<meta name="viewport" content="width=device-width, initial-scale=1"> 

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="resources/modal/css/bootstrap.min.css">
	
	
	<style>
	.admin {
	    width: 150px;
	    text-align: center;
	    border: 1px solid lightgray;
	    padding: 8px;
	    border-radius: 3px;
	}
	</style>
</head>
<body>
	<!-- header -->
	<div id="header" align="center">
		<div id="header-css">
			<!-- 사이드 메뉴 -->
			<div id="personalBar" align="right">
			
			<c:choose>	
				<c:when test="${logID != null}">
					<p id="login_success">
						<a href="mypagef">${logID}</a> 님 환영합니다.&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="mypagef">마이페이지</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
					</p>
				</c:when>

				<c:when test="${slogID != null}">
					<p id="login_success">
						<a href="mypagef">${slogID}</a> 님 환영합니다.&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
					</p>
				</c:when>
			
				<c:when test="${logID == null}">
					<a href="loginf">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="joinf">회원가입</a>&nbsp;&nbsp;&nbsp;
				</c:when>
				
				<c:when test="${slogID == null}">
					<p id="login_success">
						<a href="loginf">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="joinf">회원가입</a>&nbsp;&nbsp;&nbsp;
					</p>
				</c:when>		
			</c:choose>
         
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
		 		
			</div>
			<!-- 메인 메뉴 -->
			<div id="menubar">
		
				<div class = "logo">
					<a href="home">
						<img src="resources/image/logo2.png" width="150" alt="Logo">
					</a>
				</div>
				<div class = "menu">
					<a href="frlist" class="main_menu">브랜드</a>
					
					<div class="dropdown">
						<a href="listPage" class="main_menu">메뉴</a>
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
						<a href="eventPage" class="main_menu">이벤트</a>
						<div class="menu_dropdown" align="center">
							<a href="eventPage">이벤트 달력</a>
							<a href="eventList">이벤트 모아보기</a>
						</div>
					</div>
					
					<a href="maplist" class="main_menu">매장찾기</a>
					<a href="nlist" class="main_menu">공지사항</a>
				</div>
			</div>
			
			<!-- 검색창 -->
			<div class="searchWrap">
				
				<form name="searchform" method="post" action="searchList" onsubmit="return check();">
						<div class="searchSelect">
					       <select name="searchOption" class="searchOption">
					            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
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
	</div>
	<!-- /header -->
	<hr>
</body>
</html>