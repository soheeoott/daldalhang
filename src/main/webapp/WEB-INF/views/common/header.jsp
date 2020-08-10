<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
    <!-- , vo.NoticeVO, service.NServiceImpl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
<link rel="stylesheet" type="text/css" href="resources/css/noticeStyle.css">
<link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/home.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
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
						<a href="pdlist" class="main_menu">메뉴</a>
						<div class="menu_dropdown">
							<c:forEach var="list" items="${menulist}">
								<c:if test="${list.mucategory=='coffee'}"><a href="pdlist?mucategory=${list.mucategory}" value="coffee">커피</a></c:if>
								<c:if test="${list.mucategory=='dessert'}"><a href="pdlist?mucategory=${list.mucategory}" value="dessert">디저트</a></c:if>
								<c:if test="${list.mucategory=='drink'}"><a href="pdlist?mucategory=${list.mucategory}" value="drink">음료</a></c:if>
								<c:if test="${list.mucategory=='food'}"><a href="pdlist?mucategory=${list.mucategory}" value="food">음식</a></c:if>
								<c:if test="${list.mucategory=='special'}"><a href="pdlist?mucategory=${list.mucategory}" value="special">특별!</a></c:if>							
							</c:forEach>
						 </div>
					</div>
					<a href="#" class="main_menu">이벤트</a>
					<a href="maplist" class="main_menu">매장찾기</a>
					<a href="nlist" class="main_menu">공지사항</a>
				</div>
			</div>
			
			<!-- 검색창 -->
			<div class="searchWrap">
				<form name="searchform" method="post" action="searchList">
						<div class="searchSelect">
					        <select name="searchOption" class="searchOption">
					            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
					           <option value="hashtag" <c:out value="${map.searchOption == 'hashtag'?'selected':''}"/> >해시태그</option>
					           <option value="franchise" <c:out value="${map.searchOption == 'franchise'?'selected':''}"/> >브랜드</option>
					           <option value="pdname" <c:out value="${map.searchOption == 'pdname'?'selected':''}"/> >상품명</option>
					           <option value="muname" <c:out value="${map.searchOption == 'muname'?'selected':''}"/> >메뉴</option>
					       </select>
				       </div>
				       
				       <div class="search">
				       
				       		<input name="keyword" value="${map.keyword}" class="searchInput" placeholder="통합 검색">
				       		<%-- <c:choose>
				       			<c:when test="${map.searchOption == 'hashtag'?'selected':''}">
				       				<input name="keyword" value="${map.keyword}" class="searchInput" placeholder="해시태그 검색">
				       				<input name="keyword" value="${map.keyword}" class="searchInput" placeholder="통합 검색">
				       			</c:when>
				       			
				       			<c:when test="${map.searchOption == 'franchise'?'selected':''}">
				       				<input name="keyword" value="${map.keyword}" class="searchInput" placeholder="브랜드명 검색">
				       			</c:when>
				       			
				       			<c:when test="${map.searchOption == 'pdname'?'selected':''}">
				       				<input name="keyword" value="${map.keyword}" class="searchInput" placeholder="상품명 검색">
				       			</c:when>
				       			
				       			<c:when test="${map.searchOption == 'muname'?'selected':''}">
				       				<input name="keyword" value="${map.keyword}" class="searchInput" placeholder="메뉴 검색">
				       			</c:when>
				       		</c:choose> --%>
				       </div>
				       
				       <div class= "searchB">
				       		<button class="searchBtn">
				       			<img src="resources/image/search.png" width= "23" height = "23">
				      			<!-- <input type="submit" value="조회" class="searchBtn"> -->
				      		</button>
				       </div>
				</form>
    		</div>
		</div>
	</div>
	<!-- /header -->
	<hr>
</body>
</html>