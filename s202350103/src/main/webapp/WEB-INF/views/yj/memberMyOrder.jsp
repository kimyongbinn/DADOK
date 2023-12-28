<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<script type="text/javascript">

function cart(pNb_num) {
	var m_num = '${member.m_num}';
	$.ajax({
		url : "/cart/cartclick",
		data : {nb_num : pNb_num},
		dataType : 'text',
		success : function(data){
			if (data == '0') {
				if(confirm("장바구니에 이미 등록된 상품입니다. \n장바구니로 이동하시겠습니까?")){
					location.href = "memberCartList?m_num"+m_num;
				}
			} 
			else if(data == '1') {
				if(confirm("장바구니에 등록되었습니다. \n장바구니로 이동하시겠습니까?")){
					location.href = "memberCartList?m_num"+m_num;
				}
			} 
			else {
				location.href = data ;
			}
		}
	});
}

</script>

<head>
<style type="text/css">
.center-text {
  text-align: center; /* 텍스트 가운데 정렬 */
  position: absolute;
  left: 50%;
  font-weight: bold;
  color:black;
  transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>


<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h2 class="mb-2">주문 현황</h2>
         <p><a href="#">${member.m_id } 님의 주문 목록입니다.</a></p>
         <p>총 주문 건수 : ${totalOrderCnt }</p>
      </div>
      
      
      <c:choose>
		<c:when test="${empty orderNumGroups}">
			
			 <div class="row">
			<div class="center-text">
				주문 목록이 없습니다. <p><p>
		    <a href="innewbookList?nb_category1=1&nb_category2=0&orderType=recently" class="btn btn-soft-success ">새상품 보러가기</a>
			</div>
			</div>
			
		</c:when>
		
		<c:otherwise>
      	
      
       <div class="card-body p-6 ">
       
       
	<c:forEach var="orderNum" items="${orderNumGroups.keySet() }">
				
				<c:set var="firstOrder" value="${orderNumGroups[orderNum][0] }" />
    			<c:set var="orderDate" value="${firstOrder.o_order_date }" />
				
       <c:if test="${firstOrder.o_status != 0}">
				
				<h4 class="mb-2"><a href="#" class="link-success">
					<fmt:formatDate value="${orderDate }" pattern="yyy. MM. dd "/>
					&nbsp; 주문  &nbsp;
					</a>
						 <c:choose>
                            
                            <c:when test="${firstOrder.o_status == 0}">
				               - <span>주문취소</span>
                            </c:when>
                            
                     	    <c:when test="${firstOrder.o_status == 1}">
				               - <span style="color: #0aad0a;">주문확정</span>
                            </c:when>
                            
                            <c:when test="${firstOrder.o_status == 2}">
                     			- <span style="color: red;">배송중</span>
                            </c:when>
                            
                            <c:when test="${firstOrder.o_status == 3}">
				               - <span>배송완료</span>
                            </c:when>
                            
                            <c:when test="${firstOrder.o_status == 4}">
				               - <span>구매확정</span>
                            </c:when>
                            
                            <c:when test="${firstOrder.o_status == 5}">
				               - <span style="color: gray;">취소</span>
                            </c:when>
                            
                            <c:when test="${firstOrder.o_status == 6}">
				               - <span>교환</span>
                            </c:when>
                            
                            <c:when test="${firstOrder.o_status == 7}">
                     		   - <span>반품</span>
                            </c:when>
                        </c:choose>
						
						<c:if test="${firstOrder.o_type == 2 }">
							&nbsp;<span style="color:##889397;font-size: 15px ">(선물)</span>
						</c:if>
						
						<c:if test="${firstOrder.o_type == 3 }">
							&nbsp;<span style="color: ##889397; font-size: 15px">(수기)</span>
						</c:if>
						
						
					</h4>
					
				
				주문번호 <small style="color: #889397;">${orderNum}</small>
				
				<div class="row">
  				  <div class="col-md-6">
				 
	                 </div>
		                 
				<div class="col-md-6">
				  	<span style="float: right;  font-weight: bold; color: #044504;" class="mb-3" >
		         	 <a href="foOrderDetail?o_order_num=${orderNum}" class="link-success" style="font-size: 14px;">주문상세보기
		         	 <i class="bi bi-arrow-right-short"></i>
		         	 </a>
		    	   </span>
	    	   </div>
	    	  
	    	   </div>
	   			  
	   			  <div style="clear: both;"></div>

			<!-- 주문정보 -->
			<div class="card card-product mb-10">

			<c:forEach var="order" items="${orderNumGroups[orderNum] }">
					

		        <div class="card-body mb-4 row align-items-center">

		              <div class="col-md-4 col-12">
		                 <div class="text-center position-relative ">
							
							<c:choose>
							     <c:when test="${fn:contains(order.nb_image, 'http')}">
							            <img src="${order.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" width="130px;" height="150px;">
							     </c:when>
							     <c:otherwise>
							            <img src="${pageContext.request.contextPath}/upload/${order.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid"  width="130px;" height="150px;" >
							     </c:otherwise>
							</c:choose>
		                 </div>
		              </div>

		              <div class="col-md-4 col-12">
		                
		                 <div class="text-small mb-1"><small>
		                 ${order.nb_writer }
		                 </small>
		                 </div>
		                 
		                 
		                 <h2 class="fs-6">
		                 <a href="newbookDetail?nb_num=${order.nb_num }" class="link-dark">
							${order.nb_title }
		                 </a>
		                 </h2>
		                 
		                 <div class=" mt-3">
		                    <div><span class="text-dark">
		                    <fmt:formatNumber value="${order.nb_price }" pattern="#,###" />원 / ${order.o_de_count  } 권
		                    </span> 
		                    </div>

						 <div class=" mt-3">
		                    <div>
		                    
		                     <h3 class="fs-6" style="color:#889397;">
		                    <fmt:formatNumber value="${order.nb_price * order.o_de_count }" pattern="#,###" /> 원 
			                 </h3>
		                    
			                
			                 </div>
		                 </div>
		              	</div>
		           </div>
		           
                       <div class="col-md-1 col-1 d-none d-lg-flex" style="height: 200px; color : #dfe2e1;">
						   <div class="vr"></div><p>
		                 </div>
						
						
						 <div class="col-md-2">
						 
						   <div class="flex-column  text-center">
		                   	
		              	
							<c:choose>
								<c:when test="${order.nb_num < 200000 }">
								
							 	 <button onclick="cart(${order.nb_num })" class="btn btn-soft-primary mt-2">
		                    		장바구니 
			                    </button><p>
			                    
			                    	<c:if test="${firstOrder.o_status == 3 }">
	                            		<a href="reviewForm?o_order_num=${order.o_order_num}&nb_num=${order.nb_num}"  class="btn btn-soft-success mt-2">리뷰작성</a>
			                    	</c:if>

			                    	<c:if test="${firstOrder.o_status == 4 }">
	                            		<a href="reviewForm?o_order_num=${order.o_order_num}&nb_num=${order.nb_num}"  class="btn btn-soft-success mt-2">리뷰작성</a>
			                    	</c:if>

								
								</c:when>
								
								<c:otherwise>

								<span style="color: #0aad0a; font-weight: bold;">중고도서는 <br>
								<span style="color: #198754;">장바구니,리뷰작성</span><br>
								불가합니다.</span>
								
								</c:otherwise>								

							</c:choose>
		                 
		                   </div> 
						 
						 </div>
		                   
						</div> 
		           			
				</c:forEach>
				
					</div>
				</c:if>	
				
			</c:forEach>

     	  </div>
	     </c:otherwise>
      </c:choose>
     	  
     	  
   		 </div>

	 </div>

  <p></p>



<%@ include file="../common/footerFo.jsp"%>

</body>
</html>