<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="resources/css/joinStyle.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	$(function() {
		
		$("#id").focusout(function() {
			
			// 아이디 정규식
			var idCheck = RegExp(/[a-z.0-9]/gi, '');
			var idsizeCheck = RegExp(/^{8,20}$/);
			// 비밀번호 정규식
			var pwCheck = RegExp(/^[A-Za-z0-9]{8,20}$/); 
									// {8,20} : 범위 지정
			// 이메일 검사 정규식
			var mailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
									// (/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/)
			var id = $('#id').val();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/personal/idCheck?Id='+ id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : " + data);							
					
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#iMessage").html("사용중인 아이디입니다. ");
						$("#iMessage").css("color", "red");
						$("#submit").attr("disabled", true);
						$('#id').focus();
				
				} else {
					
					if(id == "") {
						$('#iMessage').html('아이디를 입력해주세요.'); // html : 태그와 태그사이
						$('#iMessage').css('color', 'red');
						$("#submit").attr("disabled", true);
						$('#id').focus();
						return false;
					
					// 아이디 정규식 (영문, 숫자)
					} else if(!idCheck.test(id)) {
						$('#iMessage').html('영문 또는 숫자로 입력해주세요.');
						$('#iMessage').css('color', 'red');
						$("#submit").attr("disabled", true);
						$('#id').focus();
						return false;
					
					// 아이디 정규식 (8~20)
					} else if(!idsizeCheck.test(id)) {
						$('#iMessage').html('8~20자 이내로 입력해주세요.');
						$('#iMessage').css('color', 'red');
						$("#submit").attr("disabled", true);
						$('#id').focus();
						return false;
					
					/* } else if (id.replace(/[a-z.0-9]/gi, '').length > 0) {
						$('#iMessage').html('ID는 영문자와 숫자로만 입력하세요.');
						$('#id').focus();
						return false;
			
					} else if(id.length < 4) {
						$('#iMessage').html('4글자 이상 입력하세요.');
						$('#iMessage').css('color', 'red');
						$("#submit").attr("disabled", true);
						$('#id').focus();
						return false; */
						
					} else {
						$('#iMessage').html('');
						return true;
					}
					
				} // else
					
				}, error : function() { // if data
							console.log("실패");
					} // error
					
				}); // ajax
				
			}); // focusout
			
	}); // function
	</script>	
</head>
<body>
	<div id="wrap">

      <div class="top">
      </div>

        <div class="container">

          <div class="main">

            <div class="form">
              <form action="join" method="post" id = "myForm">
                <fieldset>
                  <strong class="j_title">회원가입</strong>

                <section class="joinform"> <!-- renew_joinform_v2 -->

                  <section class="agreement"> <!-- mem_agreement_wrap -->
                      <h5>
                                                  홈페이지 이용약관 동의
                      <span class="necessary">필수</span>
                      </h5>

                      <span class="agree-check">
                        <input type="checkbox" name="agreement" id="h_agreement_yes" class="home">
                         <label for="h_agreement_yes"><!-- 동의 --></label>
                      </span>

                      <div class="agreement_area">
                        <div id="privacy">
                          <p class="pri_tit" id="quick_01">제 1 조 (목적)</p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      이 약관은 “달달행” 에서 제공하는 인터넷 서비스를 이용함에 있어 “달달행” 과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
                                  </li>
                              </ul>
                          </ol>

                          <p class="pri_tit" id="quick_01">제 2 조 (정의)</p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      이용자는 약관 동의에 따라 “달달행” 이 제공하는 서비스를 받는 회원을 말합니다.
                                  </li>
                              </ul>
                          </ol>

                          <p class="pri_tit" id="quick_01">제 3 조 (회원가입)</p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      1. 이용자는 “달달행” 이 정한 가입 양식에 따라 회원정보를 기입 후약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
                                  </li>
                                  <li>
                                      2.  “달달행” 은 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
                                        (1) 이전에 회원자격을 상실한 적이 있는 경우,	다만, “달달행” 의 회원재가입 승낙을 얻은 경우는 예외로 한다.
                                        (2) 등록 내용에 허위, 기재누락, 오기가 있는 경우
                                  </li>
                                  <li>
                                      3. 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 회원정보 수정 등의 방법으로 변경사항을 알려야 합니다.
                                  </li>
                              </ul>
                          </ol>

                          <p class="pri_tit" id="quick_01">제 4 조 (회원 탈퇴 및 자격 상실 등) </p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      1. 회원은 언제든지 탈퇴를 요청할 수 있으며 “달달행” 은 이를 즉시 처리합니다.
                                  </li>
                                  <li>
                                      2. 회원이 다음 각 호의 사유에 해당하는 경우, 회원자격을 제한 및 정지시킬 수 있습니다.
                                     	 (1) 가입 신청 시 허위 내용을 등록
                                     	 (2) 다른 사람의 서비스 이용을 방해하거나 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
                                     	 (3) 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
                                  </li>
                                  <li>
                                      3. “달달행” 이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내 사유가 시정되지아니하는 경우 “달달행” 은 회원자격을 상실시킬 수 있습니다.
                                  </li>
                                  <li>
                                      4. “달달행” 이 회원자격을 상실시키는 경우 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전 최소 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
                                  </li>
                              </ul>
                          </ol>

                          <p class="pri_tit" id="quick_01">제 5 조 (개인정보보호)</p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      1. “달달행” 은 서비스제공을 위하여 필요한 최소한의 개인정보를 수집합니다.
                                  </li>
                                  <li>
                                      2. “달달행” 은 개인정보를 수집·이용 시 이용자에게 목적을 고지하고 동의를 받습니다.
                                  </li>
                                  <li>
                                      3. “달달행” 은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우이용·제공단계에서 이용자에게 목적을 고지하고 동의를 받습니다.다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
                                  </li>
                                  <li>
                                      4. “달달행” 이 이용자의 동의를 받아야 하는 경우개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처),정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며이용자는 언제든지 이 동의를 철회할 수 있습니다.
                                  </li>
                                  <li>
                                      5. 이용자는 언제든지 자신의 개인정보에 대해 열람 및 오류정정을 요구할수 있으며 “달달행” 은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우 “달달행” 은그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                                  </li>
                                  <li>
                                      6. “달달행” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
                                  </li>
                                  <li>
                                      7.  “달달행” 은 개인정보의 수집·이용·제공에 관한이용자의 동의 거절시 제한되는 서비스를 구체적으로 명시하고, 필수 항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.
                                  </li>
                              </ul>
                          </ol>

                          <p class="pri_tit" id="quick_01">제 6 조 (“달달행” 의 의무)</p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      1. “달달행” 은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하는데 최선을 다하여야 합니다.
                                  </li>
                                  <li>
                                      2. “달달행” 은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
                                  </li>
                                  <li>
                                      3. “달달행” 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
                                  </li>
                              </ul>
                          </ol>

                          <p class="pri_tit" id="quick_01">제 7 조 (회원의 ID 및 비밀번호에 대한 의무)</p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      1. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
                                  </li>
                                  <li>
                                      2. 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을인지한 경우 바로 “달달행” 에 통보하고 “달달행” 의 안내가 있는 경우그에 따라야 합니다.
                                  </li>
                              </ul>
                          </ol>

                          <p class="pri_tit" id="quick_01">제 8 조 (저작권의 귀속 및 이용제한)</p>
                          <ol class="pri_con pri_con2 mb40">
                              <ul>
                                  <li>
                                      1. “달달행” 이 작성한 저작물에 대한 저작권은 “달달행” 의 기타 지적재산권에 귀속합니다.
                                  </li>
                                  <li>
                                      2. 이용자는 “달달행” 을 이용함으로써 얻은 정보 중 “달달행” 에게 지적재산권이 귀속된정보를 “달달행” 의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 및 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
                                  </li>
                                  <li>
                                      3. “달달행” 은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우당해 이용자에게 통보하여야 합니다.
                                  </li>
                              </ul>
                          </ol>
                        </div>
                      </div>
                  </section>

                  <section class = "agreement">
                    <h5>
                      위치 기반 서비스 이용약관 동의
                      <span class="necessary">필수</span>
                    </h5>

                    <span class="agree-check">
                      <input type="checkbox" name="agreement" id="gps_agreement_yes" class="gps">
                       <label for="gps_agreement_yes"><!-- 동의 --></label>
                    </span>

                    <div class="agreement_area">
                      <div id="privacy">
                        <p class="pri_tit" id="quick_01">제 1 조 (목적)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                    본 약관은 회원에게 제공되는 “달달행” 서비스(이하 “서비스”라고 합니다)를 이용함에 있어 “달달행” 와 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 2 조 (이용약관의 효력 및 변경)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                  회원이 본 약관의 "동의하기" 버튼을 클릭하였을 경우 약관의 내용을 모두 읽고 충분히 이해하였으며 이에 동의한 것으로 간주 합니다.
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 3 조 (서비스의 내용)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                  “달달행” 이 제공하는 서비스는 아래와 같습니다.
                                </li>
                                <li>
                                  <table clas = "agreement_gps">
                                    <colgroup>
                                      <col width="">
                                      <col width="80%">
                                    </colgroup>

                                    <thead>
                                      <tr>
                                        <th scope="col">서비스 명</th>
                                        <th scope="col">서비스 내용</th>
                                      </tr>
                                    </thead>

                                    <tbody>
                                      <tr>
                                        <th scope="row"><span class="fontBold">위치 기반 서비스</span></th>
                                        <td class="taLeft">이용자의 위치를 기준으로 하거나원하는 위치상의 검색을 통해 카페에 대한 정보 제공</td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 4 조 (서비스 내용 변경 통지 등)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                   서비스 내용을 변경하거나 종료하는 경우 “달달행” 은 회원의 등록된 이메일을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다.
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 5 조 (서비스 이용의 제한 및 중지)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                    1. “달달행” 은 아래 각 호의 (1)에 해당하는 사유가 발생한 경우 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다.
                                       (1) 회원이 서비스의 운영을 고의 또는 중과실로 방해하는 경우
                                       (2) 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우
                                       (3) 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로서비스 이용에 지장이 있는 때
                                       (4) 기타 중대한 사유로 인하여 서비스 제공을 지속하는 것이 부적당하다고인정하는 경우

                                </li>
                                <li>
                                    2. “달달행” 은 위 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 사유 및 제한기간 등을 회원에게 알려야 합니다.
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 6 조 (개인위치 정보의 이용 또는 제공)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                   “달달행” 은 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 7 조 (개인위치정보주체의 권리)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                    1. 회원은 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 “달달행” 은 수집한 개인위치정보 및 이용, 제공사실 확인자료를 파기합니다.
                                </li>
                                <li>
                                    2. 회원은 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다.
                                </li>
                                <li>
                                    3. 회원은 “달달행” 에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 자료에 오류가 있는 경우 정정을 요구할 수 있습니다.
                                       이 경우 “달달행” 은 정당한 사유 없이 회원의 요구를 거절할 수 없습니다.
                                      (1) 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료
                                      (2) 본인의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제3자에게 제공된 이유 및 내용
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 8 조 (손해배상)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                    1. “달달행” 이 위치정보의 보호 및 이용 등에 관한 법률 규정을 위반한 행위로 회원에게 손해가 발생한 경우 회원은 손해배상 청구를 할 수 있습니다.
                                       회사는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.
                                </li>
                                <li>
                                    2. 회원이 본 약관의 규정을 위반하여 “달달행” 에 손해가 발생한 경우 회사는 회원에 대하여 손해배상을 청구할 수 있습니다.
                                       회원은 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 9 조 (면책)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                    1. “달달행” 은 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.
                                      (1) 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우
                                      (2) 서비스 제공을 위하여 “달달행” 와 서비스 제휴계약을 체결한 제3자의 고의적인 서비스 방해가 있는 경우
                                      (3) 회원의 귀책사유로 서비스 이용에 장애가 있는 경우
                                      (4) 제1호 내지 제3호를 제외한 기타 회사의 고의∙과실이 없는 사유로 인한 경우
                                </li>
                                <li>
                                    2. “달달행” 은 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에 대하여는 책임을 부담하지 아니합니다.
                                </li>
                            </ul>
                        </ol>

                        <p class="pri_tit" id="quick_01">제 10 조 (분쟁의 조정 및 기타)</p>
                        <ol class="pri_con pri_con2 mb40">
                            <ul>
                                <li>
                                    1. “달달행” 은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 위치정보의 보호 및 이용 등에 관한 법률 제28조의 규정에 의한 방송통신위원회에 재정을 신청할 수 있습니다.
                                </li>
                                <li>
                                    2. “달달행” 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법 제43조의 규정에 의한 개인정보분쟁조정 위원회에 조정을 신청할 수 있습니다.
                                </li>
                            </ul>
                        </ol>

                      </div>
                    </div>
                  </section>

                  <div class="input_box id">
                      <input type="text" name="id" id="id" placeholder="아이디" class="input_warn">
                      <!-- <input type = "button" value = "ID 중복확인" id = "idDup" onclick = "idDupCheck()"> -->
                      <span id = "iMessage" class = "eMessage"></span>
                  </div>

                  <div class="input_box pw">
                      <input type="password" name="password" id="password" placeholder="비밀번호" class="input_warn">
                      <!-- <input type="password" name="password" id="password" placeholder="비밀번호 확인" class="input_warn"> -->
                      <!-- <span id = "pMessage" class = "eMessage"></span> -->
                  </div>

                  <div class="input_box email">
                      <input type="text" name="email" id="email" placeholder="이메일" class="input_warn">
                      <!-- <span id = "nMessage" class = "eMessage"></span> -->
                  </div>
					
				  <div class="form_end">
				  	<input type="submit" id = "submit" value="가입">&nbsp; <!-- onclick = "return inCheck()" disabled -->
			    	<input type="reset"  value="취소">&nbsp;
			    	<!-- <input type="button" id = "ajoin" value="AxJoin"> -->
				  </div>				
                </section>
                </fieldset>
              </form>
            </div>
          </div>
        </div>
      </div>
</body>
</html>