<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.NoticeVO,service.NServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
<script src="resources/js/noticeCheck.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/noticeInputStyle.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body>
<div align="center" id="wrap">
	<span id="notice_title">공지사항</span><br><br><br>
	<table class="ntable">
		<tr id="ndetail_title">
			<td>${notice.title}</td>
			<td align="right" id="ndetail_regdate">${notice.regdate}</td>
		</tr>
		<tr id="ndetail_content">
			<td colspan="2" id="ntable_content"><br><br>${notice.content}<br><br></td>
		</tr>
		<tr>
			<td colspan="2" align="right"></td>
		</tr>
	</table>
	<br>
	<div class="btn_nlist" align="right">
		<c:if test="${logID == notice.id}">
			<input type="button" value="등록" class="nButtonStyle" onclick="location.href='ninsertf'">&nbsp;&nbsp;&nbsp;
			<input type="button" value="수정" class="nButtonStyle" onclick="location.href='nupdatef?seq=${notice.seq}'">&nbsp;&nbsp;&nbsp;
 			<input type="button" value="삭제" class="nButtonStyle" onclick="javascript:;ndelete(${notice.seq})">&nbsp;&nbsp;&nbsp;
		</c:if>
		<input type="button" value="목록" class="nButtonStyle" onclick="location.href='nlist'">
	</div>
	<br><br><br>
	<table id="nlist_nextPrev">
		<tr>
			<td class="nlist_nextPrev" align="center">윗글<td>
			<td>
				<c:if test="${NoticePN.nextTitle==null}">
					<font color="gray">해당 글이 없습니다.</font>
				</c:if>
				<c:if test="${NoticePN.nextTitle!=null}">
					<a href="ndetail?seq=${NoticePN.nextSeq}&id=${NoticePN.id}">
						${NoticePN.nextTitle}
					</a>
				</c:if>
			<td>	
		</tr>
		<tr>
			<td class="nlist_nextPrev" align="center">아랫글<td>
			<td>
				<c:if test="${NoticePN.prevTitle==null}">
					<font color="gray">해당 글이 없습니다.</font>
				</c:if>
				<c:if test="${NoticePN.prevTitle!=null}">
					<a href="ndetail?seq=${NoticePN.prevSeq}&id=${NoticePN.id}">
						${NoticePN.prevTitle}
					</a>
				</c:if>
			<td>			
		</tr>
	</table>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>