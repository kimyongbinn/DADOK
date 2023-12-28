<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 주소 검색 API
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                    
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	        
            // 실행 여부 체크
            $("#execDaumPostcodeYN").val("Y");
	    }
		
		// 선물받기(submit) 전 주소 검색 API 실행 체크
		function execDaumPostcodeChk(){
			if(document.getElementById("execDaumPostcodeYN").value == "N"){
				$("#addrMsg").html("우편번호를 찾은 후 주소를 입력해주세요.");
				false;
			} else {
				true;
			}
		}
	    
	    // 배송메시지 콤보박스 onchange
	    function msgCombo(){
	    	// 선택값 확인
	    	var selectedMsg = "";
	    	$("#selectedMsg option:selected").each(function(){
	    		selectedMsg = $(this).val();
	    		return false;
	    	});
	    	// alert("selectedMsg : "+selectedMsg);
	    	
	    	// 직접 입력 선택 -> 입력란 노출 & 입력값을 $('#o_rec_msg')에 할당
	    	if(selectedMsg == "직접 입력"){
	    		$('#writedMsgDiv')[0].style.display = 'block';
	    		$('#o_rec_msg').val("");

	    	// 직접 입력 아닌 값 선택 -> 선택값을 $('#o_rec_msg')에 할당
	    	} else {
	    		$('#writedMsgDiv')[0].style.display = 'none';
	    		$('#o_rec_msg').val(selectedMsg);
	    	}
	    }
	    
	    // 배송메시지 직접입력 onchange
	    function msgDirect(){
	    	var writedMsg = document.getElementById("writedMsg").value;
	    	// alert("writedMsg : "+writedMsg);
	    	$('#o_rec_msg').val(writedMsg);
	    }
	    
		// 받는사람 이메일 입력 시 수행
		function mailChk(mail) {
			// alert("mail -> "+mail);
			const mailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(mail == ""){
				$("#mailMsg").html("이메일을 입력해주세요.");
				$("#o_rec_mail").val("");
				$("#o_rec_mail").focus();
			} else if(mailPattern.test(mail) === false){
				$("#mailMsg").html("이메일 형식이 잘못되었습니다.");
				$("#o_rec_mail").val("");
				$("#o_rec_mail").focus();
			} else {
				$("#mailMsg").html("");
			}
		}
		
		// 받는사람 휴대전화 입력 시 수행
		function phChk(ph) {
			// alert("ph -> "+ph);
			const phPattern = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			
			if(ph == ""){
				$("#phMsg").html("휴대전화를 입력해주세요.");
				$("#o_rec_ph").val("");
				$("#o_rec_ph").focus();
			} else if(phPattern.test(ph) === false){
				$("#phMsg").html("휴대전화 형식이 잘못되었습니다.");
				$("#o_rec_ph").val("");
				$("#o_rec_ph").focus();
			} else {
				$("#phMsg").html("");
			}
		}
	</script>	
</head>
<body>

  <!-- section -->
  <section class="my-lg-10 my-8">
      <!-- container -->
    <div class="container">
      <div class="row">
          <div class="mb-8">
              <!-- heading -->
            <h3 class="mb-10" style="text-align: center;">선물받기</h3><p>
          </div>
          <!-- col -->
        <div class="offset-lg-2 col-lg-8 col-12">
          <!-- 선물받기 전 -->
	          <!-- form -->
	          <form class="row" action="foGettingGiftAction" onsubmit="return execDaumPostcodeChk();">
	          
	            <h5 class="h5">메시지 카드</h5><p>
				<div class="card" style="width: 700px; margin-left: 80px;">
				   <img src="../assets/images/gift/giftcard${orderGift.o_gift_card }.png" class="card-img-top" alt="card" style="margin-top: 17px;">
				     <div class="card-body">
				       <pre><h5 class="h5" style="color: #889397;">"${orderGift.o_gift_msg }"</h5></pre>
				     </div>
				</div>
	            
	            <p><p><hr><p><p>
	               
	            <h5 class="h5">보내는 사람</h5><p>
	              <!-- input -->
	            <div class="col-md-12 mb-3">
	              <label class="form-label">이름</label>
	              <h6 class="h6">${orderr.m_name }</h6>
	            </div>
	            <div class="col-md-12 mb-3">
	              <!-- input -->
	              <label class="form-label">휴대전화</label>
	              <h6 class="h6">${orderr.m_ph }</h6>
	            </div>
	            
	            <p><p><hr><p><p>
	            
	            <h5 class="h5">받는 사람
	            	<span style="width: 10px;" class="badge bg-secondary" data-bs-toggle="tooltip" data-placement="right" title="보낸 사람이 입력한 정보를 확인 또는 수정해주세요. 주소는 새로 입력해주세요."> ? </span>
	            </h5><p>
	              <!-- input -->
	            <div class="col-md-12 mb-3">
	              <label class="form-label" for="o_rec_name">이름<span class="text-danger">*</span></label>
	              <input type="text" id="o_rec_name" class="form-control" name="o_rec_name" value="${orderr.o_rec_name }" required>
	            </div>
	            <div class="col-md-12 mb-3">
	              <label class="form-label" for="o_rec_mail">이메일<span class="text-danger">*</span></label>
              	  &nbsp;&nbsp;<span class="text-danger" id="mailMsg" ></span>
	              <input type="text" id="o_rec_mail" class="form-control" name="o_rec_mail"
	              		 value="${orderr.o_rec_mail }" required onchange="mailChk(o_rec_mail.value)">
	            </div>
	            <div class="col-md-12 mb-3">
	              <!-- input -->
	              <label class="form-label" for="o_rec_ph">휴대전화<span class="text-danger">*</span></label>
              	  &nbsp;&nbsp;<span class="text-danger" id="phMsg" ></span>
	              <input type="text" id="o_rec_ph" name="o_rec_ph" class="form-control"
	              		 value="${orderr.o_rec_ph }" required onchange="phChk(o_rec_ph.value)">
	            </div>
	            <div class="col-md-6 mb-3">
	              <!-- input -->
	              <label class="form-label" for="o_rec_addr">주소<span class="text-danger">*</span></label>
	              &nbsp;&nbsp;<span class="text-danger" id="addrMsg" ></span>
	              <input type="text" id="sample6_postcode"  name="o_rec_addr1" class="form-control" placeholder="우편번호" required readonly>
	              <label class="form-label">
	              	<input type="button" class="form-control" onclick="execDaumPostcode()" value="우편번호 찾기" style="background-color: lightgray;">
	              </label>
	              <input type="text" id="sample6_address" name="o_rec_addr2" class="form-control" placeholder="주소" required readonly>
	              <input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" readonly>
	              <input type="text" id="sample6_detailAddress" name="o_rec_addr3" class="form-control" placeholder="상세주소">
	            </div>
	            <div class="col-md-12 mb-3">
	              <label class="form-label" for="o_rec_msg">배송 메시지<span class="text-danger">*</span></label>
	              <div class="mb-3">
					  <select class="form-select" id="selectedMsg" onchange="msgCombo()">
					    <option selected>-- 선택 --</option>
					    <option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
					    <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
					    <option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
					    <option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
					    <option value="택배함에 보관해 주세요.">택배함에 보관해 주세요.</option>
					    <option value="직접 입력">직접 입력</option>
					  </select>
	              </div>
	              <div class="mb-3">
					  <div class="ec-shippingInfo-omessageInput gBlank10" id="writedMsgDiv" style="display:none;">
					    <textarea class="form-control" id="writedMsg" fw-filter="" fw-label="배송 메시지" fw-msg="" maxlength="30" cols="50" rows="1" onchange="msgDirect()"></textarea>
					  </div>
	              </div>
	              <input type="hidden" id="o_rec_msg" name="o_rec_msg" value="">
	            </div>
	            
	            <p><p><hr><p><p>
	            
	            <h5 class="h5">상품</h5><p>
					<div class="row">
					  <div class="col-12">
					     <div style="border: 1px solid #dfe2e1;
					     			 border-radius: 0.5rem;
					     			 padding: 0.55rem 1rem;">
					     <div>
					        <!-- card body -->
					        <div class="card-body">
					           <div class=" row align-items-center">
					              <!-- col -->
					              <div class="col-md-4 col-12">
					                 <div class="text-center position-relative ">
					                       <!-- img --><img src="${orderr.nb_image}" alt="${orderr.nb_title}" class="mb-3 img-fluid" style="height: 150px;">
					                 </div>
					              </div>
					              <div class="col-md-8 col-12 flex-grow-1">
					                 <!-- heading -->
					                 <h2 class="fs-6">${orderr.nb_title}</h2>
					                 <div class="text-small mb-1"><small><fmt:formatNumber value="${orderr.o_de_count}" groupingUsed="true"/>개</small></div>
					              </div>
					           </div>
					        </div>
					     </div>
					     </div>
					  </div>
					</div>
	            	
	            <p><p><p><p><p><p>
	            	
	            <div class="d-grid gap-2">
		            <input class="btn btn-primary" type="submit" value="선물받기">
	            </div>
	<!-- hidden value -->
	<input type="hidden" name="o_order_num" value="${orderr.o_order_num }"> 
	<input type="hidden" name="m_name" value="${orderr.m_name }"> 
	<input type="hidden" name="m_ph" value="${orderr.m_ph }"> 
	<input type="hidden" name="nb_title" value="${orderr.nb_title }"> 
	<input type="hidden" name="o_de_count" value="${orderr.o_de_count }"> 
	<input type="hidden" name="execDaumPostcodeYN" value="N"> 
	          </form>
	          
<%--			메일 발송용 태그
	          	<div style="border: 1px solid #dfe2e1;
					      border-radius: 0.5rem;
					      padding: 50px 50px;
					      width: 700px">
	          	<img src="../assets/images/gift/giftcard${orderGift.o_gift_card }.png" alt="card"
	          		 style="border-radius: 0.5rem;
	          		 		width: 600px">
	          	<div>
		          	<h4 style="color: #5c6c75; margin-top: 20px;">
		          		${orderGift.o_gift_msg }<br>
		          	</h4>
		          	<h5 style="color: #889397;">
		          		"${orderGift.o_gift_msg }"
					</h5>
		          	<button type="button"
		          			style="background-color: #0aad0a;
		          				   padding: 10px;
		          				   border-radius: 10px;
		          				   color: white;
		          				   margin-top: 20px;
		          				   margin-bottom: 20px;
		          				   font-weight : bold;
		          				   float: right;
		          				   width: 120px;">선물받기</button><br>
	          	</div>
	          	<span style="color: red;">
	          		* 받는 사람 정보를 정확히 입력해주세요.<br>
					* 입력 후 수락하기 버튼을 클릭해야 발송이 시작됩니다.
				</span>
	          </div> --%>
        </div>
      </div>
    </div>
  </section>

<%@ include file="../common/footerFo.jsp" %>
</body>
</html>