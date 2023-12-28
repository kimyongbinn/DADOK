<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
   <!-- 정산하기 --> 
<!DOCTYPE html>
<html>
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
<div class="container"></div>
<form action="writeFormObTrans" method="post">
	  <div class="d-flex align-items-center mb-3">
	    <img alt="" src="../assets/images/png/obsell.png" style="width: 50px; height: 50px;" class="me-3">
	    <h2 class="mb-1">중고 도서 판매 신청 </h2>
	  </div>

	<div class="text-center  position-relative ">
	<img src="assets/images/png/calcul.png" alt="판매신청"
                      class="mb-3 img-fluid">
	
	</div>
					<input type="hidden" name="m_id" value="${oldBook.m_id}">
					<input type="hidden" name="m_name" value="${oldBook.m_name}">
					<input type="hidden" name="m_num" value="${oldBook.m_num }">
					<input type="hidden" name="nb_num" value="${oldBook.nb_num }">	
					<input type="hidden" name="nb_price" value="${oldBook.nb_price }">
					<input type="hidden" name="nb_image" value="${oldBook.nb_image }">
					<input type="hidden" name="nb_title" value="${oldBook.nb_title }">
					<input type="hidden" name="nb_writer" value="${oldBook.nb_writer }">
					<input type="hidden" name="nb_publisher" value="${oldBook.nb_publisher }">
					<input type="hidden" name="nb_publi_date" value="${oldBook.nb_publi_date }">
<br>
<br>
	<div>
		<div>
           <div class="d-block" style="border: 0px solid;">
               <!-- 도서 정보 확인 -->
                <div class="card mb-3" style="max-width: 950px;">
                <input type="hidden" name="nb_num" value="${oldBook.nb_num }">
                 
                    <div class="col-12">
                     <table style="border: 0px;">
                         <tr>
                         <th style="margin-left: 20px;">
                      <c:choose>
                           <c:when test="${fn:contains(oldBook.nb_image, 'http')}">
                              <img src="${oldBook.nb_image}" alt="${oldBook.nb_title}" style="height: 180px; width: 150px;
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
                    <div>
                     <!-- cpation on top -->
    <table class="table caption-top text-center">
    <caption>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등급별 정산 금액</caption>
    <thead>
      <tr>
      	<th scope="col">정상 가격 </th>
        <th scope="col">A 등급</th>
        <th scope="col">B 등급</th>
        <th scope="col">C 등급</th>
        <th scope="col">D 등급</th>
      </tr>
    </thead>
    <tbody>
      <tr>
       
        <td><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price}"/>원 </td>
      	<td><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.6}"/>원  </td>
      	<td><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.5}"/>원    </td>
      	<td><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.4}"/>원 </td>
      	<td><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${oldBook.nb_price *0.3}"/>원</td>
		
      </tr>
 

    </tbody>
    
  </table>                
     
				</div>	  
                
           </div>   
                
       </div>
    </div>
    <br>
		  <p class="text-start fs-4">정산 계좌    </p>
		 <div class="input-group mb-3">
				<select name="ob_acc_name" class="pl text-start" >
						<option id="select" value="1">기업은행</option>
						<option id="select" value="2">우리은행</option>
						<option id="select" value="3">하나은행</option>
						<option id="select" value="4">제일은행</option>
						<option id="select" value="5">농      협</option>
						<option id="select" value="6">신한은행</option>
						<option id="select" value="7">국민은행</option>
						<option id="select" value="8">카카오뱅크</option>
						<option id="select" value="9">토스    뱅크</option>
				</select> 
 

		<input type="hidden" name="ob_status" value="1">
	    <input type="text"   name="ob_acc_num"  maxlength="12" pattern="[0-9]+" class="form-control" placeholder="계좌 번호를 입력해주세요" title="숫자만 입력해주세요"
	    	 required/>
         
			 </div> 
	
			 
			 <div class="d-grid gap-2">
				    <button class="btn btn-success mb-2" type="submit">판매 계속</button>
	    	 </div>
 </form>
</body>
<%@ include file="../common/footerFo.jsp" %>
</html>