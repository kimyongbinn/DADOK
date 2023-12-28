<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table{
		text-align: center; 
		margin: auto;
	}

	.btn-group {
    display: flex;
    justify-content: center;
	}

	.btn-back, .btn-page, .btn-go {
    text-align: center;
	}
</style>
<body>

      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">이벤트 목록</h1>
         <p>총 ${totalEvent } 건</p>
      </div>
<div class="tab	le-responsive" >
<table class="table">
  <thead class="table-light">
    <tr>
      <th scope="col">No.</th>
      <th scope="col">이벤트 번호</th>
      <th scope="col">이벤트 유형</th>
      <th scope="col">제목</th>
      <th scope="col">진행상태</th>
      <th scope="col">시작일</th>
      <th scope="col">종료일</th>
      <th scope="col">포인트</th>
      <th scope="col">연속출석 유무</th>
      <th scope="col">관리</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="event" items="${event }">
		<tr style="vertical-align: middle;">
			<th scope="row">${event.rn }</th>
			<td>${event.a_num }	 </td>
			<c:if test="${event.event_type == 1 }">
				<td>출석</td>
			</c:if>
			<c:if test="${event.event_type == 2 }">
				<td>퀴즈</td>
			</c:if>
			<td>${event.a_title }</td>
			<c:if test="${event.event_status == 1 }">
				<td>진행</td>
			</c:if>
			<c:if test="${event.event_status == 2 }">
				<td>예정</td>
			</c:if>
			<c:if test="${event.event_status == 3 }">
				<td>종료</td>
			</c:if>
			<td>${event.a_sdate }</td>
			<td>${event.a_edate }</td>
			<td>${event.a_point }</td>
			<td>${event.a_add }일</td>
			<td><input type="button" class="btn btn-soft-primary mb-2" value="수정" onclick="openPopUp(${event.a_num})">  
				<input type="button" class="btn btn-soft-success mb-2" value="내역" onclick="openDetail(${event.a_num})"> </td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
	 	<c:if test="${page.startPage > page.pageBlock }">
			 <li class="page-item justify-content-center">					
				<a class="page-link mx-1 text-body"  href="boEventList?currentPage=${page.startPge-page.pageBlocck }">이전</a>
			</li>
		</c:if>
			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
			 <li class="page-item justify-content-center">
					<a class="page-link mx-1 text-body"  href="boEventList?currentPage=${i }">${i}</a>
			</li>
		</c:forEach>
			
			<c:if test="${page.endPage < page.totalPage }">
			 <li class="page-item justify-content-center">		 
				<a class="page-link mx-1 text-body"href="boEventList?currentPage=${page.startPage+page.pageBlock }">다음</a>
			</li>
		</c:if>
	</ul>
</nav>
<script type="text/javascript">

	 function openPopUp(eNum){
		location.href="boEventDetail?eNum="+eNum,"eventUpdate","width=500,height=700";
	}
 
	function openDetail(eNum){
		window.open("boJoinedMember?eNum="+eNum,"이벤트 상세조회","width=800,height=600");
	}
	
	//이벤트 리스터 세팅
	document.getElementById('sdate').addEventListener('input', handleDateInput);
	document.getElementById('edate').addEventListener('input', handleDateInput);
	//날짜 입력란에 입력시 호출되는 함수
	function handleDateInput() {
		//체크박스 해제
		document.getElementById('dateCheckbox').checked = false;
	}
	
	document.getElementById('dateCheckbox').addEventListener('change',function(){
		var sdate = document.getElementById("sdate");
		var edate = document.getElementById("edate");
		
		if(this.checked){
			sdate.value="";
			edate.value="";
		} 
	});

</script>

</body>
</html>