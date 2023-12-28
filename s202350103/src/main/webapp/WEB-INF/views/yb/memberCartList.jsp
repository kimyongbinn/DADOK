<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.center-text {
	  text-align: center; /* 텍스트 가운데 정렬 */
	  position: absolute;
	  top: 40%;
	  left: 55%;
	  font-weight: bold;
	  color:black;
	  transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
	}
</style>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	
	function cartQuantityPlus(pIndex) {
		var pNb_num = $('#nb_num'+pIndex).val();
		var pQuantity = Number($("#quantity"+pIndex).val())+1;
		// alert("pQuantity -> "+pQuantity);
		
		$.ajax({
					url : "cartList",
					data : {quantity : pQuantity, nb_num : pNb_num},
					dataType : 'text',
					success : function(data){
							if (data == '1'){
								// alert("수정되었습니다.");
								location.reload();
							}else {
								// alert("수정되지 않았습니다.")
							}
					}
		});
	}
	
	function cartQuantityMinus(pIndex) {
		var pNb_num = $('#nb_num'+pIndex).val();
		var pQuantity = Number($("#quantity"+pIndex).val())-1;
		// alert("pQuantity -> "+pQuantity);
		
		if(pQuantity < 1){
			alert("수량은 1보다 작을 수 없습니다");
			location.reload();
			return;
		}
		
		$.ajax({
					url : "cartList",
					data : {quantity : pQuantity, nb_num : pNb_num},
					dataType : 'text',
					success : function(data){
							if (data == '1'){
								// alert("수정되었습니다.");
								location.reload();
							}else {
								// alert("수정되지 않았습니다.")
							}
					}
		});
	}
	

	function deleteCart(pNb_num){
		if(confirm("삭제하시겠습니까?")){
			location.href = "deleteCart?nb_num="+pNb_num;
		}
		
	}
	
	function bookListPage() {
		location.href="innewbookList";
	}
</script>
</head>
<body>
<%@ include file="../common/sideFo.jsp" %>
  <main>
  <section class="mb-lg-14 mb-8">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-12">
          <!-- 장바구니 헤더 -->
          <div class="card py-1 border-0">
         	<div class="mb-8">
		         <h2>장바구니</h2>
		         <p><a href="#">${member.m_id } 님의 장바구니 목록입니다.</a></p>
		               총 상품 개수 : ${totalCart }		
	      	</div>
          <div>
        </div>
      </div>
     <form action="orderForm">
      <!-- row -->
      <div class="row">
      	<c:if test="${listCart.size() != 0 }">
	        <div class="col-lg-8 col-md-7">
	          <div class="py-3">
	          	<div class="table-responsive">
			        <table class="table text-nowrap table-with-checkbox" style="margin-bottom: 0px; text-align: center;" >
			                <thead class="table-light">
			                  <tr>
			                    <th></th>
			                    <th style="padding-left: 70px;">제목</th>
			                    <th></th>    
			                    <th></th>
			                    <th></th>
			                    <th>수량</th>
			                   	<th style="padding-right: 20px;padding-left: 50px;">가격</th>
			                  </tr>
			                </thead>
			         </table>
			    </div>
	       		<!-- <form action="cartList" method="post"> -->
		          <c:forEach var="cart" items="${listCart }" varStatus="status">   
		          	<input type="hidden" id="nb_num${status.index }" name="nb_num" value="${cart.nb_num }">
		            <ul id="cart${status.index }" class="list-group list-group-flush">
		             <li class="list-group-item py-3 py-lg-0 px-0 border-top">  
		              <div class="row align-items-center">
		             	<div class="col-3 col-md-2">
		                	<c:choose>
	                           <c:when test="${fn:contains(cart.nb_image, 'http')}">
	                              <img src="${cart.nb_image}" alt="Ecommerce"  width="75px" height="90px">
	                           </c:when>
	                           <c:otherwise>
	                              <img src="${pageContext.request.contextPath}/upload/${cart.nb_image}" alt="Ecommerce"  width="75px" height="90px">
	                           </c:otherwise>
                        	</c:choose>
		                </div>
		  				<div class="col-4 col-md-5">
		                    <!-- 도서 제목 -->
		                    <a href="newbookDetail?nb_num=${cart.nb_num }" class="text-inherit"><h6 class="mb-0">${cart.nb_title }</h6></a>
		                    <span><small class="text-muted">${cart.nb_publisher }</small></span>
		                    <!-- 삭제하기 -->
		                    <div class="mt-2 small lh-1"> <a onclick="deleteCart(${cart.nb_num})" class="text-decoration-none text-inherit"> <span
		                          class="me-1 align-text-bottom">
		                          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
		                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		                            class="feather feather-trash-2 text-success">
		                            <polyline points="3 6 5 6 21 6"></polyline>
		                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
		                            </path>
		                            <line x1="10" y1="11" x2="10" y2="17"></line>
		                            <line x1="14" y1="11" x2="14" y2="17"></line>
		                          </svg></span><span class="text-muted">삭제하기</span></a></div>
		                  </div>
		                   <!-- 수량 -->
		                  <div class="col-4 col-md-3 col-lg-3">
		                       <!-- 수량 수정 -->
		                  	<div class="input-group input-spinner  ">
		                    	<input type="button" id="minus${status.index }" value="-" class="button-minus btn btn-sm " data-field="quantity" onclick="cartQuantityMinus(${status.index})">
					            <input type="number" id="quantity${status.index}" min=1  step="1" max="10" value="${cart.c_count }" name="quantity" class="quantity-field form-control-sm form-input">
					            <input type="button" id="plus${status.index }" value="+" class="button-plus btn btn-sm " data-field="quantity" onclick="cartQuantityPlus(${status.index})">
		                  	</div>
		                  </div>
		                    <!-- 도서가격 -->
		                  <div class="col-2 text-lg-end text-start text-md-end col-md-2" style="padding-left: 0px;">
		                    <span class="fw-bold"><fmt:formatNumber value="${cart.nb_price * cart.c_count}" pattern="#,###" />원</span>
		                  </div>
		                 </div>
						</li> 	
					  </ul>
		             </c:forEach>    
		                 
		            <!--
		            <div class="d-flex justify-content-between mt-4">
		              <button type="submit" class="btn btn-dark">수정하기</button>
		            </div> -->
	           <!--  </form> -->
	          </div>
	          <!-- section -->
			    
			</div>
		</c:if>
		<c:if test="${listCart.size() == 0 }">			
	 		<div class="row" style="height: 100px">
				<div class="center-text mt-14 md-14">
					담은 상품이 없습니다.<p><p>
					<a href="innewbookList?nb_category1=1&nb_category2=0&orderType=recently" class="btn btn-soft-success ">새상품 보러가기</a>
				</div>
			</div>	 	
		</c:if>
        <!-- 사이드  결제 버튼 -->
	    <c:if test="${listCart.size() != 0 }">
	        <div class="col-12 col-lg-4 col-md-5">
	          <!-- card -->
	          <div class="mb-5 card mt-6">
	            <div class="card-body p-6">
	              <!-- heading -->
	              	<h5>상품금액 <span><fmt:formatNumber value="${totalPrice }" pattern="#,###" /> 원</span></h5> 
	              	<h5>배송비 <span>
	              	<c:if test="${totalPrice >= 50000 || totalPrice == 0 }"><fmt:formatNumber value="0" pattern="#,###" /> 원</c:if>
	              	<c:if test="${totalPrice < 50000 && totalPrice > 0 }"><fmt:formatNumber value="3000" pattern="#,###" />
	              	 원
	              	 <h5 style="color: red; font-size: 15px; margin-top: 5px;">50,000원 이상 무료 배송</h5>
	              	 </c:if></span></h5>
	              	
	              <hr>
	              	<h5>결제예정금액 <span><fmt:formatNumber value="${totalPrice }" pattern="#,###" /> 원</span></h5> 
	              <div class="d-grid mb-1 mt-4">
	                <!-- btn -->
	                <input type="hidden" name="paymentType" value="2">
	                <button class="btn btn-primary justify-content-between align-items-center" type="submit">
	                  	주문하기(${totalCart })</button>
	              </div>
	              </div>
	            </div>
	          </div>
	        </c:if>  
        </div>
        
      </form>  
        
      	</div>
      </div>
      
    </div>
    <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="page-item justify-content-center">					
						<a class="page-link mx-1 text-body" href="memberCartList?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="page-item justify-content-center">
 						<a class="page-link mx-1 text-body" href="memberCartList?currentPage=${i}">${i}</a>
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="page-item justify-content-center">		 
						<a class="page-link mx-1 text-body" href="memberCartList?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		  </ul>
	   </nav>
  </section>
</main>


<%@ include file="../common/footerFo.jsp" %>
</body>
</html>