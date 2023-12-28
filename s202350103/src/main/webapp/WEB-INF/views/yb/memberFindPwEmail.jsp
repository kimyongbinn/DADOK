<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#certiChk {
		display: none;
	}
	#inputNum {
		display: none;
	}
</style>
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript">


	function emailChk(m_email) {
	    
	    
	    $.ajax({
	       type:"get",
	       url:"<%=request.getContextPath()%>/mailTransport",
	       data : {memberMail : m_email},
	       dataType : 'json',
	       success : function(strResult) {
	    	  var jsonStr = JSON.stringify(strResult);
	          if(strResult['certiNum'] != null){
	        	 alert("인증번호 전송중... 잠시만 기다려주세요.");
	             $('#msg').html("인증번호 전송 성공! 인증번호를 입력해주세요.");
	             $('#msg').css("color", "red");
	             $('input[name=certiNum]').attr('value',strResult['certiNum']);
	             $('input[name=m_email]').attr('value',strResult['m_email']);
	             $('#certiChk').css("display", "block").prop("disabled", false);
	             $('#inputNum').css("display", "block");
	             return true;
	          } else {
	             alert("가입할때 사용하신 이메일을 입력해주세요.");
	             $('#msg').html("가입할때 사용한 이메일을 입력해주세요.");
	             $('#msg').css("color", "red");
	             $('#m_email').val('');
	             $('#certiChk').css("display", "none").prop("disabled", true);
	             $('#inputNum').css("display", "none");
				 return false;
	          } 
	       }
	    });
	 }
	


</script>


</head>
<body>
	
	<!-- 컨텐츠 중간으로 -->
	<div class="row justify-content-center">
		<div class="mb-8">
       <!-- heading -->
       <h1 class="h3">비밀번호 찾기</h1>
    	</div>
		
		<div class="col-lg-8 col-12">
			<div class="py-6">
				
				<h4 class="fs-6 mb-4">본인 명의 이메일로 인증하여 주세요</h4>
				
	
					<div class="mb-2">
						<input type="email" class="form-control"
							 required placeholder="ex)abc123@example.com" name="m_email" id="m_email">
					</div>
					
					<h4 class="fs-6 mb-4"><mark>가입하신 이메일을 입력해주세요.</mark></h4>
					<div id="msg" style="text-align: center"></div>
			
					<div class="d-grid mb-8" >
						<button class="btn btn-primary" onclick="emailChk(m_email.value)" >
						인증 메일발송
						</button>
					</div>
					
					<form action="certiNumChk" method="post">
						<div class="mb-2">
							<input type="hidden" name="certiNum" value="" >
							<input type="hidden" name="m_email" value="" >
							<input type="text" class="form-control"
								 required placeholder="인증번호를 입력해주세요" name="inputNum" id="inputNum">
						</div>
					
						
						<div class="d-grid mb-8" >
							<input type="submit" name="numChk" value="인증번호 확인" class="btn btn-primary" 
								   id="certiChk" disabled="true" >
						</div>
                    </form>
					<div class="mt-4">
						<small> <a href="#">메일이 오지 않으세요?</a> <a href="memberQnaList"
							class="ms-3">1544-1125 고객센터 문의</a>
						</small>
					</div>
			</div>
		</div>
	</div>



	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>