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
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/productStyle.css">
	
	<style>
		.pagination {
			margin: 0 auto;
		}
		
		.page {
			align-content: center;
		}
		
		.npn_img {
			margin-bottom:-8px;
		}
		
		#paging_num {
		    font-size: 15px;
		    margin-left: 2em;
		}
		
		#paging_numClick {
			font-size:15px;
			cursor:pointer;
			color:#F1BCD5;
			text-decoration:underline;
			margin-left: 2em;
		}
	</style>
	
	<script>
	function like(s) {
		console.log("pdseq="+s);
		
		$.ajax({
			type: "Post",
			url: "like",
			data:{
				pdseq:s
			},
			success:function(data){
				
				var limg = '';
				
				if(data.lCode=="LL"){
					alert("좋아요 성공");
					limg="resources/image/fullheart.png";
				}else{
					alert("좋아요 취소");
					limg="resources/image/emptyheart.png";
				}
				
				$("#"+s).attr('src',limg);
			}
		}); //ajax
	}
	</script>
</head>
<body>
<div id = "wrap">
	<div id="product_box" align="center">

		<div class="container">
	
		<div class="count">
		    <!-- 레코드의 갯수를 출력 -->
		    ${count}개의 
		         
			<c:choose>
				<c:when test="${mubcode =='C'}">
					커피가
				</c:when>
				
				<c:when test="${mubcode =='DE'}">
					디저트가
				</c:when>
				
				<c:when test="${mubcode =='DR'}">
					음료가
				</c:when>
				
				<c:when test="${mubcode =='F'}">
					음식이
				</c:when>
				
				<c:when test="${mubcode =='S'}">
					스페셜이
				</c:when>
			</c:choose>					
			
		         있습니다.
	    <br><br><br>
	    </div>
		
		<!-- 2020.08.03 product menu name 출력 -->
		<div class="menu_css">
			<c:forEach var="list" items="${menulist}">
				<c:if test="${list.mucategory=='coffee'}">
					<a href="category?mubcode=${list.mubcode}&mucategory=${list.mucategory}&pageMaker=${pageMaker}">커피</a>
				</c:if>
				
				<c:if test="${list.mucategory=='dessert'}">
					<a href="category?mubcode=${list.mubcode}&mucategory=${list.mucategory}">디저트</a>
				</c:if>
				
				<c:if test="${list.mucategory=='drink'}">
					<a href="category?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음료</a>
				</c:if>
				
				<c:if test="${list.mucategory=='food'}">
					<a href="category?mubcode=${list.mubcode}&mucategory=${list.mucategory}">음식</a>
				</c:if>
				
				<c:if test="${list.mucategory=='special'}">
					<a href="category?mubcode=${list.mubcode}&mucategory=${list.mucategory}">스페셜</a>
				</c:if>							
			</c:forEach>
			<hr><br>
			
			<c:forEach var="cpdlist" items="${cpdlist}" end="5">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach> 
			
			<br>
			<c:forEach var="cpdlist" items="${cpdlist}" begin="6">
					<a href="mpdlist?mucategory=${cpdlist.mucategory}&muname=${cpdlist.muname}">${cpdlist.muname}</a>
			</c:forEach>
			
		</div>
		<br><br><br>
			<div class="container">
				<div class="main">
					<div class="productList">
						<c:forEach var="list" items="${ctlist}">
							
							<div class = "plist">
							<div>
								<p>
									<a href = "${list.pdurl}" target="_blank" class="pdurl">
									<img src="${list.pduploadfile}" width="200" height="200">
									</a>
									
									<input type="hidden" name="id" id="id" value="${logID}">
									
									<form id="form" name="form" method="post" onsubmit="return false;">
									<%-- <input type="hidden" name="pdseq" id="${list.pdseq}"> --%>
									
										<div class="lbutton">
											<c:choose>
												<c:when test="${logID ne null}">
													<c:if test="${list.liked=='t'}" >
													<input type="image" src="resources/image/fullheart.png" class="limg" id="${list.pdseq}" onclick="like(${list.pdseq})">
													</c:if>
													<c:if test="${list.liked!='t'}">
													<input type="image" src="resources/image/emptyheart.png" class="limg" id="${list.pdseq}" onclick="like(${list.pdseq})">
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
							            <c:if test="${list.frcode=='A10'}"><p>투썸 플레이스</p></c:if>
							            <c:if test="${list.frcode=='A11'}"><p>파리바게뜨</p></c:if>
							            <c:if test="${list.frcode=='A12'}"><p>파스쿠찌</p></c:if>
							            <c:if test="${list.frcode=='A13'}"><p>흑화당</p></c:if>
									</div>
									
									<p class = "pname">${list.pdname}</p>
									<p class="prname">${list.price} 원</p>
								</div>
								
				            	<c:forEach var="hashtag" items="${fn:split(list.hashtag,'#')}">
				            		<a href="hashtagList?keyword=${hashtag}">
				            			<span class = "hashtagsplit"># ${hashtag}</span>
				            		</a>
				            	</c:forEach>
							</div>
							
							<c:if test="${logID == 'DalDal'}">
								<div class="mdwrap">
									<a href="pdetail?pdseq=${list.pdseq}">
										<div class = "modify">수정</div>
									</a>
									
									<a href="pdelete?pdseq=${list.pdseq}">
										<div class = "delete">삭제</div>
									</a>
								</div>
							</c:if>
						</div>	
					</c:forEach>
				</div>
				<hr>
			</div>
		</div>
<hr>	
		   <!--
			      이전 버튼이 클릭가능한 조건이면, a태그를 이용해 이전 버튼이 뜨도록 하고, href 로 링크를 걸되
			      아까 만든 makeQuery 메서드를 이용해서 쿼리문자열을 만들어 줍니다.
			      ?page=어쩌고&perPageNum=어쩌고 이 부분을 생성해서 넣게 되는데 단 이전 버튼을 클릭하면
			      현재 페이지가 시작페이지의 -1 이 되도록 되어야 함으로 그 부분만 신경써 주면 됩니다.
		   -->
		   
		  <c:if test="${pageMaker.start}">
		          <%-- 
		          		<a href="categorylist${pageMaker.makeQuery(1)}" id="paging_num"> 
		    
		          		<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}&${pageMaker.makeQuery(1)}" id="paging_num">
		          --%>
		          
		          <a href="categorylist?mubcode=${mubcode}&mucategory=${mucategory}${pageMaker.makeQuery(1)}" id="paging_num">
		          	&nbsp;
		          	처음
		          </a>
		  </c:if>
		  
		  <c:if test="${pageMaker.prev}">
		          <%-- 
		          		<a href="categorylist${pageMaker.makeQuery(pageMaker.startPage-1)}"> 

		          		<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}&${pageMaker.makeQuery(pageMaker.startPage-1)}">
		          --%>
		          
		          <a href="categorylist?mubcode=${mubcode}&mucategory=${mucategory}${pageMaker.makeQuery(startPage-1)}">
	          		&nbsp;
	          		<img src="resources/image/prev.jpg" class="npn_img" id="paging_num">
		          </a>
		  </c:if>
		
		  <!--
		      [1][2][3]....[10] 이 부분을 삽입하는 부분이다. jstl 이용해for문을 돌면서 startPage ~ endPage까지
		      	표시해주되, a태그 눌렀을 때 이동하는 page 부분에 index 지정하는 부분을 유의
		   -->

		  <%-- 
		  	<c:forEach var="index" begin="${pageMaker.startPage}" end="${pageMaker.endPage}"> 
		  --%>
		  
		  <c:forEach var="index" begin="${startPage}" end="${endPage}">
			<c:choose>
				<%-- <c:when test="${pageMaker.page == index}"> --%>
				<c:when test="${page == index}">
					&nbsp;<span id="paging_numClick">${index}</span>&nbsp;
				</c:when>
				<c:otherwise>
				 	&nbsp;
				 	
				 	<%-- 
				 	<a href="categorylist${pageMaker.makeQuery(index)}" id="paging_num">${index}</a> 
				 	
				 	<a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}&${pageMaker.makeQuery(index)}" id="paging_num">${index}</a> 
				 	--%>
				 	
				 	<a href="categorylist?mubcode=${mubcode}&mucategory=${mucategory}${pageMaker.makeQuery(index)}" id="paging_num">${index}</a>
				 	&nbsp;
				</c:otherwise>
			</c:choose>
		  </c:forEach>
		
		  <c:if test="${pageMaker.next}">
		      <!--
		                  이전버튼과 마찬가지로 다음버튼을 끝 페이지보다1개 큰게 현재 페이지가 되도록 makeQuery에 page를 넣어줍시다.
		       -->
		          <%-- 
		          <a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}&${pageMaker.makeQuery(pageMaker.endPage+1)}">
		           
		          <a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}&${pageMaker.makeQuery(endPage+1)}"> 
		          --%>
		          
		          <a href="categorylist?mubcode=${mubcode}&mucategory=${mucategory}${pageMaker.makeQuery(endPage+1)}">
		          	&nbsp;
		          	<img src="resources/image/next.jpg" class="npn_img" id="paging_num">
		         </a>
		  </c:if>

		  <c:if test="${pageMaker.end}">
		          <%-- 
		          <a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}&${pageMaker.makeQuery(pageMaker.tempEndPage)}" id="paging_num">
		          
		          <a href="categorylist?mubcode=${list.mubcode}&mucategory=${list.mucategory}&${pageMaker.makeQuery(tempEndPage)}" id="paging_num"> 
		          --%>

		          <a href="categorylist?mubcode=${mubcode}&mucategory=${mucategory}${pageMaker.makeQuery(tempEndPage)}" id="paging_num">
		          	끝
		          </a>
		  </c:if>
	</div>  
</div>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>