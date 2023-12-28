<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.col-lg-9 col-md-12 {
		
	}
	
	.center-text {
	  text-align: center; /* 텍스트 가운데 정렬 */
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  font-weight: bold;
	  color:black;
	  transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
	}
</style>
</head>
<body>


<!-- row -->
		     <div class="row">
		        <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
		          <div class="card py-1 border-0 mb-8">
           			 <div class="mb-8">
			         <!-- heading -->
				         <h2 class="mb-2">중고 판매 현황</h2>
				         <p><a href="#">${member.m_id } 님의 중고 판매 목록입니다.</a></p>
				               총 상품 개수 : ${totalSellCnt }		
			      	</div>
		          <div>
		         <c:if test="${totalSellCnt == 0}">			
			 		<div class="row" style="height: 100px">
						<div class="center-text mt-14 md-14">
							판매한 상품이 없습니다.<p><p>
							<a href="writeFormObReport" class="btn btn-soft-success ">상품 팔기</a>
						</div>
					</div>	 	
				</c:if>
		            <!-- table -->
		        <c:if test="${totalSellCnt != 0 }">
		            <div class="">
		              <table class="table text-nowrap table-with-checkbox">
		              
		                <thead class="table-light">
		                  <tr>
		                    <th></th>
		                    <th>제목</th>
		                    <th>상태</th>
		                    <th style="padding-left: 10px;">등급</th>
		                    <th>판매 예상가</th>
		                    <th>정산 금액</th>
		                    <th style="padding-left: 10px;">신청일자</th>
		                    <th style="padding-left: 0px; padding-right: 10px;">정산여부 / 상세보기</th>
		                  </tr>
		                </thead>
		                <tbody>
		                <c:forEach var="oldbook" items="${oldBookSellList }">
		                  <tr>
		                    <td class="align-middle">
		                      <a href="newbookDetail?nb_num=${oldbook.nb_num }">
		                      	<c:choose>
				                   	<c:when test="${fn:contains(oldbook.nb_image, 'http')}">
				                   		<img src="${oldbook.nb_image }" alt="도서 썸네일" class="icon-shape icon-xxl" >
				                   	</c:when>
				                   	<c:otherwise>
				                   		<img src="${pageContext.request.contextPath}/upload/${oldbook.nb_image}" alt="도서 썸네일" class="icon-shape icon-xxl">
				                   	</c:otherwise>
			                    </c:choose></a>
		                    </td>
		                    <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0"><a href="newbookDetail?nb_num=${oldbook.nb_num }" class="text-inherit">${oldbook.nb_title }</a></h5>
		                         <small>${oldbook.nb_writer }</small><br>
		                         <small>${oldbook.nb_publisher }</small><br>
		                      </div>
		                    </td>
		                    <td class="align-middle">
		                    	<c:choose>
										<c:when test="${oldbook.ob_status == 1}"><span>검수중</span></c:when>
										<c:when test="${oldbook.ob_status == 2}"><span>검수완료</span></c:when>
										<c:when test="${oldbook.ob_status == 3}"><span>매입완료</span></c:when>
										<c:when test="${oldbook.ob_status == 4}"><span>판매완료</span></c:when>
								</c:choose>
		                 	</td>
		                    <td class="align-middle" style="padding-left: 10px;">
		                    	<c:choose>
		                    			<c:when test="${oldbook.ob_status == 1}"><span>  -</span></c:when>
										<c:when test="${oldbook.ob_grade == 0}"><span>A 등급</span></c:when>
										<c:when test="${oldbook.ob_grade == 1}"><span>B 등급</span></c:when>
										<c:when test="${oldbook.ob_grade == 2}"><span>C 등급</span></c:when>
										<c:when test="${oldbook.ob_grade == 3}"><span>D 등급</span></c:when>
								</c:choose>
		                 	</td>
		                    <td class="align-middle">	
								<fmt:formatNumber value="${oldbook.ob_pur_price }" pattern="#,###" /> 원
		                    </td>
		                    <td class="align-middle">
		                    	<c:choose>
									<c:when test="${oldbook.ob_status == 1}"><span>책정중</span></c:when>
									<c:otherwise><fmt:formatNumber value="${oldbook.ob_pur_price }" pattern="#,###" /> 원</c:otherwise>
								</c:choose>
		                    </td>
		                    <td class="align-middle" style="padding-left: 10px;"> ${oldbook.ob_report_date }</td>
		                    <td style="padding-left: 0px; padding-right: 10px; text-align: center;" >
		                    	<div class="justify-content-between mt-4">
		                    		<c:if test="${oldbook.ob_status == 2}"><input type="text" disabled="disabled" style="border: none; background: transparent; width: 65px;" value="정산가능"></c:if>	
		                    		<c:if test="${oldbook.ob_status != 1}"><button class="btn btn-success btn-sm" onclick="location.href='FodetailOb?ob_num=${oldbook.ob_num}'">상세보기</button></c:if>
		                    		<c:if test="${oldbook.ob_status == 1}"><span>-</span></c:if>
		                    			
					            </div>
					        </td>
		                  </tr>
		                  </c:forEach>
		                </tbody>
		               
		              </table>
		            </div>
			</c:if>
		          </div>
		        </div>
		
		      </div>
		    <c:if test="${totalSellCnt != 0}">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
				 	<c:if test="${page.startPage > page.pageBlock }">
						 <li class="page-item justify-content-center">					
							<a class="page-link mx-1 text-body" href="memberSellList?currentPage=${page.startPage-page.pageBlock}">이전</a>
						</li>
					</c:if>
	 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						 <li class="page-item justify-content-center">
	 						<a class="page-link mx-1 text-body" href="memberSellList?currentPage=${i}">${i}</a>
						</li>
					</c:forEach>
						
					<c:if test="${page.endPage < page.totalPage }">
						 <li class="page-item justify-content-center">		 
							<a class="page-link mx-1 text-body" href="memberSellList?currentPage=${page.startPage+page.pageBlock}">다음</a>
						</li>
					</c:if>
			  	</ul>
	   		</nav>
			</c:if>
		
		    </div>
			


<%@ include file="../common/footerFo.jsp"%>

</body>
</html>