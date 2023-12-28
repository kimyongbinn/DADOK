<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery안에  ajax 함수가 있기 때문에 jquery.js 가져와야 한다. -->
<script type="text/javascript">
	function reviewChange(start,end) {
		//var sendData = $('form').serialize();
		var r_reviewSelect = $('#reviewSel').val();;
		var sendData = 'r_reviewSelect='+r_reviewSelect+'&start='+start+'&end='+end;
	
		location.href="reviewList?"+sendData;
	};  

	$(function() {
		// ++5
		$('#chk1').click(function() {
				var sendData = $('form').serialize();
				location.href="reviewList?"+sendData;
			   
		 });
	}) 
	
	
</script>
</head>

	

<body>
<div class="row">
 <div class="col-md-4">
       <div class="me-lg-12 mb-6 mb-md-0">
          <div class="mb-5">
             <!-- title -->
             <h4 class="mb-3">고객 리뷰</h4>
             <span>
                <!-- rating --> <small class="text-warning"> <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-half"></i></small><span class="ms-3">${review.r_review_average } out of 5</span><small
                   class="ms-3">리뷰 총 수량 : ${review.r_review_total}</small>
             </span>
          </div>
          <div class="mb-8">
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">5</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating5+20}%;"
                         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">${review.r_rating5}%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">4</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating4+20}%;"
                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">${review.r_rating4}%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">3</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating3+20}%;"
                        aria-valuenow="35" aria-valuemin="0" aria-valuemax="35"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">${review.r_rating3}%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">2</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating2+20}%;"
                     aria-valuenow="22" aria-valuemin="0" aria-valuemax="22"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">${review.r_rating2}%</span>
             </div>
             <!-- progress -->
             <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3 text-muted"><span
                   class="d-inline-block align-middle text-muted">1</span><i
                   class="bi bi-star-fill ms-1 small text-warning"></i></div>
                <div class="w-100">
                   <div class="progress" style="height: 6px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: ${review.r_rating1+20}%;"
                    aria-valuenow="14" aria-valuemin="0" aria-valuemax="14"></div>
                   </div>
                </div>
                <span class="text-muted ms-3">${review.r_rating1}%</span>
             </div>
          </div>
          <div class="d-grid">
             <h4>해당 상품 리뷰</h4>
             <p class="mb-0">다른 고객분들을 위해서 리뷰를 작성해주세요.</p>
             <a href="MyReviewList" class="btn btn-outline-gray-400 mt-4 text-muted">리뷰 작성하기</a>
             <a href="kakaoPayStart" class="btn btn-outline-gray-400 mt-4 text-muted">결제하기</a>
          </div>
       </div>
    </div>
    <!-- col -->
    <div class="col-md-8">
       <div class="mb-10">
          <div class="d-flex justify-content-between align-items-center mb-8">
             <div>
                <!-- heading -->
                <h4>리뷰</h4>
             </div>
             <div>
             	<form action="" >
             	   <select name="r_reviewSelect" id="reviewSel" 
                	        class="form-select" 
                	        aria-label="Default select example"
                	        onchange="reviewChange(1,5)"
                	>
	                   <option value="1" <c:if test="${review.r_reviewSelect == '1' }">selected</c:if> >최신순</option>
	                   <option value="2" <c:if test="${review.r_reviewSelect == '2' }">selected</c:if> >별점순</option>
	                </select>
                
             	
                </form>
             </div>
         
          </div>
	            <c:forEach var="review" items="${listReview}" >
		          <div class="d-flex border-bottom pb-6 mb-6">
		             <!-- img -->
		             <img src="${review.nb_image}" alt="product_image"
		                class="rounded-circle avatar-lg">
		             <div class="ms-5">
		                <h6 class="mb-1">
		                 ${review.m_name }
		                </h6>
		                <!-- select option -->
		                <!-- content -->
		                <p class="small"> <span class="text-muted">${review.r_create_date}</span>
		                </p>
		                <!-- rating -->
		                <div class=" mb-2">
							<c:forEach begin="1" end="${review.r_rating}">
			                   <i class="bi bi-star-fill text-warning"></i>
			                </c:forEach>
		                   <span class="ms-3 text-dark fw-bold">${review.r_title}</span>
		                </div>
		                <!-- text-->
		                <p>${review.r_content}</p>
		             </div>
		          </div>
                </c:forEach>
          	
                <form action="">
           	       <input type="hidden" name="start"       value="1">
          	       <input type="hidden" name="end"         value="${review.end + 5}">
  
               	   <input type="button" id="chk1" class="btn btn-outline-gray-400 text-muted" value="리뷰 더보기">
				</form>


<%@ include file="../common/footerFo.jsp" %>

</body>
</html>