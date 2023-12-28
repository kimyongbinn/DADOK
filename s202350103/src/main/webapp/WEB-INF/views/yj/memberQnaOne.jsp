<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function emailFor(){
		
		var con = confirm("전송하시겠습니까 ?");
		
		if(con == true){
			
			alert("정상 접수 되었습니다.");
		    return true;
		}else{
			return false;
		}
		
	}

</script>


</head>
<body>
	
	 <div class="mb-6">
	  <div class="d-flex align-items-center">
	    <img alt="" src="../assets/images/favicon/one.png" style="width: 60px; height: 60px;" class="me-3">
	    <h2>1 : 1 문의</h2>
	  </div>
	</div>
	
	<div class="offset-lg-2 col-lg-8 col-12">

          <div class="mb-8">
              <!-- heading -->
            <h1 class="h3">
            	<span style="color: #024098;">신속하게 친절하게 연락 드리겠습니다.</span> </h1>
            <p class="lead mb-0"><strong>답변일 : 작성일 기준 1 ~ 3 이내</strong> </p>
          </div>
          <!-- form -->
          <form class="row" action="memberOneMail" method="post" id="frm" onsubmit="return emailFor();">
         
          <input type="hidden" name="m_num" value="${member.m_num }">
           
              <div class="col-md-12 mb-8">
           		 <div class="form-check form-switch">
					<i class="bi bi-exclamation-circle"></i> &nbsp;&nbsp;
					  <label class="form-check-label" for="flexSwitchCheckDefault">
					  	연락받으실 <span style="color: red;">이메일</span> 과 <span style="color: red;">연락처</span>를 확인해주세요.
					  <span class="text-danger">*</span>
					  </label>
				</div>
				</div>

             
              <!-- input -->
            <div class="col-md-6 mb-3">
              <label class="form-label" for="fname">아이디<span class="text-danger">*</span></label>
              <input type="text" id="m_id" class="form-control" name="m_id" value="${member.m_id }" readonly="readonly">
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname">회원 이름<span class="text-danger">*</span></label>
              <input type="text" id="m_name" class="form-control" name="m_name" value="${member.m_name }" readonly="readonly">
            </div>
            <div class="col-md-6 mb-3">
              <label class="form-label" for="emailContact">이메일<span class="text-danger">*</span></label>
              <input type="email" id="m_email" name="m_email" class="form-control" value="${member.m_email }"  readonly="readonly">
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="phone">연락처<span class="text-danger">*</span></label>
              <input type="text" id="m_ph" name="m_ph" class="form-control" value="${member.m_ph }" readonly="readonly">
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company">제목<span class="text-danger">*</span></label>
              <input type="text" id="mq_title" name="mq_title" class="form-control" placeholder="문의 제목을 입력하세요" required>
            </div>
     
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="comments">문의사항<span class="text-danger">*</span></label>
              <textarea rows="9" id="mq_content" name="mq_content" class="form-control" placeholder="문의 내용을 입력하세요" required="required"></textarea>
            </div>
				<!-- Button Block -->
				<div class="d-grid gap-2 col-6 mx-auto">
				  <button class="btn btn-primary" type="submit">전송</button>
				</div>
	          </form>
            </div>



	
	

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>