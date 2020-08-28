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
<link rel="stylesheet" type="text/css" href="resources/css/noticeInputStyle.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<!-- Tiny API Key : p94bjfog4l71b0rpo346ohluewcnl4st7roux4squjwp3ckz -->
<script src="https://cdn.tiny.cloud/1/p94bjfog4l71b0rpo346ohluewcnl4st7roux4squjwp3ckz/tinymce/5/tinymce.min.js" 
		referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector: 'textarea',
		menubar:'false',
		plugins: 'autolink autosave code link media image table textcolor autoresize',
		toolbar: 'undo redo | forecolor bold italic underline | alignleft aligncenter alignright alignjustify | image code',
		min_height:'800',
	    image_advtab: true,
	    file_picker_callback: function(callback, value, meta) {
	      if (meta.filetype == 'image') {
	        $('#upload').trigger('click');
	        $('#upload').on('change', function() {
	          var file = this.files[0];
	          var reader = new FileReader();
	          reader.onload = function(e) {
	            callback(e.target.result, {
	              alt: ''
	            });
	          };
	          reader.readAsDataURL(file);
	        });
	      }
	    }/* ,
		setup: function(editor) {
            editor.addButton('custom_image', {
                    title: '이미지삽입',
                    icon: 'image',
                    onclick: function() {
                        window.open("POPUP_URL","tinymcePop","width=400,height=350");
                    }
                });
            } */
	});

	// 개별적 오류 확인을 위한 switch 변수 정의
	var tCheck = false;
	var cCheck = false;

	// 개별적 focusout 리벤트 리스터 function 작성 : JQuery
	$(function() {
		$('#title').focus();
		$('#title').focusout(function() {
			tCheck = titleCheck();
		}); // title_focusout
		
		$('#content').focusout(function() {
			cCheck = contentCheck();
		}); // content_focusout
	}); // ready

	// 전체적으로 입력 오류가 없음을 확인, submit 여부 판단 : JavaScript function
	function inCheck() {
		if(tCheck==true) {
			return true;
		} else {
			$('#tMessage').html('제목을 확인하세요!');
			return false;
		} // title 오류 확인
		
		if(cCheck==true) {
			return true;
		} else {
			$('#cMessage').html('내용을 확인하세요!');
			return false;
		} // content 오류 확인
	}
</script>
</head>
<body>
<div align="center" id="wrap">
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
					<span id="cMessage" class="eMessage"></span>
					<input name="image" type="file" id="upload" class="hidden" onchange="">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="60">
					<input type="submit" value="수정" class="nButtonStyle" onclick="return inCheck()">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소" class="nButtonStyle">&nbsp;&nbsp;&nbsp;
					<input type="button" value="목록" class="nButtonStyle" onclick="location.href='nlist'">
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>