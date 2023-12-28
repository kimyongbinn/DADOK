<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

 	function category2Click() {
		// 클릭한 카테고리명
		var category2Value = $("#category2").val();
		var category1Value = '${oldBook.nb_category1}';
		/* alert("category2Value->"+category2Value); */
		location.href = "/folistOb?nb_category1="+category1Value+"&nb_category2="+category2Value;
	
	} 
	
</script>
</head>
<body>

<p class="fs-4">현재 : ${page.currentPage } 페이지</p>

<div class="row py-5 mb-3" style="background-color: #EBEBEB">
 <div class="col-12">
    <div class="d-lg-flex justify-content-between align-items-center">
       <div class="mb-3 mb-lg-0">
          <p class="mb-0">총 &nbsp;<span class="text-dark">${totalOb2} </span>&nbsp; 개 </p>  
       </div>
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
               
                <c:if test="${oldBook.nb_category1 eq 1 }">
	                <select id="category2" class="form-select" aria-label="Default select example" onchange = "category2Click()">
	                   <option value=0 <c:if test ="${oldBook.nb_category2 eq '0'}"> selected="selected"</c:if>>전체</option>
	                   <option value=1 <c:if test ="${oldBook.nb_category2 eq '1'}"> selected="selected"</c:if>>경제/경영</option>
	                   <option value=2 <c:if test ="${oldBook.nb_category2 eq '2'}"> selected="selected"</c:if>>과학</option>
	                   <option value=3 <c:if test ="${oldBook.nb_category2 eq '3'}"> selected="selected"</c:if>>소설</option>
	                   <option value=4 <c:if test ="${oldBook.nb_category2 eq '4'}"> selected="selected"</c:if>>역사/문화</option>
	                   <option value=5 <c:if test ="${oldBook.nb_category2 eq '5'}"> selected="selected"</c:if>>인문</option>
	     			</select>
     			</c:if>
     			<c:if test="${oldBook.nb_category1 eq 2 }">
	                <select id="category2" class="form-select" aria-label="Default select example" onchange = "category2Click()">
	                   <option value=0 <c:if test ="${oldBook.nb_category2 eq '0'}"> selected="selected"</c:if>>전체</option>
	                   <option value=6 <c:if test ="${oldBook.nb_category2 eq '6'}"> selected="selected"</c:if>>과학/기술</option>
	                   <option value=7 <c:if test ="${oldBook.nb_category2 eq '7'}"> selected="selected"</c:if>>문학</option>
	     			</select>
     			</c:if>
     			
             </div>
             <!-- 정렬 조건 -->
          <%--   <div>
                
                 <select id="orderType" class="form-select" aria-label="Default select example" onchange="category2Click()">
                   <option value="recently" <c:if test ="${oldBook.orderType eq 'recently'}"> selected="selected"</c:if>>최신순</option>
                   <option value="highreview" <c:if test ="${oldBook.orderType eq 'highreview'}"> selected="selected"</c:if>>높은별점순</option>
                   <option value="highprice" <c:if test ="${oldBook.orderType eq 'highprice'}"> selected="selected"</c:if>>높은가격순 </option>
                   <option value="lowprice" <c:if test ="${oldBook.orderType eq 'lowprice'}"> selected="selected"</c:if>>낮은가격순</option>
                </select> 
             </div> --%>
          </div> 
       </div>
    </div>
 </div>
</div>
          

<!-- 국내도서 리스트 -->
<c:set var="num" value="${page.totalOb-page.start+1 }"></c:set>
<c:forEach var="oldBook" items="${listObFo }">
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
			              <%--    <c:if test="${inNewbook.nb_num eq newbook.hit_nb_num}">
			                 	<div class=" position-absolute top-0">
			                 	   <!-- 조회수가 가장 높은 것 hit로 보여주기 --> 
			                       <span class="badge bg-danger">Hit</span>
			                    </div>
			                 </c:if>  --%>
		                    <a href="#">
		                       <!-- 도서 이미지 -->
		                       <img src="${oldBook.nb_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 13rem;">
		                    </a>
		                 </div>
		              </div>
		              <div class="col-md-8 col-12 flex-grow-1">
		                 <!-- 도서 제목 -->
		                 <h1 class="fs-2 mb-3"><a href="foOldBookDetail?ob_num=${oldBook.ob_num }" class="text-inherit text-decoration-none">
				          	<c:choose>
								<c:when test="${oldBook.ob_grade eq '0' }"><c:out value="[중고 A]"/></c:when>
								<c:when test="${oldBook.ob_grade eq '1' }"><c:out value="[중고 B]"/></c:when>
								<c:when test="${oldBook.ob_grade eq '2' }"><c:out value="[중고 C]"/></c:when>
								<c:when test="${oldBook.ob_grade eq '3' }"><c:out value="[중고 D]"/></c:when>
								<c:otherwise><c:out value="kkk"/></c:otherwise>
							</c:choose>
							${oldBook.nb_title}</a>
		                 </h1>
		                 <!-- 지은이, 출판사, 출판일 -->
		                 <h3 class="fs-6 mb-3">${oldBook.nb_writer} | ${oldBook.nb_publisher} | ${oldBook.nb_publi_date}<br>
		                 매입번호 : ${oldBook.ob_num }
		                 </h3>
		              <div>
	                    <!-- 별점 -->
<%-- 	                    <div class="text-warning">
	                    	<c:forEach var="i" begin="1" end="${oldBook.r_ratingAvg }">
	                    		<i class="bi bi-star-fill"></i>
	                    	</c:forEach>
	                    	<c:forEach var="i" begin="${oldBook.r_ratingAvg + 1}" end="5">
	                    		<i class="bi bi-star"></i>
	                    	</c:forEach>
		                    <span class="text-muted small" style="margin-left: 10px;">${oldBook.r_ratingAvg }(${inNewbook.reviewCnt }건)</span>
	              		</div>
		              </div> --%>
		                 
		                 <!-- 도서가격 + 버튼들 -->
		                 <div class="  mt-8 mb-3">
		                     <!-- 도서 가격 -->
		                    <div>
		                     <span class="text-dark fs-3"><fmt:formatNumber value="${oldBook.ob_sell_price}" groupingUsed="true"/>원</span>
		                     <span id="price_point" class="text-muted ml-5">
		                     		적립포인트 : <fmt:formatNumber value="${oldBook.ob_sell_price * 0.01}" pattern="#"/>p
		                     </span>
		                    </div>
		                    
		                    <!-- 찜, 바로구매,  장바구니 버튼 -->
		                    <div class="mt-2">
		                    
		                       <!-- 바로구매 버튼 -->   
		                       <a href="orderForm?ob_num=${oldBook.ob_num}&paymentType=1&c_count=1" class="btn btn-primary ">
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
	</div>    
</c:forEach>       
<div>
<c:if test="${totalOb2 eq 0 }">
					
	<div class="alert alert-warning d-flex align-items-center" role="alert">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill me-2" viewBox="0 0 16 16">
         <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
      </svg>
      <div>
         	찾으시는 중고도서가 없습니다   	
      </div>
   
   </div>
	  <div>
     <a href="/innewbookList?nb_category1=1"> <button type="button" class="btn btn-success mb-2" style="float: right;">새상품 보러가기</button></a>
      </div>		
	</c:if>
</div>


<br><br>

<!-- 페이징 처리 -->
<c:set var="num" value="${num - 1 }"></c:set>

 <div class="d-flex justify-content-center">
	 <nav aria-label="...">
		  <ul class="pagination">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="page-item">					
						<a class="page-link" href="folistOb?currentPage=${page.startPage-page.pageBlock}&nb_category1=${oldBook.nb_category1 }&nb_category2=${oldBook.nb_category2 }">
						이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="page-item">
 						<a class="page-link" href="folistOb?currentPage=${i}&nb_category1=${oldBook.nb_category1 }&nb_category2=${oldBook.nb_category2 }">${i}</a>
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalObPage }">
					 <li class="page-item">		 
						<a class="page-link" href="folistOb?currentPage=${page.startPage+page.pageBlock}&nb_category1=${oldBook.nb_category1 }&nb_category2=${oldBook.nb_category2 }">다음</a>
					</li>
				</c:if>
		</ul>
	</nav>
</div>
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>