<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>

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

<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">

$(function() {
	// 선택된 옵션의 값을 가져옴
	var emailSelect = document.getElementById("emailSelect");
	var email2 = $('#m_email2').val();
	var selectedOption = emailSelect.value;
	// "직접 입력" 옵션을 선택한 경우 m_email2 입력 필드를 활성화하고 포커스를 설정
	if (email2 != "naver.com" && email2 != "gmail.com" && email2 != "daum.com" && email2 != "hanmail.com" && email2 != "nate.com" && email2 != "yahoo.com") {
		mEmail2.removeAttribute("disabled");
		
	} else {
		// 다른 옵션을 선택한 경우 m_email2 입력 필드를 비활성화하고 선택한 옵션 값이 설정됩니다.
		 mEmail2.setAttribute("disabled", "disabled");
	     mEmail2.value = selectedOption;
	}
});

function valiForm() {

	var isValid = true;


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



	// form 제출 시 각각 input 호출하여 유효성 검사 
	emailCk();
	phCk();
	
	// 폼 제출 여부 결정
    if (!isValid) {
        return false; // 유효성 검사에서 실패한 경우 폼 제출 중단
    }

	
    $("#m_email2").attr("disabled", false);
	
    // 유효성 검사 통과 시  폼 제출
    var con = confirm("수정하시겠습니까? : 재 로그인 필요");
    
    if(con == true){
    	
    	alert("수정 되었습니다. 다시 로그인 해주세요.");
	    return true;
    }else{
    	return false;
    }
    
	
}

</script>


<script type="text/javascript">
	
	// 회원 이미지 선택 팝업창
	function memberImageSelect() {

		// 화면 중앙 팝업창
		var width = 600;
		var height = 400;
		var left = (window.innerWidth - width) / 2;
		var top = (window.innerHeight - height) / 2;
		
		window.open("memberImageSelect", "이미지 선택", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	}

</script>


<script type="text/javascript">

	// 선택한 이미지로 변경
	function changeImage(imageUrl) {
	    var imageElement = document.getElementById("memberImage"); //  이미지의 ID를 가져옴
	    imageElement.src = imageUrl; // 이미지의 src 속성을 선택한 이미지의 url 로 변경
		
	    // 변경한 이미지 url 을 임시 저장
	    m_image = imageUrl;
	    
	    // input 태그에 이미지 url 노출
	    var inputElement = document.getElementById("m_image");	// input 태그의 ID를 가져옴
	    inputElement.value = m_image; // input 태그의 value 속성에 이미지 url 추가
	}

</script>

</head>
<body>


	<div class="card -4mb bg-light border-0" style="font-size: 18px;">
		<div class="row my-10">
			<!-- col -->
			<div class="offset-lg-1 col-lg-10 col-12">
				<div class="mb-10">
					<!-- heading -->
					<h1 class="h3">개인정보 수정</h1>
					<div class="lead mb-0"  style="font-size: 15px;">
			      	<a href="#!">
	    	   	 	본인 명의 휴대전화와 이메일 주소를 올바르게 입력 해주세요.</a>
	       </div>
				</div>

				<form action="memberUpdate" method="post" id="frm"
					onsubmit="return valiForm();">
					<input type="hidden" name="m_num" value="${member.m_num }">
					<input type="hidden" id="m_image" name="m_image" value="${member.m_image }">
					
					<div class="offset-lg-5">
						<div class="input-group mb-8">
								
								<c:set var="basick" value="../assets/images/memberImage/default2.png"/>
								
						<c:choose>
   							 <c:when test="${member.m_image == basick}">
									<span class="rounded-circle border border-success ">
										<a onclick="memberImageSelect();">
											<img id="memberImage" src="../assets/images/memberImage/basick.jpg" width="120px" height="120px" alt="회원이미지" class="rounded-circle">
										</a>
									</span>
								</c:when>
								
																
  								<c:otherwise>
									<span class="rounded-circle border border-success">
										<a onclick="memberImageSelect();">
											<img id="memberImage" src="${member.m_image }" width="120px" height="120px" alt="회원이미지" class="rounded-circle">
										</a>
									</span>
								</c:otherwise>
								
							</c:choose>	
								
						</div>
					</div>
					
					
					
					<div class="col-lg-4">
						<div class="input-group mb-8">
							<span style="font-weight: bold; ">아이디</span> &nbsp;&nbsp; 
							<div  style="padding-left: 20px;">
							</div>							
							<input type="text" class="form-control"
								id="m_id" name="m_id" 
								 value="${member.m_id }" disabled="disabled" style="border-radius: 10px;">

						</div>
					</div>



					<div class="col-lg-4">
						<div class="input-group mb-8 ">
							<span style="font-weight: bold;">이름</span> &nbsp;&nbsp;&nbsp; 
							<div  style="padding-left: 33px;">
							</div>	
							<input type="text" class="form-control"
								id="m_name" name="m_name" 
								 value="${member.m_name }" disabled="disabled" style="border-radius: 10px;">
							<p>
						</div>
					</div>


					<div class="col-lg-11">
						<div class="input-group mb-8">
							<span style="font-weight: bold;">이메일</span> &nbsp;&nbsp; 
							<div  style="padding-left: 20px;">
							</div>	
								<input type="text" class="form-control rounded-start" id="m_email1" name="m_email1"
								 required="required" value="${splitEmail[0] }"> 
								
								<span class="input-group-text" style="background: #dfe2e1;">@</span> 
								
								<input type="text" class="form-control rounded-end" id="m_email2" name="m_email2"
								required="required" value="${splitEmail[1] }"> &nbsp;
							
							<div class="col-lg-3">
								<select name="m_email_type" class="form-select" id="emailSelect">
									<option value="naver.com" 	
										<c:if test ="${splitEmail[1] eq 'naver.com'}"> selected="selected"</c:if>>naver.com</option>
									<option value="gmail.com" 	
										<c:if test ="${splitEmail[1] eq 'gmail.com'}"> selected="selected"</c:if>>gmail.com</option>
									<option value="daum.com" 	
										<c:if test ="${splitEmail[1] eq 'daum.com'}"> selected="selected"</c:if>>daum.com</option>
									<option value="hanmail.com" 
										<c:if test ="${splitEmail[1] eq 'hanmail.com'}"> selected="selected"</c:if>>hanmail.com</option>
									<option value="nate.com" 	
										<c:if test ="${splitEmail[1] eq 'nate.com'}"> selected="selected"</c:if>>nate.com</option>
									<option value="yahoo.com" 	
										<c:if test ="${splitEmail[1] eq 'yahoo.com'}"> selected="selected"</c:if>>yahoo.com</option>
									<option value="직접 입력" 		
										<c:if test ="${splitEmail[1] ne 'naver.com' and splitEmail[1] ne 'gmail.com' and 
													   splitEmail[1] ne 'daum.com'  and splitEmail[1] ne 'hanmail.com' and
													   splitEmail[1] ne 'nate.com'  and splitEmail[1] ne 'yahoo.com'}"> selected="selected"</c:if>>직접 입력</option>
								</select>
							</div>
						</div>
					</div>


					<div class="col-lg-7">
						<div class="input-group mb-8">
							<span style="font-weight: bold;">휴대전화</span> &nbsp;&nbsp; 
							<div  style="padding-left: 2px;">
							</div>	
							<input type="text" class="form-control"
								size="10" maxlength="3" id="m_ph1" name="m_ph1"
								required="required" value="${splitPh[0]}" style="border-radius: 10px;">  
							&nbsp;&nbsp;
							  -
							&nbsp;&nbsp; 
							<input type="text" class="form-control" size="4"
								maxlength="4" id="m_ph2" name="m_ph2" 
								required="required" value="${splitPh[1]}" style="border-radius: 10px;">
							&nbsp;&nbsp;
							  - 
							&nbsp;&nbsp; 
							<input type="text" class="form-control" size="4"
								maxlength="4" id="m_ph3" name="m_ph3" 
								required="required" value="${splitPh[2] }" style="border-radius: 10px;">
						</div>
					</div>


					<div class="col-lg-13">
						<div class="input-group mb-2">
							<span style="font-weight: bold;">주소 </span>&nbsp;&nbsp; 
							<div  style="padding-left: 40px;">
							</div>	
							
							<input type="text" class="form-control rounded-start"
								name="m_addr1" id="sample6_postcode"
								required="required"
								readonly="readonly" value="${splitAddr[0] }" >
							<div class="col-lg-3" style="padding-right: 70px;">
								<input type="button" class="form-control rounded-end"
									onclick="sample6_execDaumPostcode()" value="주소 변경"
									style="background: #d1e7dd;">
							</div>
						</div>

						<div class="input-group mb-2 ">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<div  style="padding-left: 35px;">
							</div>	
							<input type="text" class="form-control" name="m_addr2"
								id="sample6_address" placeholder="주소" required="required"
								readonly="readonly" value="${splitAddr[1] }" style="border-radius: 10px;">
								
						</div>

						<div class="input-group mb-3 ">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div  style="padding-left: 35px;">
							</div>	
							<input type="text" class="form-control" id="sample6_extraAddress"
								placeholder="참고항목 입니다" readonly="readonly" style="border-radius: 10px;">
						</div>	
							<p>


						<div class="col-lg-15">
							<div class="input-group mb-10 ">
								<span style="font-weight: bold;">상세주소 </span>&nbsp;&nbsp; 
							<div  style="padding-left: 2px;">
							</div>	
								<input type="text" class="form-control"
									name="m_addr" id="sample6_detailAddress"
									 required="required" value="${splitAddr[2] }" style="border-radius: 10px;">
								<p>
							</div>
						</div>
						
						<hr>
						
						<div class="col-lg-15">
							<div class="input-group mb-5 ">
								<a href="memberWithdrawForm" style="font-size: 16px; color: red;" class="">회원 탈퇴 </a>
								<p>
							</div>
						</div>
					</div>
					<hr>
					<a href="memberQna?m_num=${member.m_num }" style="font-size: 16px; color: green;">관리자문의</a>
					<div class="btn btn-ghost-primary mb-2 d-grid gap-2 col-6 mx-auto ">
						<button class="btn btn-primary" type="submit">회원 정보변경</button>
					</div>
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

				mEmail2.value = ""; // 입력 필드 초기화
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
	

	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>
