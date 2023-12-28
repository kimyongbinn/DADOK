<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">
#box-right {
  align: right;
}
.top {
                position: relative;
               
                justify-content: space-between;
                padding: 0.5rem 1.4rem;
                background-color: #3CB371;
                vertical-align: middle;
            }
            
     h1.infoTit {
     				margin-top : 10px;
                    font-size: 20px; 
                    color:#ffffff;
                }


</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%-- <h3>조회수 : ${oldBook.ob_readcnt }</h3> --%>

	<div class="row">
	
	  <div class="col-md-12 row justify-content-center">
	  
<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right: 150px;" >
	  <button class="btn btn-soft-primary mb-2" type="button" 
	  		onclick="location.href='folistOb?nb_category1=${oldBook.nb_category1}'">도서목록</button>
	  		
   </div>
		<!-- 도서 이미지 -->
		 <div class="product" id="product" style="width: 20rem;">
		    <div class="zoom" onmousemove="zoom(event)"
		       style="background-image: url(${oldBook.nb_image})">
		       <!-- img --><img src="${oldBook.nb_image}" alt="${oldBook.nb_title}">
		    </div>
		 </div>
	  <!-- 도서 간략 정보 -->
	  <div class="col-md-6 text-end" style="width: 770px;">
		 <div class="ps-lg-4 mt-4 mt-md-0">
		    <!-- 카테고리 -->
		   <span class="mb-4 d-block text-start" style="margin-left: 100px;">
		    	<c:choose>
					<c:when test="${oldBook.nb_category1 eq 1}">국내도서 </c:when>
					<c:when test="${oldBook.nb_category1 eq 2}">해외도서 </c:when>
				</c:choose>
				>
				<c:choose>
					<c:when test="${oldBook.nb_category2 eq 1}"> 경제/경영</c:when>
					<c:when test="${oldBook.nb_category2 eq 2}"> 과학</c:when>
					<c:when test="${oldBook.nb_category2 eq 3}"> 소설</c:when>
					<c:when test="${oldBook.nb_category2 eq 4}"> 역사/문화</c:when>
					<c:when test="${oldBook.nb_category2 eq 5}"> 인문</c:when>
					<c:when test="${oldBook.nb_category2 eq 6}"> 과학/기술</c:when>
					<c:when test="${oldBook.nb_category2 eq 7}"> 문학</c:when>
				</c:choose>
		    </span>  
	  
	  
		    <!-- 도서명 -->
		    <h1 class="mb-1 text-center" style="width: 550px; margin-left: 100px;">
	      	<c:choose>
					<c:when test="${oldBook.ob_grade eq '0' }"><c:out value="[중고 A]"/></c:when>
					<c:when test="${oldBook.ob_grade eq '1' }"><c:out value="[중고 B]"/></c:when>
					<c:when test="${oldBook.ob_grade eq '2' }"><c:out value="[중고 C]"/></c:when>
					<c:when test="${oldBook.ob_grade eq '3' }"><c:out value="[중고 D]"/></c:when>
					<c:otherwise><c:out value="kkk"/></c:otherwise>
			</c:choose>
		    ${oldBook.nb_title}</h1>
	    <!-- 도서 가격 -->
		    <div class="fs-4 text-center">
		       <!-- 가격 -->
		       <span class="fw-bold text-dark"><fmt:formatNumber value="${oldBook.ob_sell_price}" groupingUsed="true"/>원</span>
		       <!-- 적립포인트 -->
		       <span><small class="fs-6 ms-2 text-muted">
		       		적립포인트 : <fmt:formatNumber value="${oldBook.ob_sell_price * 0.01}" pattern="#"/>p
		       </small></span>
		    </div>
	  
	     
		    <!-- 한 줄 긋기 -->
		    <hr style="width: 620px; margin-left: 100px;">
	  </div>
	    
		    <!-- 도서 간략 내용 -->
		    <div style="width: 500px;">
		       <!-- table -->
		       <table class="table table-borderless" style="margin-left: 100px;">
		         
		          <tbody style="margin-left: 200px;">
		             <tr>
		                <td>지은이:</td>
		                <td>${oldBook.nb_writer }</td>
		             </tr>
		             <tr>
		                <td>출판사:</td>
		                <td>${oldBook.nb_publisher }</td>
		             </tr>
		             <tr>
		                <td>출간일:</td>
		                <td> 
		                   <c:set var="dateVal" value="${oldBook.nb_publi_date }" />
		              		 ${fn:substring(dateVal,0,10) }
		                </td>
		             </tr>
		                <tr>
		                <td>   매입번호 :</td>
		                <td>${oldBook.ob_num }</td>
		             </tr>
		          </tbody>
		       </table>
		    </div>
		    
		
		    
		   <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		       <!-- 수량 선택 버튼 및 구매 버튼, 찜하기 버튼 -->
		       <form action="">
		       <input name="nb_num" type="hidden" value="${oldBook.nb_num }">
		       <div class="input-group input-spinner" >
		       	  <!-- 수량 선택 버튼 -->
		         <!--  <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity" style="height: 42px;width: 40px;">
		          <input id="c_count" type="number" min="1" step="1"  max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input" style="height: 42px;width: 40px;">
		          <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity" style="height: 42px;width: 40px;"> -->
				  <div class="g-2 align-items-center">
				     <!-- 구매버튼 -->
				     <div style="margin-left: 15px; margin-right:  70px;">
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
				     </div>
		    	  </div>
		      </div>
		      </form>
		   </div>
		 </div>
	  
	  
	  
</div>
	
 
   
	 
		    <!-- 별점 -->
		<%--     <div class="mb-4">
                <div class="text-warning">
                	<c:forEach var="i" begin="1" end="${newbook.r_ratingAvg }">
                		<i class="bi bi-star-fill"></i>
                	</c:forEach>
                	<c:forEach var="i" begin="${newbook.r_ratingAvg + 1}" end="5">
                		<i class="bi bi-star"></i>
                	</c:forEach>
                 <span class="text-muted small" style="margin-left: 10px;">${newbook.r_ratingAvg }(${newbook.reviewCnt }건)</span>
          		</div>
		    </div> --%>
		    <!-- 도서 가격 -->
		
		 
		  
	
	<div class="container">
      <div class="row justify-content-center">
        <div class="col-md-10 mt-5">
          <!-- 탭 메뉴들 -->
          <ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
            <!-- 도서 상세 내용 탭 버튼 -->
            <li class="nav-item" role="presentation">
              <!-- btn --> <button class="nav-link active" id="product-tab" data-bs-toggle="tab"
                data-bs-target="#product-tab-pane" type="button" role="tab" aria-controls="product-tab-pane"
                aria-selected="true">상세 정보</button>
            </li>
            <!-- 동일 중고 도서 리스트 탭 버튼 -->
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="details-tab" data-bs-toggle="tab"
                data-bs-target="#details-tab-pane" type="button" role="tab" aria-controls="details-tab-pane"
                aria-selected="false" onclick="oldbookList()">동일 새상품 도서</button>
            </li>
          </ul>
          <!-- 탭 상세 내용들 -->
          <div class="tab-content" id="myTabContent">
            <!-- 도서 상세 내용 -->
            <div class="tab-pane fade show active" id="product-tab-pane" role="tabpanel" aria-labelledby="product-tab"
              tabindex="0">
    		
    		
    		<table style="margin-top: 20px;">
    		
    		<tr>
    		<th>
    		<div class="w-100">
			<h3 class="mb-3">중고 품질 판정 </h3> 
			</div></th>
			<th >
				<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" style="float: right; margin-left: 40px;">
        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-info-circle-fill me-2" viewBox="0 0 16 16">
         <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
      </svg>	   
 중고 품질 판정 가이드 
	</button>			
			</th>
    		</tr>
    		</table>
  
     	
              <div class="my-8">
               <div>
			<div class="w-100">
	
			
		<c:if test="${oldBook.ob_grade eq 0 }">	
			<div class="table-responsive d-block">
			  <table class="table">
			    <thead class="table-light text-center">
			      <tr>
					        <th scope="col" class="col-2">품질 등급</th>
					        <th scope="col">헌 상태</th>
					        <th scope="col">표지</th>
					        <th scope="col">책등 / 책배</th>
					        <th scope="col">내부 / 제본상태 </th>
			      </tr>
			    </thead>
			    <tbody >
			      <tr>
			        <th style="border: none;">A 등급</th>
			        <td>	새것에 가까움</td>
		        <td>
				<ul>
						<li>변색 없음</li>
						<li>찢어진 흔적 없음</li>
						<li>닳은 흔적 없음</li>
						<li>낙서 없음</li>
						<li>얼룩 없음</li>
						<li>도서 겉표지 있음</li>	
				</ul>
			</td>
	        <td>
		        <ul>
				       	<li>변색 없음</li>
						<li>닳은 흔적 없음</li>
						<li>낙서 없음</li>
						<li>얼룩 없음</li>
		        </ul>
	        </td>
	        <td>
		    	<ul>
			        	<li>변색 없음</li>
						<li>닳은 흔적 없음</li>
						<li>낙서 없음</li>
						<li>얼룩 없음</li>
						<li>변형 없음</li>
						<li>제본 탈착 없음</li>
		      			  </ul>
					</td>
				 </tr>
				 </tbody>
				 </table>
				 </div>	
					</c:if>
					
					
						<c:if test="${oldBook.ob_grade eq 1 }">
					
			<div class="table-responsive d-block">
			  <table class="table">
			    <thead class="table-light text-center">
			      <tr>
					        <th scope="col" class="col-2">품질 등급</th>
					        <th scope="col">헌 상태</th>
					        <th scope="col">표지</th>
					        <th scope="col">책등 / 책배</th>
					        <th scope="col">내부 / 제본상태 </th>
			      </tr>
			    </thead>
			    <tbody>
			        <tr>
		        <th style="border: none;">B 등급</th>
		        <td>	약간의 사용감은 있으나 깨끗한 책</td>
		        <td>
		<ul>
						<li>희미한 변색이나 작은 얼룩이 있음</li>
						<li>찢어진 흔적 없음</li>
						<li>약간의 모서리 해짐</li>
						<li>낙서 없음</li>
						<li>도서 겉표지 있음</li>
			</ul>
			</td>
		        <td>
		        <ul>
				        <li>희미한 변색이나 작은 얼룩이 있음</li>
						<li>약간의 닳은 흔적 있음</li>
						<li>낙서 없음</li>   
		        </ul>
		        
		        </td>
		        <td>
		        <ul>
						<li>변색 없음</li>
						<li>낙서 없음</li>
						<li>변형 없음</li>
						<li>아주 약간의 접힌 흔적 있음</li>
						<li>얼룩 없음</li>
						<li>제본 탈착 없음</li>
		        </ul>
		        </td>
		      </tr>
				 </tbody>
				 </table>
				 </div>	
					</c:if>
					
	<c:if test="${oldBook.ob_grade eq 2 }">
					
			<div class="table-responsive d-block">
			  <table class="table">
			    <thead class="table-light text-center">
			      <tr>
					        <th scope="col" class="col-2">품질 등급</th>
					        <th scope="col">헌 상태</th>
					        <th scope="col">표지</th>
					        <th scope="col">책등 / 책배</th>
					        <th scope="col">내부 / 제본상태 </th>
			      </tr>
			    </thead>
			    <tbody>
			     <tr>
		        <th  style="border: none;">C 등급</th>
		        <td>사용감이 많으며 <br>헌 느낌이 나는 책</td>
		        <td>
				<ul>
						<li>전체적인 변색
						<li>모서리 해짐 있음</li>
						<li>2cm 이하의 찢어짐</li>
						<li>오염 있음</li>
						<li>낙서 있음</li>
						<li>도서 겉표지 없음</li>
						<li>아웃케이스 없음</li>
				</ul>
				</td>
		        <td>
		        <ul>
						<li> 전체적인 변색</li>
						<li>모서리 해짐 있음</li>
						<li>오염 있음</li>
						<li>낙서 있음 (이름 포함)</li>
		        </ul>
		        </td>
		        <td>
		        <ul>
				        <li>변색 없음</li>
						<li>2cm 이하 찢어짐 있음</li>
						<li>5쪽 이하의 필기 및 풀이 또는 밑줄 있음</li>
						<li>얼룩 및 오염 있음</li>
						<li>제본 탈착 없음</li>
						<li>본문 읽기에 지장 없는 부록 없음</li>
		        </ul>
		        </td>
		      </tr>
				 </tbody>
				 </table>
				 </div>	
					</c:if>							
		<c:if test="${oldBook.ob_grade eq 3 }">			
			<div class="table-responsive d-block">
			  <table class="table">
			    <thead class="table-light text-center">
			          <tr>
					        <th scope="col" class="col-2">품질 등급</th>
					        <th scope="col">헌 상태</th>
					        <th scope="col">표지</th>
					        <th scope="col">책등 / 책배</th>
					        <th scope="col">내부 / 제본상태 </th>
			      </tr>
			    </thead>    
			  <tr>
		        <th style="border: none;" >D 등급 </th>
		        <td>사용감이 많고 세월이 <br>있는책 </td>
		     <td>
				<ul>
						<li>전체적인 변색</li>
						<li>모서리 해짐 </li>
						<li>2cm 이상의 찢어짐</li>
						<li>오염 있음</li>
						<li>낙서 있음</li>
						<li>도서 겉표지 없음</li>
						<li>아웃케이스 없음</li>
				</ul>
				</td>
		        <td>
		        <ul>
		     		 <li> 전체적인 변색</li>
					<li>모서리 해짐 있음</li>
					<li>오염 있음</li>
					<li>낙서 있음 (이름 포함)</li>
		        </ul>
		        </td>
		        <td>
		        <ul>
		        <li>변색 없음</li>
					<li>2cm 이상의 찢어짐 있음</li>
					<li>20쪽 이하의 필기 및 풀이 또는 밑줄 있음</li>
					<li>얼룩 및 오염 있음</li>
					<li>제본 탈착 없음</li>
					<li>본문 읽기에 지장 없는 부록 있음</li>
		        </ul>
		        </td>
		      </tr>
				 </tbody>
				 </table>
				 </div>	
			</c:if>
	
	
					
 
		
		<br><br><br>
               </div>  
               
                <div class="mb-5">
                  <h3 class="mb-3">줄거리</h3>
                  <p class="mb-0 fs-5">${oldBook.nb_summary }</p>
                </div>
                
                <div class="mb-5">
                  <h3 class="mb-3">기본정보</h3>
                   <table class="table fs-6" style="width: 25rem;">
				     <tr>
				       <th class="table-light text-center">ISBN</th>
				       <td>${oldBook.nb_isbn }</td>
				     </tr>
					 <tr>
				       <th class="table-light text-center">쪽수</th>
				       <td>${oldBook.nb_page }</td>
				     </tr>
				     <tr>
				       <th class="table-light text-center">크기</th>
				       <td>${oldBook.nb_size }</td>
				     </tr>  
				   </table>
                </div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:700px;">

        	<header class="top">
			<h1 class="infoTit">
				
				 중고 품질 판정 가이드 </h1>
		</header>

      
     
      <div class="modal-body">
        
          
   <div id="chkgrade">
<div>
			<h3 class="mb-3"> </h3>
</div>

	
	</div>
<div class="">
			  <table class="">
			    <thead class="table-light text-center">
			      <tr>
					        <th scope="col" class="col-2">품질 등급</th>
					        <th scope="col">헌 상태</th>
					        <th scope="col">표지</th>
					        <th scope="col">책등 / 책배</th>
					        <th scope="col">내부 / 제본상태 </th>
			      </tr>
			    </thead>
			    <tbody style="border:none; ">
			      <tr>
			        <th  >A 등급</th>
			        <td>	새것에 가까움</td>
		        <td>
				<ul>
						<li>변색 없음</li>
						<li>찢어진 흔적 없음</li>
						<li>닳은 흔적 없음</li>
						<li>낙서 없음</li>
						<li>얼룩 없음</li>
						<li>도서 겉표지 있음</li>	
				</ul>
			</td>
	        <td>
		        <ul>
				       	<li>변색 없음</li>
						<li>닳은 흔적 없음</li>
						<li>낙서 없음</li>
						<li>얼룩 없음</li>
		        </ul>
	        </td>
	        <td>
		    	<ul>
			        	<li>변색 없음</li>
						<li>닳은 흔적 없음</li>
						<li>낙서 없음</li>
						<li>얼룩 없음</li>
						<li>변형 없음</li>
						<li>제본 탈착 없음</li>
		        </ul>
			</td>
		 </tr>
		    </tbody>
		    
		    </table>
	</div>


<div class="accordion" id="accordionExample">
 <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
       <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
    					  B 등급
       </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse"
       aria-labelledby="headingOne" data-bs-parent="#accordionExample">
       <div class="accordion-body">
       
        <div class="">
				 	 <table class="">
						 		   <thead class="table-light text-center">
						 	     <tr>
								        <th scope="col" class="col-2">품질 등급</th>
								        <th scope="col">헌 상태</th>
								        <th scope="col">표지</th>
								        <th scope="col">책등 / 책배</th>
								        <th scope="col">내부 / 제본상태 </th>
						      </tr>
						    </thead>
						    <tbody>
						        <tr>
					        <th  >B 등급</th>
					        <td>	약간의 사용감은 있으나 깨끗한 책</td>
					        <td>
						<ul>
									<li>희미한 변색이나 작은 얼룩이 있음</li>
									<li>찢어진 흔적 없음</li>
									<li>약간의 모서리 해짐</li>
									<li>낙서 없음</li>
									<li>도서 겉표지 있음</li>
						</ul>
						</td>
					        <td>
					        <ul>
							        <li>희미한 변색이나 작은 얼룩이 있음</li>
									<li>약간의 닳은 흔적 있음</li>
									<li>낙서 없음</li>   
					        </ul>
					        
					        </td>
					        <td>
					        <ul>
									<li>변색 없음</li>
									<li>낙서 없음</li>
									<li>변형 없음</li>
									<li>아주 약간의 접힌 흔적 있음</li>
									<li>얼룩 없음</li>
									<li>제본 탈착 없음</li>
					        </ul>
					        </td>
					      </tr>
					     
						    </tbody>
						    </table>
						    </div>

          
       </div>
    </div>
 </div>
 <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
       <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
   						    C 등급
       </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
       data-bs-parent="#accordionExample">
       <div class="accordion-body">
          	 <div class="">
				 	 <table class="">
						 		   <thead class="table-light text-center">
						 	     <tr>
								        <th scope="col" class="col-2">품질 등급</th>
								        <th scope="col">헌 상태</th>
								        <th scope="col">표지</th>
								        <th scope="col">책등 / 책배</th>
								        <th scope="col">내부 / 제본상태 </th>
					   		   </tr>
					 	   </thead>
					  	  <tbody>
					     <tr>
								        <th  >C 등급</th>
								        <td>사용감이 많으며 <br>헌 느낌이 나는 책</td>
								        <td>
										<ul>
												<li>전체적인 변색
												<li>모서리 해짐 있음</li>
												<li>2cm 이하의 찢어짐</li>
												<li>오염 있음</li>
												<li>낙서 있음</li>
												<li>도서 겉표지 없음</li>
												<li>아웃케이스 없음</li>
										</ul>
										</td>
								        <td>
								        <ul>
												<li> 전체적인 변색</li>
												<li>모서리 해짐 있음</li>
												<li>오염 있음</li>
												<li>낙서 있음 (이름 포함)</li>
								        </ul>
								        </td>
								        <td>
								        <ul>
										        <li>변색 없음</li>
												<li>2cm 이하 찢어짐 있음</li>
												<li>5쪽 이하의 필기 및 풀이 또는 밑줄 있음</li>
												<li>얼룩 및 오염 있음</li>
												<li>제본 탈착 없음</li>
												<li>본문 읽기에 지장 없는 부록 없음</li>
								        </ul>
								        </td>
								      </tr>
					 
						    </tbody>
						    </table>
						    </div>
      

          
       </div>
    </div>
 </div>
 <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
       <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
     				D 등급
       </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse"
       aria-labelledby="headingThree" data-bs-parent="#accordionExample">
       <div class="accordion-body">
        
              <div class="">
				 	 <table class="">
						 		   <thead class="table-light text-center">
						 	     <tr>
								        <th scope="col" class="col-2">품질 등급</th>
								    	<th scope="col">헌 상태</th>
								     	<th scope="col">표지</th>
								     	<th scope="col">책등 / 책배</th>
								     	<th scope="col">내부 / 제본상태 </th>
							   		   </tr>
							 	   </thead>
							  	  <tbody>
											    <tr>
								        <th  >D 등급 </th>
								        <td>사용감이 많고 세월이 <br>있는책 </td>
								               <td>
										<ul>
												<li>전체적인 변색
												<li>모서리 해짐 </li>
												<li>2cm 이상의 찢어짐</li>
												<li>오염 있음</li>
												<li>낙서 있음</li>
												<li>도서 겉표지 없음</li>
												<li>아웃케이스 없음</li>
										</ul>
										</td>
								        <td>
								        <ul>
								     		<li> 전체적인 변색</li>
											<li>모서리 해짐 있음</li>
											<li>오염 있음</li>
											<li>낙서 있음 (이름 포함)</li>
								        </ul>
								        </td>
								        <td>
								        <ul>
								        <li>변색 없음</li>
											<li>2cm 이상의 찢어짐 있음</li>
											<li>20쪽 이하의 필기 및 풀이 또는 밑줄 있음</li>
											<li>얼룩 및 오염 있음</li>
											<li>제본 탈착 없음</li>
											<li>본문 읽기에 지장 없는 부록 있음</li>
								        </ul>
								        </td>
								      </tr>
								      
				
						   			 </tbody>
						   		 </table>
						  				  </div>
									    </div>
								    </div>
								</div>
							</div>
							   <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
          </div>
          </div>
     
     
     
     
     
			</div>
			
			
		
          
            <!-- 동일 새상품 도서 리스트 -->
   <div class="tab-pane fade" id="details-tab-pane" role="tabpanel" aria-labelledby="details-tab" tabindex="0">
        <div class="my-8">
           <div class="row">
               <div class="col-10" style="margin: auto;">
       <div class="py-5">
          <ul class="list-group list-group-flush">
             <!-- list group -->
             <li class="list-group-item py-3 py-lg-0 px-0 " style="border: 1px solid; border-color: green; border-radius: 30px; margin: 10px; " >
                <!-- row -->
               
                <div class="row align-items-center">
                   <div class="col-3 col-md-2">
                      <!-- img --> <img src="${oldBook.nb_image}" alt="Ecommerce" class="img-fluid" style="margin-left: 35px;">
                  	<input type="hidden" name="nb_image" value="${oldBook.nb_image }">
                   </div>
                   <div class="col-3 col-md-4" style="margin-left: 35px;">
                      <!-- title -->
                        <h6 class="mb-0"><input type="hidden" name="nb_num" value="${oldBook.nb_num}"> 
                        			<input type="hidden"  name="nb_title" value="${oldBook.nb_title }">
                        			${oldBook.nb_title }
                          </h6>
                 
                      <span><small class="text-muted">
	                      <input type="hidden" disabled="disabled" name="nb_writer" value="${oldBook.nb_writer}"> 지은이: ${oldBook.nb_writer}
	                        <br>
	                      <input type="hidden"  name="nb_publisher" value="${oldBook.nb_publisher }"> 출판사: ${oldBook.nb_publisher }
	                      <br>
                    	<input type="hidden" name="nb_publi_date" value="${oldBook.nb_publi_date }"> 출간일: <c:set var="dateVal" value="${oldBook.nb_publi_date }" />
		              																																						 ${fn:substring(dateVal,0,10) } 
                      </small></span>
                      <!-- text -->
                    </div>
                      <!-- input group -->
                   <div class="col-2 col-md-3 col-lg-3">
                      <!-- input -->
   						<input type="hidden" name="nb_price" value="${oldBook.nb_price }"> 
   						<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price}"/>원   
                   </div>
                   <!-- 넣기 -->
              <div class="col-1 text-start col-md-1">
             <span class="fw-bold"> <input type="button" class="btn btn-primary mb-1" value="새상품 보러가기" onclick="location.href='newbookDetail?nb_num=${oldBook.nb_num}'"></span>	
               </div>
                </div>
             </li>
                </ul>
            
                  
                  
                  
                  </div>
                </div>
              </div>
            </div>
         </div>
         
            
             
    

  
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>