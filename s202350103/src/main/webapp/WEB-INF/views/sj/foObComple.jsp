<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
   
       <!-- 완료하기 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.ddidi {
  width : 300px;
  height : 150px;
 
  margin: auto;
}


</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div>

  <div class="d-flex align-items-center mb-3">
	    <img alt="" src="../assets/images/png/obsell.png" style="width: 50px; height: 50px;" class="me-3">
	    <h2 class="mb-1">중고 도서 판매 신청</h2>
	  </div>

</div>
				<div class="text-center  position-relative ">
	<img src="assets/images/png/comple.png" alt="판매신청"
                      class="mb-3 img-fluid">

<div class="ddidi">
<table  class="table table-striped" >
  <thead>
    <tr>
      <th scope="col">회원 번호 : </th>
      <th scope="col">${member.m_num }	</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>회원 아이디 :</th>
      <td> ${member.m_id }</td>
    </tr>
 

  </tbody>
</table>
</div>	


	</div>
			
			<br>

		<div> 
			<p class="text-center" style="font-size: 18px;">
			신청이 완료 되었습니다 . <br>
			이용해 주셔서 감사합니다 . <br>
			검수및 정산결과는 
			마이페이지에서 가능합니다.	
			</p>
		
	<div class="d-grid gap-2 col-6 mx-auto">										
 		 <button class="btn btn-success " type="button" onclick="location.href='memberSellList?m_num=${member.m_num }'" >마이페이지 이동</button>
	</div>
	</div>
</div>
</body>

<%@ include file="../common/footerFo.jsp" %>
</html>