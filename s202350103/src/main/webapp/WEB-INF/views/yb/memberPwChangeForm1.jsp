<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%> 
<%@ include file="../common/headerFo.jsp" %> 
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	#passwordToggler {
		border: 0px;
		background: none;
	}
	#passwordSave {display: none;}
</style>
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript">
	//비밀번호에 focus
	window.onload = function() {
	    document.getElementById('m_pw').focus();
	};

	function validateForm() {
	    var passwordSaveButton = document.getElementById("passwordSave");
	    
	    if (passwordSaveButton.disabled == true) {
	        alert("비밀번호 일치하는지 확인하십시오.");
	        return false;
	    } else {
	    	 if (confirm("변경하시겠습니까?") == true){   
	    		    // 버튼이 활성화된 경우 폼을 제출합니다.
	    		return true;
	    	 } else {
	    	   return false;
	    	 }
	      return false;
	    }
	   
	}

		
   function passwordChk(m_pw, m_pw2) {
	  
      $.ajax({
         url:"<%=request.getContextPath()%>/changePwChk",
         data : {m_pw : m_pw,
                 m_pw2 : m_pw2
         		},
         dataType : 'json',
         success : function(strResult) {
        	var jsonStr = JSON.stringify(strResult);
            if(strResult['strResult'] == 1) {
				$('#msg').html("비밀번호가 일치합니다.");
				$('#msg').css("color", "#0aad0a");
				$('#passwordSave').css("display", "block").prop("disabled", false);
				$('#passwordSave').focus();
            } else if(strResult['strResult'] == 2) {
            	$('#msg').html("비밀번호는 영문, 숫자, 특수문자 조합으로 8자에서 20자 사이여야 합니다. 다시 입력해주세요");
				$('#msg').css("color", "red");
				$('#m_pw2').val('');
				$('#passwordSave').css("display", "none").prop("disabled", true);
				$('#m_pw').focus();
            } else if(strResult['strResult'] == 0){
            	$('#msg').html("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				$('#msg').css("color", "red");
				$('#m_pw2').val('');
				$('#passwordSave').css("display", "none").prop("disabled", true);
				$('#m_pw').focus();
            }
         }
         
      });
   }
   
 
 	
</script>

<body>		
<section class="my-lg-14 my-8" style="width: 150%; ">
    <div class="container">
      <!-- row -->
      <div class="row justify-content-center align-items-center">
        <!-- col -->
        
        <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1" style="align-items: center;">
          <div class="mb-lg-9 mb-5">
            <h1 class="mb-1 h2 fw-bold" style="text-align: center;">비밀번호 변경</h1>
            <p></p>
          </div>
		  <div id="msg" style="text-align: center;"></div><p>
		<form action="memberPwChange1" method="post" name="frm" onsubmit="return validateForm()">
            <div class="row g-3">
              <!-- row -->
			  <div>새 비밀번호 </div>
              <div class="col-12">
                <!-- input -->
                <input type="password" placeholder="**********" id="m_pw" name="m_pw" required="required" class="form-control">
              </div>
              <div class="col-12">
	                <!-- input -->
	              <div>비밀번호 확인</div>
	              <div class="password-field position-relative">
	      			<input type="password" placeholder="**********" id="m_pw2" name="m_pw2" required="required" class="form-control">
	      			<input type="hidden" name="m_email" value="${m_email }" id="m_email">
	      			<span><button type="button" id="passwordToggler" class="bi bi-eye-slash"></button></span>
	    		  </div>
              </div>
     		  <div class="col-12 d-grid"> <button type="button" class="btn btn-primary" onclick="passwordChk(m_pw.value, m_pw2.value)" id="passwordChkEnter">비밀번호 확인</button>
             	 <!-- link -->
           	  </div>
			  <div id="msg" style="text-align: center;"></div>	

              <div class="col-12 d-grid"> <input type="submit" class="btn btn-primary"  id="passwordSave" disabled="true" value="비밀번호 저장">
             	 <!-- link -->
           	 </div> 
        
           </div>
       </form>
       </div>
      </div>
   </div>
</section>


<%@ include file="../common/footerFo.jsp" %>
</body>
<script type="text/javascript">
	const passwordChkEnter = document.getElementById("passwordChkEnter");
	const m_pw2 = document.getElementById("m_pw2");
	
	// input 요소에서 엔터 키를 누를 때 버튼을 클릭하도록 설정합니다.
	m_pw2.addEventListener("keyup", function(event) {
	  if (event.key === "Enter") {
		  passwordChkEnter.click();
	  }
	});

	//비밀번호 type 바꾸기
	const passwordToggler = document.getElementById("passwordToggler");
	const pwInput = document.getElementById("m_pw2");
	
	passwordToggler.addEventListener("click", function() {
	
	  const currentType = pwInput.type;
	
	  if (currentType === "text") {
		  pwInput.type = "password";
	  } else if (currentType === "password") {
		  pwInput.type = "text";
	  }
	});
	
	


</script>
</html>