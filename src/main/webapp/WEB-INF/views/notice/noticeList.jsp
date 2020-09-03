<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
<script src="resources/js/noticeCheck.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/noticeStyle.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script>
$(function() {
	$('#nsearchBtn').on("click",function() {
		self.location="nlist"
					+"${pageMaker.makeQuery(1)}"		// 페이지 번호
					+"&searchType="
					+$('#searchType').val()
					+"&keyword="
					+$('#keyword').val();
	});
}); // ready
</script>
</head>
<body>
<div align="center" id="wrap">
	<div>
		<a id="notice_title" href="nlist">
			공지사항
		</a>
	</div>

	<div class="box-body" id="searchBar" id="notice_search">
		<form name="searchform" method="post" action="nlist">
			<select name="searchType" id="searchType" hidden>
				<option value="tc"
					<c:out value="${cri.searchType eq 'tc' ? 'selected':''}"/>>제목&내용
				</option>
			</select>
			
			<div style= "float: left; margin-left: 670px;">
				<input type="text" name="keyword" id="keyword" 
					value="${cri.keyword}" size="25" placeholder="검색어를 입력해 주세요.">
			</div>
				
			<div>
				<button id="nsearchBtn">
					<img src="resources/image/search.png" alt="search_icon" width= "20" height = "20">
				</button>
			</div>
		</form>
	</div>
		
	<table class="ntable">
				
		<tr height="50"></tr>
		<tr align="center" id="nlist_category">
			<td>No</td><td>제목</td><td>날짜</td><td>조회수</td>
		</tr>
		<c:forEach var="list" items="${daldal}">
		<tr height="50" id="nlist_content">
			<td align="center" width="100">${list.seq}</td>		
			<td width="600">		
				<!-- 조회수 증가를 위해 글쓴이의 id도 포함 (무조건 관리자 id) -->
				<a href="ndetail?seq=${list.seq}&id=${list.id}" id="nlist_title">${list.title}</a>
			</td>				
			<td align="center" width="100">${list.regdate}</td>		
			<td align="center">${list.cnt}</td>		
		</tr>
		</c:forEach>
	</table>
	
	<div class="btn_nlist" align="right">
		<c:if test="${logID=='DalDal'}">
			<input type="button" value="등록" class="nButtonStyle" onclick="location.href='ninsertf'">
		</c:if>
	</div>
		
	<hr>
	<!--
		Page Criteria 추가
		1) First <<, Prev < : enabled 여부
		2) sPage~ePage까지 perPageNo 값만큼 출력,
		3) Next >, Last >> : enabled 여부	
	-->
	<div align="center">
		<!-- 1) -->
		<c:if test="${pageMaker.prev}">	
			<a href="nlist${pageMaker.makeSearch(pageMaker.sPageNo-1)}">
				<img src="resources/image/prev.jpg" class="npn_img">&nbsp;</a>
		</c:if>
	
		<!-- 2) -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
			<c:choose>
				<c:when test="${pageMaker.cri.currPage==i}">
					&nbsp;<span id="paging_numClick">${i}</span>&nbsp;
				</c:when>
				<c:otherwise>
				 	&nbsp;<a href="nlist${pageMaker.makeSearch(i)}" id="paging_num">${i}</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 3) -->
	 	<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
			<a href="nlist${pageMaker.makeQuery(pageMaker.ePageNo+1)}">
				<img src="resources/image/next.jpg" class="npn_img"></a>
		</c:if>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>