<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
   <!-- 중고서적 디테일 프론트 --> 
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function chkcalcul(){
		alert("정산 완료되었습니다");
		
		
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" style="width: 650px;">
      <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">중고 검수 상세내역</h1>
      </div>


<input type="hidden" name="ob_num" value="${oldBook.ob_num }">

<table class="table table-bordered">
    <tr>
	      <td scope="col" class="text-center" style="width:220px; background-color: #f0f3f2;">신청 일자</td>
	      <td scope="col" colspan="2">${oldBook.ob_report_date }</td> 
    </tr>
    <tr>
	      <td class="text-center" style="width:220px; background-color: #f0f3f2;">중고상품번호 </td>
	      <td colspan="2" id="ob_num" >${oldBook.ob_num }</td>
    </tr>
      <tr>
	      <td class="text-center" style="width:220px; background-color: #f0f3f2;">검수매입상태</td>
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
		      <td class="text-center" style="width:220px; background-color: #f0f3f2;">책이름 </td>
		      <td colspan="2">${oldBook.nb_title }</td>
      </tr>
        <tr>
		      <td class="text-center" style="width:220px; background-color: #f0f3f2;">중고 판매 예상가</td>
		      <td colspan="2">	
		   		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.ob_pur_price}"/>원     
		      </td>
       </tr>
	
	
     <tr>
      <td rowspan="3" class="text-center" style="width:220px; height:130px; background-color: #f0f3f2;"> <br>
      	검수내역 </td>
	   <td>찢김</td>
	    <td> 
		 <c:choose>
			    <c:when test="${oldBook.ob_ripped eq '1'}">
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
	    </c:choose>		      </td>
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
      <td class="text-center" style="width:220px; background-color: #f0f3f2;">등급</td>
      <td colspan="2">
      		<c:choose>
				<c:when test="${oldBook.ob_grade eq '0' }"><c:out value="A"/></c:when>
				<c:when test="${oldBook.ob_grade eq '1' }"><c:out value="B"/></c:when>
				<c:when test="${oldBook.ob_grade eq '2' }"><c:out value="C"/></c:when>
				<c:otherwise><c:out value="D"/></c:otherwise>
				</c:choose>
	       </td>
	    </tr>
	    <tr>
	      <td class="text-center" style="width:220px; background-color: #f0f3f2;">정산 금액 </td>
	      <td colspan="2"> <fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.ob_pur_price}" />원</td>
	    </tr>
	</table>
	
	
	<div class=" text-center">
	<form action="foObUpComple" method="post">
		   <c:if test="${oldBook.ob_status == 2 }">
		    <button class="btn btn-primary mt-5 mb-2" type="submit" onclick="chkcalcul()" style="margin-right: 10px;" >정산받기</button>
		    <input type="hidden" name="ob_status" value="3">
		    <input type="hidden" name="ob_write_date" value="">
		    <input type="hidden" name="ob_readcnt" value="0">
		    <input type="hidden" name="ob_num" value="${oldBook.ob_num }">
		    </c:if>
	  <button class="btn btn-secondary  mt-5 mb-2" type="button" onclick="location.href='memberSellList?m_num=${member.m_num }'">목록 보기</button>
	</form>	
		
		  
		
	</div>
		
</div>
		

</body>

<%@ include file="../common/footerFo.jsp" %>
</html>