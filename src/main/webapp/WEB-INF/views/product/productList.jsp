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
	
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="resources/modal/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- 좋아요 -->
	<script src="resources/js/likeFunc.js"></script>
	
	<style>
	#footer {
		margin-top: 50px;
	}
	</style>
</head>
<body>
<div id="wrap">
	<div id="product_box" align="center">
		
		<!-- 2020.08.03 product menu name 출력 -->
		<div class="menu_css">
			<c:forEach var="list" items="${menulist}">
				<c:if test="${list.mucategory=='coffee'}">
					<a href="category?mubcode=${list.mubcode}&mucategory=${list.mucategory}">커피</a>
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
						<c:forEach var="list" items="${pdlist}" varStatus="vs">
						
						<div class = "plist">
							<div>
								<p>
									<a href ="${list.pdurl}" target="_blank" class="pdurl">
										<img src="${list.pduploadfile}" width="200" height="200">
									</a>
									
									<form id="form" name="form" method="post" onsubmit="return false;">
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
												</c:otherwise>
											</c:choose>
										</div>
									</form>
									
									<!-- 아래에서 data-toggle과 data-target 속성에서 data-toggle에는 modal 값을 data-target속성에는 모달 창 전체를 
									감싸는 div의 id 이름을 지정하면 된다. -->
									
									<!--  
									<script>
								    function sampleModalPopup(){
								        // 호출
								        $("#sampleModalPopup > .modal-dialog").load(url, function() { 
								            $("#sampleModalPopup").modal("show"); 
								        });
								    }
									</script>
									
									<div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="-1">
									    <div class="modal-dialog modal-dialog-width1000 modal-dialog-height800">
									        <div class="modal-header">
									            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
									        </div>
									        <div class="modal-body">
									        </div>
									        <div class="modal-footer">
									            <button type="button" name="button" class="btn btn-color2" data-dismiss="modal" >닫기</button>
									        </div>
									    </div>
									</div>
									-->
									
									 
									<button type="button" data-toggle="modal" data-target="#myModal${vs.index}">상품 상세</button>
									&nbsp;&nbsp;
									
									<!--  
									<a data-toggle="modal" href="#myModal">상품 상세</a>
								 	-->
									
									<!--  
									<script>
									function myModal(){
								        // 호출
								        $("#myModal > .modal-dialog").load(url, function() { 
								            $("#myModal").modal("show"); 
								        });
								    }
									</script>
									 -->
									 
									<%-- 
									<button id="myModal" type="button" 
										onclick="document.getElementById('myModal${vs.index}').style.display='block'" onclick="myModal()">
										상품 상세</button>
									--%>
									
								  	<!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라짐 -->
								  	
								  	  <!-- <div class="modal fade" id="myModal" role="dialog"> 사용자 지정 부분① : id명
									    <div class="modal-dialog"> -->
									    
									  <!-- Modal -->
									  <div class="modal fade" id="myModal${vs.index}" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
									    <div class="modal-dialog">
									
									      <!-- Modal content-->
									      <div class="modal-content">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">×</button>
									          <!-- 사용자 지정 부분② : 타이틀 -->
									          <!-- <h4 class="modal-title">모달 창 타이틀</h4> --> 
									        </div>
									
									        <div class="modal-body">
									          <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
									          	
									          	<img src="${list.pduploadfile}" width="200" height="200">
												<a href ="${list.pdurl}" target="_blank" class="pdurl">홈페이지로 이동</a>
												
												<div class="input_box">
													<input type = "text" class="form-control" name = "comment" id = "comment">
												</div>
					
												<!-- 
												<div>
													<button type="button" class="modal_modify_btn">수정</button>
													<button type="button" class="modal_delete_btn">삭제</button>
											 	</div>
											 	-->
									        
									        </div>
									
									        <div class="modal-footer">
									          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									        </div>
									        
									      </div>
									    </div>
									  </div>
									<br/><br/>
									
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
								
									<p class="pname">${list.pdname}</p>
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

									<%-- pdelete?pdseq=${list.pdseq}"> --%>
									<a href="#" onclick="remove(${list.pdseq})">
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
		  <!--
			      이전 버튼이 클릭가능한 조건이면, a태그를 이용해 이전 버튼이 뜨도록 하고, href 로 링크를 걸되
			      아까 만든 makeQuery 메서드를 이용해서 쿼리문자열을 만들어 줍니다.
			      ?page=어쩌고&perPageNum=어쩌고 이 부분을 생성해서 넣게 되는데 단 이전 버튼을 클릭하면
			      현재 페이지가 시작페이지의 -1 이 되도록 되어야 함으로 그 부분만 신경써 주면 됩니다.
		   -->
		   
	      <c:if test="${pageMaker.start}">
	         <a href="listPage${pageMaker.makeQuery(1)}" id="paging_num">
	          	&nbsp;
	          	처음
	         </a>
	 	  </c:if>
	  
		  <c:if test="${pageMaker.prev}">
	          <a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}">
          		&nbsp;
          		<img src="resources/image/prev.jpg" class="npn_img" id="paging_num">
	          </a>
		  </c:if>
		
		  <!--
		      [1][2][3]....[10] 이 부분을 삽입하는 부분이다. jstl 이용해for문을 돌면서 startPage ~ endPage까지
		      	표시해주되, a태그 눌렀을 때 이동하는 page 부분에 index 지정하는 부분을 유의
		   -->
		  <c:forEach var="index" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<c:choose>
				<c:when test="${pageMaker.page == index}">
					&nbsp;<span id="paging_numClick">${index}</span>&nbsp;
				</c:when>
				<c:otherwise>
				 	&nbsp;
				 	<a href="listPage${pageMaker.makeQuery(index)}" id="paging_num">${index}</a>
				 	&nbsp;
				</c:otherwise>
			</c:choose>
		  </c:forEach>
		
		  <!--
	                  이전버튼과 마찬가지로 다음버튼을 끝 페이지보다1개 큰게 현재 페이지가 되도록 makeQuery에 page를 넣어줍시다.
	      -->
		  <c:if test="${pageMaker.next}">
	          <a href="listPage${pageMaker.makeQuery(pageMaker.endPage+1)}">
	          	&nbsp;
	          	<img src="resources/image/next.jpg" class="npn_img" id="paging_num">
	          </a>
		  </c:if>

		  <c:if test="${pageMaker.end}">
	          <a href="listPage${pageMaker.makeQuery(pageMaker.tempEndPage)}" id="paging_num">
	          	끝
	          </a>
		  </c:if>
	</div>
</div>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>