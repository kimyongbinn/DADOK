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
    .textBox {
                margin-left: 5%;
                margin-right: 5%;
              }
	
</style>
<script type="text/javascript" src="assets/js/jquery.js"></script>
</head>
<body>
   <div class="mb-6">
      <header class="top">
         <h1 class="infoTit">
           	이벤트 참여 이력
         </h1>
      </header>
   </div>
   
<main class="textBox">
	<c:if test="${not empty pointList }">
	<p style="float: left; margin-left: 30px;">총 참여 인원 : ${joinedCount}</p>
	
	<table class="table" style="text-align: center; margin: auto;">
		<thead class="table-light">
		<tr>
			<th>-</th>
			<th>회원번호</th>
			<th>적립번호</th>
			<th>획득일자</th>
		</tr>
		</thead>
		<tbody>
		
				<c:forEach var="pl" items="${pointList}">
					<tr style="border-color: #d8dbda">
						<td>${pl.rn}</td>	
						<td>${pl.m_num}</td>
						<td>${pl.p_num}</td>
						<td><fmt:formatDate value="${pl.a_par_pdate}" pattern="yy-MM-dd"/></td>
	
					</tr>
				</c:forEach>
			
		</tbody>
	</table>
	</c:if>
			
	<c:if test="${empty pointList }">
		<div class="row">
			<div class="center-text mt-14">
				참여한 인원이 없습니다.
			</div>
		</div>
	</c:if>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
		 	<c:if test="${page.startPage > page.pageBlock }">
				 <li class="page-item justify-content-center">					
					<a class="page-link mx-1 text-body"  href="boJoinedMember?currentPage=${page.startPge-page.pageBlocck }">이전</a>
				</li>
			</c:if>
				<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
				 <li class="page-item justify-content-center">
						<a class="page-link mx-1 text-body"  href="boJoinedMember?currentPage=${i }&eNum=${eNum}">${i}</a>
				</li>
			</c:forEach>
				
				<c:if test="${page.endPage < page.totalPage }">
				 <li class="page-item justify-content-center">		 
					<a class="page-link mx-1 text-body"href="boJoinedMember?currentPage=${page.startPage+page.pageBlock }">다음</a>
				</li>
			</c:if>
		</ul>
	</nav>	
</main>

</body>
</html>