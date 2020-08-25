<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/insertStyle.css">
	<!-- 
	** 입력값 확인하기
	=> join, update, login
	=> 외부문서 (memberCheck.js) 에 작성 후 활용
	=> 처리방식 : inCheck05 방식 (focusout(), submit 적용)
	 -->
	 <style type="text/css">
		#footer {
		    position: absolute;
		    left: 0;
		    right: 0;
		    bottom: -610px;
		    width: 100%;
		    padding: 45px 0;
		    font-size: 12px;
		    text-align: center;
		    background-color: #262626;
		    margin-top: 0;
		} 
		
		.footer_menu {
		    width: 100%;
		    color: white;
		    font-weight: bold;
		}
		
		hr {
			border: 0;
			width: 0;
		}
	</style>

	<script type="text/javascript">
		$(document).ready(function(){
			var fileTarget = $('.filebox .upload-hidden');
			fileTarget.on('change', function(){ // 값이 변경되면 
				if(window.FileReader){ // modern browser
					var filename = $(this)[0].files[0].name;
				} else { // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
				} 
			// 추출한 파일명 삽입
			$(this).siblings('.upload-name').val(filename);
			});
		});
	</script>
</head>
<body>

<div id="wrap">
	<div class="container">
		<div class="main">
            <div class="form">
            	<form action = "fcinsert" name="franchise" method = "post" enctype="multipart/form-data"> <!-- img [enctype="multipart/form-data"] -->
					
					<div class="input_box">
						<div class="explan">브랜드 코드</div>		
						<input type= "text" name = "frcode" id = "frcode">
					</div>
					
					<div class="input_box">
						<div class="explan">영문 이름</div>		
						<input type= "text" name = "frename" id = "frename">
					</div>
					
					<div class="input_box">
						<div class="explan">한글 이름</div>
						<input type= "text" name = "frkname" id = "frkname">
					</div>
					
					<div class="input_box">
						<div class="explan">색상</div>		
						<input type= "color" name= "frcolor" id= "frcolor" class= "frcolor">
					</div>
					
					<div class="input_box">
						<div class="explan">로고 이미지 업로드</div>
						
						<div class="filebox"> 
							<label for="ex_filename">업로드</label>
							<input class="upload-name" value="파일선택" disabled="disabled">
							<input type="file" id="ex_filename" name = "fruploadfilef" class="upload-hidden"> 
							<img src ="" class="select_img"/>
						</div>
						
						<script>
						$("#ex_filename").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img").attr("src", data.target.result)
										.width(150).height(150);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
						</script>
					</div>	
				</form>
			</div>
					
					<div class="form_end">
						<input type="submit" id="submit" class="submit" value="등록">
				    	<input type="reset" class="reset" value="취소">
				    </div>
            </div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>