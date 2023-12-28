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
		// 체크박스 전체 체크 & 해제
		function checkAll(){
			if($('input[name="checkAll"]').prop("checked")) {
				$('input[name="checkBox"]').prop("checked", true);
			} else {
				$('input[name="checkBox"]').prop("checked", false);
			}
		}
		
		// 전체 체크 상태에서 일부 해제 시 thead 체크박스 해제
		function clickCheckbox(){
			if($('input[name="checkBox"]:checked').length == 10){
				$('input[name="checkAll"]').prop("checked", true);
			} else {
				$('input[name="checkAll"]').prop("checked", false);
			}
		}
		
		// 체크박스 checked 이벤트 확인용
		// function cbChecked(index) {
		// 	$('input[name="checkBox"]:checked').each(function(){
		// 		alert($('#o_order_num'+index).val());
		// 	});
		// }
		
		// 발송처리 (1 -> 2)
		function statusShipping() {
			// alert("체크 수 : " + $('input[name="checkBox"]:checked').length);
			
			// 체크 수 = 1일 때만 동작
			if($('input[name="checkBox"]:checked').length == 1){
				
				// 확인창
				if(confirm("발송 처리하시겠습니까?")){
					// 체크된 row의 index, o_order_num, o_status GET
					$('input[name="checkBox"]:checked').each(function(){
						// index 변수 정의
						var index = $(this).val();
						
						// index를 통해 원하는 값 도출
						// alert("statusShipping index -> "+index);
						// alert("statusShipping o_order_num -> "+$('#o_order_num'+index).val());
						// alert("statusShipping o_status -> "+$('#o_status'+index).val());
						
						// o_status가 1일 때만 동작
						if($('#o_status'+index).val() == 1) {
							// 팝업 띄움
							window.open("/boShippingPopup?o_order_num="+$('#o_order_num'+index).val(),
										"발송처리",
										"width=500 height=400");
						} else {
							alert('주문확정 상태일 때만 발송 처리 가능합니다.');
							return false;
						}
					});
				}
				
			// 체크 수 = 0일 때
			} else if($('input[name="checkBox"]:checked').length == 0) {
				alert("처리할 주문을 선택해주세요.");
				
			// 체크 수 = 1 초과일 때
			} else {
				alert("발송 처리는 1건씩 가능합니다.");
			}
		}
		
		// 교환처리 (3 -> 6)
		function statusExchange() {
			// alert("체크 수 : " + $('input[name="checkBox"]:checked').length);
			
			// 체크 수 = 1일 때만 동작
			if($('input[name="checkBox"]:checked').length == 1){

				// 확인창
				if(confirm("교환 처리하시겠습니까?")){
					// 체크된 row의 index, o_order_num, o_status GET
					$('input[name="checkBox"]:checked').each(function(){
						// index 변수 정의
						var index = $(this).val();
						
						// index를 통해 원하는 값 도출
						// alert("statusExchange index -> "+index);
						// alert("statusExchange o_order_num -> "+$('#o_order_num'+index).val());
						// alert("statusExchange o_status -> "+$('#o_status'+index).val());
						
						// o_status가 3일 때만 동작
						if($('#o_status'+index).val() == 3) {
							// 팝업 띄움
							window.open("/boExchangePopup?o_order_num="+$('#o_order_num'+index).val(),
										"교환처리",
										"width=500 height=400");
						} else {
							alert('배송완료 상태일 때만 교환 처리 가능합니다.');
							return false;
						}
					});
				}
				
			// 체크 수 = 0일 때
			} else if($('input[name="checkBox"]:checked').length == 0) {
				alert("처리할 주문을 선택해주세요.");
				
			// 체크 수 = 1 초과일 때
			} else {
				alert("교환 처리는 1건씩 가능합니다.");
			}
		}
		
		
		// 반품처리 (3 -> 7)
		function statusReturn() {
			// alert("체크 수 : " + $('input[name="checkBox"]:checked').length);
			
			// 체크 수 = 1일 때만 동작
			if($('input[name="checkBox"]:checked').length == 1){

				// 확인창
				if(confirm("반품 처리하시겠습니까?")){
					// 체크된 row의 index, o_order_num, o_status GET
					$('input[name="checkBox"]:checked').each(function(){
						// index 변수 정의
						var index = $(this).val();
						
						// index를 통해 원하는 값 도출
						// alert("statusReturn index -> "+index);
						// alert("statusReturn o_order_num -> "+$('#o_order_num'+index).val());
						// alert("statusReturn o_status -> "+$('#o_status'+index).val());
						
						// o_status가 3일 때만 동작
						if($('#o_status'+index).val() == 3) {
							// 팝업 띄움
							window.open("/boReturnPopup?o_order_num="+$('#o_order_num'+index).val(),
										"반품처리",
										"width=500 height=400");
						} else {
							alert('배송완료 상태일 때만 반품 처리 가능합니다.');
							return false;
						}
					});
				}
				
			// 체크 수 = 0일 때
			} else if($('input[name="checkBox"]:checked').length == 0) {
				alert("처리할 주문을 선택해주세요.");
				
			// 체크 수 = 1 초과일 때
			} else {
				alert("반품 처리는 1건씩 가능합니다.");
			}
		}
		
		// 취소처리 (1 -> 5)
		function statusCancellation() {
			// 체크 수 = 0일 때
			if($('input[name="checkBox"]:checked').length == 0){
				alert("처리할 주문을 선택해주세요.");
				
			// 체크 수 = 0 아닐 때만 동작
			} else {
				// 확인창
				if(confirm("취소 처리하시겠습니까?")){
					$('input[name="checkBox"]:checked').each(function(){
						// index 변수 정의
						var index = $(this).val();
					
						// o_status가 1일 때만 동작
						if($('#o_status'+index).val() == 1) {
							$.ajax(
									{
										url : "/statusCancellation",
										data : {o_order_num : $('#o_order_num'+index).val()},
										dataType : 'text',
										success : function(data) {
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
							return false;
						}
					});
				}
			}
		}
		
		// 배송완료 (2 -> 3)
		function statusDelivered() {
			// 체크 수 = 0일 때
			if($('input[name="checkBox"]:checked').length == 0){
				alert("처리할 주문을 선택해주세요.");
				
			// 체크 수 = 0 아닐 때만 동작
			} else {
				// 확인창
				if(confirm("배송완료 처리하시겠습니까?")){
					$('input[name="checkBox"]:checked').each(function(){
						// index 변수 정의
						var index = $(this).val();
					
						// o_status가 2일 때만 동작
						if($('#o_status'+index).val() == 2) {
							$.ajax(
									{
										url : "/statusDelivered",
										data : {o_order_num : $('#o_order_num'+index).val()},
										dataType : 'text',
										success : function(data) {
											// alert('statusDelivered data -> '+data);
											if(data == "1"){
												alert('배송완료 처리 완료되었습니다.');
												//$('#o_status').load(location.href+' #o_status');
												location.reload();
											}
										}
									}	
							)
						} else {
							alert('배송중 상태일 때만 취소 처리 가능합니다.');
							return false;
						}
					});
				}
			}
		}
		
		// 구매확정 (3 -> 4)
		function statusConfirmation() {
			// 체크 수 = 0일 때
			if($('input[name="checkBox"]:checked').length == 0){
				alert("처리할 주문을 선택해주세요.");
				
			// 체크 수 = 0 아닐 때만 동작
			} else {
				// 확인창
				if(confirm("구매확정 처리하시겠습니까?")){
					$('input[name="checkBox"]:checked').each(function(){
						// index 변수 정의
						var index = $(this).val();
					
						// o_status가 3일 때만 동작
						if($('#o_status'+index).val() == 3) {
							$.ajax(
									{
										url : "/statusConfirmation",
										data : {o_order_num : $('#o_order_num'+index).val()},
										dataType : 'text',
										success : function(data) {
											// alert('statusConfirmation data -> '+data);
											if(data == "1"){
												alert('구매확정 처리 완료되었습니다.');
												//$('#o_status').load(location.href+' #o_status');
												location.reload();
											}
										}
									}	
							)
						} else {
							alert('배송완료 상태일 때만 구매확정 처리 가능합니다.');
							return false;
						}
					});
				}
			}
		}
		
		// 수기 주문 업로드
		function orderUpload() {
			window.open("/boOrderUploadPopup",
						"수기 주문 업로드",
						"width=500 height=400");

		}
		
		// 수기 주문 양식 다운로드
		function orderUploadForm() {
			location.href = '/upload/hr/orderUpload_sample.csv';
		}
		
	</script>
</head>
<body>
<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">주문 목록</h1>
         <p>총 ${cnt } 건</p>
      </div>
      <div>
         <!-- table -->
  			<!-- Button -->
           <input type="button" class="btn btn-secondary mb-2" value="수기 주문 업로드"
              	  onclick="orderUpload()"
              	  style="float: right;">
           <input type="button" class="btn btn-secondary mb-2" value="수기 주문 양식 다운로드"
              	  onclick="orderUploadForm()"
              	  style="float: right; margin-right: 5px;">
  			<div class="order-operating-buttons">
              <input type="button" class="btn btn-success mb-2" value="발송"    onclick="statusShipping()">
              <input type="button" class="btn btn-success mb-2" value="배송완료" onclick="statusDelivered()">
              <input type="button" class="btn btn-success mb-2" value="구매확정" onclick="statusConfirmation()">
              <input type="button" class="btn btn-success mb-2" value="취소"    onclick="statusCancellation()">
              <input type="button" class="btn btn-success mb-2" value="교환"    onclick="statusExchange()">
              <input type="button" class="btn btn-success mb-2" value="반품"    onclick="statusReturn()">
   			</div>
         <div class="table-responsive" style="text-align: center;">
         	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>
                        <!-- form check -->
                        <div class="form-check">
                    <!-- input --><input class="form-check-input" type="checkbox" value="" id="checkAll" name="checkAll" onclick="checkAll()">
                    <!-- label --><label class="form-check-label" for="checkAll">
                    </label>
                        </div>
                     </th>
                     <th>No.</th>
                     <th>주문번호</th>
                     <th>주문상태</th>
                     <th>주문일시</th>
                     <th>대표 상품명</th>
                     <th>주문자</th>
                     <th>수신자</th>
                     <th>주문유형</th>
                  </tr>
               </thead>
               <tbody>
               <c:forEach var="orderr" items="${orderrList }" varStatus="status">
                  <tr>
                     <td class="align-middle">
                        <!-- form check -->
                        <div class="form-check">
                            <!-- input --><input class="form-check-input" type="checkbox" value="${status.index }" id="check${status.index }" name="checkBox" onclick="clickCheckbox()">
                            <!-- label --><label class="form-check-label" for="chechboxTwo"></label>
                        </div>
                     </td>
                     <!-- No. -->
                     <td class="align-middle">${num }</td>
                     <!-- 주문번호 -->
                     <td class="align-middle">
                        <div>
                        <h5 class="fs-6 mb-0"><a href="/boOrderDetail?o_order_num=${orderr.o_order_num}&currentPage=${page.currentPage }" class="text-inherit">${orderr.o_order_num}</a></h5>
                        <input type="hidden" id="o_order_num${status.index }" value="${orderr.o_order_num}">
                        </div>
                     </td>
                     <!-- 주문상태 -->
                     <td class="align-middle"><%-- ${orderr.o_status} --%>
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
                        <input type="hidden" id="o_status${status.index }" value="${orderr.o_status}">
                     </td>
                     <!-- 주문일시 -->
                     <td class="align-middle"><fmt:formatDate value="${orderr.o_order_date}" type="both"/></td>
                     <!-- 대표 상품명 -->
                     <td class="align-middle">
                     	${orderr.nb_title}
                     	<c:if test="${orderr.o_book_count != 1}"> 외 ${orderr.o_book_count -1}건</c:if>
                     </td>
                     <!-- 주문자 -->
                     <td class="align-middle">${orderr.m_name}</td>
                     <!-- 수신자 -->
                     <td class="align-middle">${orderr.o_rec_name}</td>
                     <!-- 주문유형 -->
                     <td class="align-middle"><%-- ${orderr.o_type} --%>
                     	<c:choose>
                     		<c:when test="${orderr.o_type == 1}">일반</c:when>
                     		<c:when test="${orderr.o_type == 2}">선물</c:when>
                     		<c:otherwise>수기업로드</c:otherwise>
                     	</c:choose>
                     </td>
                  </tr>
                  <c:set var="num" value="${num-1 }"></c:set>
               </c:forEach>
               </tbody>
            </table>
            
            <%-- <!-- default pagination -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <c:if test="${page.startPage > page.pageBlock }">
			    	<li class="page-item">
			    		<a class="page-link" href="boOrderList?currentPage=${page.startPage-page.pageBlock }">이전</a>
			    	</li>
			    </c:if>
			    
			    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			    	<li class="page-item">
			    		<a class="page-link" href="boOrderList?currentPage=${i }">${i }</a>
			    	</li>
			    </c:forEach>
			    
			    <c:if test="${page.endPage < page.totalPage }">
			    	<li class="page-item">
			    		<a class="page-link" href="boOrderList?currentPage=${page.startPage+page.pageBlock }">다음</a>
			    	</li>
			    </c:if>
			  </ul>
			</nav> --%>
			
            <!-- 페이지네이션 -->
            <div class="d-flex justify-content-center">
	            <nav aria-label="...">
				  <ul class="pagination">
				    <!-- 이전 -->
				    <c:if test="${page.startPage > page.pageBlock }">
					    <li class="page-item">
					      <a class="page-link" href="boOrderList?currentPage=${page.startPage-page.pageBlock }">이전</a>
					    </li>
					</c:if>
				    
				    <!-- 1~10 -->
				    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
				    	<li class="page-item">
				    		<a class="page-link" href="boOrderList?currentPage=${i }">${i }</a>
				    	</li>
				    </c:forEach>
				    
				    <!-- 다음 -->
				    <c:if test="${page.endPage < page.totalPage }">
					    <li class="page-item">
					      <a class="page-link" href="boOrderList?currentPage=${page.startPage+page.pageBlock }">다음</a>
					    </li>
				    </c:if>
				  </ul>
	            </nav>
            </div>
            
            <%-- <c:if test="${page.startPage > page.pageBlock }">
				<a href="boOrderList?currentPage=${page.startPage-page.pageBlock }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
				<a href="boOrderList?Page=${i }">[${i }]</a>
			</c:forEach>
			<c:if test="${page.endPage < page.totalPage }">
				<a href="boOrderList?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
			</c:if> --%>
	
	
         </div>
 </div>
 </div>
 </div>

</body>
</html>