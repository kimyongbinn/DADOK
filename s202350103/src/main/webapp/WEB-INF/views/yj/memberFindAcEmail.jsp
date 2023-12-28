<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function emailCk() {
    var email = document.getElementById("m_email").value;
    var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    if (!regex.test(email)) {
        alert("올바른 이메일 주소를 입력하세요.");
        return false;
    }
}
</script>


</head>
<body>
	
	<!-- 컨텐츠 중간으로 -->
	<div class="row justify-content-center">
		<div class="mb-8">
       <!-- heading -->
       <h1 class="h3">아이디 찾기</h1>
    	</div>
	
		<div class="col-lg-8 col-12">
			<div class="py-6">
				
				<c:if test="${not empty noAuth}">
				<h4 class="mb-4" style="color: red; font-size: 15px;" >
					<strong>${noAuth }</strong> </h4><p>
				</c:if>
				
				<h4 class="fs-6 mb-4">본인 명의 이메일로 인증하여 주세요</h4>
				
				<form action="memberAuthEmail" method="post" onsubmit="return emailCk()" id="frm">
					<div class="mb-2">
						<input type="email" class="form-control"
							 required placeholder="ex)abc123@example.com" name="m_email" id="m_email" value="${m_email }">
					</div>
					
					<h4 class="fs-6 mb-4"><mark>가입하신 이메일을 입력해주세요.</mark></h4>
					
					<c:if test="${not empty noEmail }">
						<h4 class="mb-4" style="color: red; font-size: 15px;" >
						<strong>${noEmail }</strong> </h4><p>
					</c:if>
					
					<c:if test="${not empty okEmail }">
						<h4 class="mb-4" style="color: red; font-size: 15px;" >
						<strong>${okEmail }</strong> </h4><p>
					</c:if>
					
					
					<div class="d-grid mb-8" >
						<button type="submit" class="btn btn-primary">
						인증 메일발송
						</button>
					</div>
				</form>	
					
				<c:if test="${not empty okEmail }">
					
					<form action="memberFindGetIdEmail" method="post"> 
					<input type="hidden" name="ranCode" value="${ranCode }" >
					<input type="hidden" name="m_email" value="${m_email }"> 
					<h4 class="fs-6 mb-2">인증번호 입력</h4>
					 <div class="mb-4">
                         <input type="text" maxlength="6" class="form-control" 
                         required placeholder="인증번호 6자리를 정확히 입력해주세요." name="inputCode" id="inputCode">
                     </div>
                	
                	<div class="d-grid">
						<button type="submit" class="btn btn-primary">확인</button>
					</div>
					</form>
					
					
				</c:if>
					
					

				<script>
				    // 인증번호 입력 폼이 나타났을 때 포커스를 이동
				    // DOMContentLoaded -> 페이지 리 로드시 이벤트
				    document.addEventListener('DOMContentLoaded', function () {
				        var inputCode = document.getElementById('inputCode');
				        if (inputCode) {
				            inputCode.focus();
				        }
				    });
				</script>	
                     
					<div class="mt-4">
						<small> <a href="#">메일이 오지 않으세요?</a> <a href="#"
							class="ms-3">1544-1125 고객센터 문의</a>
						</small>
					</div>
			</div>
		</div>
	</div>



	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>