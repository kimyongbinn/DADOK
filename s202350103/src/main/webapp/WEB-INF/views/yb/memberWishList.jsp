<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
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
			
		function wishlist(pNb_num) {
			// alert("pNb_num ->"+pNb_num);
			
			$.ajax({
				url : "/wish/wishclick", 
				data : {nb_num : pNb_num},
				dataType : 'text',
				success : function(data){
							if (data == '0') {
								alert ("찜 취소 되었습니다.");
								location.reload();
							} 
							else if(data == '1') {
								alert ("찜 되었습니다.");
								location.reload();
							} 
							else {
								location.href = data ;
							}
											
					  }
				});
		}
		
		function bookListPage() {
			location.href="innewbookList";
		}
</script>

<style type="text/css">
.center-text {
  text-align: center; /* 텍스트 가운데 정렬 */
  position: absolute;
  top: 80%;
  left: 50%;
  font-weight: bold;
  color:black;
  transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
}

</style>

</head>
<body>
<%@ include file="../common/sideFo.jsp" %>

		      <!-- row -->
		      <div class="row">
		        <div class="col-lg-12">
		          <div class="card py-1 border-0 mb-8">
		           			    <!-- card --> 			 
           			 <div class="mb-8">
			         <!-- heading -->
				         <h2 class="mb-2">찜목록</h2>
				         <p><a href="#">${member.m_id } 님의 찜 목록입니다.</a></p>
				         <c:if test="${memberWishList.size() != 0 }">총 상품 개수 : ${totalWishList }</c:if>
				         	
			      	</div>
		          <div>
				
				
				<c:choose>
					<c:when test="${empty memberWishList}">
						
						 <div class="row">
						<div class="center-text mt-14">
							찜한 상품이 없습니다. <p><p>
					<a href="innewbookList?nb_category1=1&nb_category2=0&orderType=recently" class="btn btn-soft-success ">새상품 보러가기</a>
						</div>
						</div>
						
					</c:when>
					
					<c:otherwise>
		
		          	
		            <!-- table -->
		            <div class="table-responsive">
		            
		              <table class="table text-nowrap table-with-checkbox">
		              
		                <thead class="table-light">
		                  <tr>
		                    <th></th>
		                    <th style="padding-left: 70px;">제목</th>
		                    <th>출판사</th>
		                    <th>가격</th>
		                    <th style="padding-left: 50px;">상태</th>
		                    <th>삭제</th>
		                  </tr>
		                </thead>
		                <c:if test="${memberWishList.size() != 0 }">
		                <tbody>
		                <c:forEach var="wishList" items="${memberWishList }">
		                  <tr>
		                    <td class="align-middle">
		                      <div class="col-3 col-md-2">
			                	<c:choose>
		                           <c:when test="${fn:contains(wishList.nb_image, 'http')}">
		                              <img src="${wishList.nb_image}" alt="Ecommerce"  width="75px" height="90px">
		                           </c:when>
		                           <c:otherwise>
		                              <img src="${pageContext.request.contextPath}/upload/${wishList.nb_image}" alt="Ecommerce"  width="75px" height="90px">
		                           </c:otherwise>
	                        	</c:choose>
		               		  </div>
							 
		                    </td>
		                    <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0"><a href="newbookDetail?nb_num=${wishList.nb_num }" class="text-inherit">${wishList.nb_title }</a></h5>
		                         <small>${wishList.nb_writer }</small>
		                      </div>
		                    </td>
		                    <td class="align-middle"> ${wishList.nb_publisher }</td>
		                    <td class="align-middle"><fmt:formatNumber value="${wishList.nb_price }" pattern="#,###" /></td>
		                    <td class="align-middle">
		                      <div class="btn btn-primary btn-sm" onclick="cart(${wishList.nb_num })">장바구니 추가</div>
		                    </td>
		                    <td class="align-middle "><a onclick="wishlist(${wishList.nb_num })" class="text-muted" data-bs-toggle="tooltip"
		                        data-bs-placement="top" title="Delete">
		                        <i class="feather-icon icon-trash-2"></i>
		                      </a></td>
		                  </tr>
		                  </c:forEach>
		                </tbody>
		               </c:if>
		              </table>
		            </div>
		          </div>
		          <nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
						 	<c:if test="${page.startPage > page.pageBlock }">
								 <li class="page-item justify-content-center">					
									<a class="page-link mx-1 text-body" href="memberWishList?currentPage=${page.startPage-page.pageBlock}">이전</a>
								</li>
							</c:if>
			 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
								 <li class="page-item justify-content-center">
			 						<a class="page-link mx-1 text-body" href="memberWishList?currentPage=${i}">${i}</a>
								</li>
							</c:forEach>
								
							<c:if test="${page.endPage < page.totalPage }">
								 <li class="page-item justify-content-center">		 
									<a class="page-link mx-1 text-body" href="memberWishList?currentPage=${page.startPage+page.pageBlock}">다음</a>
								</li>
							</c:if>
					  	</ul>
	   				</nav>
		        </div>
		
		      </div>
		
		    </div>
		    
		    </c:otherwise>
			
		</c:choose>
	
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>