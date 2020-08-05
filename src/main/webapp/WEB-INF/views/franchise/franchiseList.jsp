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
	<link rel="stylesheet" type="text/css" href="resources/css/franchiseStyle.css">
</head>
<body>
<div id="product_box" align="center">
	<div class="btn_nlist" align="right">
		<c:if test="${logID=='DalDal'}">
			<input type="button" value="브랜드 등록" class="buttonStyle" onclick="location.href=''">
		</c:if>
	</div>
				
	<div id = "wrap">
		<div class="container">
			<div class="main">
			
				<div class="productList">
						<c:forEach var="list" items="${frlist}">
						
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
						
						<div class = "frlist">
							<div class = "frwrap">
								<a href = "franchise/franchiseSortList?code=${list.frcode}">
									<img src="${list.fruploadfile}" width="200" height="200">
								</a>
								
								<p class = "pname">${list.frkname}</p>
							</div>
							
						</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
<%-- 
<c:if test="${message != null}">
 => ${message}
</c:if> 
--%>
</div><hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>