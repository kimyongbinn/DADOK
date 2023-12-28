<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- End Tag 금비 -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	$(function() {
		if('${result}' == '1'){
			alert("정상적으로 완료되었습니다.");
		}
	});
	
	function boNewbookUpdate(pNb_num) {
		// alert("선택한 도서는 ->" +pNb_num);
		
		location.href = "boNewbookDetail?nb_num="+pNb_num;
	}
	
	function deleteBoNewbook(pIndex){
		if(confirm("상품을 삭제하시겠습니까?")){
			var pNb_num = $('#newbook'+pIndex).val();
			$.ajax({
					url : "deleteBoNewbook",
					data : {nb_num : pNb_num},
					dataType : 'Text',
					success : function(data){
						if(data == '1'){
							alert("삭제되었습니다.");
							$('#newbookRow'+pIndex).remove();
						}else {
							alert("삭제에 실패하였습니다.");
						}
					}
			});
		}
	}
	
</script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
		    <!-- 상품목록 -->
		    <div class="mb-8">
		       <!-- heading -->
		       <h1 class="mb-1">새상품 목록</h1>
		       <p>총 ${boNewbookCnt } ${searchBoNewbookCnt }건</p>
		    </div>
		    <div class="row mt-8">
		    	<!-- 검색 -->
		    	<form action="boSearchNewbookList">
			        <div class="input-group mb-3" style="width: 60%;">
						<select name="search_type" class="w-20 rounded" style="border-color: rgb(223, 226, 225);" >
							<option value="title" <c:if test ="${search_Newbook.search_type eq 'title'}"> selected="selected"</c:if>>도서제목</option>
							<option value="writer" <c:if test ="${search_Newbook.search_type eq 'writer'}"> selected="selected"</c:if>>지은이</option>
							<option value="publisher" <c:if test ="${search_Newbook.search_type eq 'publisher'}"> selected="selected"</c:if>>출판사</option>
						</select>&nbsp;&nbsp;
			            <input name = "search_keyword" class="form-control rounded" type="search" value="${search_Newbook.search_keyword }" placeholder="찾으실 도서를 검색해보세요." >
			            
			            <!-- 검색 버튼 -->
			            <div class="col-md-2 col-xxl-2 d-lg-block" style="margin-left: 5px;">
			              <button type="submit" class="btn  btn-outline-gray-400 text-muted" data-bs-toggle="modal"
			                	data-bs-target="#locationModal">검색  </button>
			            </div>
			        </div>
		        </form>
			</div>
	            
		    <div>
		       <!-- table -->
		       <div class="table-responsive" style="text-align: center;">
		          <table class="table text-nowrap">
		             <thead class="table-light">
		                <tr>
		                   <th>No.</th>
		                   <th>상품번호</th>
		                   <th></th>
		                   <th>제목</th>
		                   <th>지은이</th>
		                   <th>가격</th>
		                   <th>출판사</th>
		                   <th>출간일</th>
		                   <th>국내/해외</th>
		                   <th>카테고리</th>
		                   <th>조회수</th>
		                   <th>등록일</th>
		                   <!-- <th colspan='2'>삭제</th> -->
		                </tr>
		             </thead>
		             <tbody>
		             	<c:forEach var="newbook" items="${listBoNewbook }" varStatus="status">
			                <tr id="newbookRow${status.index }">
			                   <td class="align-middle">${StartRow }</td>
			                   <td class="align-middle">${newbook.nb_num }</td>
			                   <td class="align-middle">
			                   	   <input type="hidden" id="newbook${status.index }" value="${newbook.nb_num }">
				                   <!-- 도서 이미지 출력 -->
				                   <c:set var="nb_image" value="${newbook.nb_image }"/>
				                   <c:choose>
				                   	<c:when test="${fn:contains(nb_image, 'http')}">
				                   		<a onclick="boNewbookUpdate(${newbook.nb_num})"><img src="${newbook.nb_image }" class="icon-shape icon-xxl" alt="도서이미지"></a>
				                   	</c:when>
				                   	<c:otherwise>
				                   		<a onclick="boNewbookUpdate(${newbook.nb_num})"><img src="${pageContext.request.contextPath}/upload/${newbook.nb_image}" class="icon-shape icon-xxl" alt="도서이미지"></a>
				                   	</c:otherwise>
				                   </c:choose>
			                   </td>
			                   <td class="align-middle">
			                      <div>
			                      <h5 class="fs-6 mb-0"><a class="text-inherit" onclick="boNewbookUpdate(${newbook.nb_num})">${newbook.nb_title }</a></h5>
			                      </div>
			                   </td>
			                   <td class="align-middle">${newbook.nb_writer}</td>
			                   <td class="align-middle"><fmt:formatNumber value="${newbook.nb_price}" groupingUsed="true"/>원</td>
			                   <td class="align-middle">${newbook.nb_publisher }</td>
			                   <td class="align-middle">${newbook.nb_publi_date }</td>
			                   <td class="align-middle">
			                   		<c:if test="${newbook.nb_category1 eq 1}">국내</c:if>
			                   		<c:if test="${newbook.nb_category1 eq 2}">해외</c:if>
			                   </td>
			                   <td class="align-middle">
									<c:choose>
										<c:when test="${newbook.nb_category2 eq 1}"> 경제/경영</c:when>
										<c:when test="${newbook.nb_category2 eq 2}"> 과학</c:when>
										<c:when test="${newbook.nb_category2 eq 3}"> 소설</c:when>
										<c:when test="${newbook.nb_category2 eq 4}"> 역사/문화</c:when>
										<c:when test="${newbook.nb_category2 eq 5}"> 인문</c:when>
										<c:when test="${newbook.nb_category2 eq 6}"> 과학/기술</c:when>
										<c:when test="${newbook.nb_category2 eq 7}"> 문학</c:when>
									</c:choose>
								</td>
								<td class="align-middle">${newbook.nb_readcnt}</td>
								<td class="align-middle">${newbook.nb_register_date}</td>
			                   <%-- <td colspan='2' class="align-middle">
			                      <div class="btn btn-secondary mb-2" onclick="deleteBoNewbook(${status.index})">삭제</div>
			                   </td> --%>
			                </tr>
			                <c:set var="StartRow" value="${StartRow +1}"/>
		              </c:forEach>
			    </tbody>
			  </table>
			  </div>
			</div>
		</div>
	</div>
	
	<!-- 페이징 처리 -->
	<div class="row mt-8">
	  <div class="d-flex justify-content-center">
	    <!-- nav -->
	    <nav>
	    	<c:choose>
		    	<c:when test="${search_Newbook.search_type == null }">
			      <ul class="pagination">
			        <!-- 이전버튼 -->
			        <c:if test="${page.startPage > page.pageLimit}">
				        <li class="page-item">
				          <a class="page-link  mx-1 " href="bonewbookList?currentPage=${page.startPage-page.pageLimit}" aria-label="Previous">
				            	이전
				          </a>
				        </li>
			        </c:if>
			        
			        <!-- 페이지 넘버 -->
			        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			        	<li class="page-item"><a class="page-link mx-1 text-body" href="bonewbookList?currentPage=${i }">${i }</a></li>
			        </c:forEach>
			         
			        <!-- 다음 버튼 -->
			        <c:if test="${page.endPage < page.totalPage}">
				        <li class="page-item">
				          <a class="page-link mx-1 text-body" href="bonewbookList?currentPage=${page.startPage+page.pageLimit }" aria-label="Next">
				            	다음
				          </a>
				        </li>
			        </c:if>
			       </ul>
			     </c:when>
			     <c:otherwise>
			      <ul class="pagination">
			        <!-- 이전버튼 -->
			        <c:if test="${page.startPage > page.pageLimit}">
				        <li class="page-item">
				          <a class="page-link  mx-1 " href="boSearchNewbookList?currentPage=${page.startPage-page.pageLimit}&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}" aria-label="Previous">
				            	이전
				          </a>
				        </li>
			        </c:if>
			        
			        <!-- 페이지 넘버 -->
			        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			        	<li class="page-item"><a class="page-link mx-1 text-body" href="boSearchNewbookList?currentPage=${i }&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}">${i }</a></li>
			        </c:forEach>
			         
			        <!-- 다음 버튼 -->
			        <c:if test="${page.endPage < page.totalPage}">
				        <li class="page-item">
				          <a class="page-link mx-1 text-body" href="boSearchNewbookList?currentPage=${page.startPage+page.pageLimit }&search_type=${search_Newbook.search_type}&search_keyword=${search_Newbook.search_keyword}" aria-label="Next">
				            	다음
				          </a>
				        </li>
			        </c:if>
			       </ul>
			     </c:otherwise>
		      </c:choose>
	    </nav>
	  </div>
	</div>
</body>
</html>