<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pl{
    width: 110px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 5px 5px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}


</style>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	
	 		function toglestatus() {
			 	var obstatusVal = $("#obstatus1").val();
			 /* 	alert("obstatusVal->"+obstatusVal);	 */
				
			  location.href="/BolistOb?currentPage="+1+"&ob_status="+obstatusVal; 
			
			
			}



</script>
</head>
<body>
	
	<div class="row">
	<div class="col-lg-12 col-md-12 col-12 d-block">
	     <div class="col-12">
	      
	        <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">  중고 판매 신청 목록</h1>
         <p style="margin-bottom: 0px;">총 ${totalOb } 건</p>
      </div>
	       
	       <select id="obstatus1" class="pl "  onchange="toglestatus()" >
	       <option value=0 <c:if test="${oldBook.ob_status eq '0'}"> selected="selected"</c:if>>   전체</option>
	        <option value=1 <c:if test="${oldBook.ob_status eq '1'}"> selected="selected"</c:if>>  검수 중</option>
	         <option value=2<c:if test="${oldBook.ob_status eq '2'}"> selected="selected"</c:if>> 검수 완료</option>
	          <option value=3 <c:if test="${oldBook.ob_status eq '3'}"> selected="selected"</c:if>> 매입 완료</option>
	           <option value=4 <c:if test="${oldBook.ob_status eq '4'}"> selected="selected"</c:if>> 판매 완료</option>
	       </select>    
	           	<br>
	           	
	           	
	           	<div class="table">
	           <table class="table text-nowrap text-center" style="margin-top: 20px;" >
	              <!-- Table Head -->
	              <thead class="table-light">
	                 <tr>  
		                    <th class="border-0">신청일자</th>
		                    <th class="border-0">매입 번호</th>
		                    <th class="border-0">신청자 명 </th>
		                    <th class="border-0 text-center" >중고 상품</th>
		                    
		                    <th class="border-0">매입상태</th>
		 						
		                    <th class="border-0 text-center">검수하기/상세보기</th>
	                 </tr>
	              </thead>
	              <c:forEach var="oldBook" items="${listOb }">
	              <tbody>
	                 <!-- Table body -->
	              	   <tr>
	               	     <td class="align-middle">
                            <h6 class="mb-0">${oldBook.ob_report_date}</h6>
	                       <span><small class="text-muted"></small></span>
	                    </td>
	                    <td class="align-middle">
	                      ${oldBook.ob_num }
	                    </td>
	                    <td class="align-middle">
	                    	${oldBook.m_name }
	                    </td>
	                    <td class="align-middle">
	                    
	                     	  ${oldBook.nb_title }
	                       
	                    </td>
	                    <td class="align-middle">
	     		<c:choose>
						<c:when test="${oldBook.ob_status eq '1' }"><c:out value="검수중"/></c:when>
						<c:when test="${oldBook.ob_status eq '2' }"><c:out value="검수완료"/></c:when>
						<c:when test="${oldBook.ob_status eq '3' }"><c:out value="매입완료"/></c:when>
						<c:when test="${oldBook.ob_status eq '4' }"><c:out value="판매완료"/></c:when>
						<c:otherwise><c:out value=""/></c:otherwise>
				</c:choose>
	                    </td>
	                    
	                    <td style="width: 150px;">
		      			 <c:choose>
							<c:when test="${oldBook.ob_status eq '1' }"><c:out value=""/>
									<input type="button" class="btn btn-soft-success mb-2" value="검수하기" name="ob_num" style="margin-left: 20px;" onclick="location.href='BoupdateObDetailCheck?ob_num=${oldBook.ob_num}'">
								</c:when>
								<c:when test="${oldBook.ob_status eq '2' }"><c:out value=""/>
									<input type="button" class="btn btn-soft-info mb-2" name="ob_num" style="margin-left: 20px;" value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
								</c:when>
								<c:when test="${oldBook.ob_status eq '3' }"><c:out value=""/>
									<input type="button" class="btn btn-soft-info mb-2" name="ob_num" style="margin-left: 20px;" value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
								</c:when>
									<c:when test="${oldBook.ob_status eq '4' }"><c:out value=""/>
									<input type="button" class="btn btn-soft-info mb-2" name="ob_num" style="margin-left: 20px;" value="상세보기" onclick="location.href='BodetailOb?ob_num=${oldBook.ob_num}'">
								</c:when>
								<c:otherwise><c:out value=""/>
								</c:otherwise>
						</c:choose>
		                   </td>
		                </tr>
		   			
		       	</c:forEach> 
		      
		    </tbody>
		           
		</table>
				<br>
									
									<c:set var="num" value="${page.totalOb-page.start+1 }"></c:set>
									<c:set var="num" value="${num - 1 }"></c:set>
									<!-- 페이지 네이션 -->
									 <div class="d-flex justify-content-center">
									  <nav aria-label="...">
									  <!-- 이전버튼 시작 -->
									  <ul class="pagination">
										 	<c:if test="${page.startPage > page.pageBlock }">
												 <li class="page-item">					
													<a class="page-link" href="BolistOb?currentPage=${page.startPage-page.pageBlock}&ob_status=${oldBook.ob_status}">
														이전
													</a>
												</li>
											</c:if>
											
											<!-- 페이지숫자 -->
							 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
												 <li  class="page-item">
							 						<a class="page-link" href="BolistOb?currentPage=${i}&ob_status=${oldBook.ob_status}">${i}</a>
												</li>
											</c:forEach>
												
												<!-- 다음버튼 -->
											<c:if test="${page.endPage < page.totalObPage }">
												 <li class="page-item">		 
													<a class="page-link" href="BolistOb?currentPage=${page.startPage+page.pageBlock}&ob_status=${oldBook.ob_status}">다음</a>
												</li>
											</c:if>
										</ul>
									</nav>
								</div>
<!-- 
						 <div class="d-grid gap-2">
					    <button class="btn btn-soft-success mb-2" type="submit" onclick="location.href='index'">메인화면가기</button>
					</div>	 -->
				</div>
			</div>
		</div>
	</div>

		

</body>
</html>