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
       <h1 class="h3">아이디 찾기</h1>
       <p class="lead mb-0"><a class="">가입 하신 본인명의 전화번호와 이메일 인증을 통하여 계정을 찾으실 수 있습니다.</a>
       </p>
    </div>
    
    <!-- form -->
    <form action="memberFindAc" method="get">
		     <!-- radio-->
		 <div class="form-check"  style="font-size: 18px;">
		   <input class="form-check-input" type="radio" name="auth" value="ph"  checked="checked">
		   <label class="form-check-label">
				 휴대전화로 인증하여 아이디 찾기<span class="text-danger">*</span>
		   </label>
		 </div>
		 
			<hr>
			<p><p><p><p><p>	
			
		 <div class="form-check" style="font-size: 18px;">
		   <input class="form-check-input" type="radio" name="auth" value="email" >
		   <label class="form-check-label" >
				 이메일로 인증하여 아이디 찾기<span class="text-danger">*</span>
		   </label>
		 </div>
		 
			 <p><p><p><p><p>	<p><p><p><p><p>
		 
		 <div class="d-grid gap-2 col-6 mx-auto">
		  <button class="btn btn-primary" type="submit">다음</button>
		</div>
		 
		 
    </form>
  </div>
</div>



<%@ include file="../common/footerFo.jsp"%>

</body>
</html>