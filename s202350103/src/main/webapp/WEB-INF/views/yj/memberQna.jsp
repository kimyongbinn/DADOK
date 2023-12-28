<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../assets/libs/simplebar/dist/simplebar.min.js"></script>

<script type="text/javascript">
	
	function Con(){
		
		var con = confirm("게시글을 등록 하시겠습니까 ?");
		
		if(con == true){
			
			alert("정상 등록 되었습니다.");
		    return true;
		}else{
			return false;
		}
		
	}



</script>

</head>
<body>

      <div class="mb-2">
	  <div class="d-flex align-items-center mb-3">
	    <img alt="" src="../assets/images/favicon/pen.png" style="width: 60px; height: 60px;" class="me-3">
	    <h2 class="mb-1">글 쓰기</h2>
	  </div>
	  <p>친절하고 매너 있는 DADOK 회원이 되어주세요.</p>
	</div><hr>
	
	<div class="offset-lg-2 col-lg-8 col-12 " >

          <div class="mb-8">

          </div>
          <!-- form -->
          <form class="row" action="memberQInsert" method="post" id="frm" onsubmit="return Con();">
         
          <input type="hidden" name="m_num" value="${member.m_num }">
           
           <div class="card card-product mb-10" style="border-left: none; border-right: none;">
             <div class="card-body text-center py-8">
              <div class="col-md-12">
           		 <div class="form-check form-switch">
				  <input class="form-check-input" name="mq_hidden" type="checkbox" id="flexSwitchCheckDefault" value=1 >
				  <input type="hidden" name="mq_hidden" value=0>
					  <label class="form-check-label" for="flexSwitchCheckDefault">
					  	<span style="font-weight: bold;" ><span style="color: #198754;">비밀글</span> 로 작성하기 </span>
					  <span class="text-danger">*</span>&nbsp;&nbsp;
					  	<small style="color: red; font-weight: bold;">나 와 관리자만 조회 할수 있습니다</small>
					  </label>
				</div>
				</div>
			</div>
			</div>
             
              <!-- input -->
            <div class="col-md-6 mb-3">
              <label class="form-label " for="fname" style="font-weight: bold; font-size: 14px;">작성자<span class="text-danger">*</span></label>
              <input type="text" id="m_id" class="form-control" name="m_id" value="${member.m_id }" disabled="disabled">
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname" style="font-weight: bold; font-size: 14px;">회원 이름<span class="text-danger">*</span></label>
              <input type="text" id="m_name" class="form-control" name="m_name" value="${member.m_name }" disabled="disabled">
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company" style="font-weight: bold; font-size: 14px;">글제목<span class="text-danger">*</span></label>
              <input type="text" id="mq_title" name="mq_title" class="form-control" placeholder="제목을 입력하세요" required>
            </div>
     
            <div class="col-md-12 mb-5">
              <!-- input -->
              <label class="form-label" for="comments" style="font-weight: bold; font-size: 14px;">글내용<span class="text-danger">*</span></label>
              <textarea rows="5"  id="mq_content" name="mq_content" class="form-control" placeholder="내용을 입력하세요" required="required"></textarea>

            </div>
            
            
             <div class="col-md-12 mb-1 text-center"> 
				 <div class="d-grid gap-2 d-md-flex justify-content-md-center ">
				   	<button class="btn btn-primary mt-5 mb-2" type="submit" style="margin-right: 10px;">등록</button>
				   	<button class="btn mt-5 mb-2 btn-secondary" onclick="location.href='memberQnaList'" >목록가기</button>
		  		</div>
			</div>
            
	          </form>
            </div>



	
	

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>