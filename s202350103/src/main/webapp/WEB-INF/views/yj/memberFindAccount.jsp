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

	function findMemberId(){
	
	location.href="memberFrinId";
	}
	

	
	function findMemberPw(){
		
	location.href="memberFindPwForm";
	}


</script>

</head>
<body>
	
<div class="row my-10">
 <!-- col -->
 <div class="offset-lg-1 col-lg-10 col-12">
    <div class="mb-8">
       <!-- heading -->
       <h1 class="h3">계정 찾기</h1>
       <p class="lead mb-0"><a class="">가입 하신 본인명의 전화번호와 이메일 인증을 통하여 계정을 찾으실 수 있습니다.</a>
       </p>
    </div>
    
    <!-- form -->
    <form class="row">
       <!-- input -->
       <div class="col-md-10 mb-3">
          <!-- input -->
          <label class="form-label" >아이디 찾기<span class="text-danger">*</span></label>
				<div class="d-grid gap-2  mx-auto">
				  <button class="btn btn-primary" type="button" onclick="findMemberId()">본인명의 인증으로 아이디 찾기</button>
				</div>

       </div>
       <div class="col-md-10 mb-3">
          <!-- input -->
          <label class="form-label" > 비밀번호 변경<span class="text-danger">*</span></label>
				<div class="d-grid gap-2  mx-auto">
				  <button class="btn btn-primary" type="button" onclick="findMemberPw()">본인명의 인증으로 비밀번호 변경</button>
				</div>

       </div>
    </form>
  </div>
</div>



<%@ include file="../common/footerFo.jsp"%>

</body>
</html>