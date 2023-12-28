<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
/* 	function StatusChk(){
		alert("StatusChk start...")		
		//1                    1
		var obRippedChk1 = (${oldBook.ob_ripped});
		var obRippedChk2 = (${oldBook.ob_scribble});
		var obRippedChk3 = (${oldBook.ob_smeary});
		
		var ObRipped;
		var ObScribble;
		var ObRSmeary;
		
		 $("#ObRipped").val(ObRipped); 
		
			 //1				//1 ?
					 
		var $("#obRippedChke1");
		var $("#obRippedChke2");
		var $("#obRippedChke3");
		
		alert ("obRippedChk1"+obRippedChk1);
			ObRipped = $("#obRippedChke1").val();
			if(obRippedChk1 == '1'){
		    	$("#obRippedChke1").val('있음');
		    } else {
		    	$("#obRippedChke1").val('없음');
		    	
		    } 
		   	
			ObScribble = $("#obRippedChke2").val();
		   if(obRippedChk2 == '1'){
		    	$("#obRippedChke2").val('있음');
		    } else {
		    	$("#obRippedChke2").val('없음');
		    } 
		   
		   ObRSmeary = $("#obRippedChke3").val();
		   if(obRippedChk3 == '1'){
		    	$("#obRippedChke3").val('있음');
		    } else {
		    	$("#obRippedChke3").val('없음');
		    } 
		   
	}
 */

/*  function StatusChk(){
	 alert ("statuschk() start...")
	 
	var obRippedChk1 = (${oldBook.ob_ripped});
	var obRippedChk2 = (${oldBook.ob_scribble});
	var obRippedChk3 = (${oldBook.ob_smeary});
	  
	alert("obRippedChk1->"+obRippedChk1);
	alert("obRippedChk2->"+obRippedChk2);
	alert("obRippedChk3->"+obRippedChk3);
	
	
	
	
 }
 */

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<form action="" method="post" class="col-xl-8 col-lg-8 col-md-8 col-8 mb-6" style="margin-left: auto; margin-right: auto;">

      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">중고 검수 상세 내역</h1>
      </div>


<input type="hidden" name="ob_num" value="${oldBook.ob_num }">

<table class="table table-bordered">
    <tr>
	      <td scope="col" class="text-center" style="width:200px; background-color: #f0f3f2;">신청 일자</td>
	      <td scope="col" colspan="2">${oldBook.ob_report_date }</td> 
    </tr>
    <tr>
	      <td class="text-center" style="width:200px; background-color: #f0f3f2;">중고상품번호 </td>
	      
	      <td colspan="2" id="ob_num" >${oldBook.ob_num }</td>
    </tr>
      <tr>
	      <td class="text-center" style="width:200px; background-color: #f0f3f2;">검수매입상태</td>
	      <td colspan="2">
      	<c:choose>		
				<c:when test="${oldBook.ob_status eq '1' }"><c:out value="검수중"/></c:when>
				<c:when test="${oldBook.ob_status eq '2' }"><c:out value="검수완료"/></c:when>
				<c:when test="${oldBook.ob_status eq '3' }"><c:out value="매입완료"/></c:when>
				<c:when test="${oldBook.ob_status eq '4' }"><c:out value="판매완료"/></c:when>
				<c:otherwise><c:out value=""/></c:otherwise>
		</c:choose>
				
      </td>
    </tr>
      <tr>
		      <td class="text-center" style="width:200px; background-color: #f0f3f2;">책이름 </td>
		      <td colspan="2">${oldBook.nb_title }</td>
      </tr>
        <tr>
		      <td  class="text-center" style="width:200px; background-color: #f0f3f2;">중고매입가격 </td>
		      <td colspan="2">
		   		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.ob_pur_price}"/>원    	     
		      </td>
       </tr>
	
	
     <tr>
      <td rowspan="3" class="text-center" style="width:200px; height:110px; background-color: #f0f3f2;"> <br>
      	<br>
      	검수내역 
      	</td>
	   
	   <td>찢김 </td>
	    <td>
	     <c:choose>
		    <c:when test="${oldBook.ob_ripped eq '1'}">
		   		<input type="checkbox"  disabled="disabled" checked="checked">
		    </c:when>
		    <c:otherwise>
				<input type="checkbox" disabled="disabled" >
	    </c:otherwise>
</c:choose>
     </tr>
    <tr>
	      <td>낙서</td>
	      <td> 
	     <c:choose>
		    <c:when test="${oldBook.ob_scribble eq '1'}">
		   		<input type="checkbox"  disabled="disabled" checked="checked">
		    </c:when>
		    <c:otherwise>
				<input type="checkbox" disabled="disabled" >
	    </c:otherwise>
	    </c:choose>	
	   	</td>
    </tr>
     <tr>
	      <td>오염</td>
	      <td>  
	          <c:choose>
		    <c:when test="${oldBook.ob_smeary eq '1'}">
		   		<input type="checkbox"  disabled="disabled" checked="checked">
		    </c:when>
		    <c:otherwise>
				<input type="checkbox"  disabled="disabled" >
	    </c:otherwise>
	    </c:choose>	
	    </td>
    </tr>
     <tr>
	
      <td class="text-center" style="width:200px; background-color: #f0f3f2;">등급</td>
      <td colspan="2">
      		<c:choose>
				<c:when test="${oldBook.ob_grade eq '0' }"><c:out value="A 등급"/></c:when>
				<c:when test="${oldBook.ob_grade eq '1' }"><c:out value="B 등급"/></c:when>
				<c:when test="${oldBook.ob_grade eq '2' }"><c:out value="C 등급"/></c:when>
				<c:otherwise><c:out value="D 등급"/></c:otherwise>
			</c:choose>
	       </td>
	    </tr>
	    <tr>
	      <td class="text-center" style="width:200px; background-color: #f0f3f2;">중고 판매가 </td> <p><input type="hidden" name="ob_sell_price" value="${oldBook.ob_sell_price}">
	      <td colspan="2"><fmt:formatNumber type="number" pattern="###,###,###,###,###,###"  value="${oldBook.ob_sell_price}" />원</td>
	    </tr>
	</table>
		   <div class="col-12 " style="margin: auto;">
     <div class="text-center">
	   	 <button class="btn btn-secondary mt-5 mb-2 center" type="button" onclick="location.href='BolistOb'" >목록 보기</button>
	  </div>
		</div>
	</form>		
		

</body>
</html>