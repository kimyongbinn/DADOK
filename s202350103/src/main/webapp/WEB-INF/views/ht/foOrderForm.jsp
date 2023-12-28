<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #k {
    border: 1px solid #ccc; /* 태두리 스타일 및 색상 지정 */
    border-radius: 10px; /* 라운드 처리 */
    text-align: center; /* 텍스트 중앙 정렬 */
  }

  .nav-link {
    padding: 10px; /* 옆 여백 추가 */
  }
</style>

 <!-- 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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
    }
</script>	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	function changePaymentType(select){
		if(select == 1){
			$('#o_pay_type').val(select);
		} else if(select == 2){
			$('#o_pay_type').val(select);
		}
	}

	function selStatus(selTab) {
		$('#o_selTab').val(selTab);  // Input Tag
		
		if (selTab === 1) {
            $('#destination1').show();
            $('#destination2').hide();
        } else if (selTab === 2) {
            $('#destination1').hide();
            $('#destination2').show();
        }
	}
	
	// 이름 유효성 검사
	function nameCk(name) {
		// 특수문자 제외, 영문 대소문자,한글, 공백 허용
		var regex = /^[a-zA-Z가-힣\s]+$/;
		
		 if(!regex.test(name)){
	        	alert("이름에는 특수문자가 포함 될 수 없습니다.");
	        	$("#o_rec_name").val("");
	        	$('#o_rec_name').focus();
     	} 
	}
	
	// 이메일 유효성 검사
	function mailCk(mail) {
		// 특문 제외 영문숫자와 마침표. 만 허용
		var regex = /^[a-zA-Z0-9.]+$/;
		
		if(!regex.test(mail) || !regex.test(mail)){
    		alert("이메일은 영문자와 숫자로만 작성해주세요.");
    		$("#o_rec_mail1").val("");
    		$("#o_rec_mail2").val("");
            $('#o_rec_mail1').focus();
    	}
	}
	
	// 전화번호 유효성 검사
	function phCk() {
		var o_rec_ph1 =  $('#destination2 #o_rec_ph1').val();
		var o_rec_ph2 =  $('#destination2 #o_rec_ph2').val();
		var o_rec_ph3 =  $('#destination2 #o_rec_ph3').val();
		// 숫자만 
		// ph1 은 010 까지 이므로 3자리까지 허용
		var regex1 = /^(02|010|031|[0-9]{3})$/;
		// ph2, 3은 4자리
		var regex = /^[0-9]{4}$/;

		if (!regex1.test(o_rec_ph1)) {
			alert("전화번호는 숫자로 입력하세요.");
			$("#o_rec_ph1").val("");
			$('#o_rec_ph1').focus();
			return;
		} 
		
		if(o_rec_ph2 !== "" && !regex.test(o_rec_ph2)) {
			alert("전화번호는 숫자로 입력하세요.");
			$("#o_rec_ph2").val("");
			$('#o_rec_ph2').focus();
			return;
		} 
		
		if(o_rec_ph3 !== "" && !regex.test(o_rec_ph3)) {
			alert("전화번호는 숫자로 입력하세요.");
			$("#o_rec_ph3").val("");
			$('#o_rec_ph3').focus();
			return;
		} 
	}
	
	// 포인트 유효성 검사
	function pointCk() {
		
	}
		
	function orderActionController() {
		// 공통
		var sendData1 =  $('#orderActionForm').serialize();
		var sendData2;
		var sendData3;
		var sendData4;
		var sendData5;
		var omessage;
		var selectedMessage = $('#omessage_select').val();
		var o_selTab = $('#o_selTab').val();
		
		
		
		
		if(o_selTab == '2'){
	        if(($("#destination2 #o_rec_name").val()) == ""){
	            alert("이름을 입력하세요!!")
	            $('#o_rec_name').focus();
	        } else if(($("#destination2 #o_rec_mail1").val()) == ""){
        		alert("메일을 입력하세요!!")
	            $('#o_rec_mail1').focus();
        	} else if(($("#destination2 #o_rec_mail2").val()) == ""){
        		alert("메일을 입력하세요!!")
	            $('#o_rec_mail2').focus();
        	}  else if(($("#destination2 #sample6_postcode").val()) == ""){
        		alert("주소를 입력하세요!!")
	            $('#sample6_postcode').focus();
        	} else if(($("#destination2 #sample6_detailAddress").val()) == ""){
        		alert("상세주소를 입력하세요!!")
	            $('#sample6_detailAddress').focus();
        	} else if(($("#destination2 #o_rec_ph1").val()) == ""){
        		alert("전화번호를 입력하세요!!")
	            $('#o_rec_ph1').focus();
        	} else if(($("#destination2 #o_rec_ph2").val()) == ""){
        		alert("전화번호를 입력하세요!!")
	            $('#o_rec_ph2').focus();
        	} else if(($("#destination2 #o_rec_ph3").val()) == ""){
        		alert("전화번호를 입력하세요!!")
	            $('#o_rec_ph3').focus();
        	} else {
        		if ($('#o_pay_type').val() != 1 && $('#o_pay_type').val() != 2){
    				$('#radio').focus();
    				alert("결제방식을 선택해주세요!!")
    			} else {
    				if (o_selTab == '1') {
    					sendData2 =  $('#destination1').serialize();
    					
    				}else {
    					sendData2 =  $('#destination2').serialize();

    				}
    				sendData3 = sendData1+"&"+sendData2;
    				
    				if($('#omessage_select').val() == "직접 입력"){
    					omessage =  $('#omessage').val();
    					sendData4 = "o_rec_msg=" + omessage;
    				} else {
    					sendData4 = "";
    				}
    				//alert(sendData4);
    				sendData5 = sendData3+"&"+sendData4;
    				//alert(sendData5);
    				location.href= "orderAction?"+sendData5;	
    			}
        	}
	        
		} else {
			if ($('#o_pay_type').val() != 1 && $('#o_pay_type').val() != 2){
				$('#radio').focus();
				alert("결제방식을 선택해주세요!!")
			} else {
				if (o_selTab == '1') {
					sendData2 =  $('#destination1').serialize();
					
				}else {
					sendData2 =  $('#destination2').serialize();

				}
				sendData3 = sendData1+"&"+sendData2;
				
				if($('#omessage_select').val() == "직접 입력"){
					omessage =  $('#omessage').val();
					sendData4 = "o_rec_msg=" + omessage;
				} else {
					sendData4 = "";
				}
				//alert(sendData4);
				sendData5 = sendData3+"&"+sendData4;
				//alert(sendData5);
				location.href= "orderAction?"+sendData5;	
			}
		}
	}

	
	
	function changeChk(p_point){
		//var regex = /^[0-9][0-9]*$/;
		var regex = /^0$|^[1-9][0-9]*$/;
		if(!regex.test(p_point)){
			alert("숫자(양수)로 입력하세요.");
			$("#o_point2").val("");
			$('#o_point2').focus();
			return;
		}
		
		var p_point_result		= Number(p_point);                      							// 사용 포인트
		var p_total_price		= Number(${cart.totalPrice});										// 총 상품 금액
		var p_deliv_price 		= Number(${cart.o_deliv_price});									// 배송비
		var success_total_price = (p_total_price + p_deliv_price - p_point_result).toLocaleString();// 총 결제 금액(성공)
		var success_save_pointy = ((p_total_price + p_deliv_price - p_point_result) * 0.01).toLocaleString();// 적립금(성공)
		var fail_total_price 	= (p_total_price + p_deliv_price).toLocaleString();					// 총 결제 금액(성공)
		var fail_save_point 	= ((p_total_price + p_deliv_price) * 0.01).toLocaleString();  		// 적립금(실패)
		
		if(Number(p_point) < 0 ) {
			$("#pointMsg").html("양수값만 입력 가능합니다.");
			$("#o_point_result").html("");
			$("#o_point").val(0);
			$("#o_point2").val("");
			$("#o_pay_price").html(fail_total_price);
			$("#o_deliv_price_submit").html(fail_total_price);
			$("#o_point_save").html(fail_save_point);
		} else if(Number(p_point) <= Number('${member.m_point}') ){
			// 가능 여부 메세지
			$("#pointMsg").html("사용 가능합니다.");
			// 포인트 사용값
			$("#o_point_result").html(p_point_result);
			// 최종 결제 금액
			$("#o_pay_price").html(success_total_price);
			$("#o_pay_price_submit").html(success_total_price);
			// 적립금(성공)
			let replaced_success_save_pointy = success_save_pointy.replace(/,/g, '');
	
			$("#o_point_save").html(parseInt(replaced_success_save_pointy, 10));
			$('#o_point').val(p_point);
		} else {
			//alert("else...");
	
			$("#pointMsg").html("보유 포인트보다 많이 사용할 수 없습니다.");
			$("#o_point_result").html("");
			$("#o_point").val(0);
			$("#o_point2").val("");
			$("#o_pay_price").html(fail_total_price);
			$("#o_deliv_price_submit").html(fail_total_price);
			$("#o_point_save").html(fail_save_point);
		}
	}
	
	function chk() {
		return false;
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
            <h3 class="mb-10" style="text-align: center;">주문하기</h3><p>
          </div>
          <!-- col -->
        <div class="offset-lg-2 col-lg-8 col-12">
          <h5 class="h5">배송지</h5><p>
          <!-- form -->
         
          	<div class="col-md-12 mb-3">
          		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				  <li class="nav-item col" id="k">
				    <a class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" href="#pills-home" 
				                               role="tab" aria-controls="pills-home" 
				                               onclick="selStatus(1)"
				                               aria-selected="true">나의 배송지</a>
				  </li>
				  <li class="nav-item col" id="k">
				    <a class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" href="#pills-profile" 
				                        role="tab" aria-controls="pills-profile" 
				                         onclick="selStatus(2)"
				                        aria-selected="false">직접 입력</a>
				                        
				  </li>
				</ul>
				<div class="tab-content" id="pills-tabContent">
				
				   <!-- 최근 배송지 -->
				 <form action="orderAction" id="destination1" style="display: block" >
				    <input type="hidden" name="o_rec_name"  value="${member.m_name }">
		            <input type="hidden" name="o_rec_addr"  value="${member.m_addr }">
		            <input type="hidden" name="o_rec_ph"    value="${member.m_ph }">
		            <input type="hidden" name="o_rec_mail" value="${member.m_email }">
		            <input type="hidden" name="destination" value=1>
				  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
		            <div class="col-md-12 mb-3">
		              <label class="form-label"> 이름</label>
		              <h6 class="h6">${member.m_name }</h6>
		            </div>
		            <div class="col-md-12 mb-3">
		              <label class="form-label"> 이메일</label>
		              <h6 class="h6">${member.m_email }</h6>
		            </div>
		            <div class="col-md-12 mb-3">
		              <!-- input -->
		              <label class="form-label"> 주소</label>
		              <h6 class="h6">${splitAddr[0]} ${splitAddr[1]}</h6>
	              	  <h6 class="h6">${splitAddr[2]}</h6>
		            </div>
		            <div class="col-md-12 mb-3">
		              <!-- input -->
		              <label class="form-label"> 휴대전화</label>
		              <h6 class="h6">${member.m_ph }</h6>
		            </div>
				  </div>
				 </form>
				   
				 <!-- 직접 입력 -->
				 <form action="orderAction" id="destination2" style="display: none">
				  <input type="hidden" name="destination" value=2>
				  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
				  	<div class="col-md-12 mb-3">
		              <label class="form-label" for="o_rec_name"> 이름<span class="text-danger">*</span></label>
		              <input type="text" id="o_rec_name" class="form-control" name="o_rec_name" placeholder="홍길동" required  style="width: 150px;" onchange="nameCk(o_rec_name.value)">
		            </div>
		            <div class="col-md-12 mb-3">
		              <label class="form-label" for="o_rec_mail"> 이메일<span class="text-danger">*</span></label>
		              <div class="form-group">
					    <div class="d-flex">
					     <input type="email" id="o_rec_mail1" name=m_email1 class="form-control" placeholder="abc" required style="width: 200px;" onchange="mailCk(o_rec_mail1.value)"> 
					     <span class="mx-1"> @ </span>
					     <input type="email" id="o_rec_mail2" name="m_email" class="form-control" placeholder="naver.com" required style="width: 200px;" onchange="mailCk(o_rec_mail2.value)">
					    </div>
		              </div>
		            </div>  
		              
		            <div class="col-md-12 mb-3">
			              <label class="form-label" for="sample6_postcode"> 주소<span class="text-danger">*</span></label><br>
			            <label class="form-label" for="o_rec_name">
		                	<input type="text" id="sample6_postcode"  name="m_addr1" class="form-control" placeholder="우편번호" readonly>
		                </label>
		                <label class="form-label" for="o_rec_name">
							<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: lightgray;" >
						</label><br>
						<label class="form-label" for="o_rec_name">
							<input type="text" id="sample6_address" name="m_addr2" class="form-control" placeholder="주소" readonly>
						</label><br>
						<label class="form-label" for="o_rec_name">
							<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" readonly>
						</label><br>
						<label class="form-label" for="o_rec_name">
							<input type="text" id="sample6_detailAddress" name="m_addr" class="form-control" placeholder="상세주소" required="required" >
						</label>
		            </div>
		            
		            <div class="col-md-12 mb-3">
		              <!-- input -->
		              <label class="form-label" for="o_rec_ph"> 휴대전화<span class="text-danger">*</span></label>
		              <div class="form-group">
					    <div class="d-flex">
					     <input type="tel" id="o_rec_ph1" name="m_ph1" class="form-control" placeholder="010" required onchange="phCk()">
					     <span class="mx-1">-</span>
					     <input type="tel" id="o_rec_ph2" name="m_ph2" class="form-control" placeholder="0000" required onchange="phCk()">
					     <span class="mx-1">-</span>
					     <input type="tel" id="o_rec_ph3" name="m_ph3" class="form-control" placeholder="0000" required onchange="phCk()">
					    </div>
					  </div>
		            </div>
				  </div>
				 </form>
				</div>
          	</div>
          	
 <!--  공통으로 보내줘야하는 form -->       	
        <form action="orderAction"   id="orderActionForm"  onsubmit="return chk()">
        	<input type="hidden" name="o_order_count" value="${orderList[0].quantity}">
        	<input type="hidden" name="nb_title" value="${orderList[0].nb_title}">
            <c:if test="${paymentType == 1}">
            	<c:forEach var="book" items="${orderList}">
            		<c:if test="${book.ob_num > 0}">
            			<input type="hidden" name="ob_num" value="${book.ob_num}">
            		</c:if>
            		<c:if test="${book.ob_num == 0}">
            			<input type="hidden" name="nb_num" value="${book.nb_num}">
            		</c:if>
        		</c:forEach>
        		<input type="hidden" name="paymentType" value="${paymentType}">
        	</c:if>
        	<c:if test="${paymentType == 2}">
        		<input type="hidden" name="paymentType" value="${paymentType}">
        	</c:if>
        	
          	<div class="mb-3">
			  <select class="form-select" id="omessage_select" name="o_rec_msg">
			    <option value="" selected>-- 메시지 선택 (선택사항) --</option>
			    <option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
			    <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
			    <option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
			    <option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
			    <option value="택배함에 보관해 주세요.">택배함에 보관해 주세요.</option>
			    <option value="직접 입력">직접 입력</option>
			  </select>
			</div>
			
			<div class="mb-3">
			  <div class="ec-shippingInfo-omessageInput gBlank10" style="display:none;">
			    <textarea class="form-control" id="omessage" name="ec-shippingInfo-omessageInput" fw-filter="" fw-label="배송 메세지" fw-msg="" maxlength="30" cols="50" rows="1" ></textarea>
			  </div>
			</div>
			
	<script>
	  // 직접입력 선택될 경우, o_rec_msg의 value값이 직접입력에서 textarea의 값으로 바뀌는 작업임
	    document.getElementById('omessage_select').addEventListener('change', function () {
		    var textareaDiv = document.querySelector('.ec-shippingInfo-omessageInput');
		    var selectedOption = this.options[this.selectedIndex].value;
		    var omessageTextarea = document.getElementById('omessage');
		    var omessageTextarea2 = document.getElementById('omessage_select');
		    var o_rec_msgInput = document.querySelector('[name="o_rec_msg"]');
		
		    if (selectedOption === '직접 입력') {
		      textareaDiv.style.display = 'block';
		      omessageTextarea.required = true; // 직접 입력이 선택되었을 때 필수로 설정
		      
		    } else {
		      textareaDiv.style.display = 'none';
		      omessageTextarea.required = false; // 직접 입력이 아닌 경우 필수 해제
		      o_rec_msgInput.value = selectedOption; // 선택된 값을 직접 입력 값으로 설정
		      omessageTextarea.value = ''; // 값 초기화
		    }
		    if (selectedOption === '직접 입력') {
		    	omessageTextarea2.removeAttribute('name');
		      } 
		  });
	</script>
			
          
            <p><p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p><p>
            
            <h5 class="h5">주문 상품</h5><p>
				<div class="row">
				  <div class="col-12">
				     <div style="border: 1px solid #dfe2e1;
				     			 border-radius: 0.5rem;
				     			 padding: 0.55rem 1rem;">
				     <div>
				        <!-- 주문 리스트 -->
				        <div class="card-body">
				           <div class=" row align-items-center">
				           
				           	<c:forEach var="newbook" items="${orderList}">
				              <!-- col -->
				              <div class="col-md-4 col-12">
				                 <div class="text-center position-relative ">
				                      <%--  <!-- img --><img src="${newbook.nb_image}" alt="${newbook.nb_title}" class="mb-3 img-fluid" style="height: 150px;"> --%>
				                       <c:choose>
										     <c:when test="${fn:contains(newbook.nb_image, 'http')}">
										            <img src="${newbook.nb_image}" alt="도서 ${newbook.nb_title}" class="mb-3 img-fluid" style="height: 150px;">
										     </c:when>
										     <c:otherwise>
										            <img src="${pageContext.request.contextPath}/upload/${newbook.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 150px;">
										     </c:otherwise>
										</c:choose>
				                 </div>
				              </div>
				              <div class="col-md-8 col-12 flex-grow-1">
				                 <!-- heading -->
				                 <h2 class="fs-6">
				                   <c:choose>
				                   		<c:when test="${newbook.ob_num != 0}">
				                   		  <c:choose>
											<c:when test="${newbook.ob_grade eq '0' }"><c:out value="[중고 A]"/></c:when>
											<c:when test="${newbook.ob_grade eq '1' }"><c:out value="[중고 B]"/></c:when>
											<c:when test="${newbook.ob_grade eq '2' }"><c:out value="[중고 C]"/></c:when>
											<c:when test="${newbook.ob_grade eq '3' }"><c:out value="[중고 D]"/></c:when>
										    <c:otherwise><c:out value="kkk"/></c:otherwise>
									      </c:choose>
				                   		</c:when>
				                   </c:choose>
									 ${newbook.nb_title}
				                 </h2>
				                 
				                 
				                <%--  <h2 class="fs-6">${newbook.nb_title}</h2> --%>
				                 
				                 <c:if test="${paymentType == 1}">
				                 	<div class="text-small mb-1"><small><fmt:formatNumber value="${newbook.c_count}" groupingUsed="true"/>개</small></div>
				                 	<input type="hidden" name="o_de_count" value="${newbook.c_count}">
				                 </c:if>
				                 <c:if test="${paymentType == 2}">
				                 	<div class="text-small mb-1"><small><fmt:formatNumber value="${newbook.c_count}" groupingUsed="true"/>개</small></div>
				                 </c:if>
				                 
				                 <div class=" mt-6">
				                    <!-- price -->
				                    <c:choose>
									     <c:when test="${paymentType == 1}">
									        <div><span class="text-dark"><fmt:formatNumber value="${cart.totalPrice}" groupingUsed="true"/>원</span></div>
									     </c:when>
									     <c:otherwise>
									        <div><span class="text-dark"><fmt:formatNumber value="${newbook.nb_price * newbook.c_count}" groupingUsed="true"/>원</span></div>
									     </c:otherwise>
									</c:choose>
				                 </div>
				              </div>
				             </c:forEach> 
				              
				           </div>
				        </div>
				     </div>
				     </div>
				  </div>
				</div>
				
            <p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p>
    
    		<h5 class="h5">할인/부가결제</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label" for="o_point"> 사용 포인트  (보유 : <fmt:formatNumber value="${member.m_point }" groupingUsed="true"/>원)</label>
              <span class="text-danger" id="pointMsg" ></span>
              <input type="text" id="o_point2" class="form-control" onchange="changeChk(o_point2.value)" value="">
              <input type="hidden" id="o_point" name="o_point" value="0">
            </div>
				
            <p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p>
            
            <h5 class="h5">결제 정보</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
            	<table style="width: 100%;">
            		<tr height="40px">
            			<td class="form-label" width="70%">
            				상품금액
            			</td>
            			<td class="h6" width="30%" align="right">
            				<fmt:formatNumber value="${cart.totalPrice}" groupingUsed="true"/> 원
            				
            			</td>
            		</tr>
            		<tr height="40px">
            			<td class="form-label" width="70%">배송비</td>
            			<td class="h6" width="30%" align="right">
            				<c:if test="${cart.o_deliv_price == 3000}">
            					<fmt:formatNumber value="${cart.o_deliv_price}" groupingUsed="true"/> 원
            				</c:if>
            				<c:if test="${cart.o_deliv_price == 0}">
            					<span style="font-weight: bold; color: blue;">무료배송</span>
            				</c:if>
            			</td>
            		</tr>
            		<tr height="40px">
            			<td class="form-label" width="70%">할인/부가결제</td>
            			<td class="h6" width="30%" align="right">
            				<span id="o_point_result">0</span> 원
            			</td>
            		</tr>
            		<tr style="border-top: 1px solid #dfe2e1;
            				   border-bottom: 1px solid #dfe2e1;
            				   height: 60px">
            			<td class="text-danger" width="70%">최종 결제 금액</td>
            			<td class="text-danger" width="30%" align="right">
            				<span id="o_pay_price">
            					<fmt:formatNumber value="${cart.totalPrice + cart.o_deliv_price}" groupingUsed="true"/>
            				</span> 원
            			</td>
            		</tr>
            		
            		<tr height="40px">
            			<td class="form-label" width="70%">적립 혜택</td>
            			<td class="h6" width="30%" align="right">
            				<span id="o_point_save">
            					<%-- <fmt:formatNumber value="${(cart.totalPrice + cart.o_deliv_price) * 0.01}" groupingUsed="true"/> --%>
            					<fmt:formatNumber value="${(cart.totalPrice + cart.o_deliv_price) * 0.01}" groupingUsed="true" maxFractionDigits="0"/>
            				</span> 원
            			</td>
            		</tr>
            	</table>
            </div>
            
            <p><p><hr class="my-4" style="border-width: 2px; border-color: #333;"><p><p>
            
            <h5 class="h5">결제 수단</h5><p>
            	<div class="d-grid gap-2 col-6 mx-auto">
	            	<tr >
						<td><button id="radio" type="radio"  name="paymentMethod" onclick="changePaymentType(1)" value="1" class="btn btn-soft-secondary mb-2" required>카카오</button>
							<!-- <button type="radio"  name="paymentMethod" onclick="changePaymentType(2)" value="2" class="btn btn-soft-secondary mb-2">토스</button> -->
						</td>
					</tr>
            	</div>
            	
            
            <input type="hidden" id="o_pay_price_submit"   name="o_pay_price"   value="${cart.totalPrice + cart.o_deliv_price}">
            <input type="hidden" id="o_deliv_price_submit" name="o_deliv_price" value="${cart.o_deliv_price}">
            <input type="hidden" id="o_pay_type" name="o_pay_type" value="0">
            <input type="hidden" name="o_selTab"   id="o_selTab" value="1">
            
            <p><p><p><p><p><p>
            
            <div class="d-grid gap-2">
	            <input class="btn btn-primary" type="button" value="결제하기" onclick="orderActionController()">
            </div>
<!--  공통으로 보내줘야하는 form -->
       </form>

        </div>
      </div>
    </div>

  </section>


<%@ include file="../common/footerFo.jsp" %>
</body>
</html>