<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 다음  주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
		{
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress")
						.focus();
			}
		}).open();
	}
</script>


<script type="text/javascript">
	// 아이디 중복검사
	function chkId() {
		var m_id = document.getElementById("m_id").value;

		// 정규식 6~12자 + @, #, $ 제외 , 영문자와 숫자 허용
		var regex = /^[a-zA-Z0-9]{6,12}$/;

		// 정규표현식 유효성 검사
		if (!regex.test(m_id)) {
			alert("아이디는 6자에서 12자 사이의 영문자와 숫자로만 작성해주세요.");
			frm.m_id.value = "";
			return false;
		} else { // 중복검사 
			location.href = "idConfirm?m_id=" + m_id;
			return true;
		}
	}
</script>


<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">


function emailOptionChange(){
	
    var emailSelect = document.getElementById("emailSelect");
    var mEmail2 = document.getElementById("m_email2").value;
	var selectedOption = emailSelect.value;

    if (emailSelect.value === "직접 입력") {
        mEmail2.removeAttribute("disabled");
    } else {
        mEmail2.setAttribute("disabled", "disabled");
        mEmail2.value = selectedOption;
        alert(mEmail2.value);
    }
	
}


function valiForm() {

	var isValid = true;
	
	
	// 이름 유효성 검사
	function nameCk() {
		var m_name = document.getElementById("m_name").value;
		// 특수문자 제외, 영문 대소문자,한글, 공백 허용
		var regex = /^[a-zA-Z가-힣\s]+$/;

		if (!regex.test(m_name)) {
			alert("이름에는 특수문자가 포함 될 수 없습니다.");
			frm.m_name.value = "";
			isValid = false;
		}
	}

	// 이메일 유효성 검사
	function emailCk() {
		var m_email1 = document.getElementById("m_email1").value;
		var m_email2 = document.getElementById("m_email2").value;
		
		// 특문 제외 영문숫자와 마침표. 만 허용
		var regex = /^[a-zA-Z0-9.]+$/;

		if (!regex.test(m_email1) || !regex.test(m_email2)) {
			alert("이메일은 영문자와 숫자로만 작성해주세요.");
			isValid = false;
		}
	}

	// 비밀번호 유효성 검사 
	function pwCk() {
		var m_pw = document.getElementById("m_pw").value;
		//  영문, 숫자, 특수문자 조합으로 8자~20자
		var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&*!])[A-Za-z\d@#$%^&*!]{8,20}$/;

		if (!regex.test(m_pw)) {
			alert("비밀번호는 영문, 숫자, 특수문자 조합으로 8자에서 20자 사이여야 합니다.");
			frm.m_pw.value ="";
			isValid = false;
		}
	}

	// 비밀번 재확인
	function valiPwCk() {
		var m_pw = document.getElementById("m_pw").value;
		var pw_ck = document.getElementById("pw_ck").value;

		if (m_pw !== pw_ck) {
			alert("비밀번호를 다시 확인해주세요.");
			frm.pw_ck.value = "";
			isValid = false;
		}
	}

	// 전화번호 유효성 검사
	function phCk() {
		var m_ph1 = document.getElementById("m_ph1").value;
		var m_ph2 = document.getElementById("m_ph2").value;
		var m_ph3 = document.getElementById("m_ph3").value;

		// 숫자만 
		// ph1 은 010 까지 이므로 3자리까지 허용
		var regex1 = /^(02|010|031|[0-9]{3})$/;
		// ph2, 3은 4자리
		var regex = /^[0-9]{4}$/;

		if (!regex1.test(m_ph1)) {
			alert("전화번호는 숫자로 입력하세요.");
			isValid = false;
		}

		if (!regex.test(m_ph2)) {
			alert("전화번호는 숫자로 입력하세요.");
			isValid = false;
		}

		if (!regex.test(m_ph3)) {
			alert("전화번호는 숫자로 입력하세요.");
			isValid = false;
		}
	}

	// 생년월일 유효성 검사
	function birthCk() {
		var m_birth = document.getElementById("m_birth").value;

		// 6자리 숫자
		var regex = /^[0-9]{6}$/;

		if (!regex.test(m_birth)) {
			alert("생년월일을 6자리 숫자로 입력하세요.");
			isValid = false;
		}

	}

	// 성별란 유효성 검사 
	function genCk() {
		var m_birth1 = document.getElementById("m_birth1").value;
		// 성별 1~4 숫자 1자리
		var regex1 = /^[1-4]{1}$/;

		if (!regex1.test(m_birth1)) {
			alert("성별란을 확인하세요.");
			isValid = false;
		}
	}

	// form 제출 시 각각 input 호출하여 유효성 검사 
	nameCk();
	emailCk();
	pwCk();
	valiPwCk();
	phCk();
	birthCk();
	genCk();
	

	// 폼 제출 여부 결정
    if (!isValid) {
        return false; // 유효성 검사에서 실패한 경우 폼 제출 중단
    }
	
    $("#m_email2").attr("disabled", false);
	
    // 유효성 검사 통과 시  폼 제출
    return true;
	
}

</script>



</head>
<body>

<div class="card -4mb bg-light border-0" style="font-size: 18px;">
<div class="row my-10">
 <!-- col -->
 <div class="offset-lg-1 col-lg-10 col-12">
    <div class="mb-8">
       <!-- heading -->
       <h1 class="h3">DADOK 회원가입</h1>
	       <div class="lead mb-0"  style="font-size: 15px;">
			      원활한 회원가입을 위해 <a href="#!">
	    	   	 본인 명의 휴대전화와 이메일 주소를 올바르게 입력 해주세요.</a>
	       </div>
    </div>
    
    
   <form action="memberJoinAction" method="post" id="frm" onsubmit="return valiForm();">
	 <div class="col-lg-12">
		<div class="input-group mb-1">
				<span style="font-weight: bold;">아이디</span> &nbsp;&nbsp;
				<div style="padding-left: 30px;"></div>
			 <input type="text"  class="form-control rounded-start"   id="m_id" name="m_id" maxlength="13" placeholder="아이디를 입력해주세요" required="required" value="${m_id }">
			  <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="chkId()">중복확인</button> &nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${not empty no}">
					<small class="fs-6" style="color: red;">${no}</small>
				</c:if>
		
				<c:if test="${not empty ok}">
					<small class="fs-6" style="color: red;">${ok}</small>
				</c:if><p>
		</div>
	</div> <span class="text-danger">*</span>
		<mark style="font-size: 13px;">(6자 ~ 12자라의 영문자, 숫자 / @,#,$ 등 특수문자는 제외)</mark><p>



 	<div class="col-lg-6">
		<div class="input-group mb-5 ">
				<span style="font-weight: bold;">이름 </span>&nbsp;&nbsp;
					<div style="padding-left: 48px;"></div>
		 <input type="text" class="form-control rounded" id="m_name" name="m_name" placeholder="이름을 입력해주세요." required="required"><p>

		</div>
	</div>

		
	<div class="col-lg-11">
	    <div class="input-group mb-5">
	        <span style="font-weight: bold;">이메일</span> &nbsp;&nbsp;
	        	<div style="padding-left: 30px;"></div>
	        <input type="text" class="form-control rounded-start" id="m_email1" name="m_email1" required="required">
	        <span class="input-group-text" style="background: #dfe2e1;">@</span>
	        <input type="text" class="form-control rounded-end" id="m_email2" name="m_email2" required="required">
	        &nbsp;
	        <div class="col-lg-3">
	            <select  class="form-select" id="emailSelect" onchange="emailOptionChange();">
	                <option value="naver.com">naver.com</option>
	                <option value="gmail.com">gmail.com</option>
	                <option value="daum.com">daum.com</option>
	                <option value="hanmail.com">hanmail.com</option>
	                <option value="nate.com">nate.com</option>
	                <option value="yahoo.com">yahoo.com</option>
	                <option value="직접 입력" selected="selected">직접 입력</option>
	            </select>
	        </div>
	    </div>
	</div>
	
	
	<div class="col-lg-6">
		<div class="input-group mb-1 ">
				<span style="font-weight: bold;">비밀번호</span> &nbsp;&nbsp;
					<div style="padding-left: 10px;"></div>
		<input type="password" class="form-control rounded" id="m_pw" name="m_pw" placeholder="비밀번호를 입력해주세요"  required="required"><p>

		</div>
	</div>	 <span class="text-danger">*</span>
	<mark style="font-size: 13px;">영문,숫자,특수문자 조합하여 8자~20자리</mark><p>
		
		
	<div class="col-lg-8">
		<div class="input-group mb-5 ">
				<span style="font-weight: bold;">비밀번호 재입력</span>  &nbsp;&nbsp;
				<div style="padding-left: 5px;"></div>
		 <input type="password" class="form-control rounded" id="pw_ck" placeholder="비밀번호를  다시 입력해 주세요"  required="required"><p>
		</div>
	</div>	
		

	 <div class="col-lg-7">
		<div class="input-group mb-5 ">
				<span style="font-weight: bold;">휴대전화</span> &nbsp;&nbsp;
				<div style="padding-left: 10px;"></div>
		<input type="text" class="form-control rounded-start" size="3" maxlength="3" id="m_ph1" name="m_ph1" required="required" value="010"> &nbsp;&nbsp;
		-  &nbsp;&nbsp; <input type="text" class="form-control" size="4" maxlength="4" id="m_ph2" name="m_ph2" required="required">&nbsp;&nbsp;
		-  &nbsp;&nbsp; <input type="text" class="form-control rounded-end" size="4" maxlength="4" id="m_ph3" name="m_ph3" required="required">
		</div>
	</div>		
	
	
	<div class="col-lg-10">
	  <div class="input-group mb-1">
			<span style="font-weight: bold;">생년월일</span> &nbsp;&nbsp;
			    	<div style="padding-left: 10px;"></div>
	    <input type="text" class="form-control rounded" id="m_birth" name="m_birth" maxlength="6" placeholder="ex) 201001"> &nbsp;&nbsp; 
	    -  &nbsp;&nbsp; 
	    	<div class="col-lg-7 d-flex align-items-center">
		      <input type="text" class="form-control" id="m_birth1" name="m_birth1"  maxlength="1" >
		      <input type="text" class="form-control" disabled="disabled" style="background: #c1c7c6; ">
		      <input type="text" class="form-control" disabled="disabled" style="background: #c1c7c6; ">
		      <input type="text" class="form-control" disabled="disabled" style="background: #c1c7c6; ">
		      <input type="text" class="form-control" disabled="disabled" style="background: #c1c7c6; ">
		      <input type="text" class="form-control" disabled="disabled" style="background: #c1c7c6; ">
		      <input type="text" class="form-control" disabled="disabled" style="background: #c1c7c6; ">

	    	</div>
	  </div>
	</div> <span class="text-danger">*</span>
		<mark style="font-size: 13px;">생년월일 6 자리와 앞 1 자리 를 입력하세요</mark><p>
	
	
	<div class="col-lg-8">
		<div class="input-group mb-2 ">
				<span style="font-weight: bold;">주소</span>  &nbsp;&nbsp;
				<div style="padding-left: 48px;"></div>
			<input type="text" class="form-control rounded-start"  name="m_addr1" id="sample6_postcode" placeholder="주소검색 버튼을 이용해주세요" required="required" readonly="readonly" >
				<div class="col-lg-3">
					<input type="button" class="form-control rounded-end"  onclick="sample6_execDaumPostcode()" value="주소 검색" style="background: #d1e7dd;">
				</div>
		</div>
		
		<div class="input-group mb-2 ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div style="padding-left: 48px;"></div>
			<input type="text" class="form-control rounded"  name="m_addr2" id="sample6_address" placeholder="주소" required="required" readonly="readonly">
		</div>	
		
		<div class="input-group mb-5 ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div style="padding-left: 48px;"></div>
			<input type="text" class="form-control rounded" id="sample6_extraAddress" placeholder="참고항목"  readonly="readonly"><p>
		</div>	
		
		
	<div class="col-lg-15">
		<div class="input-group mb-5 ">
				<span style="font-weight: bold;">상세주소</span>  &nbsp;&nbsp;
				<div style="padding-left: 10px;"></div>
		 <input type="text" class="form-control rounded"  name="m_addr" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요"  required="required"><p>
		</div>
	</div>	
		
	
		
	<div class="col-lg-10">
		<div class="input-group mb-1 ">
				<span style="font-weight: bold;">추천인</span>  &nbsp;
				<div style="padding-left: 30px;"></div>
		 <input type="text" class="form-control rounded" id="m_reid" name="m_reid" placeholder="추천인 아이디를 입력해주세요 : 선택 "><p>
		</div>
	</div>	 <span class="text-danger">*</span>
	<mark style="font-size: 13px;">선택 사항입니다</mark><p><p>
	
</div>
<hr>

<c:choose>
	
	<c:when test="${not empty no}">
		<div class="mb-3 d-grid gap-2 col-4 mx-auto ">
		<a class="btn btn-primary" href="loginForm">로그인 하러가기</a>
	</div>
			
	  <div class="mb-2 d-grid gap-1 col-6 mx-auto text-center">
		<strong>가입된 회원입니다. 로그인을 진행해 주세요</strong>
	</div>
	</c:when>
	
	<c:when test="${not empty ok}">
		<div class="btn btn-ghost-primary mb-2 d-grid gap-2 col-6 mx-auto ">
			<button class="btn btn-primary" type="submit">회원 가입하기</button>
		</div>
	</c:when>
	
	<c:otherwise>
		 <div class="mb-2 d-grid gap-1 col-6 mx-auto text-center">
			<strong>ID 중복 확인을 진행해 주세요.</strong>
		</div>
	
	</c:otherwise>
		
</c:choose>

</form>
   
   
 
  </div>
</div>
</div>


<script type="text/javascript">
	// ********* 이메일 처리 *********
	// 이메일 select 요소
	var emailSelect = document.getElementById("emailSelect");
	
	// m_email2 input 요소
	var mEmail2 = document.getElementById("m_email2");
	
	// select 요소의 change 이벤트 핸들러
	emailSelect.addEventListener("change", function() {
	    // 선택된 옵션의 값을 가져옴
	    var selectedOption = emailSelect.value;
	
	    // "직접 입력" 옵션을 선택한 경우 m_email2 입력 필드를 활성화하고 포커스를 설정
	    if (selectedOption === "직접 입력") {
	        mEmail2.removeAttribute("disabled");
	        mEmail2.focus();
	        
	    } else {
	        // 다른 옵션을 선택한 경우 m_email2 입력 필드를 비활성화하고 선택한 옵션 값이 설정됩니다.
	        mEmail2.setAttribute("disabled", "disabled");
		     mEmail2.value = selectedOption;
	    }
	});
	
	
</script>

<script type="text/javascript">
	// ********* 전화번호 처리 *********
	// 각 입력 필드의 최대 길이 지정
	var maxLength = 4;

	// 각 입력 필드의 이벤트 리스너 추가
	document.getElementById("m_ph1").addEventListener("input", function() {
		// this 키워드로 현재객체를 가르킴 
		// 현재 입력필드 값의 길이 > 지정최대값(4) 일때 
		// 현재 입력필드의  값 = 0 부터 지정최대값(4) 
		// 이후 현재 값이 최대값일 때 다음으로 포커스 이동
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
		// 입력이 최대값에 도달하면 두 번째 입력 필드로 포커스를 이동
		if (this.value.length === maxLength) {
			document.getElementById("m_ph2").focus();
		}
	});

	document.getElementById("m_ph2").addEventListener("input", function() {
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
		if (this.value.length === maxLength) {
			document.getElementById("m_ph3").focus();
		}
	});

	document.getElementById("m_ph3").addEventListener("input", function() {
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
	});
</script>




<%@ include file="../common/footerFo.jsp" %>

</body>
</html>