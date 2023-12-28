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
// 전화번호 유효성 검사
function phCk() {
    var m_ph = document.getElementById("m_ph").value;

    // 숫자만 허용
    var regex = /^[0-9]+$/;

    if (!regex.test(m_ph)) {
        alert("전화번호는 숫자만 입력하세요.");
		frm.m_ph.value = "";
		frm.m_ph.focus();
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
			
				<h4 class="fs-6 mb-4">본인 명의 휴대전화로 인증하여 주세요</h4>
				
				<form action="memberAuthPhone" method="post" onsubmit="return phCk()" id="frm">
					<div class="input-phone mb-2">
						<input type="tel" maxlength="11" class="form-control"
							 required placeholder="ex)01012345678" name="m_ph" id="m_ph" value="${m_ph }">
					</div>
					<h4 class="fs-6 mb-4"><mark>- 생략하고 번호만 입력해주세요</mark></h4>
					
					<c:if test="${not empty noPh }">
						<h4 class="mb-4" style="color: red; font-size: 15px;" >
						<strong>${noPh }</strong> </h4><p>
					</c:if>
				
					<c:if test="${not empty okPh }">
						<h4 class="mb-4" style="color: red; font-size: 15px;" >
						<strong>${okPh }</strong> </h4><p>
					</c:if>
				
					<div class="d-grid mb-8" >
						<button type="submit" class="btn btn-primary">
						인증 번호전송
						</button>
					</div>
				</form>	
					
				<c:if test="${not empty okPh }">
					
					<form action="memberFindGetId" method="post"> 
					<input type="hidden" name="ranCode" value="${ranCode }" >
					<input type="hidden" name="m_ph" value="${m_ph }"> 
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
						<small> <a href="#">인증번호가 오지 않으세요?</a> 
						<a href="memberQnaList"class="ms-3">
						1544-1125  고객센터 문의</a>
						</small>
					</div>
			</div>
		</div>
	</div>



	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>