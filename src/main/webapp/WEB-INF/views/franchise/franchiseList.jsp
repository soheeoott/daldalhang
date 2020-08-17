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
	<div class="btn_nlist" align="left">
		<c:if test="${logID=='DalDal'}">
			<input type="button" value="브랜드 등록" class="buttonStyle" onclick="location.href=''">
		</c:if>
	</div>
				
	<div id = "wrap">
		<div class="container">
			<div class="main">
				<div class="productList">
					<c:forEach var="list" items="${frlist}">
						<div class = "frlist">
							<div class = "frwrap">
								<a href = "franchiseSortList?frcode=${list.frcode}?frkname=${list.frkname}">
									<img src="${list.fruploadfile}" width="200" height="200">
									<p class = "pname">
										${list.frkname}
									</p>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div><hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>