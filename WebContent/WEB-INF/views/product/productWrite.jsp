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
	<!-- 
	** 입력값 확인하기
	=> join, update, login
	=> 외부문서 (memberCheck.js) 에 작성 후 활용
	=> 처리방식 : inCheck05 방식 (focusout(), submit 적용)
	 -->
</head>
<body>
<div id="product_box">
	<form action = "pdinsert" method = "post" enctype="multipart/form-data"> <!-- img [enctype="multipart/form-data"] -->
		<table>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 			
			<tr height = "40">
				<td bgcolor = "yellow">상호명</td>
				<td>
					<select name="frcode">
						<option value= "">---</option>
 					
						<option value= "A01" <c:if test="${frlist.frcode=='A01'}">selected</c:if>>${frlist.frkname}</option>
<%--
                   		<option value= "A02" <c:if test="${frlist.fcode=='A02'}">selected</c:if>>${frlist.fname}</option>
                  		<option value= "A03" <c:if test="${frlist.fcode=='A03'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A04" <c:if test="${frlist.fcode=='A04'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A05" <c:if test="${frlist.fcode=='A05'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A06" <c:if test="${frlist.fcode=='A06'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A07" <c:if test="${frlist.fcode=='A07'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A08" <c:if test="${frlist.fcode=='A08'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A09" <c:if test="${frlist.fcode=='A09'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A10" <c:if test="${frlist.fcode=='A10'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A11" <c:if test="${frlist.fcode=='A11'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A12" <c:if test="${frlist.fcode=='A12'}">selected</c:if>>${frlist.fname}</option>
                 		<option value= "A13" <c:if test="${frlist.fcode=='A13'}">selected</c:if>>${frlist.fname}</option>
 --%>					
 					</select>
				</td>
			</tr>
			
			<tr height = "40">
				<td bgcolor = "yellow">상품명</td>
				<td>
					<input type = "text" name = "pdname" id = "pdname" required>
				</td>
			</tr>
			
			<tr height = "40">
				<td bgcolor = "yellow">가격</td>
				<td>
					<input type = "text" name = "price" id = "price" required>
				</td>
			</tr>
			
			<tr height = "40">
				<td bgcolor = "yellow">메뉴1</td>
				<td>
					<select name="mucode1">
						<option value= "">---</option>
						<option value= "C01" <c:if test="${mulist.mucode=='C01'}">selected</c:if>>${mulist.muname}</option>
                   		<%-- <option value= "C02" <c:if test="${metalist.mtcode=='C02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "C03" <c:if test="${metalist.mtcode=='C03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C04" <c:if test="${metalist.mtcode=='C04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C05" <c:if test="${metalist.mtcode=='C05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C06" <c:if test="${metalist.mtcode=='C06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C07" <c:if test="${metalist.mtcode=='C07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C08" <c:if test="${metalist.mtcode=='C08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C09" <c:if test="${metalist.mtcode=='C09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C10" <c:if test="${metalist.mtcode=='C10'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C11" <c:if test="${metalist.mtcode=='C11'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C12" <c:if test="${metalist.mtcode=='C12'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "DR01" <c:if test="${metalist.mtcode=='DR01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "DR02" <c:if test="${metalist.mtcode=='DR02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "DR03" <c:if test="${metalist.mtcode=='DR03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR04" <c:if test="${metalist.mtcode=='DR04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR05" <c:if test="${metalist.mtcode=='DR05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR06" <c:if test="${metalist.mtcode=='DR06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR07" <c:if test="${metalist.mtcode=='DR07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR08" <c:if test="${metalist.mtcode=='DR08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR09" <c:if test="${metalist.mtcode=='DR09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR10" <c:if test="${metalist.mtcode=='DR10'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR11" <c:if test="${metalist.mtcode=='DR11'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "F01" <c:if test="${metalist.mtcode=='F01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "F02" <c:if test="${metalist.mtcode=='F02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "F03" <c:if test="${metalist.mtcode=='F03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "F04" <c:if test="${metalist.mtcode=='F04'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "DE01" <c:if test="${metalist.mtcode=='DE01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "DE02" <c:if test="${metalist.mtcode=='DE02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "DE03" <c:if test="${metalist.mtcode=='DE03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE04" <c:if test="${metalist.mtcode=='DE04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE05" <c:if test="${metalist.mtcode=='DE05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE06" <c:if test="${metalist.mtcode=='DE06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE07" <c:if test="${metalist.mtcode=='DE07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE08" <c:if test="${metalist.mtcode=='DE08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE09" <c:if test="${metalist.mtcode=='DE09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE10" <c:if test="${metalist.mtcode=='DE10'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "S01" <c:if test="${metalist.mtcode=='S01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "S02" <c:if test="${metalist.mtcode=='S02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "S03" <c:if test="${metalist.mtcode=='S03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S04" <c:if test="${metalist.mtcode=='S04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S05" <c:if test="${metalist.mtcode=='S05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S06" <c:if test="${metalist.mtcode=='S06'}">selected</c:if>>${metalist.mtname}</option> --%>
					</select>
				</td>
			</tr>
			
			<tr height = "40">
				<td bgcolor = "yellow">메뉴2</td>
				<td>
					<select name="mucode2">
						<option value= "">---</option>
						<option value= "C01" <c:if test="${mulist.mucode=='C01'}">selected</c:if>>${mulist.muname}</option>
						<%-- <option value= "C01" <c:if test="${metalist.mtcode=='C01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "C02" <c:if test="${metalist.mtcode=='C02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "C03" <c:if test="${metalist.mtcode=='C03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C04" <c:if test="${metalist.mtcode=='C04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C05" <c:if test="${metalist.mtcode=='C05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C06" <c:if test="${metalist.mtcode=='C06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C07" <c:if test="${metalist.mtcode=='C07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C08" <c:if test="${metalist.mtcode=='C08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C09" <c:if test="${metalist.mtcode=='C09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C10" <c:if test="${metalist.mtcode=='C10'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C11" <c:if test="${metalist.mtcode=='C11'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C12" <c:if test="${metalist.mtcode=='C12'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "DR01" <c:if test="${metalist.mtcode=='DR01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "DR02" <c:if test="${metalist.mtcode=='DR02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "DR03" <c:if test="${metalist.mtcode=='DR03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR04" <c:if test="${metalist.mtcode=='DR04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR05" <c:if test="${metalist.mtcode=='DR05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR06" <c:if test="${metalist.mtcode=='DR06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR07" <c:if test="${metalist.mtcode=='DR07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR08" <c:if test="${metalist.mtcode=='DR08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR09" <c:if test="${metalist.mtcode=='DR09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR10" <c:if test="${metalist.mtcode=='DR10'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR11" <c:if test="${metalist.mtcode=='DR11'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "F01" <c:if test="${metalist.mtcode=='F01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "F02" <c:if test="${metalist.mtcode=='F02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "F03" <c:if test="${metalist.mtcode=='F03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "F04" <c:if test="${metalist.mtcode=='F04'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "DE01" <c:if test="${metalist.mtcode=='DE01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "DE02" <c:if test="${metalist.mtcode=='DE02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "DE03" <c:if test="${metalist.mtcode=='DE03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE04" <c:if test="${metalist.mtcode=='DE04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE05" <c:if test="${metalist.mtcode=='DE05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE06" <c:if test="${metalist.mtcode=='DE06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE07" <c:if test="${metalist.mtcode=='DE07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE08" <c:if test="${metalist.mtcode=='DE08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE09" <c:if test="${metalist.mtcode=='DE09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE10" <c:if test="${metalist.mtcode=='DE10'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "S01" <c:if test="${metalist.mtcode=='S01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "S02" <c:if test="${metalist.mtcode=='S02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "S03" <c:if test="${metalist.mtcode=='S03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S04" <c:if test="${metalist.mtcode=='S04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S05" <c:if test="${metalist.mtcode=='S05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S06" <c:if test="${metalist.mtcode=='S06'}">selected</c:if>>${metalist.mtname}</option> --%>
					</select>
				</td>
			</tr>
			
			<tr height = "40">
				<td bgcolor = "yellow">메뉴3</td>
				<td>
					<select name="mucode3">
						<option value= "">---</option>
						<option value= "C01" <c:if test="${mulist.mucode=='C01'}">selected</c:if>>${mulist.muname}</option>
						<%-- <option value= "C01" <c:if test="${metalist.mtcode=='C01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "C02" <c:if test="${metalist.mtcode=='C02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "C03" <c:if test="${metalist.mtcode=='C03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C04" <c:if test="${metalist.mtcode=='C04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C05" <c:if test="${metalist.mtcode=='C05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C06" <c:if test="${metalist.mtcode=='C06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C07" <c:if test="${metalist.mtcode=='C07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C08" <c:if test="${metalist.mtcode=='C08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C09" <c:if test="${metalist.mtcode=='C09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C10" <c:if test="${metalist.mtcode=='C10'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C11" <c:if test="${metalist.mtcode=='C11'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "C12" <c:if test="${metalist.mtcode=='C12'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "DR01" <c:if test="${metalist.mtcode=='DR01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "DR02" <c:if test="${metalist.mtcode=='DR02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "DR03" <c:if test="${metalist.mtcode=='DR03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR04" <c:if test="${metalist.mtcode=='DR04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR05" <c:if test="${metalist.mtcode=='DR05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR06" <c:if test="${metalist.mtcode=='DR06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR07" <c:if test="${metalist.mtcode=='DR07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR08" <c:if test="${metalist.mtcode=='DR08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR09" <c:if test="${metalist.mtcode=='DR09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR10" <c:if test="${metalist.mtcode=='DR10'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DR11" <c:if test="${metalist.mtcode=='DR11'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "F01" <c:if test="${metalist.mtcode=='F01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "F02" <c:if test="${metalist.mtcode=='F02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "F03" <c:if test="${metalist.mtcode=='F03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "F04" <c:if test="${metalist.mtcode=='F04'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "DE01" <c:if test="${metalist.mtcode=='DE01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "DE02" <c:if test="${metalist.mtcode=='DE02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "DE03" <c:if test="${metalist.mtcode=='DE03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE04" <c:if test="${metalist.mtcode=='DE04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE05" <c:if test="${metalist.mtcode=='DE05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE06" <c:if test="${metalist.mtcode=='DE06'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE07" <c:if test="${metalist.mtcode=='DE07'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE08" <c:if test="${metalist.mtcode=='DE08'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE09" <c:if test="${metalist.mtcode=='DE09'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "DE10" <c:if test="${metalist.mtcode=='DE10'}">selected</c:if>>${metalist.mtname}</option>
                 		
                 		<option value= "S01" <c:if test="${metalist.mtcode=='S01'}">selected</c:if>>${metalist.mtname}</option>
                   		<option value= "S02" <c:if test="${metalist.mtcode=='S02'}">selected</c:if>>${metalist.mtname}</option>
                  		<option value= "S03" <c:if test="${metalist.mtcode=='S03'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S04" <c:if test="${metalist.mtcode=='S04'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S05" <c:if test="${metalist.mtcode=='S05'}">selected</c:if>>${metalist.mtname}</option>
                 		<option value= "S06" <c:if test="${metalist.mtcode=='S06'}">selected</c:if>>${metalist.mtname}</option> --%>
					</select>
				</td>
			</tr>
			
			<tr height = "40">
				<td bgcolor = "yellow">해시태그</td>
				<td>
					<input type = "text" name = "hashtag" id = "hashtag">
				</td>
			</tr>
 			
			<tr height="40">
				<td bgcolor="yellow">이미지 업로드</td> <!-- refresh 필요 -->
				<td>
					<input type="file" name="uploadfilef" id = "uploadfilef"> <!-- 폼에서 읽어들이는 값 -->
				<br>
					<img src ="" class="select_img"/>
					<script>
						$("#uploadfilef").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img").attr("src", data.target.result)
										.width(300).height(300);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script>
				</td>
			</tr> 
			
			<tr height = "40">
				<td></td>
				<td>
					<input type="submit" id = "submit" value="등록">&nbsp;
			    	<input type="reset"  value="취소">&nbsp;
			</tr>
		</table>
	</form>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>