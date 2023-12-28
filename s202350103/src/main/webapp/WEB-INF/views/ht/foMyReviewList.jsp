<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery안에  ajax 함수가 있기 때문에 jquery.js 가져와야 한다. -->
<script type="text/javascript">


</script>
<style>
    #ht {
        width: 150px; /* Set the desired width */
        height: 200px; /* Set the desired height */
    }
    .pagination .page-item {
						    width: 50%;
						     text-align: center;
    }
</style>

</head>
<body>

	<div class="row">
<!-- col -->
    <div class="col-12">
       <div class="p-4">
       
         <!-- heading -->
         <nav aria-label="...">
			<ul class="pagination pagination-lg justify-content-center">
			  <li  class="page-item active"><a class="page-link" href="MyReviewList" >작성 가능한 리뷰</a></li>
			  <li  class="page-item "><a class="page-link" href="MyReviewedList" >작성한 리뷰</a></li>
			</ul>
		 </nav>
       
          <ul class="list-group list-group-flush">
          
          	 <c:forEach var="orderList" items="${reviewWriteList }">
          	 	 <input type="hidden" name="nb_num" >
	             <li class="list-group-item py-5">
	                <div class="d-flex justify-content-between">
	                   <div class="d-flex">
	                      <!-- img -->
	                      <c:choose>
						     <c:when test="${fn:contains(orderList.nb_image, 'http')}">
						            <img id="ht" src="${orderList.nb_image}" alt="bookImage">
						     </c:when>
						     <c:otherwise>
						            <img src="${pageContext.request.contextPath}/upload/${orderList.nb_image}" id="ht" alt="bookImage">
						     </c:otherwise>
						 </c:choose>
	                      <%-- <img id="ht" src="${orderList.nb_image}" alt="bookImage"> --%>
	                      <!-- text -->
	                      <div class="ms-4" style="font-size: 16px;">
							    <h5 class="mb-0 h6 h6">${orderList.nb_title}</h5>
							    <p style="margin: 10px;">
						        <p class="mb-0 small">수량 : ${orderList.o_de_count}</p>
						        <p style="margin: 10px;">
					            <p class="mb-0 small">구매일자 :
					                <fmt:formatDate value="${orderList.o_order_date}" pattern="yyyy-MM-dd"/>
					            </p>
							</div>
	                   </div>
	                   <div>
	                      <a class="btn btn-primary" href="reviewForm?o_order_num=${orderList.o_order_num}&currentPage=${page.currentPage}&nb_num=${orderList.nb_num}">리뷰 작성하기</a>
	                   </div>
	                </div>
	             </li>
               </c:forEach>
          </ul>
       </div>
         <div style="text-align: center;">
	        <c:if test="${page.startPage > page.pageBlock}">
				<a href="MyReviewList?currentPage=${page.startPage-page.pageBlock}"style="font-size: 19px;">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				<a href="MyReviewList?currentPage=${i}"style="font-size: 19px;">[${i}]</a>
			</c:forEach>
			<c:if test="${page.endPage < page.totalPage}">
				<a href="MyReviewList?currentPage=${page.startPage+page.pageBlock}"style="font-size: 19px;">[다음]</a>
			</c:if>
		 </div>
   	  </div>
    </div>
		
<%@ include file="../common/footerFo.jsp" %>	

</body>
</html>