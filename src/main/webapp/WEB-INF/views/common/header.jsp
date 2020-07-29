<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, vo.NoticeVO, service.NServiceImpl"%>
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
	<div id = "header">
		<!-- 사이드 메뉴 -->
		<div id="personalBar" align="right">
			<c:if test="${logID == null}">
				<a href="loginf">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="joinf">회원가입</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${logID != null}">
					<a href="mypagef" id="id_hover">${logID}</a> 님 환영합니다.&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="mypagef">마이페이지</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</c:if>
		</div>
		<!-- 메인 메뉴 -->
		<div align="center" id="menubar">
			<div class = "logo">
				<a href="home">
					<img src="resources/image/logo2.png" width="150" alt="Logo">
				</a>
			</div>
			<div class = "menu">
				<a href="#" class="main_menu">브랜드</a>
				<a href="pdlist" class="main_menu">메뉴</a>
				<a href="#" class="main_menu">이벤트</a>
				<a href="maplist" class="main_menu">매장찾기</a>
				<a href="nlist" class="main_menu">공지사항</a>
			</div>
		</div>
		<!-- 검색창 -->
		<hr hidden>
		<div align="center"><input type="text" placeholder="통합 검색">아이콘</div>
	</div>
	<!-- /header -->
	<hr>
</body>
</html>