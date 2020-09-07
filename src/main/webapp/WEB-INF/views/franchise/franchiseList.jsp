<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<style>
	.productList p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-size: 18px;
	}
	
	.productList .frkname {
	padding: 25px;
	}
	
	.frlist {
	float: left;
    width: 33%;
    height: 380px;
    padding: 0 20px;
    box-sizing: border-box;
    text-align: center;
    margin-top: 50px;
	}
	
	#hero-no-slider {
	height: 100%;
	}
	
	.swiperwrap {
    height: 100%;
	}
	</style>
</head>
<body>
<section id="swiperSlider" class="d-flex justify-cntent-center align-items-center" style="margin-top: 180px;">
	<div class="container">
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
</section>

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

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
<%@ include file="../common/footer.jsp" %>
</html>