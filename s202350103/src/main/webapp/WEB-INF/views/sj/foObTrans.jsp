<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!-- 운송장 -->    
<!DOCTYPE html>
<html>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

		function calcul(){
		var totalCal1 = parseInt(${oldBook.nb_price*0.6});
		
		$("#Calcul1").val(totalCal1);
		}

</script>
<head>
<style type="text/css">
.pl{
    width: 110px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 5px 5px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}






</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="writeOb" method="post">

  <div class="d-flex align-items-center mb-3">
	    <img alt="" src="../assets/images/png/obsell.png" style="width: 50px; height: 50px;" class="me-3">
	    <h2 class="mb-1">중고 도서 판매 신청</h2>
  </div>


	<div class="text-center  position-relative ">
	<img src="assets/images/png/trans.png" alt="판매신청"
                      class="mb-3 img-fluid">
	
	</div>
		<input type="hidden" name="m_num" value="${member.m_num }">
		<input type="hidden" name="nb_num" value="${oldBook.nb_num }">
		<input type="hidden" name="ob_status" value="1">
		<input type="hidden" name="ob_pur_price" id="Calcul1" value="0">
		<input type="hidden" name="ob_acc_num" value="${oldBook.ob_acc_num }">
		<input type="hidden" name="ob_acc_name" value="${oldBook.ob_acc_name }">
<%-- 	<input type="hidden" name="ob_report_date" value="${oldBook.ob_report_date }" >
 --%>		
         <input type="hidden" name="nb_num" value="${oldBook.nb_num }">
		


<br><br>
   <div id="newbookInfo" class="d-block" style="border: 0px solid;">
               <!-- 도서 정보 확인 -->
                <div class="card mb-3" style="max-width: 950px;">
                <input type="hidden" name="nb_num" value="${oldBook.nb_num }">
                 
                    <div class="col-12">
                     <table style="border: 0px;">
                         <tr>
                         <th style="margin-left: 20px;">
                      <c:choose>
                           <c:when test="${fn:contains(oldBook.nb_image, 'http')}">
                              <img id="newbookImg" src="${oldBook.nb_image}" alt="${oldBook.nb_title}" style="height: 180px; width: 150px;
                              margin: 10px; "  >
                           </c:when>
                           <c:otherwise>
                              <img src="${pageContext.request.contextPath}/upload/${oldBook.nb_image}" alt="${oldBook.nb_title}">
                           </c:otherwise>
                        </c:choose>
                    </th>
                    <th class="text-start" >
                   
                        <p style="margin: 0px; font-size: 22px;"> ${oldBook.nb_title }</p> 
                       <span><small class="fs-6 ms-2 text-muted">
                        ${oldBook.nb_writer } 지음 | ${oldBook.nb_publisher } | ${oldBook.nb_publi_date }
                        </small></span>
                         <p style="font-size: 18px; margin-right: 30px;" class="text-start">가격: <fmt:formatNumber value="${oldBook.nb_price}" groupingUsed="true"/>원</p>
                    </th>
                    </tr>
                    
                    </table>
                 
                
             </div>
             </div>
             </div>
<br>

 <p class="text-start fs-4"> 운송장  정보  </p>
 <div class="input-group mb-3">
 

  <select name="ob_trans_com" class="pl" >
				<option value="1">CJ 대한통운 </option>
				<option value="2">우체국    택배</option>
				<option value="3">로젠     택배</option>
				<option value="4">한진     택배</option>
				<option value="5">롯데     택배</option>		
		</select> 
 


     <input type="text"   name="ob_trans_num"  maxlength="12" pattern="[0-9]+" class="form-control" placeholder="운송장 번호를 입력해주세요" title="숫자만 입력해주세요"
	    	 required/>
 </div> 
 
<br>


	 <div class="d-grid gap-2">
	    <button class="btn btn-success mb-2" type="submit" onclick="calcul()">중고 판매 등록</button>
	 
	 </div>
 
 </form>
</body>

<%@ include file="../common/footerFo.jsp" %>
</html>