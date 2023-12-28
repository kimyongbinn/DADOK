<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
      // 아이디 유효성 검사
  	function chkId() {
  		var m_id = document.getElementById("m_id").value;
  		// 정규식 6~12자 + @, #, $ 제외 , 영문자와 숫자 허용
  		var regex = /^[a-zA-Z0-9]{6,12}$/;
  		// 정규표현식 유효성 검사
  		if (!regex.test(m_id)) {
  			alert("아이디는 6자에서 12자 사이의 영문자와 숫자로만 작성해주세요.");
  			frm.m_id.value = "";
  			return false;
  		} 
  	}
</script>
<script type="text/javascript">
	//이름 유효성 검사
	function nameCk() {
		var m_name = document.getElementById("m_name").value;
		// 특수문자 제외, 영문 대소문자,한글
		var regex = /^[a-zA-Z가-힣]+$/;
	
		if (!regex.test(m_name)) {
			alert("이름에는 특수문자가 포함 될 수 없습니다.");
			frm.m_name.value = "";
			return false; 
		}
	}
</script>    	
<script type="text/javascript">
	//이메일 유효성 검사
	function emailCk() {
		 var m_email = document.getElementById("m_email").value;
		 
		if (m_email == ""){
			alert("이메일을 입력해주세요.");
			return false; 
		}
	}
</script>    	
<script type="text/javascript">
	//전화번호 유효성 검사
	function phCon() {
	    var m_ph = document.getElementById("m_ph").value;
	
	    // 하이픈 포함, 다른 특수 문자 또는 공백 허용 안 함
	    var phonePattern = /^\d{2,4}-\d{2,4}-\d{4}$/;
	    if (!phonePattern.test(m_ph)) {
	        alert("유효한 전화번호 형식이 아닙니다. (예: 010-1234-5678)");
	        return false; 
	    }
	}
</script>    	
<script type="text/javascript">
	//생년월일 유효성 검사
	function birthCk() {
		var m_birth = document.getElementById("m_birth").value;
	
		// 6자리 숫자
		var regex = /^[0-9]{6}$/;
	
		if (!regex.test(m_birth)) {
			alert("생년월일을 6자리 숫자로 입력하세요.");
			return false; 
		}
	
	}
</script>
<script type="text/javascript">
	// 주소 유효성 검사
	function addrCon(){
		var m_birth = document.getElementById("m_addr").value;
		
		if(m_birth == ""){
			alert("주소를 입력하세요.");
			return false; 
		}
	}
</script>
<script type="text/javascript">
	//비밀번호 유효성 검사 
	function pwCk() {
		var m_pw = document.getElementById("m_pw").value;
		//  영문, 숫자, 특수문자 조합으로 8자~20자
		var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&*!])[A-Za-z\d@#$%^&*!]{8,20}$/;
	
		if (!regex.test(m_pw)) {
			alert("비밀번호는 영문, 숫자, 특수문자 조합으로 8자에서 20자 사이여야 합니다.");
			frm.m_pw.value ="";
			return false; 
		}
	}
</script>    	

<script type="text/javascript">

	function adminMemberupdate(){
		
		var con = confirm("수정하시겠습니까?");
		
		if(con == true ){
			alert("정상 수정 되었습니다.");
			return true;
		}else{
			return false;
		}
		
	}


</script>

<script type="text/javascript">
	
	function adminMemberDelete(){
		var delcon = confirm("해당 회원을 삭제하시겠습니까?");
		
		if(delcon == true){
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
	
	function boMemberPointUpdate(m_num) {
		var popupW = 720;
		var popupH = 800;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
	
		var url = "boMemberPointUpdate?m_num="+m_num;
        var name = "boMemberPointUpdate";
        
        window.open(url, name, 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')
	}

</script>
</head>
<body>


	
<div class="offset-lg-2 col-lg-8 col-12">

	<div class="mb-8">
         <!-- heading -->
         <h1 class="mb-7">회원 상세</h1>
      </div>
	    <div class="mb-8">
         <!-- heading -->
          <p class="fs-2 mb-3"><strong>${member.m_name} 님 (${member.m_id })</strong> 
          	<c:if test="${member.m_admin == 1}">
          		<span style="color: green; font-size: 18px;"> * 해당 회원은 관리자 입니다.*</span>
          	</c:if>
          </p>
			  <p class="fs-4 mb-5">회원번호 : <mark >${member.m_num}</mark></p>	
			  <p> 가입일 : 
			  <span class="mb-9" style="color: red;">
				 <fmt:formatDate value="${member.m_date }" pattern="yyyy-MM-dd 일  HH 시 ss 분"/>
			  </span>
			  </p>
		  
		  	<c:if test="${member.m_wd == 1}">
			  	<div class="fs-4 mb-5" style="color:#581313; font-size: 16px; font-weight: bold;">
			  	<i class="bi bi-exclamation-triangle"></i>&nbsp;
			    	탈퇴한 회원
			  	</div>
		  	</c:if>

		  	<c:if test="${member.m_wd == 0}">
			  	<div class="fs-4 mb-5" style="color:#581313; font-size: 16px; font-weight: bold;">
			  	<i class="bi bi-check-circle-fill"></i>&nbsp;
			    	활동중인 회원
			  	</div>
		  	</c:if>



      </div>
       
       
          <!-- form -->
          <form class="row" action="adminMemberUpdate" method="post" id="frm" onsubmit="return adminMemberupdate();">
         
          <input type="hidden" name="m_num" id="m_num" value="${member.m_num }">
   	      <input type="hidden" id="m_image" name="m_image" value="${member.m_image }">
   	      <input type="hidden" id="m_admin" name="m_admin" value="${member.m_admin }">
         
          <div class="col-md-12 mb-8 text-center">   
          
           <div class="mb-1">
            <div style="text-align: right;">
           		 <a href="adminMemberDelete?m_num=${member.m_num }" onclick="return adminMemberDelete();">
	            	<i style="font-size: 30px; color: #581313;" class="bi bi-x-circle"></i>
            	</a>
	          </div>
            </div>
           
		  <div class="mb-3">
        	  	<a onclick="memberImageSelect();">
    	            <img src="${member.m_image }" id="memberImage" alt="회원이미지" class="rounded-circle"  style="max-width: 100%; height: auto;">
				</a>
           </div>

            </div>
              <div class="col-md-12 mb-8">
           		 <div class="form-check form-switch">
				   <input class="form-check-input" name="m_wd" type="checkbox" id="flexSwitchCheckDefault" value="1" ${member.m_wd == 1 ? 'checked' : ''}>
		      		  <label class="form-check-label" for="flexSwitchCheckDefault">				  	
				        탈퇴 처리
					  <span class="text-danger">*</span>&nbsp;&nbsp;
					  	<small style="color: red;">해당 회원의 로그인 제한</small>
					  </label>
				</div>
				</div>
             
             
              <!-- input -->
            <div class="col-md-6 mb-3">
              <label class="form-label" for="fname">아이디<span class="text-danger">*</span></label>
              <input type="text" id="m_id" class="form-control" name="m_id" value="${member.m_id }" onblur="chkId();" required="required" readonly="readonly" >
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname">회원 이름<span class="text-danger">*</span></label>
              <input type="text" id="m_name" class="form-control" name="m_name" value="${member.m_name }" onblur="nameCk();" required="required" >
            </div>
            <div class="col-md-6 mb-3">
              <label class="form-label" for="emailContact">이메일<span class="text-danger">*</span></label>
              <input type="email" id="m_email" name="m_email" class="form-control" value="${member.m_email }" onblur="emailCk();" required="required">
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="phone">연락처<span class="text-danger">*</span></label>
              <input type="text" id="m_ph" name="m_ph" class="form-control" value="${member.m_ph }" onblur="phCon();"required="required">
            </div>
            <div class="col-md-12 mb-3">
              <!-- input -->
              <label class="form-label" for="company">주소<span class="text-danger">*</span></label>
              <input type="text" id="m_addr" name="m_addr" class="form-control" value="${member.m_addr }" onblur="addrCon();"required="required">
            </div>
     
            <div class="col-md-6 mb-3">
              <label class="form-label" for="fname">생년월일<span class="text-danger">*</span></label>
              <input type="text" id="m_birth" class="form-control" name="m_birth" value="${member.m_birth }" onblur="birthCk();" required="required">
            </div>
            <div class="col-md-6 mb-3">
              <!-- input -->
              <label class="form-label" for="lname">보유 포인트
              <span class="text-danger">*</span>
              </label><p>
              	 ${member.m_point } <span style="color: red;">P</span>
					&nbsp;&nbsp;<input type="button" class="btn btn-primary mb-2" value="포인트 조정" onclick="boMemberPointUpdate(${member.m_num })">
            </div>
            
              <div class="col-md-12 mb-8">
              <!-- input -->
              <label class="form-label" for="company">PW<span class="text-danger">*</span></label>
              <input type="password" id="m_pw" name="m_pw" class="form-control" value="${member.m_pw }" onblur="pwCk();" required="required">
            </div>
			
			 <div class="col-md-12 mb-1 text-center"> 
				 <div class="d-grid gap-2 d-md-flex justify-content-md-center ">
				   	<button class="btn btn-primary mt-5 mb-2" type="submit" style="margin-right: 10px;">수정하기</button>
				   	<a class="btn mt-5 mb-2 btn-secondary" href="adminMemberList">목록가기</a>
		  		</div>
			</div>
        
         </form>
		
		</div>




</body>
</html>