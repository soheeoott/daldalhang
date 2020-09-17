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
	<link rel="stylesheet" type="text/css" href="resources/css/franchiseStyle.css">
	
	<!-- Template CSS -->
	<link href="resources/assets/css/style.css" rel="stylesheet">
	<link href="resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
	
	<style type="text/css">
	.services .icon-box {
    width: 250px;
    height: 250px;
    padding: 30px;
    position: relative;
    overflow: hidden;
    margin: 0 0 40px 0;
    background: #fff;
    box-shadow: 0 5px 26px 0 rgba(68, 88, 144, 0.14);
    transition: all 0.3s ease-in-out;
    text-align: center;
    border: 1px solid #fff;
	}
	</style>
</head>
<body>
<main>
	<div class="services">
		<div id="wrap" align="center">
			<div id = "product_box" align="center">
				<div class="container">
					<div class="main">
						<div class="productList">
							<c:forEach var="list" items="${frlist}">
								<div class = "frlist">
									
									<div class = "frwrap">
										<div class="icon-box icon-box-pink">
											<a href = "franchiseMainList?frcode=${list.frcode}&frkname=${list.frkname}">
												<img src="${list.fruploadfile}" width="200" height="200">
												
												<p class="frkname">${list.frkname}</p> 
												
												<c:if test="${logID == 'DalDal'}">
													<div class="mdwrap">
														<a href="fdetail?frcode=${list.frcode}">
															<div class="modify">수정</div>
														</a>
														
														<a href="fdetail?frcode=${list.frcode}">
															<div class="delete">삭제</div>
														</a>
													</div>
												</c:if>
											</a>
										</div>
									</div>
									
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="../common/footer.jsp" %>
</body>
</html>