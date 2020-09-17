<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/insertStyle.css">
	
	<!--
	** 입력값 확인하기
	=> join, update, login
	=> 외부문서 (memberCheck.js) 에 작성 후 활용
	=> 처리방식 : inCheck05 방식 (focusout(), submit 적용)
	 -->
	<style type="text/css">
	.form-control {
		height: 45px;
	}
	
	a {
		color: black;
	}
	
	.explan {
   		line-height: 4;
	}
	
	.select {
		padding: 10px;
	}
	
	h2 {
		font-weight: 100;
	}		    
	
	.textareaWrap {
		border: 1px solid #ddd;
    	border-radius: 3px;
    	box-sizing: border-box;
    	display: inline-block;
    	max-width: 530px;
    	padding: 15px;
    	width: 100%;
    	height: 100%;
	}
	</style>

	<script type="text/javascript">
	$(function() {
		$("#datepicker1").datepicker({
  				dateFormat: 'yy-mm-dd'
 			});
		
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
            		<form action = "calinsert" name="event" method = "post" enctype="multipart/form-data"> 
					
						<h2>이벤트 등록</h2>
					
						<!-- 동적 셀렉트 박스 ---------------------------------------------------------------------------->
						<div class="input_box">
							<div class="explan">브랜드</div>						
							
							<select id="frcode" name="frcode" class="form-control select" onchange="coderead(this.value)">
								<option value="" selected>브랜드명</option>
								 
		 						<c:forEach var="franchise" items="${frlist}">
									<option value= "${franchise.frcode}">${franchise.frkname}</option>
		 						</c:forEach>
		 					</select>
						</div>
					
						<br><br>
					
						<div class="input_box" style="width: 200px;">
							
							<div class="explan">시작 날짜</div>	
							<input type='date' class="form-control" id='currentDate' name="start_date"/>
							
							<!-- 현재 시간 -->
							<script type="text/javascript">
							document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
							</script>
						
							<div class="explan">종료 날짜</div>	
							<input type='date' class="form-control" name="end_date"/>
							 
						</div>
					
						<div class="input_box">
							<div class="explan">이벤트 제목</div>		
							<input type = "text" class="form-control" name="caltitle" id="caltitle" required>
						</div>
						
						
						<div class="input_box">
							<div class="explan">이벤트 내용</div>		
							<textarea class="form-control col-sm-5 textareaWrap" rows="5" name="calcontent" id="calcontent"></textarea>
						</div>
					
						<div class="input_box">
							<div class="explan">이벤트 경로</div>
							<input type = "text" class="form-control" name="editurl" id="editurl">						
						</div>
					
						<div class="input_box">
							<div class="explan">이벤트 이미지 업로드</div>
							
							<div class="filebox"> 
								<label for="ex_filename">업로드</label>
								<input class="upload-name" value="파일선택" disabled="disabled">
								<input type="file" id="ex_filename" name="eventuploadfilef" class="upload-hidden"> 
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