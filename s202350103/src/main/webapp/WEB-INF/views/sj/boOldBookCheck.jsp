<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

/*
		function btnActive()  {
			  const target = document.getElementById('target_btn');
			  target.disabled = false;
			}
		
			function btnDisabled()  {
			  const target = document.getElementById('target_btn');
			  target.disabled = true;
			} */
	
			
			function toggleChk(selectchk) {
			/* 	alert("toggleOb_ripped start..."); */
				var	 chk;
				// checkbox 1일때에 선택 
				if (selectchk == 1)	 {
					chk =  	 $("#chk1").val();
					if (chk1 == '1' ) $("#chk1").val('0');
					else 			 $("#chk1").val('1');
				// checkbox 1일때에 선택 
				}if (selectchk == 2) {
					chk =  	 $("#chk2").val();
					if (chk2 == '1' ) $("#chk2").val('0');
					else 			 $("#chk2").val('1');
				}
				// checkbox 1일때에 선택 
				if (selectchk == 3)	 {
					chk =  	 $("#chk3").val();
					if (chk2 == '1' ) $("#chk3").val('0');
					else 			 $("#chk3").val('1');
				}
			
			}
			//등급 합계
			function toggleSum() {
			    var num1 = $("#chk1").val();
			    var num2 = $("#chk2").val();
			    var num3 = $("#chk3").val();
			/*     alert ("num1->"+num1);
			    alert ("num2->"+num2);
			    alert ("num3->"+num3); */
			    var totalNum = parseInt(num1)+parseInt(num2)+parseInt(num3);
			    var totalNumStr = parseInt(totalNum); 
				var totalCalculVal =parseInt(totalCalculVal);  // 중고 등급에 따른 곱셈값 
			/* 
			    alert ("totalNumStr->"+totalNumStr);
			     */
	/* 	  		  //무조건 적인 리턴 
				//    0          0 , 1, ,2,3
			    var num4 = $("#totalSum6").val();
				//    1          0 , 1, ,2,3
			    var num5 = $("#totalSum7").val();
			    var num6 = $("#totalSum8").val();
			    var num7 = $("#totalSum9").val(); */
			    
			    //새상품 가격에서 등급을 *한 값을 넣어주는 식
			    var totalCal1 = (${oldBook.nb_price*0.6});
			    var totalCal2 = (${oldBook.nb_price*0.5});
			    var totalCal3 = (${oldBook.nb_price*0.4});
			    var totalCal4 = (${oldBook.nb_price*0.3});
			   
			    //위 식의 값을 넣을 그릇  
			    $("#totalCalcul1").val(totalCal1);
			    $("#totalCalcul2").val(totalCal2);
			    $("#totalCalcul3").val(totalCal3);
			    $("#totalCalcul4").val(totalCal4);
			   
			 /*    alert ("totalCal1->"+totalCal1);
			    alert ("totalCal2->"+totalCal2);
			    alert ("totalCal3->"+totalCal3);
			    alert ("totalCal4->"+totalCal4); */
			    //                 checkbox()
			    $("#totalSum").val(totalNum);
			    
			    //grade 값에 따른 등급 
			    if(totalNum == '0'){
			    	$("#totalSum1").html('A등급');
			    } else if(totalNum == '1'){
			    	$("#totalSum1").html('B등급');
			    } else if(totalNum == '2'){
			    	$("#totalSum1").html('C등급');
			    } else if(totalNum == '3'){
			    	$("#totalSum1").html('D등급');
			    } else {
			    	$("#totalSum5").val('kkk');
			    }
			 
			    // totalNum view에 보여질거고 
			    //1 리턴된걸 value로 넣고싶어요
			    if(totalNumStr == '0'){
			    	$("#totalSum6").val(totalCal1);
			    	totalCalculVal = totalCal1;
			    } else if(totalNumStr == '1'){
			    	$("#totalSum7").val(totalCal2);
			    	totalCalculVal = totalCal2;
			    } else if(totalNumStr == '2'){
			    	$("#totalSum8").val(totalCal3);
			    	totalCalculVal = totalCal3;
			    } else if(totalNumStr == '3'){
			    	$("#totalSum9").val(totalCal4);
			    	totalCalculVal = totalCal4;
			    } else {
			    	$("#totalSum10").val('kkk');
			    	totalCalculVal = 0;
			    }
			    	
			    const format = Number(totalCalculVal).toLocaleString();
			    
			
			 	//calcul의 그릇  --> 리턴으로 value값 전달
			 	$("#totalCalculVal").val(totalCalculVal);
			 	/* $("#totalCalculVal2").; */
			 	$("#totalCalculVal2").val(format); 
			    $("#totalCalculValSell").val(parseInt(totalCalculVal*1.1));
			     
			    const target = document.getElementById('target_btn');
				  target.disabled = false;
							  	  
			}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="updateOb" method="post" class="col-xl-8 col-lg-8 col-md-8 col-8 mb-6" style="margin-left: auto; margin-right: auto;">
	
	    <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">중고 검수 등록</h1>
      </div>
	
	
	
	<input type="hidden" name="ob_report_date" value="${oldBook.ob_report_date }">
	
	<table class="table table-bordered col-8 ">
		    <tr>
			      <td scope="col" class="col-2 text-center" style="background-color: #f0f3f2;">신청 일자</td>
			      <td scope="col" colspan="2">${oldBook.ob_report_date }</td> 
		    </tr>
		     <tr>
				      <td class="text-center" style="background-color: #f0f3f2;">중고상품번호 </td>
				      <td colspan="2"><input type="hidden" name="ob_num" value="${oldBook.ob_num }">${oldBook.ob_num } </td>
			    </tr>
			      <tr>
				      <td class="text-center" style="background-color: #f0f3f2;">검수매입상태</td>
				      <td colspan="2">
			      	<c:choose>		
							<c:when test="${oldBook.ob_status eq '1' }"><c:out value="검수중"/></c:when>
							<c:when test="${oldBook.ob_status eq '2' }"><c:out value="검수완료"/></c:when>
							<c:otherwise><c:out value="매입완료"/></c:otherwise>
					</c:choose>
				<input type="hidden" name="ob_status"  value="2">
		      </td>
		    </tr>
		     <tr>
			      <td class="text-center" style="background-color: #f0f3f2;">책이름 </td>
			      
			      <td colspan="2"><input type="hidden" name="nb_title"> ${oldBook.nb_title }</td>
	      </tr>
	     <tr>
			      <td class="text-center" style="background-color: #f0f3f2;">중고매입가격 </td>
			      <td colspan="2">
			   	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.6}"/>원   
			      </td>
	       </tr>
	     <tr>					
	      <td rowspan="3" class="text-center" style="background-color: #f0f3f2;"> 검수내역 <br><input type="button" class="btn btn-danger" value="RESET" onclick="location.reload(true)" >    </td>
		      <td>찢김</td>
		      <td>
		        <input class="form-check-input" type="checkbox" onclick="toggleChk(1)">
		      	<input  class="form-check-input" type="hidden" name="ob_ripped" id="chk1" value="0">
		      </td>
	     </tr>
	    <tr>
		      <td>오염</td>
		      <td>
		      <input class="form-check-input" type="checkbox" onclick="toggleChk(2)" >
		      <input class="form-check-input" type="hidden" name="ob_smeary" id="chk2" value="0">
		      </td>
	    </tr>
	     <tr>
		      <td>낙서</td>
		    	 <td>
		    	 <input class="form-check-input" type="checkbox" onclick="toggleChk(3)" >
		    	 <input class="form-check-input" type="hidden" name="ob_scribble" id="chk3" value="0"> 
	   		  </td>
	     </tr>
	 
    
     <tr>
	      <td class="text-center" style="background-color: #f0f3f2;">등급 
	      	<input type="button"  class="btn btn-primary mb-2" value="등급확인" onclick="toggleSum()">
	      </td>
	      <td colspan="2">
	       		 	<input type="hidden" name="ob_grade" id="totalSum" value="0" >
	   		 	<div>
	      		
	      		<div id="totalSum1"></div>
	      		<!--  	<input type="button" class="btn btn-ghost-secondary mb-2" 		id="totalSum1" value="" >
	      		 	<input type="button" 	class="btn btn-ghost-secondary mb-2" 	id="totalSum2" value="" >
	      		 	<input type="button" class="btn btn-ghost-secondary mb-2" 		id="totalSum3" value="" >
	      		 	<input type="button"	class="btn btn-ghost-secondary mb-2"	id="totalSum4" value="" > -->
	   		 	</div>

	<%-- 	 	<c:set var="grade" id="totalSum" value=""></c:set>
			<c:choose>
				<c:when test="${grade eq '0' }"><c:out value="A"/></c:when>
				<c:when test="${grade eq '1' }"><c:out value="B"/></c:when>
				<c:when test="${grade eq '2' }"><c:out value="C"/></c:when>
				<c:when test="${grade eq '3' }"><c:out value="D"/></c:when>
				<c:otherwise><c:out value="kkk"/></c:otherwise>
			</c:choose> --%>
			</td>
			</tr>
			
		    <tr>
			    <td style="background-color: #f0f3f2;">중고 정산가격   </td> 
			  <!--      <input type="button"  class="btn btn-dark mb-2" value="정산가격 계산" onclick="togglecalcul()"> -->
			 <td colspan="2">
			   		 	<input type="hidden"  name="ob_pur_price" id="totalCalculVal" value="0" > 
	      		 		<input type="hidden"  name="ob_sell_price" id="totalCalculValSell" value="0"> 
	      		 	<div >	
	      		  <input type="text"   disabled="disabled"   id="totalCalculVal2" style="border: none; background: transparent; width: 52px;"/>원 
		      		
		      	
		      	<!-- 	 	<input type="button" 	class="btn btn-ghost-secondary mb-2"   id="totalSum6"> 
		      		 	 <input type="button" 	class="btn btn-ghost-secondary mb-2"   id="totalSum7">
		      		 	<input type="button" 	class="btn btn-ghost-secondary mb-2"   id="totalSum8">
		      		 	 <input type="button"	class="btn btn-ghost-secondary mb-2"   id="totalSum9">  -->
				</div>
			 <!-- 위에서 이미 if 돌렸음   -->
		<%--       <c:choose>
				<c:when test="${# eq '0'}"  > <c:out value="${oldBook.nb_price *0.6 }"/>원 </c:when>
				<c:when test="${oldBook.ob_grade eq '1'}"> <c:out value="${oldBook.nb_price *0.5 }"/>원</c:when>
				<c:when test="${oldBook.ob_grade eq '2'}"> <c:out value="${oldBook.nb_price *0.4 }"/>원</c:when>
				<c:otherwise> <c:out value="${oldBook.nb_price *0.4 }"/> 원  </c:otherwise>
				</c:choose> 
				 --%>
	    	</tr>
	  
		</table>

     <div class="col-12 " style="margin: auto;">
     <div class="text-center">
	   	<button class="btn btn-primary mt-5 mb-2 center" type="submit" id="target_btn" disabled="disabled" style="margin-right: 10px;">등록하기</button>
	   	<button class="btn btn-secondary  mt-5 mb-2" type="submit" >목록 보기</button>
	  </div>
	  </div>
   
   
   
   
		</form>


</body>
</html>