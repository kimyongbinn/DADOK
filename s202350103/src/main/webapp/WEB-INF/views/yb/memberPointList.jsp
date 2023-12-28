<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#first::first-letter {
		color:blue;
	}
	#chargeAmount {
		width: 25rem;
		height: 45px;
		border: 1px solid #889397;
		border-radius: 10px;
	}
	#comment{
		border: 1px solid #889397; 
		border-radius: 5px;
		background-color: #f0f3f2;
	}
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		var result = '${result}';
		if (result > 0){
			alert("포인트 충전이 완료되었습니다.");
		}
		
		$('#charge1').click(function(){
			var charge = $('#charge1').val();
			$('#chargeAmount').val(charge);
			
			$('#pointChargeAction').attr("disabled", false); // 버튼 비활성화 해제
		});
		$('#charge2').click(function(){
			var charge = $('#charge2').val();
			$('#chargeAmount').val(charge);
			
			$('#pointChargeAction').attr("disabled", false); // 버튼 비활성화 해제
		});
		$('#charge3').click(function(){
			var charge = $('#charge3').val();
			$('#chargeAmount').val(charge);
			
			$('#pointChargeAction').attr("disabled", false); // 버튼 비활성화 해제
		});
		$('#charge5').click(function(){
			var charge = $('#charge5').val();
			$('#chargeAmount').val(charge);
			
			$('#pointChargeAction').attr("disabled", false); // 버튼 비활성화 해제
		});
		$('#charge10').click(function(){
			var charge = $('#charge10').val();
			$('#chargeAmount').val(charge);
			
			$('#pointChargeAction').attr("disabled", false); // 버튼 비활성화 해제
		});
		
		$('#chargeAmount').change(function() {
			var chargeAmount = $('#chargeAmount').val();
			if(chargeAmount < 1000){
				alert("1,000원보다 큰 금액을 입력하세요.");
				$('#chargeAmount').focus();
				$('#chargeAmount').val("");
			}
			
			if(chargeAmount%100 != 0){
				alert("100원 단위로 충전이 가능합니다.");
				$('#chargeAmount').focus();
				$('#chargeAmount').val("");
			}
			
			if(chargeAmount != 0 && chargeAmount != ""){ 
				$('#pointChargeAction').attr("disabled", false); // 버튼 비활성화 해제
			}else{
				$('#pointChargeAction').attr("disabled", true); // 버튼 비활성화
			}
		});
		
		var chargeAmount = $('#chargeAmount').val();
		
		if(chargeAmount == 0 && chargeAmount == ""){
			$('#pointChargeAction').attr("disabled", true); // 버튼 비활성화
		}
	});
</script>

</head>
<body>
<%@ include file="../common/sideFo.jsp" %>
	  <!-- row -->
		      <div class="row">
		        <div class="col-lg-12">
		          <div class="card py-1 border-0 mb-8">
           			 <div>
			         <!-- heading -->
				         <h2 class="mb-2">포인트 목록</h2>
				         <p><a href="#">${member.m_id } 님의 포인트 목록입니다.</a></p>
				               총 포인트 : ${totalPoint} P		
				         <!-- 포인트 충전하기 -->
						 <div class="d-grid gap-2 d-md-flex justify-content-md-end" 
						 		style="float: right; margin-top: -20px;" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
						   <button class="btn btn-success mb-2" id="pointCharge" type="button">포인트 충전</button>
						 </div>      
			      	</div>
		          <div>
		          
		          <!-- 충전하기 모달 화면 -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					    <!-- 헤더 -->
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalCenterTitle">다독 포인트 충전하기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					    <!-- 내용 -->
					      <div class="modal-body">
					      	<form action="orderAction" method="post">
					      		<input type="hidden" name="o_order_num" value="${member.m_num }">
					      		<input type="hidden" name="destination" value=0>
						        <div class="mb-3">
						        <!-- 충전 금액 -->
								  <label class="form-label" for="textInput">충전 금액</label>
								  
								  <div class="input-group" style="width: 28rem; height:40px;">
                          			<input type="number" id="chargeAmount" name="o_pay_price" class="form-control" placeholder="1,000원 이상부터 충전 가능합니다."> 
                          			<div>
                          				<p style="font-size:15px; margin-top:10px; margin-left: 10px;">원</p>
                          			</div>                       
								  </div>
								 
								  <div class="btn-group mt-3" role="group" aria-label="Basic radio toggle button group" style="width: 29rem;">
									  <input type="radio" class="btn-check" name="charge" id="charge1" autocomplete="off" value=10000 checked>
									  <label class="btn btn-outline-primary" for="charge1">1만원</label>
									
									  <input type="radio" class="btn-check" name="charge" id="charge2" autocomplete="off" value=20000>
									  <label class="btn btn-outline-primary" for="charge2">2만원</label>
									
									  <input type="radio" class="btn-check" name="charge" id="charge3" autocomplete="off" value=30000>
									  <label class="btn btn-outline-primary" for="charge3">3만원</label>
									  
									  <input type="radio" class="btn-check" name="charge" id="charge5" autocomplete="off" value=50000>
									  <label class="btn btn-outline-primary" for="charge5">5만원</label>
									  
									  <input type="radio" class="btn-check" name="charge" id="charge10" autocomplete="off" value=100000>
									  <label class="btn btn-outline-primary" for="charge10">10만원</label>
								  </div>
								  <hr>
								 <!-- 유의사항 -->
								  <label class="form-label" for="textInput">유의사항</label>
								  <div id="comment" >
								  	<ul style="margin-top: 10px;">
								  		<li>다독포인트는 다독 상품을 구매할 경우 이용할 수 있습니다.</li>
								  		<li>다독포인트는 악용방지 및 건전한 거래를 위해 환불이 불가하오니 이 점 유의하시기 바랍니다.</li>
								  		<li>다독포인트 충전은 1,000원 이상부터100단위로 충전이 가능합니다.</li>
								  		<li>다독포인트 충전 금액은 도서 소득공제 불가합니다.</li>
								  	</ul>
								  </div>
								  <hr>
								 <!-- 충전하기 -->
								  <div>
									<div class="d-grid gap-2 d-md-flex justify-content-center">
									  <button class="btn btn-success mb-2" id="pointChargeActionBtn" type="submit" style="width: 10rem;">충전하기</button>
									</div>
								  </div>
								</div>
							</form>
					      </div>
					    </div>
					  </div>
					</div>
		          
		          <p><p><p>
		            <!-- table -->
		            <div class="table-responsive">
		              <table class="table text-nowrap table-with-checkbox" style="text-align: center;">
		              
		                <thead class="table-light">
		                  <tr>
		                    <th style="padding-right: 100px; padding-left: 50px;">적립 유형</th>
		                    <th>이벤트명(주문번호)</th>
		                    <th>적립 포인트</th>
		                    <th>적립 날짜</th>
		                  </tr>
		                </thead>
		                <tbody>
		                <c:forEach var="point" items="${memberPointList }">
		                  <tr id="pointTable">
		                     <td class="align-middle"; style="padding-right: 100px; padding-left: 50px;">
		                      <div>
		                        <h5 class="fs-6 mb-0">
									<c:choose>
										<c:when test="${point.type1 == 1}"><span>주문 적립</span></c:when>
										<c:when test="${point.type1 == 2}"><span>출석 적립</span></c:when>
										<c:when test="${point.type1 == 3}"><span>퀴즈 적립</span></c:when>
										<c:when test="${point.type1 == 4}"><span>회원가입 적립</span></c:when>
										<c:when test="${point.type1 == 5}"><span>추천인 적립</span></c:when>
										<c:when test="${point.type1 == 6}"><span>포인트 사용</span></c:when>
										<c:when test="${point.type1 == 7}"><span>관리자에 의한 조정</span></c:when>
										<c:when test="${point.type1 == 8}"><span>포인트 충전</span></c:when>
									</c:choose>
								</h5>
		                      </div>
		                    </td>
		                     <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0">
			                      	<c:choose>
										<c:when test="${point.title != null}"><span>${point.title }</span></c:when>
										<c:when test="${point.type1 == 4}"><span>회원가입 축하~</span></c:when>
										<c:when test="${point.type1 == 5}"><span>추천인 이벤트</span></c:when>
										<c:when test="${point.type1 == 6}"><span>주문으로 인한 포인트 차감</span></c:when>
										<c:when test="${point.type1 == 7}"><span>관리자에 의한 조정</span></c:when>
									</c:choose>
								</h5>
		                      </div>
		                    </td>
		                    <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0">
		                        	<c:choose>
											<c:when test="${point.point > 0 }"><span id=first>+${point.point }P</span></c:when>
											<c:when test="${point.point < 0 }"><span>${point.point }P</span></c:when>
									</c:choose>
									
									
		                        </h5>
		                      </div>
		                    </td>
		    				 <td class="align-middle">
		                      <div>
		                        <h5 class="fs-6 mb-0"><fmt:formatDate value="${point.date1 }" pattern="yyyy년MM월dd일"/></h5>
		                      </div>
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

			 	<c:if test="${page.startPage > page.pageBlock }">
					 <li class="page-item justify-content-center">					
						<a class="page-link mx-1 text-body" href="memberPointList?m_num=${member.m_num }&currentPage=${page.startPage-page.pageBlock}">이전</a>
					</li>
				</c:if>
 				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					 <li class="page-item justify-content-center">
 						<a class="page-link mx-1 text-body" href="memberPointList?m_num=${member.m_num }&currentPage=${i}">${i}</a>
					</li>
				</c:forEach>
					
				<c:if test="${page.endPage < page.totalPage }">
					 <li class="page-item justify-content-center">		 
						<a class="page-link mx-1 text-body" href="memberPointList?m_num=${member.m_num }&currentPage=${page.startPage+page.pageBlock}">다음</a>
					</li>
				</c:if>
		  </ul>
	   </nav>
				
</div>


<%@ include file="../common/footerFo.jsp" %>
</body>
</html>