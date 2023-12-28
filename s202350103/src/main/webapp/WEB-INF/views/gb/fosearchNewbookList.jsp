<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	
	function category2Click() {
		// 클릭한 카테고리명
		var category2Value = $("#category2").val();
		var orderTypeValue = $("#orderType").val();
		
		location.href = "/searchNewbookList?nb_category2="+category2Value +"&orderType="
				+orderTypeValue+"&search_type="+'${search_Newbook.search_type}'+"&search_keyword="+'${search_Newbook.search_keyword}';

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
	
	function cart(pNb_num) {
		var m_num = '${member.m_num}';
		// alert("pNb_num ->"+pNb_num);
		
		$.ajax({
			url : "/cart/cartclick",
			data : {nb_num : pNb_num},
			dataType : 'text',
			success : function(data){
				if (data == '0') {
					if(confirm("장바구니에 이미 등록된 상품입니다. \n장바구니로 이동하시겠습니까?")){
						location.href = "memberCartList?m_num="+m_num;
					}
				} 
				else if(data == '1') {
					if(confirm("장바구니에 등록되었습니다. \n장바구니로 이동하시겠습니까?")){
						location.href = "memberCartList?m_num="+m_num;
					}
				} 
				else {
					location.href = data ;
				}
			}
		});
	}
</script>
</head>
<body>
	<p class="fs-4">현재 : ${page.currentPage1 } 페이지</p>
	<h2>
		<c:choose>
			<c:when test="${search_Newbook.search_type eq 'title'}">도서제목 : </c:when>
			<c:when test="${search_Newbook.search_type eq 'writer'}">지은이 : </c:when>
			<c:when test="${search_Newbook.search_type eq 'publisher'}">출판사 : </c:when>
		</c:choose>
		'${search_Newbook.search_keyword }'에 대한 ${search_NewbookCnt }개의 검색 결과
	</h2>
	<!-- 정렬조건 및 카테고리 검색 -->
	<div class="row py-5 mb-3" style="background-color: #EBEBEB">
	 <div class="col-12">
	    <div class="d-lg-flex justify-content-between align-items-center">
	       <div class="mb-3 mb-lg-0">
	          <p class="mb-0">총 <span class="text-dark"> ${search_NewbookCnt } </span> 개 </p>  
	       </div>
	       
	       <!-- icon -->
	       <div class="d-md-flex justify-content-between align-items-center">
	          <div class="d-flex align-items-center justify-content-between">
	             
	             <!-- 반응형 시 사이드 바 -->
	             <div class="ms-2 d-lg-none">
	                <a class="btn btn-outline-gray-400 text-muted" data-bs-toggle="offcanvas" href="#offcanvasCategory" role="button" aria-controls="offcanvasCategory">
	                   <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
	                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
	                      class="feather feather-filter me-2">
	                      <polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon>
	                   </svg>
	                   Filters
	                </a>
	             </div>
	          </div>
	          
	       <div class="d-flex mt-2 mt-lg-0">
             <div class="me-2 flex-grow-1">
               	<!-- 카테고리 검색 -->
                <select id="category2" class="form-select" aria-label="Default select example" onchange = "category2Click()">
                   <option value=0 <c:if test ="${search_Newbook.nb_category2 eq '0'}"> selected="selected"</c:if>>전체</option>
                   <option value=1 <c:if test ="${search_Newbook.nb_category2 eq '1'}"> selected="selected"</c:if>>경제/경영</option>
                   <option value=2 <c:if test ="${search_Newbook.nb_category2 eq '2'}"> selected="selected"</c:if>>과학</option>
                   <option value=3 <c:if test ="${search_Newbook.nb_category2 eq '3'}"> selected="selected"</c:if>>소설</option>
                   <option value=4 <c:if test ="${search_Newbook.nb_category2 eq '4'}"> selected="selected"</c:if>>역사/문화</option>
                   <option value=5 <c:if test ="${search_Newbook.nb_category2 eq '5'}"> selected="selected"</c:if>>인문</option>
                   <option value=6 <c:if test ="${search_Newbook.nb_category2 eq '6'}"> selected="selected"</c:if>>과학/기술</option>
                   <option value=7 <c:if test ="${search_Newbook.nb_category2 eq '7'}"> selected="selected"</c:if>>문학</option>
     			</select>
             </div>
             
             <div>
                <!-- 정렬 조건 -->
                <select id="orderType" class="form-select" aria-label="Default select example" onchange="category2Click()">
                   <option value="recently" <c:if test ="${search_Newbook.orderType eq 'recently'}"> selected="selected"</c:if>>최신순</option>
                   <option value="highreview" <c:if test ="${search_Newbook.orderType eq 'highreview'}"> selected="selected"</c:if>>높은별점순</option>
                   <option value="highprice" <c:if test ="${search_Newbook.orderType eq 'highprice'}"> selected="selected"</c:if>>높은가격순 </option>
                   <option value="lowprice" <c:if test ="${search_Newbook.orderType eq 'lowprice'}"> selected="selected"</c:if>>낮은가격순</option>
                </select>
             </div>
          </div>
	       </div>
	    </div>
	 </div>
	</div>
	
	<!-- 국내도서 리스트 -->
	<c:choose>
		<c:when test="${listSearchNewbook.size() > 0}">
			<c:forEach var="searchNewbook" items="${listSearchNewbook }">
				<div class="row g-4  row-cols-1 mt-2">
					<div class="row">
					  <div class="col-12">
					     <div class="card card-product">
					        <!-- 한 개 도서상품 내용  -->
					        <div class="card-body">
					           <div class=" row align-items-center">
					              <!-- col -->
					              <div class="col-md-4 col-12">
					                 <div class="text-center position-relative ">
					                 	<!-- 새상품 도서일 때 -->
					                 	<c:if test="${searchNewbook.nb_num < 200000}">
					                 		<a href="newbookDetail?nb_num=${searchNewbook.nb_num }">
						                       <!-- 도서 이미지 -->
						                       <c:choose>
								                  <c:when test="${fn:contains(searchNewbook.nb_image, 'http')}">
								                     <img src="${searchNewbook.nb_image}" alt="${searchNewbook.nb_title}" style="width: 13rem; height: 19rem;">
								                  </c:when>
								                  <c:otherwise>
								                     <img src="${pageContext.request.contextPath}/upload/${searchNewbook.nb_image}" alt="${searchNewbook.nb_title}" style="width: 13rem; height: 19rem;">
								                  </c:otherwise>
								               </c:choose>
						                    </a>
					                 	</c:if>
					                 	<!-- 중고도서 일 때 -->
					                 	<c:if test="${searchNewbook.nb_num > 200000}">
						                 	<a href="foOldBookDetail?ob_num=${searchNewbook.nb_num }">
						                       <!-- 도서 이미지 -->
						                       <c:choose>
								                  <c:when test="${fn:contains(searchNewbook.nb_image, 'http')}">
								                     <img src="${searchNewbook.nb_image}" alt="${searchNewbook.nb_title}" style="width: 13rem; height: 19rem;">
								                  </c:when>
								                  <c:otherwise>
								                     <img src="${pageContext.request.contextPath}/upload/${searchNewbook.nb_image}" alt="${searchNewbook.nb_title}" style="width: 13rem; height: 19rem;">
								                  </c:otherwise>
								               </c:choose>
						                    </a>
					                 	</c:if>
					                 </div>
					              </div>
					              <div class="col-md-8 col-12 flex-grow-1">
					                 <!-- 도서 제목 -->
					                 <h1 class="fs-2 mb-3">
					                 <!-- 새 도서 일 때 -->
					                 <c:if test="${searchNewbook.nb_num < 200000}">
					                 	<a href="newbookDetail?nb_num=${searchNewbook.nb_num }" class="text-inherit text-decoration-none">${searchNewbook.nb_title}</a>
					                 </c:if>
					                 <!-- 중고도서 일때 -->
									 <c:if test="${searchNewbook.nb_num > 200000}">
									 	<a href="foOldBookDetail?ob_num=${searchNewbook.nb_num }" class="text-inherit text-decoration-none">${searchNewbook.nb_title}</a>
									 </c:if>
					                 </h1>
					                 <!-- 지은이, 출판사, 출판일 -->
					                 <h3 class="fs-6 mb-3">${searchNewbook.nb_writer} | ${searchNewbook.nb_publisher} | ${searchNewbook.nb_publi_date}
					                 </h3>
					              <c:if test="${searchNewbook.nb_num < 200000 }">
						              <div>
					                    <!-- 별점 -->
					                    <div class="text-warning">
					                    	<c:forEach var="i" begin="1" end="${searchNewbook.r_ratingAvg }">
					                    		<i class="bi bi-star-fill"></i>
					                    	</c:forEach>
					                    	<c:forEach var="i" begin="${searchNewbook.r_ratingAvg + 1}" end="5">
					                    		<i class="bi bi-star"></i>
					                    	</c:forEach>
						                    <span class="text-muted small" style="margin-left: 10px;">${searchNewbook.r_ratingAvg }(${searchNewbook.reviewCnt })</span>
					              		</div>
						              </div>
					              </c:if>
					                 
					                 <!-- 도서가격 + 버튼들 -->
					                 <div class="  mt-8 mb-3">
					                     <!-- 도서 가격 -->
					                    <div>
					                     <span class="text-dark fs-3"><fmt:formatNumber value="${searchNewbook.nb_price}" groupingUsed="true"/>원</span>
					                     <span id="price_point" class="text-muted ml-5">
					                     		적립포인트 : <fmt:formatNumber value="${searchNewbook.nb_price * 0.01}" pattern="#"/>p
					                     </span>
					                    </div>
					                    
					                    <!-- 찜, 바로구매,  장바구니 버튼 -->
					                    <div class="mt-2">
					                    	<!-- 새상품일 떄만 조회 -->
					                       <c:if test="${searchNewbook.nb_num < 200000}">
						                       <!-- 찜하기 버튼 -->	
						                       <c:choose>
						                       	<c:when test="${searchNewbook.w_wish == 0}">
							                       <a id="wish" class="btn btn-icon btn-sm btn-outline-gray-400 text-muted"
							                          data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist" onclick="wishlist(${searchNewbook.nb_num })">
							                          <i id="wishbtn" class="bi bi-heart"></i></a>
							                    </c:when>
							                    <c:when test="${searchNewbook.w_wish == 1}">
							                       <a id="wish" class="btn btn-icon btn-sm btn-outline-gray-400 text-muted"
							                          data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist" onclick="wishlist(${searchNewbook.nb_num })">
							                          <i id="wishbtn" class="bi bi-heart-fill" style="color:red;"></i></a>
							                    </c:when>
						                       </c:choose>
					                       </c:if>
					                       <!-- 바로구매 버튼 -->   
					                       <a href="orderForm?nb_num=${searchNewbook.nb_num }&paymentType=1" class="btn btn-primary ">
					                  	   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
					                  		fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
					                  		stroke-linejoin="round" class="feather feather-shopping-bag me-2">
						                  	   <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
						                  	   <line x1="3" y1="6" x2="21" y2="6"></line>
						                       <path d="M16 10a4 4 0 0 1-8 0"></path>
					                 	   </svg>
					                  		바로구매
					                       </a>
					                       <!-- 새상품 도서만 조회 -->
					                       <c:if test="${searchNewbook.nb_num < 200000}">
						                       <!-- 장바구니 버튼 -->
						                       <a class="btn btn-secondary" onclick="cart(${searchNewbook.nb_num })">
						                  	   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
						                  		fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
						                  		stroke-linejoin="round" class="feather feather-shopping-bag me-2">
							                  	   <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
							                  	   <line x1="3" y1="6" x2="21" y2="6"></line>
							                       <path d="M16 10a4 4 0 0 1-8 0"></path>
						                 	   </svg>
						                  		장바구니
						                       </a>
					                       </c:if>
					                    </div>
					                 </div>
					              </div>
					           </div>
					        </div>
					     </div>
					  </div>
					 </div>
				</div>    
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h2>검색된 도서가 없습니다.</h2>
		</c:otherwise>
	</c:choose>   
	
	<!-- 페이징 처리 -->
	<div class="row mt-8">
	  <div class="d-flex justify-content-center">
	    <!-- nav -->
	    <nav>
	      <ul class="pagination">
	        <!-- 이전버튼 -->
	        <c:if test="${page.startPage > page.pageLimit}">
		        <li class="page-item">
		          <a class="page-link  mx-1 " href="searchNewbookList?currentPage=${page.startPage-page.pageLimit}&nb_category2=${search_Newbook.nb_category2 }&orderType=${search_Newbook.orderType}&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}" aria-label="Previous">
		            	이전
		          </a>
		        </li>
	        </c:if>
	        
	        <!-- 페이지 넘버 -->
	        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
	        	<li class="page-item"><a class="page-link mx-1 text-body" href="searchNewbookList?currentPage=${i }&nb_category2=${search_Newbook.nb_category2 }&orderType=${search_Newbook.orderType}&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}">${i }</a></li>
	        </c:forEach>
	        
	        
	        <!-- <li class="page-item "><a class="page-link  mx-1 active" href="#">1</a></li>
	        <li class="page-item"><a class="page-link mx-1 text-body" href="#">2</a></li>
	        <li class="page-item"><a class="page-link mx-1 text-body" href="#">...</a></li>
	        <li class="page-item"><a class="page-link mx-1 text-body" href="#">12</a></li>
	         -->
	         
	        <!-- 다음 버튼 -->
	        <c:if test="${page.endPage < page.totalPage}">
		        <li class="page-item">
		          <a class="page-link mx-1 text-body" href="searchNewbookList?currentPage=${page.startPage+page.pageLimit }&nb_category2=${search_Newbook.nb_category2 }&orderType=${search_Newbook.orderType}&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}" aria-label="Next">
		            	다음
		          </a>
		        </li>
	        </c:if>
	       
	      </ul>
	    </nav>
	  </div>
	</div>    

</body>
<footer>
<%@ include file="../common/footerFo.jsp" %>
</footer>
</html>