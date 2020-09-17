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
<!-- Tiny API Key : p94bjfog4l71b0rpo346ohluewcnl4st7roux4squjwp3ckz -->
<script src="https://cdn.tiny.cloud/1/p94bjfog4l71b0rpo346ohluewcnl4st7roux4squjwp3ckz/tinymce/5/tinymce.min.js" 
		referrerpolicy="origin"></script>
<script>
 	tinymce.init({
		selector: 'textarea',
		menubar: 'false',
		plugins: 'autolink autosave code link image table textcolor autoresize',
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
                        window.open("/notice/noticeFileUpload.jsp","tinymcePop","width=400,height=350");
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

<div id="wrap">
      <div class="container" align="center">
        <div class="main">
			<span id="wnotice_title">공지작성</span><br><br><br>
          
			<div class="form">
          
			<form action="ninsert" method="post">
				<table id="noticeForm">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="id" id="writerID" value="${logID}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="title" id="title" size="60"><br>
							<span id="tMessage" class="eMessage"></span></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea rows="10" cols="50" name="content" id="content"></textarea>
							<span id="cMessage" class="eMessage"></span>
							<input name="image" type="file" id="upload" class="hidden" onchange=""></td>
						</td>
					</tr>
					
					<hr>
					
					<tr>
						<td colspan="2" align="center" height="80">
							<input type="submit" value="등록" class="nButtonStyle" onclick="return inCheck()">&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" class="nButtonStyle">&nbsp;&nbsp;&nbsp;
							<input type="button" value="목록" class="nButtonStyle" onclick="location.href='nlist'">
						</td>
					</tr>
				</table>
			</form>
          
          </div>
        </div>
     </div>
</div>          
<%@ include file="../common/footer.jsp" %>
</body>
</html>