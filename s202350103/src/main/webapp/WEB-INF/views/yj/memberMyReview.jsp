<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="row">
<div class="col-lg-12">
      <div class="mb-8">
         <!-- heading -->
         <h2 class="mb-2">내가 작성한 리뷰</h2>
         <p><a href="#">${member.m_id } 님의 작성한 리뷰 목록입니다.</a></p>
      </div>
      <div>
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>작성일 </th>
                     <th></th>
                     <th>내용</th>
                     <th>제목</th>
                     <th>별점</th>
                  
                  </tr>
               </thead>
                <tbody>
    				<c:forEach items="${memberMyReview }" var="myReview">
	    				<tr class="align-middle">
							<td><fmt:formatDate value="${myReview.r_create_date }" pattern="yyyy-MM-dd"/></td>	     					
	                       <td class="align-middle">
                       			 <a href="#"><img src="${myReview.nb_image }" class="icon-shape icon-xxl" alt="썸네일"></a>
	   	                  </td>
	                       <td class="align-middle">
	                	        <div>
    	                    	<h5 class="fs-6 mb-0">
    	                    		<a href="#" class="text-inherit">${myReview.nb_title }<a href="#">(${myReview.nb_writer })</a></a>
    	                    	</h5>
        	                
        	                <small>${myReview.r_content }</small>
            	        	    </div>
                	     </td>
						 <td>${myReview.r_title }</td>	
							
						 <td>
           					<c:forEach begin="1" end="${myReview.r_rating}" var="star">
               					<i class="bi bi-star-fill" style="color: #ffc107;"></i>
			            	</c:forEach>
				        </td>
								     				
	     				</tr>
	     			
    				</c:forEach>
     			
     			</tbody>
 
 
 			  </table>
		   </div>
		 </div>
	 </div>
 </div>

<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
	     	 <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>
	


<%@ include file="../common/footerFo.jsp"%>

</body>
</html>