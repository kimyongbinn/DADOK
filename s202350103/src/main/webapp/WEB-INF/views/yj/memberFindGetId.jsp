<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp"%>
<%@ include file="../common/sideFo.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>


	<div class="card -4mb bg-light border-0" style="font-size: 18px;">
		<div class="row my-10">
			<!-- col -->
			<div class="offset-lg-1 col-lg-10 col-12">
				<div class="mb-10">
					<!-- heading -->
					<h1 class="h4">입력한 정보로 가입된 ${member.m_name } 님의 계정 입니다.</h1>
					<div class="lead mb-0"  style="font-size: 15px;">
					<hr>
	       </div>
				</div>


				<form action="memberPwChangeForm" method="post">
					<input type="hidden" name="m_num" value="${member.m_num }" id="m_num">
					<div class="col-lg-4">
						<div class="input-group mb-8">
							아이디 &nbsp;&nbsp; 
							<p class="fw-bold">${member.m_id }</p>
						</div>
					</div>

					<div class="col-lg-11">
						<div class="input-group mb-8">
							이메일 &nbsp;&nbsp; 
							<p class="fw-bold">${member.m_email }</p>
						</div>
					</div>


					<div class="col-lg-7">
						<div class="input-group mb-8">
							휴대전화 &nbsp;&nbsp; 
							<p class="fw-bold">${member.m_ph }</p>

						</div>
					</div>
					
					<div class="col-lg-7">
						<div class="input-group mb-8">
							가입일  &nbsp;&nbsp; 
							<p class="fw-bold">${formatM_date }</p>

						</div>
					</div>
					
					
					<div class="col-lg-7">
						<div class="input-group mb-8">
							비밀번호 &nbsp;&nbsp; 
							<button type="submit" class="btn btn-primary">
								비밀번호 변경
							</button>					
						</div>
					</div>

					<hr>

					<div class="btn btn-ghost-primary mb-2 d-grid gap-2 col-6 mx-auto ">
						<button class="btn btn-primary" type="button" onclick="location.href='loginForm'">로그인</button>
					</div>
				</form>



			</div>
		</div>
	</div>


<%@ include file="../common/footerFo.jsp"%>
	
</body>
</html>