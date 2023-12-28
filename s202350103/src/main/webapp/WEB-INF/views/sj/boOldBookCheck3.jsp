<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function btnActive()  {
	  const target = document.getElementById('target_btn');
	  target.disabled = false;
	}

	function btnDisabled()  {
	  const target = document.getElementById('target_btn');
	  target.disabled = true;
	}
	
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post">
<p class="fs-1 text-center">중고 검수등록 1 </p>

<table class="table table-bordered">

  <tr>
	      <td scope="col">신청 일자</td>
	      <td scope="col" colspan="2"><input type="hidden"  value="${oldBook.ob_report_date }"></td> 
    </tr>
    <tr>
	      <td>중고상품번호 </td>
	      <td colspan="2" id="ob_num" ><input type="hidden" name="ob_num" value="${oldBook.ob_num }"> </td>
    </tr>
      <tr>
	      <td>검수매입상태</td>
	      <td colspan="2">
	      <input type="hidden" name="ob_status" value="${oldBook.ob_status }">
      	<c:choose>		
				<c:when test="${oldBook.ob_status eq '1' }"><c:out value="검수중"/></c:when>
				<c:when test="${oldBook.ob_status eq '2' }"><c:out value="검수완료"/></c:when>
				<c:when test="${oldBook.ob_status eq '3' }"><c:out value="매입완료"/></c:when>
				<c:otherwise><c:out value=""/></c:otherwise>
		</c:choose>
      </td>
    </tr>
      <tr>
		      <td>책이름</td>
		      <td colspan="2">
		      <input type="hidden" name="nb_title" value="${oldBook.nb_title }">
		      </td>
      </tr>
     
        <tr>
		
		      <td>중고 매입가 </td>
		      <td colspan="2">
		      <input type="text" name="nb_price" value="${oldBook.nb_price }">
		      </td>
       </tr>
	
	
     <tr>
     
      <td rowspan="3"> 검수내역 <button type="submit" class="btn btn-dark mb-2" onclick="btnActive()">등록하기</button> </td>
	      <td>찢김</td>
	      <td><input  class="form-check-input" type="checkbox" name="ob_ripped" id="chk1" value="${oldBook.ob_ripped }"></td>
     </tr>
    <tr>
	      <td>오염</td>
	      <td><input class="form-check-input" type="checkbox" name="ob_scribble" id="chk2" value="${oldBook.ob_scribble }"></td>
    </tr>
     <tr>
	      <td>낙서</td>
	    	 <td><input class="form-check-input" type="checkbox" name="ob_smeary" id="chk3" value="${oldBook.ob_smeary }" >
	     	
   		  </td>
	    
     </tr>
 
    
     <tr>
      <td>등급</td>
      <td colspan="2">
			 <input type="hidden" name="ob_grade" value="${oldBook.ob_grade }">
      		<c:choose>
				<c:when test="${oldBook.ob_grade eq '0' }"><c:out value="A"/></c:when>
				<c:when test="${oldBook.ob_grade eq '1' }"><c:out value="B"/></c:when>
				<c:when test="${oldBook.ob_grade eq '2' }"><c:out value="C"/></c:when>
				<c:otherwise><c:out value="D"/></c:otherwise>
				</c:choose>
	       </td>
	    </tr>
	   
	    <tr>
	      <td>중고 정산가격</td>
	      
	      <td colspan="2">
	      <input type="hidden" name="ob_pur_price" value="${oldBook.ob_pur_price }">
	      	<c:choose>
				<c:when test="${oldBook.ob_grade eq '0' }"><c:out value="${oldBook.ob_pur_price*0.6}"/></c:when>
				<c:when test="${oldBook.ob_grade eq '1' }"><c:out value="${oldBook.ob_pur_price*0.5}"/></c:when>
				<c:when test="${oldBook.ob_grade eq '2' }"><c:out value="${oldBook.ob_pur_price*0.4}"/></c:when>
				<c:otherwise><c:out value="${oldBook.ob_pur_price*0.3}"/></c:otherwise>
				</c:choose>
    	</tr>
  
	</table>
	 
	 	<div class="d-grid gap-2">
		    <button class="btn btn-dark" id="target_btn" type="submit" disabled="disabled" >등록하기</button>
		</div>
</form>
        <div class="d-grid gap-2">
		    <button class="btn btn-dark" type="button" onclick="location.href='BolistOb'">중고 리스트 보기</button>
		</div>
   


</body>
</html>