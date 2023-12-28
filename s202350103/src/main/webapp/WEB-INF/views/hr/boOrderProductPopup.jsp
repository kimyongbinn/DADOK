<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
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

</head>
<body>
   <div class="mb-6">
		<header class="top">
			<h1 class="infoTit">
				주문 상품 목록
			</h1>
		</header>
   </div>
<main class="textBox">
<div class="row">
<div class="col-lg-12">
      <div>
         <div class="table-responsive">
            <table class="table text-nowrap">
               <thead class="table-light">
                  <tr>
                     <th>상품명</th>
                     <th>수량</th>
                     <th>가격</th>
                     <th>유형</th>
                  </tr>
               </thead>
               <tbody> 
               <c:forEach var="orderDetail" items="${orderDetailList }">
                  <tr>
                     <!-- 상품명 -->
                     <td class="align-middle">${orderDetail.nb_title}</td>
                     <!-- 수량 -->
                     <td class="align-middle"><fmt:formatNumber value="${orderDetail.o_de_count}" groupingUsed="true"/></td>
                     <!-- 가격 -->
                     <td class="align-middle"><fmt:formatNumber value="${orderDetail.nb_price * orderDetail.o_de_count}" groupingUsed="true"/></td>
                     <!-- 유형 -->
                     <td class="align-middle">
                     	<c:if test="${orderDetail.o_de_prodtype == 1}">새상품</c:if>
                     	<c:if test="${orderDetail.o_de_prodtype == 2}">중고상품</c:if>
                     </td>
                  </tr>
               </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
</div>
</div>
</main>
</body>
</html>