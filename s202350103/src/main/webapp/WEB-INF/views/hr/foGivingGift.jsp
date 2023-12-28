<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		// 포인트 입력 시 수행
		function changeChk(p_point){
			//alert("보유 포인트 : ${member.m_point }");
			//alert("보유 포인트 type : "+typeof("${member.m_point }"));
			//alert("입력 포인트 : "+p_point);
			//alert("입력 포인트 type : "+typeof(p_point));
			
			// 음수 또는 숫자 아닌 값 입력 시
			if(Number(p_point) < 0){
				$("#o_point").val(0);
				$("#o_point_result").html(0);

			// 보유 포인트 이하로 입력 시
			} else if(Number(p_point) <= Number('${member.m_point }')){
				//alert("사용 가능합니다.");
				$("#pointMsg").html("사용 가능합니다.");
				
				// 결제정보의 할인/부가결제에 반영
				const p_point_result = Number(p_point).toLocaleString();
				//alert("p_point_result : "+p_point_result);
				$("#o_point_result").html(p_point_result);
				
				// 결제정보의 최종결제금액에 반영
				const p_deliv_price = Number(document.getElementById("o_deliv_price").value);
				//alert("p_deliv_price : "+p_deliv_price);
				const nb_price_sum_num = Number('${newbook.nb_price * quantity}');
				const p_pay_price = (nb_price_sum_num + p_deliv_price - p_point);
				//alert("p_pay_price : "+p_pay_price);
				const p_pay_price_result = p_pay_price.toLocaleString();
				//alert("p_pay_price_result : "+p_pay_price_result);
				$("#o_pay_price").html(p_pay_price_result);
				$("#o_pay_price_val").val(p_pay_price);
				
				// 결제정보의 적립혜택에 반영
				const p_point_save = Math.round(p_pay_price * 0.01);
				const p_point_save_result = p_point_save.toLocaleString();
				$("#o_point_save").html(p_point_save_result);
				
			// 그 외 (이상 입력 시)
			} else {
				//alert("보유 포인트보다 많이 사용할 수 없습니다.");
				$("#pointMsg").html("보유 포인트보다 많이 사용할 수 없습니다.");
				$("#o_point").val(0);
				$("#o_point_result").html(0);
			}
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
		
		// 카드1 선택 시 수행
		function selectCard1() {
			$("#card2").css({'border':'5px solid white'});
			$("#card1").css({'border':'5px solid #198754'});
			$("#o_gift_card").val(1);
		}
		
		// 카드2 선택 시 수행
		function selectCard2() {
			$("#card1").css({'border':'5px solid white'});
			$("#card2").css({'border':'5px solid #198754'});
			$("#o_gift_card").val(2);
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
            <h3 class="mb-10" style="text-align: center;">선물하기</h3><p>
          </div>
          <!-- col -->
        <div class="offset-lg-2 col-lg-8 col-12">
          <!-- form -->
          <form class="row" action="orderAction">
          
<!-- 배송비 결정 -->
<c:choose>
	<c:when test="${newbook.nb_price * quantity > 50000}">
		<c:set var="o_deliv_price" value="0"/>
		<c:set var="o_deliv_price_express" value="무료 배송"/>
	</c:when>
	<c:otherwise>
		<c:set var="o_deliv_price" value="3000"/>
		<c:set var="o_deliv_price_express" value="3,000 원"/>
	</c:otherwise>
</c:choose>
<input type="hidden" id="o_deliv_price" name="o_deliv_price" value="${o_deliv_price }">
         
            <h5 class="h5">보내는 사람</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label"> 이름</label>
              <h6 class="h6">${member.m_name }</h6>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label"> 이메일</label>
              <h6 class="h6">${member.m_email }</h6>
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label"> 휴대전화</label>
              <h6 class="h6">${member.m_ph }</h6>
            </div>
            
            <p><p><hr><p><p>
            
            <h5 class="h5">받는 사람</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label" for="o_rec_name"> 이름<span class="text-danger">*</span></label>
              <input type="text" id="o_rec_name" class="form-control" name="o_rec_name" placeholder="홍길동" required>
            </div>
            <div class="col-md-12 mb-3">
              <label class="form-label" for="o_rec_mail"> 이메일<span class="text-danger">*</span></label>
              &nbsp;&nbsp;<span class="text-danger" id="mailMsg" ></span>
              <input type="text" id="o_rec_mail" class="form-control" name="o_rec_mail"
              		 placeholder="hgd@dadok.com" required onchange="mailChk(o_rec_mail.value)">
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="o_rec_ph"> 휴대전화<span class="text-danger">*</span></label>
              &nbsp;&nbsp;<span class="text-danger" id="phMsg" ></span>
              <input type="text" id="o_rec_ph" name="o_rec_ph" class="form-control"
              		 placeholder="010-0000-0000" required onchange="phChk(o_rec_ph.value)">
            </div>
            
            <p><p><hr><p><p>
            
            <h5 class="h5">메시지 카드</h5><p>
            <div class="col-md-12 mb-3">
            	<input type="hidden" name="o_gift_card" id="o_gift_card" value="1">
            	<img alt="card1" src="../assets/images/gift/giftcard1.png" style="border-radius: 20px;
            																	  margin-right:  5px;
            																	  border: 		 5px solid #198754"
            															   onclick="selectCard1()"
            															   id="card1">
            	<img alt="card2" src="../assets/images/gift/giftcard2.png" style="border-radius: 20px;
            																	  border: 		 5px solid white"
            															   onclick="selectCard2()"
            															   id="card2"><br><p><p>
            	<textarea rows="3" name="o_gift_msg" class="form-control" placeholder="메시지를 입력해주세요." required></textarea>
            </div>
            
            <p><p><hr><p><p>
            
            <h5 class="h5">주문 상품</h5><p>
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
									<%-- <img src="${newbook.nb_image}" alt="${newbook.nb_title}" class="mb-3 img-fluid" style="height: 150px;"> --%>
									<c:choose>
									     <c:when test="${fn:contains(newbook.nb_image, 'http')}">
									            <img src="${newbook.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 150px;">
									     </c:when>
									     <c:otherwise>
									            <img src="${pageContext.request.contextPath}/upload/${newbook.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="height: 150px;">
									     </c:otherwise>
									</c:choose>
				                 </div>
				              </div>
				              <div class="col-md-8 col-12 flex-grow-1">
				                 <!-- heading -->
				                 <h2 class="fs-6">${newbook.nb_title}</h2>
				                 <div class="text-small mb-1"><small><fmt:formatNumber value="${quantity}" groupingUsed="true"/>개</small></div>
				                 <div class=" mt-6">
				                    <!-- price -->
				                    <div><span class="text-dark"><fmt:formatNumber value="${newbook.nb_price * quantity}" groupingUsed="true"/>원</span></div>
				                 </div>
				              </div>
				           </div>
				        </div>
				     </div>
				     </div>
				  </div>
				</div>
				
            <p><p><hr><p><p>
            
            <h5 class="h5">할인/부가결제</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
              <label class="form-label" for="o_point"> 사용 포인트  (보유 : <fmt:formatNumber value="${member.m_point }" groupingUsed="true"/>원)</label>
              &nbsp;&nbsp;<span class="text-danger" id="pointMsg" ></span>
              <input type="number" id="o_point" class="form-control" name="o_point"
              		 onchange="changeChk(o_point.value)" value="0" required>
            </div>
				
            <p><p><hr><p><p>
            
            <h5 class="h5">결제 정보</h5><p>
              <!-- input -->
            <div class="col-md-12 mb-3">
            	<table style="width: 100%;">
            		<tr height="40px">
            			<td class="form-label" width="70%">상품금액</td>
            			<td class="h6" width="30%" align="right"><fmt:formatNumber value="${newbook.nb_price * quantity}" groupingUsed="true"/> 원</td>
            		</tr>
            		<tr height="40px">
            			<td class="form-label" width="70%">배송비</td>
            			<td class="h6" width="30%" align="right">${o_deliv_price_express }</td>
            		</tr>
            		<tr height="40px">
            			<td class="form-label" width="70%">할인/부가결제</td>
            			<td class="h6" width="30%" align="right"><span id="o_point_result">0</span> 원</td>
            		</tr>
            		<tr style="border-top: 1px solid #dfe2e1;
            				   border-bottom: 1px solid #dfe2e1;
            				   height: 60px">
            			<td class="text-danger" width="70%">최종 결제 금액</td>
            			<td class="text-danger" width="30%" align="right">
            				<span id="o_pay_price">
            					<fmt:formatNumber value="${newbook.nb_price * quantity + o_deliv_price}" groupingUsed="true"/>
            				</span> 원
            			</td>
            		</tr>
            		<tr height="40px">
            			<td class="form-label" width="70%">적립 혜택</td>
            			<td class="h6" width="30%" align="right">
            				<span id="o_point_save">
            					<fmt:formatNumber value="${(newbook.nb_price * quantity + o_deliv_price) * 0.01}"
            									  pattern="###,###,###,###,###,###" groupingUsed="true"/>
            				</span> 원
            			</td>
            		</tr>
            	</table>
            </div>
				
            <p><p><hr><p><p>
            
            <h5 class="h5">결제 수단</h5><p>
            	<div class="d-grid gap-2 col-6 mx-auto">
					<input type="button" class="btn btn-outline-secondary mb-2" value="카카오">
            	</div>
            	
            <p><p><p><p><p><p>
            	
            <div class="d-grid gap-2">
	            <input class="btn btn-primary" type="submit" value="결제하기">
            </div>

<!-- hidden value -->
<input type="hidden" name="m_num" 		  value="${member.m_num }"> 
<input type="hidden" name="o_pay_price"   value="${newbook.nb_price * quantity + o_deliv_price}" id="o_pay_price_val"> <!-- ajax 통해 삽입 -->
<input type="hidden" name="nb_num" 		  value="${newbook.nb_num }"> 
<input type="hidden" name="nb_title" 	  value="${newbook.nb_title }"> 
<input type="hidden" name="o_de_count"    value="${quantity}"> 
<input type="hidden" name="o_order_count" value="${quantity}"> 
<input type="hidden" name="o_type" 		  value="2"> 
<input type="hidden" name="destination"   value="0"> 
<input type="hidden" name="o_pay_type"    value="1">

          </form>

        </div>
      </div>
    </div>

  </section>


<%@ include file="../common/footerFo.jsp" %>
</body>
</html>