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
		menubar: 'false',
		plugins: 'autolink autosave code link media image table textcolor autoresize',
		toolbar: 'undo redo | forecolor bold italic underline | alignleft aligncenter alignright alignjustify | custom_image code',
		min_height:'800'
	});
 </script>
</head>
<body>
<div align="center" id="wrap">
	<span id="notice_title">공지작성</span><br><br><br>
	<form action="ninsert" method="post">
		<table id="noticeForm">
			<tr>
				<td>Writer</td>
				<td><input type="text" name="id" id="writerID" value="${logID}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Title</td>
				<td>
					<input type="text" name="title" id="title" size="60"><br>
					<span id="tMessage" class="eMessage"></span></td>
			</tr>
			<tr>
				<td>Content</td>
				<td>
					<textarea rows="10" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="80">
					<input type="submit" value="등록" class="buttonStyle">&nbsp;&nbsp;&nbsp;
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