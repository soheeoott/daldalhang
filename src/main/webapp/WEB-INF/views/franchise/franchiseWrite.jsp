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
	<script src="//code.jquery.com/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/insertStyle.css">
	
	<script src="resources/js/spectrum.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/spectrum.css">
	
	<style type="text/css">
	.ui-colorpicker input { float: none; width: auto; height: auto; }
	
	#bg .submit { margin-top: 40px; text-align: center; }
	</style>

	<script type="text/javascript">
		$(function(){
			
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
            		<form action = "fcinsert" name="franchise" id="franchise" method = "post" enctype="multipart/form-data"> <!-- img [enctype="multipart/form-data"] -->
					
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
							<div class="explan">이벤트 등록 색상</div>		
							<!-- <input type= "color" name= "frcolor" id= "frcolor" class= "frcolor"> -->
							<input type='text' id="togglePaletteOnly" name= "frcolor"/>
							
						</div>
					
						<script>
						$("#togglePaletteOnly").spectrum({
							preferredFormat: "hex",
							showInput: true,
						    showPalette: true,
							showAlpha: true,
						    showPaletteOnly: true,
						    togglePaletteOnly: true,
						    togglePaletteMoreText: '더보기',
						    togglePaletteLessText: '작게',
						    color: 'blanchedalmond',
						    palette: [
						        ["#000","#444","#666","#999","#ccc","#eee","#f3f3f3","#fff"],
						        ["#f00","#f90","#ff0","#0f0","#0ff","#00f","#90f","#f0f"],
						        ["#f4cccc","#fce5cd","#fff2cc","#d9ead3","#d0e0e3","#cfe2f3","#d9d2e9","#ead1dc"],
						        ["#ea9999","#f9cb9c","#ffe599","#b6d7a8","#a2c4c9","#9fc5e8","#b4a7d6","#d5a6bd"],
						        ["#e06666","#f6b26b","#ffd966","#93c47d","#76a5af","#6fa8dc","#8e7cc3","#c27ba0"],
						        ["#c00","#e69138","#f1c232","#6aa84f","#45818e","#3d85c6","#674ea7","#a64d79"],
						        ["#900","#b45f06","#bf9000","#38761d","#134f5c","#0b5394","#351c75","#741b47"],
						        ["#600","#783f04","#7f6000","#274e13","#0c343d","#073763","#20124d","#4c1130"]
						    ]
						});
						</script>
					
						<div class="input_box">
							<div class="explan">로고 이미지 업로드</div>
							
							<div class="filebox"> 
								<label for="ex_filename">업로드</label>
								<input class="upload-name" value="파일선택" disabled="disabled">
								<input type="file" id="ex_filename" name="fruploadfilef" class="upload-hidden"> 
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
</body>
<%@ include file="../common/footer.jsp" %>
</html>