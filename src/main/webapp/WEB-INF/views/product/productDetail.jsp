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
	<link rel="stylesheet" type="text/css" href="resources/css/insertStyle.css">
	<!-- 
	** 입력값 확인하기
	=> join, update, login
	=> 외부문서 (memberCheck.js) 에 작성 후 활용
	=> 처리방식 : inCheck05 방식 (focusout(), submit 적용)
	 -->
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
	
	<script type="text/javascript">
		var mainfrcode = null;
			
		function coderead(frcode){
			console.log("test frcode="+frcode);
			mainfrcode = frcode;
			
		    var $target = $("select[name='bname']");
		     
		    $target.empty();
		    
		    if(frcode == ""){
		        $target.append("<option value=''>대분류</option>");
		        return;
		    }
		 
		    $.ajax({
		        type: "POST",
		        url: "bnameinsert",
		        data:{ frcode : frcode },
		        success: function(jdata) {
		            if(jdata.catem.length == 0){
		                $target.append("<option value=''>대분류</option>");
		                
		            }else{
		                console.log("jdata.length=>"+jdata.catem.length);
		                
		                $target.append("<option value=''>대분류</option>");
		                
						for(var i=0; i < jdata.catem.length; i++){
							$target.append("<option value=" +jdata.catem[i].bname+ ">" +jdata.catem[i].bname + "</option>");
							console.log("each i=>"+i);
						} // for
		            } // else
		        }, error:function(xhr){
		            alert("잠시 후 다시 이용해주세요.");
		            console.log(xhr);
		            return;
		        }
		    });
		}
		
		function bnameread(bname){
			
			console.log("test bname="+bname);
			console.log("test mainfrcode="+mainfrcode);
			
		    var $target = $("select[name='mname']");
		     
		    $target.empty();
		    
		    if(bname == ""){
		        $target.append("<option value=''>중분류</option>");
		        return;
		    }
		 
		    $.ajax({
		        type: "POST",
		        url: "mnameinsert",
		        data:{ 
		        	bname : bname,
		        	frcode : mainfrcode
		        	},
		        success: function(mdata) {
		            if(mdata.cates.length == 0){
		                $target.append("<option value=''>중분류</option>");
		            }else{
		            	console.log("mdata.length=>"+mdata.cates.length);
		            	
		            	$target.append("<option value=''>중분류</option>");
		                
		            	for(var j=0; j < mdata.cates.length; j++){
							$target.append("<option value="+ mdata.cates[j].mname + ">" + mdata.cates[j].mname+"</option>");
							console.log("each j=>"+j);
						} // for
		            } // else
		        }, error:function(xhr){
		            alert("잠시 후 다시 이용해주세요.");
		            console.log(xhr);
		            return;
		        }
		    });
		}
	</script>
</head>
<body>

<div id="wrap">
	<div class="container">
		<div class="main">
            <div class="form"> <!-- 수정 URL -->
            	<form action = "#" name="product" method = "post" enctype="multipart/form-data"> <!-- img [enctype="multipart/form-data"] -->

					<!-- 동적 셀렉트 박스 ---------------------------------------------------------------------------->
					<div class="input_box"> <!-- padding-left: 20px; -->
						<div class="explan">카테고리</div>						
						<!-- <select id="frcode" name="frcode" class="select" onchange="coderead('A01')"> -->
						
						<select id="frcode" name="frcode" class="select" onchange="coderead(this.value)">
							<option value="브랜드명" selected>${pdetail.frcode}</option> <!-- 공차로 바꾸기 -->
							 
	 						<c:forEach var="franchise" items="${frlist}">
								<option value= "${franchise.frcode}">${franchise.frkname}</option>
	 						</c:forEach>
	 					</select>
	 					
	 					<select id="bname" name="bname" class="select" onchange="bnameread(this.value)">
	 						<option value= "대분류" selected>${pdetail.bname}</option>
	 						
	 						<c:forEach var="big" items="${catem}">
								<option value="${big.bname}">${big.bname}</option>
							</c:forEach>
	 					</select>
	 					
	 					<select id="mname" name="mname" class="select">
	 						<option value="중분류" selected>${pdetail.mname}</option>
	 						
	 						<c:forEach var="middle" items="${cates}">
								<option value= "${middle.mname}" value="${middle.mkname}">${middle.mkname}</option>
							</c:forEach>
	 					</select>
					</div>
					
					<!------------------------------------------------------------------------------------------->
					
					<div class="input_box" style="display: inline-block;">
						<select name="mucode1" class="MenuSelect">
							<option value="${pdetail.mucode1}" selected>${pdetail.mucode1}</option>
							
							<c:forEach var="menu" items="${mulist}">
								<option value= "${menu.mucode}">${menu.muname}</option>
	 						</c:forEach>
						</select>

						<select name="mucode2" class="MenuSelect">
							<option value= "${pdetail.mucode2}" selected>${pdetail.mucode2}</option>
							
							<c:forEach var="menu" items="${mulist}">
								<option value="${menu.mucode}">${menu.muname}</option>
	 						</c:forEach>
						</select>
			
						<select name="mucode3" class="MenuSelect">
							<option value="${pdetail.mucode3}" selected>${pdetail.mucode3}</option>
							
							<c:forEach var="menu" items="${mulist}">
								<option value= "${menu.mucode}">${menu.muname}</option>
	 						</c:forEach>
						</select>
					</div>
					
					<div class="input_box">
						<div class="explan">상품명</div>		
						<input type = "text" name = "pdname" id ="pdname" value="${pdetail.pdname}" required>
					</div>
					
					<div class="input_box">
						<div class="explan">가격</div>
						<input type = "text" name = "price" id = "price" value="${pdetail.price}" required>
					</div>
					
					<!------------------------------------------------------------->
					<div class="check_box">
						<div class="explan">신제품</div>
						<div class="checkbox">						
							<input type="checkbox" name="newproduct" 
							value="y" 
							<c:if test="${pdetail.newproduct == 'y'}"> checked="checked"</c:if> />
						</div>
					</div>
					
					<div class="check_box">
						<div class="explan">추천제품</div>
						<div class="checkbox">						
							<input type = "checkbox" name = "bestproduct" 
							value="y"
							<c:if test="${pdetail.bestproduct == 'y'}"> checked="checked"</c:if> />
						</div>
					</div>
					
					<div class="check_box">
						<div class="explan">시즌제품</div>
						<div class="checkbox">						
							<input type = "checkbox" name = "seasonproduct" 
							value="y"
							<c:if test="${pdetail.seasonproduct == 'y'}"> checked="checked"</c:if> />
						</div>
					</div>
					<!------------------------------------------------------------->
					
					<div class="input_box">
						<div class="explan">해시태그</div>
						<input type = "text" name = "hashtag" id = "hashtag" placeholder="#커피,#디저트" value="${pdetail.hashtag}">						
					</div>
					
					<div class="input_box">
						<div class="explan">상품 경로</div>
						<input type = "text" name = "pdurl" id = "pdurl" value="${pdetail.pdurl}">						
					</div>
					
					<div class="input_box">
						<div class="explan">이미지 업로드</div>
						
						<div class="filebox"> 
							<label for="ex_filename">업로드</label>
							<input class="upload-name" disabled="disabled" value="${pdetail.pduploadfile}">
							<input type="file" id="ex_filename" name = "uploadfilef" class="upload-hidden"> 
							<img src ="${pdetail.pduploadfile}" class="select_img"/>
		
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
			</div>
					
					<div class="form_end">
						<input type="submit" id="submit" class="submit" value="등록">
				    	<input type="reset" class="reset" value="취소">
				    </div>
				 </form>   
            </div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>