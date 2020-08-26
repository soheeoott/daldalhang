<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <script src="resources/js/productListLike.js"></script> -->
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/productStyle.css">
<script>
function likeddd() {
	
		$.ajax({
			type: "Post",
			url: "likecheck",
			data:{
				/* id:$("#id").val(), */
				pdseq:$("#pdseq").val()
			},
			success:function(data){
				var like = '';
				
			console.log('pdseq =>'+pdseq);
			
				if(data.lCode=="LL"){
					alert("좋아요 성공");
					like="resources/image/fullheart.png";
				}
				$("#like").attr('src',like);
			}
		}); //ajax
	}
	
function like() {
	
	$.ajax({
		type: "Post",
		url: "like",
		data:{
			/* id:$("#id").val(), */
			pdseq:$("#pdseq").val()
		},
		success:function(data){
			
			var limg = '';
			
			if(data.lCode=="LL"){
				alert("좋아요 성공");
				limg="resources/image/fullheart.png";
			}else if (data.lCode=="LD"){
				alert("좋아요 취소");
				limg="resources/image/emptyheart.png";
			}
			
			$(".limg").attr('src',limg);
		}
	}); //ajax
}
		
function likedelete(){
	
	$.ajax({
		type: "Post",
		url: "likedelete",
		data:{
			id:$("#id").val(),
			pdseq:$("#pdseq").val()
		},
		success:function(data){
			var likedelete = '';
			
			if(data.lCode=="LD"){
				alert("좋아요 취소");
				likedelete="resources/image/emptyheart.png";
			}
			$("#likedelete").attr('src',likedelete);
		}
	});	
}

</script>	
</head>
<body>
<div id = "wrap">
	<div id="product_box" align="center">
		<div class="btn_nlist" align="right">
			<c:if test="${logID=='DalDal'}">
				<input type="button" value="상품 등록" class="buttonStyle" onclick="location.href='pdinsertf'">
			</c:if>
		</div>
		
		<!-- 2020.08.03 product menu name 출력 -->
		<div class="menu_css">
			<c:forEach var="list" items="${mulist}" end="5">
					<c:if test="${list.mucategory=='coffee'}"><a href="pdlist?mucategory=${list.mucategory}" value="coffee">커피</a></c:if>
					<c:if test="${list.mucategory=='dessert'}"><a href="pdlist?mucategory=${list.mucategory}" value="dessert">디저트</a></c:if>
					<c:if test="${list.mucategory=='drink'}"><a href="pdlist?mucategory=${list.mucategory}" value="drink">음료</a></c:if>
					<c:if test="${list.mucategory=='food'}"><a href="pdlist?mucategory=${list.mucategory}" value="food">음식</a></c:if>
					<c:if test="${list.mucategory=='special'}"><a href="pdlist?mucategory=${list.mucategory}" value="special">스페셜</a></c:if>		
			</c:forEach>
			<hr><br>
			<c:forEach var="cpdlist" items="${cpdlist}" end="5">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach>
			<br><br>
			<c:forEach var="cpdlist" items="${cpdlist}" begin="6">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach>		
		</div>
		<br><br><br>
		<div class="container">
			<div class="main">
			
				<div class="productList">
						<c:forEach var="list" items="${pdlist}">
						
						<div class = "plist">
							<p>
								<a href = "${list.pdurl}" target="_blank" class="pdurl">
									<img src="${list.pduploadfile}" width="200" height="200">
								</a>
								
								<form id="form" name="form" method="post" onsubmit="return false;">
								<input type="hidden" name="id" id="id" value="${logID}">
								<input type="hidden" name="pdseq" id="pdseq" value="${list.pdseq}">
								
								<div class="lbutton">
								<c:choose>
									<c:when test="${logID ne null}">
										<c:if test="${list.liked=='t'}" >
										<input type="image" src="resources/image/fullheart.png" class="limg" onclick="return like()">
										</c:if>
										<c:if test="${list.liked!='t'}">
										<input type="image" src="resources/image/emptyheart.png" class="limg" onclick="return like()">
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="loginf" ><img src="resources/image/emptyheart.png" class="limg"></a>
										<!-- <input type="image" src="resources/image/emptyheart.png" class="limg" onclick="location.href='loginForm.jsp'"  > -->
									</c:otherwise>
								</c:choose>
								</div>
								</form>
							 </p>
							
							<div class="namelist">
							<div class="fname">
							<c:if test="${list.frcode=='A01'}"><p>공차</p></c:if>
				            <c:if test="${list.frcode=='A02'}"><p>던킨도너츠</p></c:if>
				            <c:if test="${list.frcode=='A03'}"><p>뚜레쥬르</p></c:if>
				            <c:if test="${list.frcode=='A04'}"><p>메가커피</p></c:if>
				            <c:if test="${list.frcode=='A05'}"><p>빽다방</p></c:if>
				            <c:if test="${list.frcode=='A06'}"><p>스타벅스</p></c:if>
				            <c:if test="${list.frcode=='A07'}"><p>이디야</p></c:if>
				            <c:if test="${list.frcode=='A08'}"><p>쥬씨</p></c:if>
				            <c:if test="${list.frcode=='A09'}"><p>설빙</p></c:if>
				            <c:if test="${list.frcode=='A10'}"><p>투썸플레이스</p></c:if>
				            <c:if test="${list.frcode=='A11'}"><p>파리바게뜨</p></c:if>
				            <c:if test="${list.frcode=='A12'}"><p>파스쿠찌</p></c:if>
				            <c:if test="${list.frcode=='A13'}"><p>흑화당</p></c:if>
				            </div>
							<p class = "pname">${list.pdname}</p>
							<p class="prname">${list.price} 원</p>
							</div>
							
			            	<c:forEach var="hashtag" items="${fn:split(list.hashtag,'#')}">
			            		<a href="hashtagList?keyword=${hashtag}">
			            			<span class = "hashtagsplit">#${hashtag} </span>
			            		</a>
			            	</c:forEach>
						
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