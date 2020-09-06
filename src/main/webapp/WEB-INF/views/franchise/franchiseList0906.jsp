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
<main id="main">
	<div id = "product_box" align="center">
		<div class="container">
			<div class="main">
				<div class="productList">
					<c:forEach var="franchise" items="${franchiseList}">
						<div class = "frlist">
							<div class = "frwrap">
								<a href = "franchiseSortList?frcode=${franchise.frcode}&frkname=${franchise.frkname}">
									<img src="${franchise.fruploadfile}" width="200" height="200">
									<p class="frkname">${franchise.frkname}</p> 
										
									<c:if test="${logID == 'DalDal'}">
										<div class="mdwrap">
											<div class="modify">수정</div>
											<div class="delete">삭제</div>
										</div>
									</c:if>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="../common/footer.jsp" %>
</body>
</html>