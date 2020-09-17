<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" media="screen and (max-width: 768px)" href="resources/css/smallStyle.css" />
	<link rel="stylesheet" media="screen and (max-width: 992px)" href="resources/css/middleStyle.css" />
	<link rel="stylesheet" media="screen and (max-width: 1200px)" href="resources/css/largeStyle.css" />

	<link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/js/home.js"></script>
	
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

	<meta name="viewport" content="width=device-width, initial-scale=1"> 

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	
	<!-- <link rel="stylesheet" type="text/css" href="resources/modal/css/bootstrap.min.css"> -->
	
	<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing:  border-box;
	}
	
	/* .admin {
	    width: 150px;
	    text-align: center;
	    border: 1px solid lightgray;
	    padding: 8px;
	    border-radius: 3px;
	} */
	
	/* 메인 메가 메뉴 */
	/* 
		부모 요소에 
		display: flex;
		justify-content: center;
		align-item: center; 
		를 적용하면 자식 요소가
		부모 요소의 정가운데 배치 
	*/
	
	#mainMenu {
		width: 100%;
		height: 56px;
		border-bottom: 1px solid rgba(0,0,0,0.1);
		display: flex;
		/* flex : 1차원 레이아웃 방식으로 요소를 가로 혹은 세로 한 줄로 배치할 때 유용. 원하는 요소를 가운데 정렬할 때도 유용 */
		flex-flow: column nowrap;
		align-items: center;
		justify-content: center;
	}
	
	/* 
		display: flex를 원하는 부모 요소에게 주고 (ul 요소에 적용)
		justify-content: space-evenly를 적용하면 
		자식인 메뉴 아이템들이 간격을 유지하고 예쁘게 배열 
	*/
	.listGnb {
		list-style: none;
		display: flex;
		flex-flow: row wrap;
		justify-content: space-evenly; 
		align-items: center;
		width: 70%;
		height: inherit;
	}
	
	.listGnb > li > a {
		font-weight: bold;
		color: #454569;
		text-decoration: none;
		text-align: center;
		display: block;
		padding: 4px 0;
	}
	
	.listGnb > li > a:hover {
	}
	
	#megaMenu {
		display: none;
		width: 100%;
	    height: 320px;
	    background: #182952;
	    position: absolute;
	    top: 92px;
	    left: 0;
	}
	
	.listLnb {
		margin: 0;
		padding: 0;
		list-style: none;
		float: left;
		width: 33.3333%;
		height: inherit;
	}
	
	.listLnb > li {
		padding: 26px 50px 0;
	}
	
	.listLnb > li > a {
		color: #bbb;
		text-decoration: none;
	}
	
	.listLnb > li:hover a,
	.listLnb > li:active a {
	}
	
	/* .listGnb > li:hover #megaMenu {
		display: block;
		opacity: 1;
	} */
	
	.listGnb:hover #megaMenu {
		display: block;
		opacity: 0.3;
	}
	
	.listGnb:active #megaMenu {
		display: block;
		opacity: 0.3;
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
			<nav id="mainMenu">
				<ul class="listGnb">
						<li><a href="#">로고</a></li>
						<li><a href="#">브랜드</a>
							<div id="megaMenu">
								<ul class="listLnb 01">
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
								
								<ul class="listLnb 02">
									<li><a href="eventCalPage">이벤트 달력</a></li>
									<li><a href="eventList">이벤트 모아보기</a></li>
								</ul>
							</div>
						</li>
						
						<li><a href="#">메뉴</a></li>
						
						<li><a href="#">이벤트</a> <!-- eventCalPage --></li>
						
						<li><a href="#">매장찾기</a></li>
						
						<li><a href="#">공지사항</a></li>
				</ul>
			</nav>
			
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