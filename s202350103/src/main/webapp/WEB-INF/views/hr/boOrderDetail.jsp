<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		// 취소처리 (1 -> 5)
		function statusCancellation(p_order_num) {
			// 확인용
			// alert("statusCancellation p_order_num -> "+p_order_num);
			
			if("${orderr.o_status}" == 1) {
				$.ajax(
						{
							url : "/statusCancellation",
							data : {o_order_num : p_order_num},
							dataType : 'text',
							success : function(data) {
								// 확인용
								// alert('statusCancellation data -> '+data);
								if(data == "1"){
									alert('취소 처리 완료되었습니다.');
									//$('#o_status').load(location.href+' #o_status');
									location.reload();
								}
							}
						}	
				)
			} else {
				alert('주문확정 상태일 때만 취소 처리 가능합니다.');
			}
		}
		// 배송완료 (2 -> 3)
		function statusDelivered(p_order_num) {
			// 확인용
			// alert("statusDelivered p_order_num -> "+p_order_num);
			
			if("${orderr.o_status}" == 2) {
				$.ajax(
						{
							url : "/statusDelivered",
							data : {o_order_num : p_order_num},
							dataType : 'text',
							success : function(data) {
								// 확인용
								// alert('statusDelivered data -> '+data);
								if(data == "1"){
									alert('배송완료 처리 완료되었습니다.');
									location.reload();
								}
							}
						}	
				)
			} else {
				alert('배송중 상태일 때만 배송완료 처리 가능합니다.');
			}
		}
		// 구매확정 (3 -> 4)
		function statusConfirmation(p_order_num) {
			// 확인용
			// alert("statusConfirmation p_order_num -> "+p_order_num);
			
			if("${orderr.o_status}" == 3) {
				$.ajax(
						{
							url : "/statusConfirmation",
							data : {o_order_num : p_order_num},
							dataType : 'text',
							success : function(data) {
								// 확인용
								// alert('statusConfirmation data -> '+data);
								if(data == "1"){
									alert('구매확정 처리 완료되었습니다.');
									location.reload();
								}
							}
						}	
				)
			} else {
				alert('배송완료 상태일 때만 구매확정 처리 가능합니다.');
			}
		}
		// 발송처리 (1 -> 2)
		function statusShipping(p_order_num) {
			// 확인용
			// alert("statusShipping p_order_num -> "+p_order_num);
			
			if("${orderr.o_status}" == 1) {
				window.open("/boShippingPopup?o_order_num=${orderr.o_order_num}",
							"발송처리",
							"width=500 height=400");
			} else {
				alert('주문확정 상태일 때만 발송 처리 가능합니다.');
			}
		}
		
		// 교환처리 (3 -> 6)
		function statusExchange(p_order_num) {
			// 확인용
			// alert("statusExchange p_order_num -> "+p_order_num);
			
			if("${orderr.o_status}" == 3) {
				window.open("/boExchangePopup?o_order_num=${orderr.o_order_num}",
							"교환처리",
							"width=500 height=400");
			} else {
				alert('배송완료 상태일 때만 교환 처리 가능합니다.');
			}
		}
		
		// 반품처리 (3 -> 7)
		function statusReturn(p_order_num) {
			// 확인용
			// alert("statusReturn p_order_num -> "+p_order_num);
			
			if("${orderr.o_status}" == 3) {
				window.open("/boReturnPopup?o_order_num=${orderr.o_order_num}",
							"반품처리",
							"width=500 height=400");
			} else {
				alert('배송완료 상태일 때만 반품 처리 가능합니다.');
			}
		}
		
		// 주문상품목록
		function ProductPopup(p_order_num) {
			// 확인용
			// alert("ProductPopup p_order_num -> "+p_order_num);
			
			window.open("/boOrderDetail/List?o_order_num=${orderr.o_order_num}",
						"주문 상품 목록",
						"width=500 height=400");
		}
	</script>
	<style type="text/css">
		.table-light {text-align: center;}
		
		.order-operating-buttons > input {margin-left: 5px;}
	</style>
</head>
<body>
<div class="row">
<div class="col-30" style="width: 1200px; margin-left: 95px;">
      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">주문 상세</h1>
      </div>
      <div>
         <!-- table -->
           <!-- Button -->
           <div class="order-operating-buttons"
           		style="display:flex; justify-content:right;">
              <input type="button" class="btn btn-success mb-2" value="발송"    onclick="statusShipping(${orderr.o_order_num})">
              <input type="button" class="btn btn-success mb-2" value="배송완료" onclick="statusDelivered(${orderr.o_order_num})">
              <input type="button" class="btn btn-success mb-2" value="구매확정" onclick="statusConfirmation(${orderr.o_order_num})">
              <input type="button" class="btn btn-success mb-2" value="취소"    onclick="statusCancellation(${orderr.o_order_num})">
              <input type="button" class="btn btn-success mb-2" value="교환"    onclick="statusExchange(${orderr.o_order_num})">
              <input type="button" class="btn btn-success mb-2" value="반품"    onclick="statusReturn(${orderr.o_order_num})">
           </div>
           
         <!-- 주문 정보 -->
         <div class="table-responsive">
            <table class="table text-nowrap">
            <tr>
            	<td style="padding: 16px 24px 8px 24px;"><h4 style="margin: 10px 0px 0px;">주문 정보</h4></td>
            </tr>
            <tr>
                     <th class="table-light" width="200px">주문번호</th>
                     <td class="align-middle" width="500px">${orderr.o_order_num}</td>
                     <th class="table-light" width="200px">주문일시</th>
                     <td class="align-middle" width="400px"><fmt:formatDate value="${orderr.o_order_date}" type="both"/></td>
            </tr>
            <tr>
                     <th class="table-light">주문상태</th>
                     <td class="align-middle" id="o_status">
                     	<c:choose>
                     		<c:when test="${orderr.o_status == 0}">주문접수</c:when>
                     		<c:when test="${orderr.o_status == 1}">주문확정</c:when>
                     		<c:when test="${orderr.o_status == 2}">배송중</c:when>
                     		<c:when test="${orderr.o_status == 3}">배송완료</c:when>
                     		<c:when test="${orderr.o_status == 4}">구매확정</c:when>
                     		<c:when test="${orderr.o_status == 5}">취소</c:when>
                     		<c:when test="${orderr.o_status == 6}">교환</c:when>
                     		<c:otherwise>반품</c:otherwise>
                     	</c:choose>
                     </td>
                     <th class="table-light">주문유형</th>
                     <td class="align-middle">
                     	<c:choose>
                     		<c:when test="${orderr.o_type == 1}">일반</c:when>
                     		<c:when test="${orderr.o_type == 2}">선물</c:when>
                     		<c:otherwise>수기업로드</c:otherwise>
                     	</c:choose>
                     </td>
            </tr>
            <tr>
                     <th class="table-light">결제 수단</th>
                     <td class="align-middle">
                     	<c:choose>
                     		<c:when test="${orderr.o_pay_type == 1}">카카오페이</c:when>
                     		<c:when test="${orderr.o_pay_type == 2}">토스페이</c:when>
                     		<c:otherwise>(결제 대기 중)</c:otherwise>
                     	</c:choose>
                     </td>
                     <th class="table-light">택배사/송장번호</th>
                     <td class="align-middle">
                     	<c:choose>
                     		<c:when test="${orderr.o_deliv_com == 1}">대한통운</c:when>
                     		<c:when test="${orderr.o_deliv_com == 2}">우체국택배</c:when>
                     		<c:when test="${orderr.o_deliv_com == 3}">로젠택배</c:when>
                     		<c:when test="${orderr.o_deliv_com == 4}">한진택배</c:when>
                     		<c:when test="${orderr.o_deliv_com == 5}">한진택배</c:when>
                     		<c:otherwise>(발송 대기 중)</c:otherwise>
                     	</c:choose>
                     	<c:choose>
                     		<c:when test="${orderr.o_deliv_track == 0}"></c:when>
                     		<c:otherwise> / ${orderr.o_deliv_track}</c:otherwise>
                     	</c:choose>
                     </td>
            </tr>

         <!-- 상품 정보 -->
            <tr>
            	<td style="padding: 16px 24px 8px 24px;"><h4 style="margin: 10px 0px 0px;">상품 정보</h4></td>
            </tr>
            <tr>
                     <th class="table-light">대표 상품명</th>
                     <td class="align-middle">
                        ${orderr.nb_title} 
                        <c:if test="${orderr.o_book_count != 1}"> 외 ${orderr.o_book_count -1}건</c:if>
                        &nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-soft-success btn-sm mb-2" onclick="ProductPopup(${orderr.o_order_num})">전체 상품 보기</button>
                     </td>                     
                     <th class="table-light">주문수량</th>
                     <td class="align-middle"><fmt:formatNumber value="${orderr.o_order_count}" groupingUsed="true"/></td>
            </tr>
            <tr>
                     <th class="table-light">상품금액</th>
                     <td class="align-middle"><fmt:formatNumber value="${orderr.o_order_price}" groupingUsed="true"/></td>
                     <th class="table-light">결제금액</th>
                     <td class="align-middle"><fmt:formatNumber value="${orderr.o_pay_price}" groupingUsed="true"/></td>
            </tr>
            <tr>
                     <th class="table-light">사용 포인트</th>
                     <td class="align-middle">
                     	<c:choose>
                     		<c:when test="${orderr.o_point == 0}">
                     			(미사용)
                     		</c:when>
                     		<c:otherwise>
                     			<fmt:formatNumber value="${orderr.o_point}" groupingUsed="true"/>P
                     		</c:otherwise>
                     	</c:choose> 
                     </td>
                     <th class="table-light">배송비</th>
                     <td class="align-middle">
                     	<c:choose>
							<c:when test="${orderr.o_order_price > 50000}">
								무료 배송
							</c:when>
							<c:otherwise>
								3,000 원
							</c:otherwise>
						</c:choose>
                     </td>
            </tr>

         <!-- 주문자 정보 -->
            <tr>
            	<td style="padding: 16px 24px 8px 24px;"><h4 style="margin: 10px 0px 0px;">주문자 정보</h4></td>
            </tr>
            <tr>
                     <th class="table-light">아이디</th>
                     <td class="align-middle">${orderr.m_id}</td>
                     <th class="table-light">이름</th>
                     <td class="align-middle">${orderr.m_name}</td>
            </tr>
            <tr>
                     <th class="table-light">전화번호</th>
                     <td class="align-middle">${orderr.m_ph}</td>
            </tr>

         <!-- 수신자 정보 -->
            <tr>
            	<td style="padding: 16px 24px 8px 24px;"><h4 style="margin: 10px 0px 0px;">수신자 정보</h4></td>
            </tr>
            <tr>
                     <th class="table-light">이름</th>
                     <td class="align-middle">${orderr.o_rec_name}</td>
                     <th class="table-light">전화번호</th>
                     <td class="align-middle">${orderr.o_rec_ph}</td>
            </tr>
            <tr>
                     <th class="table-light">배송지</th>
                     <td class="align-middle">${orderr.o_rec_addr}</td>
                     <th class="table-light">배송메시지</th>
                     <td class="align-middle">${orderr.o_rec_msg}</td>
            </tr>
            </table>
         </div>
         
	  <div style="display:flex; justify-content:center;">
         <input type="button" class="btn btn-secondary mb-2" value="목록가기"
		   	    onclick="location.href='boOrderList?currentPage=${currentPage }'">
	  </div>
         
 </div>
</div>
</div>
</body>
</html>