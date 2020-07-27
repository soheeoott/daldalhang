<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/productStyle.css">
</head>
<body>
	
	<div class="btn_nlist" align="right">
		<c:if test="${logID=='DalDal'}">
			<input type="button" value="상품 등록" class="buttonStyle" onclick="location.href='pdinsertf'">
		</c:if>
	</div>
				
	<fieldset>
	<div id = "wrap">
		<div class="container">
			<div class="main">
			
				<div class="productList">
						<c:forEach var="list" items="${pdlist}">
						
						<%-- <c:if test = "${list.bcode == 1}">
							<hr>
								<div>
									음료
								</div>
							<hr>
						</c:if>
						
						<c:if test = "${list.bcode == 2}">
							<hr>
								<div>
									빙수
								</div>
							<hr>
						</c:if>
						
						<c:if test = "${list.bcode == 3}">
							<hr>
								<div>
									디저트
								</div>
							<hr>
						</c:if>
						
						<c:if test = "${list.bcode == 4}">
							<hr>
								<div>
									상품
								</div>
							<hr>
						</c:if> --%>
						
						<div class = "plist">
							<p>
								<a href = "${list.pdurl}">
								<img src="${list.pduploadfile}" width="200" height="200">
								</a>
							</p>
							<p class = "pname">${list.pdname}</p>
							<p>${list.price} 원</p>
							<div class = "hashtag">${list.hashtag}</div>
						</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</fieldset>
<%-- 
<c:if test="${message != null}">
 => ${message}
</c:if> 
--%>
<%@ include file="../common/footer.jsp" %>
</body>
</html>