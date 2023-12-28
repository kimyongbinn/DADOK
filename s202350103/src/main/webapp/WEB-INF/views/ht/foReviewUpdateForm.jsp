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
<style type="text/css">
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
	       .rate { display: inline-block;border: 0;margin-right: 15px;}
	.rate > input {display: none;}
	.rate > label {float: right;color: #ddd}
	.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
	.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
	.rate input:checked ~ label, 
	.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
	.rate input:checked + .rate label:hover,
	.rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label,  
	.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } 
	  #ht img {
			    width: 200px; /* 이미지의 가로 크기 조절 */
			    height: auto; /* 세로 크기를 가로 크기에 맞게 자동으로 조절 */
 			  }
  	#ht .text-truncate {
    					font-size: 18px; /* 텍스트 크기 조절 */
  						}
   .text-truncate {
    font-weight: bold;
  					}
</style>
</head>
<body>
 <form action="reviewUpdatePro">
 	 <input type="hidden" name="o_order_num" value="${writedReview.o_order_num}">
 	 <input type="hidden" name="nb_num"      value="${writedReview.nb_num}">
 	 <input type="hidden" name="currentPage" value="${writedReview.currentPage}">
	 <div id="ht">
	   <!-- rating -->
	   <h3 class="mb-5">리뷰 수정</h3>
	   <c:choose>
	     <c:when  test="${fn:contains(writedReview.nb_image, 'http')}">
	            <img src="${writedReview.nb_image}" alt="bookImage">
	     </c:when>
	     <c:otherwise>
	            <img src="${pageContext.request.contextPath}/upload/${writedReview.nb_image}" alt="Grocery Ecommerce Template"class="mb-3">
	     </c:otherwise>
	  </c:choose>
	   <div class="text-truncate">${writedReview.nb_title}</div>
	   <div class="border-bottom py-4 mb-4">
	      <h4 class="mb-3">별점</h4>
	       <fieldset class="rate"><c:if test=""></c:if>
	             <input type="radio" id="rating5" name="r_rating" value="5" <c:if test="${writedReview.r_rating == 5}">
	             															  checked
	             															</c:if>><label for="rating5" title="5점"></label>
	             <input type="radio" id="rating4" name="r_rating" value="4" <c:if test="${writedReview.r_rating == 4}">
	             															  checked
	             															</c:if>><label for="rating4" title="4점"></label>
	             <input type="radio" id="rating3" name="r_rating" value="3" <c:if test="${writedReview.r_rating == 3}">
	             															  checked
	             															</c:if>><label for="rating3" title="3점"></label>
	             <input type="radio" id="rating2" name="r_rating" value="2" <c:if test="${writedReview.r_rating == 2}">
	             															  checked
	             															</c:if>><label for="rating2" title="2점"></label>
	             <input type="radio" id="rating1" name="r_rating" value="1" <c:if test="${writedReview.r_rating == 1}">
	             															  checked
	             															</c:if>><label for="rating1" title="1점"></label>
            </fieldset>
	      </div>
	   </div>
	 
	   <!-- form control -->
	   <div class="border-bottom py-4 mb-4">
	      <h5>제목</h5>
	      <input type="text" name="r_title" class="form-control" placeholder="제목을 작성해주세요!" value="${writedReview.r_title}">
	   </div>
	 
	   <div class=" py-4 mb-4">
	      <!-- heading -->
	      <h5>텍스트 리뷰</h5>
	      <textarea name="r_content" class="form-control" rows="3"
	         placeholder="솔직한 사용후기를 작성해주세요!" >${writedReview.r_content}</textarea>
	   </div>
	   <!-- button -->
	   <div class="d-flex justify-content-end">
	      <input type="submit" class="btn btn-primary" value="리뷰 저장">
	   </div>
	</div>
 </form>
	
	
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>