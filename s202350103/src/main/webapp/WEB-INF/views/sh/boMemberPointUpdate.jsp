<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.center-text {
	  	text-align: center; /* 텍스트 가운데 정렬 */
	  	position: absolute;
	  	top: 30%;
	  	left: 50%;
	  	font-weight: bold;
	  	color:black;
	  	transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
	}
	
	.top {
              position: relative;
              display: flex; 
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

	
	table{
		width: 80%;
		border-style: none;
	}
	
	h2{
		text-align: center;
	}	
</style>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	function plusPoint(){
		var point = $('#point').val();
		var m_num = $('#m_num').val();
		if (point>0){
			if(confirm(point+"만큼 추가하시겠습니까?")){
				alert(point + "포인트 추가 하셨습니다.");
				location.href="boPlusPoint?m_num="+m_num+"&point="+point;
		
			} else {
				alert("포인트 추가를 취소하셨습니다.");
				return false;
			}
		} else
			alert("숫자를 입력해주세요.");
			return false;
	}
	
	function minusPoint(){
		var point = $('#point').val();
		var m_num = $('#m_num').val();
		var sum = ${sum};
		//alert("sum->"+sum);
		if(sum >= point){
			if(point>0){
				if(confirm(point+"만큼 차감하시겠습니까?")){
					alert(point + "포인트 차감 하셨습니다.");
					location.href="boMinusPoint?m_num="+m_num+"&point="+point;
				}else{
					alert("포인트 차감을 취소하셨습니다.");
					return false;
				}
			} else {
				alert("숫자를 입력해주세요.");
				return false;
			}
		}else{
			alert("보유한 포인트가 부족합니다.");
			return false
		}
	}
</script>
</head>
<body>
<main class="textBox">
   <div class="mb-6">
      <header class="top">
         <h1 class="infoTit">
           	포인트 조정
         </h1>
      </header>
   </div>

<c:if test="${sum != 0 }">
	<div style="margin-left: 20%; margin-right: 20%; text-align: center; margin-left: 105px;" class="mt-9" >
    	<div class="row g-4 row-cols-lg-4 row-cols-2 row-cols-md-2 mt-2" style="border: 1px solid #0aad0a; width: 600px; margin-left: -50px;">
        <!-- col -->
        	<div class="col" style="border-right: 1px solid #0aad0a;margin-top: 0px; width:200px;">
        		<input type="hidden" name="m_num" id="m_num" value="${member.m_num }"> 
	              <div class="text-muted mt-4">
	              	  <div>
			          	 <div class="text-center position-relative ">
				            <div class="mb-3">
    	           				<img src="${member.m_image }" id="memberImage" alt="회원이미지" class="rounded-circle"  style="max-width: 100%; height: auto;">
         					</div>        		
         				 </div>
			          </div>
	              	<p><p>
		              <div class="mt-4">
			              <h4 class="fs-4">${member.m_name}님</h4>
			              <h3 class="fs-4">(${member.m_id })</h3>
			          </div>
	              </div>
	            
	              </div>
	               <div class="text-muted mt-4">
		              <div class="col" style="margin-top: 0px; width:350px;">
		             	 <div style="margin-left: 20px">
			              	<div style="display: flex; color: black">
			              		<div class="fs-5 mt-5" style="margin-right:8px;">보유 포인트 : ${sum } P </div>
			              	</div>
			              	<div style="display: flex; color: black">
			              		<div class="fs-5 mt-2" style="margin-right:8px;">조정 포인트 : </div>
			              		<input type="text" class="form-control"  id="point" placeholder="포인트를 입력하세요." style="width: 180px;">
			              		<div class="fs-5 mt-2" style="margin-left: 8px;">P</div> 
			              	</div>
		              	</div>
<!-- 		              	<button type="button" class="btn btn-ghost-primary mb-2" >추가하기 </button> -->
<!-- 	           			<button type="button" class="btn btn-ghost-danger mb-2" >차감하기</button> -->
	           			<div class="mt-5" style="display: flex;margin-left: 100px;">
							<input type="button" class="btn btn-primary mb-2"  onclick="plusPoint()" value="추가하기" style="margin-right: 10px">
							<input type="button"  class="btn btn-secondary mb-2"  onclick="minusPoint()" value="차감하기">
					    </div>
		           	  </div>
		           	  
		           </div>	    
	          </div>
	        </div>  
</c:if>
<c:if test="${sum == 0 }">
	<div class="row">
		<div class="center-text mt-14">
			보유한 포인트가 없습니다.
		</div>
	</div>
</c:if>

<div class="fs-6 mt-5" style="margin-left: 10px;">회원번호 : ${member.m_num}</div>

<c:if test="${not empty memberPoint }">	  
<input type="hidden" name="m_num" id="m_num" value="${member.m_num  }">       
<table class="table" style="text-align: center">
	<thead class="table-light">
		<tr>
			<th scope="col">No.</th>
			<th scope="col">포인트번호</th>
			<th scope="col">발행페이지 코드</th>
			<th scope="col">발행일시</th>
			<th scope="col">포인트유형	</th>
			<th scope="col">지급포인트</th>
		</tr>
		
	</thead>
	<tbody>		
		<c:forEach var="memberPoint" items="${memberPoint }">				
				<tr>
				<td scope="row">${memberPoint.rn }</td>
				<td>${memberPoint.p_num }</td>
				<td>
				<c:choose>
					<c:when test="${memberPoint.o_order_num != 0}"> ${memberPoint.o_order_num}</c:when>
					<c:when test="${memberPoint.q_num != 0}">${memberPoint.q_num}</c:when>
					<c:when test="${memberPoint.a_num != 0}">${memberPoint.a_num}</c:when>
					<c:when test="${memberPoint.p_list_type == 4}">-</c:when>
					<c:when test="${memberPoint.p_list_type == 5}">-</c:when>
					<c:when test="${memberPoint.p_list_type == 7}">-</c:when>
					<c:when test="${memberPoint.p_list_type == 8}">-</c:when>
				</c:choose>
				</td>
				<td>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${memberPoint.a_par_pdate }"/>
				</td>
				<td>
					<c:choose>
						<c:when test="${memberPoint.p_list_type == 1}">주문 적립</c:when>
						<c:when test="${memberPoint.p_list_type == 2}">출석 이벤트</c:when>
						<c:when test="${memberPoint.p_list_type == 3}">퀴즈 이벤트</c:when>
						<c:when test="${memberPoint.p_list_type == 4}">회원가입</c:when>
						<c:when test="${memberPoint.p_list_type == 5}">추천인</c:when>
						<c:when test="${memberPoint.p_list_type == 6}">주문 포인트 사용</c:when>
						<c:when test="${memberPoint.p_list_type == 7}">관리자 조정</c:when>
						<c:when test="${memberPoint.p_list_type == 8}">포인트 충전</c:when>
					</c:choose>
				</td>
				<td>${memberPoint.m_point }P</td>
						
			</tr>
		</c:forEach>
	</tbody>
</table>		
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
	 	<c:if test="${page.startPage > page.pageBlock }">
			 <li class="page-item justify-content-center">					
				<a class="page-link mx-1 text-body"  href="boMemberPointUpdate?currentPage=${page.startPage-page.pageBlock }">이전</a>
			</li>
		</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
			 <li class="page-item justify-content-center">
					<a class="page-link mx-1 text-body"  href="boMemberPointUpdate?currentPage=${i }&m_num=${member.m_num }">${i}</a>
			</li>
		</c:forEach>
			
		<c:if test="${page.endPage < page.totalPage }">
			 <li class="page-item justify-content-center">		 
				<a class="page-link mx-1 text-body"href="boMemberPointUpdate?currentPage=${page.startPage+page.pageBlock }">다음</a>
			</li>
		</c:if>
	</ul>
</nav>
</c:if>
<br>
<br>
</main>
</body>
</html>