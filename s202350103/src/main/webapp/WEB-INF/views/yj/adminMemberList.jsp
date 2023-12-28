<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript">
	function getMemberAddr(pMnum){
		console.log(pMnum);
		
		$.ajax({
		    url: "adminMemberAddr",
		    data: { m_num: pMnum },
		    dataType: "text",
		    success: function (m_addr) {
		        $('#m_addr').val(m_addr);
		        $('#msg').html(m_addr);
		    }
		});
	}

</script>
<style>
  th, td {
    text-align: center;
  }
</style>

</head>
<body>

	    <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">회원 목록</h1>
         <p>총  ${totalMember } 건</p>
      </div>
	
 
  <div class="row justify-content-center">
  <div class="col-lg-12 col-md-12 col-12 d-block  container">

	   <div class="row mb-3">
			 <form action="memberSearch">
				<div class="col-md-6 col-12 mb-3">
				    <div class="row">
				   
				    <div class="input-group">
				        <div class="col-3">
				            <select name="search" class="form-select" id="emailSelect">
							    <option value="s_num" >* 회원 번호 *</option>
						        <option value="s_name" selected="selected">* 이름 *</option>
						        <option value="s_id" >* 아이디 *</option>
						        <option value="s_email" >* 이메일 *</option>
						        <option value="s_addr" >* 주소 *</option>
				            </select>
				        </div>
				        <div class="col-8">
				            <div class="input-group" style="padding-left: 10px;">
				                <input name="keyword" id="search_keyword" class="form-control rounded-start" type="text" placeholder="찾으실 회원을 검색해보세요.">
				                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">회원검색</button>
				            </div>
				        </div>
				            <div class="col-1">
					                <a href="adminMemberList"><i class="bi bi-arrow-repeat" style="font-size: 30px; padding-left: 10px;"></i></a>
							</div>
				    </div>
				</div>
			</div>

	        <span>
	            <span class="text-danger">*</span>
	            회원 번호/이름/아이디/이메일/주소 로 검색
	            <span class="text-danger">*</span>
	            &nbsp;
	        </span>
	    </form>       

 		<div class="col-md-7 col-12 mb-3" >
      		 <div class="input-group mb-1">
      		    <span class="input-group-text">간편 주소조회</span>
	           
	        	<input id="m_addr" style="color: red;"  class="form-control rounded-end"  placeholder="회원 상세에 마우스를 올려보세요." readonly="readonly">
			
			</div>
			<span class="text-danger">*</span>
			<span>회원 주소를 빠르게 조회할수 있습니다.</span>
         </div>

        </div>
        
	</div>
			
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	
         <!-- table -->
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                     <tr>
					<th class="rounded-start">No. 가입일</th>
					<th class="rounded-0 ">이미지</th>
					<th class="rounded-0 ">회원번호</th>
					<th class="rounded-0 ">아이디</th>
					<th class="rounded-0 ">이름</th>
					<th class="rounded-0 ">보유포인트</th>
					<th class="rounded-end">상세조회</th>
					</tr>
               </thead>
               
               <tbody>
               		<c:forEach items="${adminMemberList }" var="member">
               
                  <tr>
                   		<td class="align-middle ">
                   		<span style="color: green;">${num }</span> / 
                   		<fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd" />
                   		</td>
                   		<td class="align-middle">
                   		<img alt="" src="${member.m_image }" width="40px;" height="40px;" class="rounded-circle">
                   		</td>
						<td class="align-middle">${member.m_num }</td>
						<td class="align-middle ">${member.m_id }</td>
						<td class="align-middle ">${member.m_name }</td>
						<td class="align-middle ">${member.m_point } <span style="color: red;">P</span></td>
						<td class="align-middle ">
							<a onmouseover="getMemberAddr(${member.m_num})" href="adminMemberInfo?m_num=${member.m_num }" class="btn btn-soft-success mb-2">상세</a>
						</td>
                     	
                  </tr>
                      <c:set var="num" value="${num-1}"></c:set>
                  </c:forEach>
     </tbody>
   </table>
   
   
   </div>
 </div>

  <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="page-item justify-content-center">					
						<a class="page-link mx-1 text-body" href="adminMemberList?currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
				
		<c:choose>
			<c:when test="${member.keyword != null }">
 			
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="page-item justify-content-center">
 						<a class="page-link mx-1 text-body" href="memberSearch?currentPage=${i}&search=${member.search}&keyword=${member.keyword}">${i}</a>
					</li>
				</c:forEach>
			
			</c:when>
			<c:otherwise>
	 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						 <li class="page-item justify-content-center">
	 						<a class="page-link mx-1 text-body" href="adminMemberList?currentPage=${i}">${i}</a>
						</li>
					</c:forEach>
			</c:otherwise>					
		</c:choose>				
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="page-item justify-content-center">		 
						<a class="page-link mx-1 text-body" href="adminMemberList?currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		</ul>
	</nav>
   


</body>
</html>