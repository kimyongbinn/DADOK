<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<style type="text/css">
	/* 저작권 영준 */
	#hit {
	background: #70e1f5;  
	background: -webkit-linear-gradient(to right, #ffd194, #70e1f5);  
	background: linear-gradient(to right, #ffd194, #70e1f5); 
	border: none;
	border-radius: 10px 0 10px 0;
	width: 150px;
	height: 30px;
	}

</style>

<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	
	function category2Click() {
		// 클릭한 카테고리명
		var category2Value = $("#category2").val();
		var orderTypeValue = $("#orderType").val();
		var category1Value = '${newbook.nb_category1}';
		// alert("category1Value -> " +category1Value );
		// alert("내가 선택한 카테고리 + 정렬 -> " + category2Value + "+" + orderTypeValue);
		
		location.href = "/innewbookList?nb_category1="+category1Value+"&nb_category2="+category2Value +"&orderType="+orderTypeValue;
	
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
<!-- 정렬조건 및 카테고리 검색 -->
<div class="row py-5 mb-3" style="background-color: #EBEBEB">
 <div class="col-12">
    <div class="d-lg-flex justify-content-between align-items-center">
       <div class="mb-3 mb-lg-0">
          <p class="mb-0"> 총 <span class="text-dark">${inNewbookCnt} </span> 개 </p>  
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
               <c:if test="${newbook.nb_category1 eq 1 }">
	                <select id="category2" class="form-select" aria-label="Default select example" onchange = "category2Click()">
	                   <option value=0 <c:if test ="${newbook.nb_category2 eq '0'}"> selected="selected"</c:if>>전체</option>
	                   <option value=1 <c:if test ="${newbook.nb_category2 eq '1'}"> selected="selected"</c:if>>경제/경영</option>
	                   <option value=2 <c:if test ="${newbook.nb_category2 eq '2'}"> selected="selected"</c:if>>과학</option>
	                   <option value=3 <c:if test ="${newbook.nb_category2 eq '3'}"> selected="selected"</c:if>>소설</option>
	                   <option value=4 <c:if test ="${newbook.nb_category2 eq '4'}"> selected="selected"</c:if>>역사/문화</option>
	                   <option value=5 <c:if test ="${newbook.nb_category2 eq '5'}"> selected="selected"</c:if>>인문</option>
	     			</select>
     			</c:if>
     			<c:if test="${newbook.nb_category1 eq 2 }">
	                <select id="category2" class="form-select" aria-label="Default select example" onchange = "category2Click()">
	                   <option value=0 <c:if test ="${newbook.nb_category2 eq '0'}"> selected="selected"</c:if>>전체</option>
	                   <option value=6 <c:if test ="${newbook.nb_category2 eq '6'}"> selected="selected"</c:if>>과학/기술</option>
	                   <option value=7 <c:if test ="${newbook.nb_category2 eq '7'}"> selected="selected"</c:if>>문학</option>
	     			</select>
     			</c:if>
             </div>
             
             
             <div>
                <!-- 정렬 조건 -->
                <select id="orderType" class="form-select" aria-label="Default select example" onchange="category2Click()">
                   <option value="recently" <c:if test ="${newbook.orderType eq 'recently'}"> selected="selected"</c:if>>최신순</option>
                   <option value="highreview" <c:if test ="${newbook.orderType eq 'highreview'}"> selected="selected"</c:if>>높은별점순</option>
                   <option value="highprice" <c:if test ="${newbook.orderType eq 'highprice'}"> selected="selected"</c:if>>높은가격순 </option>
                   <option value="lowprice" <c:if test ="${newbook.orderType eq 'lowprice'}"> selected="selected"</c:if>>낮은가격순</option>
                </select>
             </div>
          </div>
       </div>
    </div>
 </div>
</div>

<!-- 국내도서 리스트 -->
<c:forEach var="inNewbook" items="${listInNewbook }">
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

		                 <c:choose>
		                 	<c:when test="${newbook.nb_category2 ne '0'}">
			                 	<c:forEach var="hitBook" items="${hitList}">
				                 	<c:if test="${inNewbook.nb_num eq hitBook.nb_num}">
					                 	<div class=" position-absolute top-0">
					                 	   <!-- 카테고리별로 조회수가 가장 높은 것 hit로 보여주기 --> 
					                       <span class="badge bg-danger">
					                       <!-- 카테고리별 리스트 -->
				                       		<c:choose>
					                       		<c:when test="${inNewbook.nb_category2 eq '1'}">
					                       			[경제/경영] 1등
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '2'}">
					                       			[과학] 1등
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '3'}">
					                       			[소설] 1등
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '4'}">
					                       			[역사/문화] 1등
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '5'}">
					                       			[인문] 1등
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '6'}">
					                       			[과학/기술] 1등
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '7'}">
					                       			[문학] 1등
					                       		</c:when>
					                       	</c:choose> 
					                       	</span>
					                    </div>
					                 </c:if>
			                 	</c:forEach>
			                 </c:when>
			                 <c:otherwise>
			                 	<c:if test="${inNewbook.nb_num eq hitBook1.nb_num}">
				                 	<div class=" position-absolute top-0">
				                 	   <!-- 전체에서 조회수가 가장 높은 것 hit로 보여주기 --> 
				                       <span class="badge bg-danger">다독 1등</span>
				                    </div>
			                    </c:if>
			                 </c:otherwise>
		                 </c:choose>
		                 	
		                 	
		                    <a href="newbookDetail?nb_num=${inNewbook.nb_num }">
		                       <!-- 도서 이미지 -->
		                       <c:set var="nb_image" value="${inNewbook.nb_image }"/>
		                       <c:choose>
			                   	<c:when test="${fn:contains(nb_image, 'http')}">
			                   		<img src="${inNewbook.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 13rem; height: 19rem;">
			                   	</c:when>
			                   	<c:otherwise>
			                   		<img src="${pageContext.request.contextPath}/upload/${inNewbook.nb_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 13rem; height: 19rem;">
			                   	</c:otherwise>
			                   </c:choose>
		                    </a>
		                 </div>
		              </div>
		              <div class="col-md-8 col-12 flex-grow-1">
		               
		               <!-- 영준시작  (왕관 색깔 넣을거면 얘기하셈 이미지라 색처리 안됨 , 검정색도 나름 ㄱㅊ은듯?) -->
		                   <c:choose>
		                 	<c:when test="${newbook.nb_category2 ne '0'}">
			                 	<c:forEach var="hitBook" items="${hitList}">
				                 	<c:if test="${inNewbook.nb_num eq hitBook.nb_num}">
				                       		<c:choose>
					                       		<c:when test="${inNewbook.nb_category2 eq '1'}">
					                       			<button id="hit" class="mb-6" type="button" disabled='disabled'>
														<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
									              	   <span style="color: white; font-weight: bold;">
										              	   경제/경영 Best 1</span>
									                  </button>
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '2'}">
					                       			<button id="hit" class="mb-6" type="button" disabled='disabled'>
														<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
									              	   <span style="color: white; font-weight: bold;">
										              	  	과학 Best 1</span>
									                  </button>
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '3'}">
					                       			<button id="hit" class="mb-6" type="button" disabled='disabled'>
														<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
									              	   <span style="color: white; font-weight: bold;">
										              	   소설 Best 1</span>
									                  </button>
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '4'}">
					         						<button id="hit" class="mb-6" type="button" disabled='disabled'>
														<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
									              	   <span style="color: white; font-weight: bold;">
										              	   역사/문화 Best 1</span>
									                  </button>
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '5'}">
					                       				<button id="hit" class="mb-6" type="button" disabled='disabled'>
														<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
									              	   <span style="color: white; font-weight: bold;">
										              	 인문 Best 1 </span>
									                  </button>
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '6'}">
					                  				<button id="hit" class="mb-6" type="button" disabled='disabled'>
														<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
									              	   <span style="color: white; font-weight: bold;">
										              	   과학/기술 Best 1 </span>
									                  </button>
					                       		</c:when>
					                       		<c:when test="${inNewbook.nb_category2 eq '7'}">
					                       			  <button id="hit" class="mb-6" type="button" disabled='disabled'>
														<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
									              	   <span style="color: white; font-weight: bold;">
										              	   문학 Best 1 </span>
									                  </button>
					                       		</c:when>
					                       	</c:choose> 
					                 </c:if>
			                 	</c:forEach>
			                 </c:when>
			                 <c:otherwise>
			                 	<c:if test="${inNewbook.nb_num eq hitBook1.nb_num}">
									  <button id="hit" class="mb-6" type="button" disabled='disabled'>
										<img alt="" src="../assets/images/memberImage/crown.png">&nbsp;	                  
					              	   <span style="color: white; font-weight: bold;">
						              	   다독 Best 1 </span>
					                  </button>
			                    </c:if>
			                 </c:otherwise>
		                 </c:choose>
            		    <!-- 영준 끝 -->
		               
		                 <!-- 도서 제목 -->
		                 <h1 class="fs-2 mb-3"><a href="newbookDetail?nb_num=${inNewbook.nb_num }" class="text-inherit text-decoration-none">${inNewbook.nb_title}</a>
		                 </h1>
		                 <!-- 지은이, 출판사, 출판일 -->
		                 <h3 class="fs-6 mb-3">${inNewbook.nb_writer} | ${inNewbook.nb_publisher} | ${inNewbook.nb_publi_date}
		                 </h3>
		              <div>
	                    <!-- 별점 -->
	                    <div class="text-warning">
	                    	<c:forEach var="i" begin="1" end="${inNewbook.r_ratingAvg }">
	                    		<i class="bi bi-star-fill"></i>
	                    	</c:forEach>
	                    	<c:forEach var="i" begin="${inNewbook.r_ratingAvg + 1}" end="5">
	                    		<i class="bi bi-star"></i>
	                    	</c:forEach>
		                    <span class="text-muted small" style="margin-left: 10px;">${inNewbook.r_ratingAvg }(${inNewbook.reviewCnt }건)</span>
	              		</div>
		              </div>
		                 
		                 <!-- 도서가격 + 버튼들 -->
		                 <div class="  mt-8 mb-3">
		                     <!-- 도서 가격 -->
		                    <div>
		                     <span class="text-dark fs-3"><fmt:formatNumber value="${inNewbook.nb_price}" groupingUsed="true"/>원</span>
		                     <span id="price_point" class="text-muted ml-5">
		                     		적립포인트 : <fmt:formatNumber value="${inNewbook.nb_price * 0.01}" pattern="#"/>p
		                     </span>
		                    </div>
		                    
		                    <!-- 찜, 바로구매,  장바구니 버튼 -->
		                    <div class="mt-2">
		                       <!-- 찜하기 버튼 -->	
		                       <c:choose>
		                       	<c:when test="${inNewbook.w_wish == 0}">
			                       <a id="wish" class="btn btn-icon btn-sm btn-outline-gray-400 text-muted"
			                          data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist" onclick="wishlist(${inNewbook.nb_num })">
			                          <i id="wishbtn" class="bi bi-heart"></i></a>
			                    </c:when>
			                    <c:when test="${inNewbook.w_wish == 1}">
			                       <a id="wish" class="btn btn-icon btn-sm btn-outline-gray-400 text-muted"
			                          data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist" onclick="wishlist(${inNewbook.nb_num })">
			                          <i id="wishbtn" class="bi bi-heart-fill" style="color:red;"></i></a>
			                    </c:when>
		                       </c:choose>
		                       
		                       <!-- 바로구매 버튼 -->   
		                       <a href="orderForm?nb_num=${inNewbook.nb_num }&paymentType=1&c_count=1" class="btn btn-primary ">
		                  	   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
		                  		fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
		                  		stroke-linejoin="round" class="feather feather-shopping-bag me-2">
			                  	   <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
			                  	   <line x1="3" y1="6" x2="21" y2="6"></line>
			                       <path d="M16 10a4 4 0 0 1-8 0"></path>
		                 	   </svg>
		                  		바로구매
		                       </a>
		                       <!-- 장바구니 버튼 -->
		                       <a class="btn btn-secondary" onclick="cart(${inNewbook.nb_num })">
		                  	   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
		                  		fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
		                  		stroke-linejoin="round" class="feather feather-shopping-bag me-2">
			                  	   <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
			                  	   <line x1="3" y1="6" x2="21" y2="6"></line>
			                       <path d="M16 10a4 4 0 0 1-8 0"></path>
		                 	   </svg>
		                  		장바구니
		                       </a>
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
  
<!-- 페이징 처리 -->
<div class="row mt-8">
  <div class="d-flex justify-content-center">
    <!-- nav -->
    <nav>
      <ul class="pagination">
        <!-- 이전버튼 -->
        <c:if test="${page.startPage > page.pageLimit}">
	        <li class="page-item">
	          <a class="page-link  mx-1 " href="innewbookList?currentPage=${page.startPage-page.pageLimit}&nb_category1=${newbook.nb_category1 }&nb_category2=${newbook.nb_category2 }&orderType=${newbook.orderType}" aria-label="Previous">
	            	이전
	          </a>
	        </li>
        </c:if>
        
        <!-- 페이지 넘버 -->
        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
        	<li class="page-item"><a class="page-link mx-1 text-body" href="innewbookList?currentPage=${i }&nb_category1=${newbook.nb_category1 }&nb_category2=${newbook.nb_category2 }&orderType=${newbook.orderType}">${i }</a></li>
        </c:forEach>
        
        
        <!-- <li class="page-item "><a class="page-link  mx-1 active" href="#">1</a></li>
        <li class="page-item"><a class="page-link mx-1 text-body" href="#">2</a></li>
        <li class="page-item"><a class="page-link mx-1 text-body" href="#">...</a></li>
        <li class="page-item"><a class="page-link mx-1 text-body" href="#">12</a></li>
         -->
         
        <!-- 다음 버튼 -->
        <c:if test="${page.endPage < page.totalPage}">
	        <li class="page-item">
	          <a class="page-link mx-1 text-body" href="innewbookList?currentPage=${page.startPage+page.pageLimit }&nb_category1=${newbook.nb_category1 }&nb_category2=${newbook.nb_category2 }&orderType=${newbook.orderType}" aria-label="Next">
	            	다음
	          </a>
	        </li>
        </c:if>
       
      </ul>
    </nav>
  </div>
</div>



</body>
<%@ include file="../common/footerFo.jsp" %>
</html>