<%@page import="com.choongang.s202350103.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function chk_pw(m_pw) {
		
		
		
		var m_pw = $("#m_pw").val();
		$.ajax(
				{
					url:"<%=request.getContextPath()%>/memberChkPw",
					data : {m_pw : m_pw},
					dataType : 'text',
					success : function(memberPw) {
						if(m_pw == memberPw){
							$('#msg').html("비밀번호가 일치합니다.");
							$('#msg').css("color","#0aad0a");
							$('#button_dw').attr("disabled", false);	
							return true;
						} else {
							$('#msg').html("비밀번호를 확인해주세요.");
							$('#msg').css("color","red");
							$('#m_pw').val('');
							$('#button_dw').attr("disabled", true);// 버튼 비활성화
							return false;
						}
					}
				}	
		) 
	}
	
	function validateForm() {
    	 if (confirm("정말로 탈퇴하시겠습니까?") == true){   
    		return true;
    	 } else {
    		    	return false;
    	 }
	   	 return false;
	}
	   


	
</script>
</head>
<body>
<%@ include file="../common/headerFo.jsp" %>
<body>
<div class="container" style="text-align: center;">
	<form class="row" action="memberWithdraw" method="post" onsubmit="return validateForm()">
	
	      <div class="mb-8">
       		<!-- heading -->
       		<h1 class="h3">DADOK 회원탈퇴</h1>
    	  </div>
          <!-- input -->
          <label class="form-label" for="comments"> 
          	<strong >탈퇴 시 유의사항</strong>
          </label><p>
     	  <div style="text-align: left;  margin-left: 200px;" >
- 회원 탈퇴시 포인트, 주문내역 등 일부 개인정보가 자동 삭제 됩니다.<br>
- 회원님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제 6조 및 동법 시행령 제 6조에 의거하여 표시 및 광고에 관한 기록은  6개월,<br>
   계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급 등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다. 
		  </div>	
      		<p><p>
      		<hr>
      		<p><p>
 			<div class="container">
          			<strong >비밀번호 입력</strong> <input type="password" name="m_pw" required="required" id="m_pw">
          			<button type="button" onclick="chk_pw(m_pw.value)" class="btn btn-primary" style="height:30px;">비밀번호 확인</button><p>	
          			<span id="msg"></span><p>
					<p>
 					개인정보 삭제 및 보유 포인트 소멸에 대한 안내를 모두 숙지하고 회원탈퇴에 대해 동의하여 주시기 바랍니다.<p>
 				<input class="form-check-input"  type="checkbox" value="ck1" id="ck1" required="required">
 				위 내용을 모두 숙지하였으며, 이에 동의합니다.
 			</div>
		<hr>
			<div class="d-grid gap-2 col-6 mx-auto ">
			<button type="submit" class="btn btn-primary" id="button_dw" disabled="true">탈퇴하기</button>
			</div>
			
	
		</form>
	</div>
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>