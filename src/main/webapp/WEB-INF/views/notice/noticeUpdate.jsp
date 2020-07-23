<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** DalDal **</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<!-- Tiny API Key : p94bjfog4l71b0rpo346ohluewcnl4st7roux4squjwp3ckz -->
<script src="https://cdn.tiny.cloud/1/p94bjfog4l71b0rpo346ohluewcnl4st7roux4squjwp3ckz/tinymce/5/tinymce.min.js" 
		referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector: 'textarea',
		menubar:'false',
		plugins: 'autolink autosave code link media image table textcolor autoresize',
		toolbar: 'undo redo | forecolor bold italic underline | alignleft aligncenter alignright alignjustify | custom_image code',
		min_height:'800'
	});
 </script>
</head>
<body>
<div align="center">
	<span id="notice_title">공지수정</span><br><br>
	<form action="nupdate" method="post">
		<table id="noticeForm">
			<tr>
				<td>Writer</td>
				<td><input type="text" name="id" id="writerID" value="${notice.id}" readonly></td>
			</tr>
			<tr>
				<td>Regdate</td>
				<td><input type="text" name="regdate" id="nregdate" value="${notice.regdate}" readonly>
					<input type="hidden" name="seq" id="seq" value="${notice.seq}"></td>
			</tr>
			<tr>
				<td>Title</td>
				<td colspan="4">
					<input type="text" name="title" id="title" size="50" value="${notice.title}"><br>
					<span id="tMessage" class="eMessage"></span></td>
			</tr>
			<tr>
				<td>Content</td>
				<td colspan="4">
					<textarea rows="10" cols="50" name="content">${notice.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="60">
					<input type="submit" value="수정" class="buttonStyle">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소" class="buttonStyle">&nbsp;&nbsp;&nbsp;
					<input type="button" value="목록" class="buttonStyle" onclick="location.href='nlist'">
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>