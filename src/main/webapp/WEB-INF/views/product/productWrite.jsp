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
		    bottom: -310px;
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
</head>
<body>

<div id="wrap">
	<div class="container">
		<div class="main">
            <div class="form">
            	<form action = "pdinsert" method = "post" enctype="multipart/form-data"> <!-- img [enctype="multipart/form-data"] -->
					
					<div style="padding-left: 20px;">
						<div class="explan">상호명</div>						
						<select name="frcode" class="select">
							<option value= "" selected>---</option>
	 						
	 						<c:forEach var="franchise" items="${frlist}">
								<option value= "${franchise.frcode}" selected>${franchise.frkname}</option>
	 						</c:forEach>
	 					</select>
					</div>
					
						<select name="mucode1" class="MenuSelect">
							<option value= "" selected>---</option>
							
							<c:forEach var="menu" items="${mulist}">
								<option value= "${menu.mucode}">${menu.muname}</option>
	 						</c:forEach>
	 					
						</select>
				
						<select name="mucode2" class="MenuSelect">
							<option value= "" selected>---</option>
							
							<c:forEach var="menu" items="${mulist}">
								<option value= "${menu.mucode}">${menu.muname}</option>
	 						</c:forEach>
						</select>
			
						<select name="mucode3" class="MenuSelect">
							<option value= "" selected>---</option>
							
							<c:forEach var="menu" items="${mulist}">
								<option value= "${menu.mucode}">${menu.muname}</option>
	 						</c:forEach>
						</select>
					
					<hr>
					
					<div class="input_box">
						<div class="explan">상품명</div>						
						<input type = "text" name = "pdname" id = "pdname" required>
					</div>
					
					<div class="input_box">
						<div class="explan">가격</div>
						<input type = "text" name = "price" id = "price" required>						
					</div>
					
					<div class="input_box">
						<div class="explan">해시태그</div>
						<input type = "text" name = "hashtag" id = "hashtag">						
					</div>
					
					<div class="input_box">
						<div class="explan">이미지 업로드</div>
						<input type="file" name="uploadfilef" id = "uploadfilef">
						
						<img src ="" class="select_img"/>
							<script>
								$("#uploadfilef").change(function(){
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
					
					<div class="form_end">
						<input type="submit" id="submit" class="submit" value="등록">
				    	<input type="reset" class="reset" value="취소">
				    </div>
						    
				</form>
            </div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>