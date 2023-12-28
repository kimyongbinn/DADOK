<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	$(function)
</script>
<style>
	form {
		width:80%;
	}
	
	th{
		width: 20%;	
		vertical-align: middle;
	}
	
	.title{
		font-size: 25px; 
		font-weight: bold;
	}
	
	.s_title{
		text-align: center;
	}
	
	textarea {
	 width: 80%;
	 height: 150px;
	 
	 
}
	#createQuizForm {
		
		
	}
	
</style>

<div class="offset-lg-2 col-lg-8 col-12">

	<div class="mb-8">
         <!-- heading -->
         <h1 class="mb-10">퀴즈 수정</h1>
      </div>

 <div class="mb-8">
      
      
<div class="mt-7 md-10 justify-content-center">
		<form class="" id="quizForm" action="javascript:void(0)" >
			<table class="table" style="  border: 1px solid #dfe2e1; ">
				
				<tr>		
					<th class="table-active">이벤트 번호</th>
					<td>
					<input class="form-control" type="text" value="${quiz.q_num }" name="q_num" style="width: 300px;" readonly="readonly">
					</td>	
				</tr>
				
				<tr>		
					<th class="table-active">이벤트 이름</th>
					<td><input class="form-control" type="text" value="${quiz.q_title}" name="q_title" style="width: 300px;" required="required"></td>	
				</tr>
				
				<tr>
					<th class="table-active">이벤트 기간</th>	
					<td>
						<div style="display: flex;">
							<input class="form-control" type="date" name="q_sdate" required="required" value="${quiz.q_sdate}"><div class="mt-2">~</div>					
							<input class="form-control" type="date" name="q_edate" required="required" value="${quiz.q_edate}">
						</div>
					</td>
				</tr>
				<tr>
					<th class="table-active">사진 등록</th>
					<td>
					<input type="hidden" name="q_image"   value="${quiz.q_image}" jdbcType="varchar">
					<input class="form-control" type="file" name="file1" style="width: 300px;"></td>
				</tr>
				<tr>
					
					<th class="table-active">포인트</th>
					<td><div style="display: flex;">
					<input class="form-control" type="number" name="q_point" min="1" maxlength="3" 
							value="${quiz.q_point}" required="required"> <div class="mt-2">point</div></div></td>
				</tr>
				<tr>
					<th class="table-active">질문</th>
					<td >
					<textarea name="q_question" required="required" style="border: 1px solid #dfe2e1">${quiz.q_question }</textarea>
					</td>
				</tr>
				<tr>
					<th class="table-active">선택</th>
					<td >
						<table>
							<tr>
								<th class="s_title">1 </th><td>
								<input class="form-control" type="text" name="q_select1" value="${quiz.q_select1}" style="width: 300px;" required="required"></td>
							</tr>
							<tr>
								<th class="s_title">2 </th><td>
								<input class="form-control" type="text" name="q_select2" value="${quiz.q_select2}" style="width: 300px;" required="required"></td>
							</tr>
							<tr>
								<th class="s_title">3 </th><td>
								<input class="form-control" type="text" name="q_select3" value="${quiz.q_select3}" style="width: 300px;" required="required"></td>
							</tr>
							<tr>
								<th class="s_title">4 </th><td>
								<input class="form-control" type="text" name="q_select4" value="${quiz.q_select4}" style="width: 300px;" required="required"></td>
							</tr>
						</table>
					</td>						
				</tr>
				<tr>
					<th scope="row" class="table-active">정답</th>
					<td>
						<select class="w-10 rounded" name="q_answer" required="required" style="width: 45px;height: 35px;text-align: center;padding-left: 0;border: 1px solid #dfe2e1;">
							<option id="select" value="1" ${quiz.q_answer == 1 ? "selected" : "" }>1
							<option id="select" value="2" ${quiz.q_answer == 2 ? "selected" : "" }>2
							<option id="select" value="3" ${quiz.q_answer == 3 ? "selected" : "" }>3
							<option id="select" value="4" ${quiz.q_answer == 4 ? "selected" : "" }>4
						</select>
					</td>
				</tr>
				
			</table>
		
			<div class="d-grid gap-2 d-md-flex justify-content-center" >
				<input type="submit" onclick="updateQuiz()"  class="btn btn-primary mb-2" value="수정" style="margin-right: 10px"> 
				<input type="button"   onclick="deleteQuiz(${quiz.q_num },'${quiz.q_title}')"  class="btn btn-primary mb-2" id="cancleButton"  value="삭제">
			</div>
			</form>
	</div>
	</div>
	</div>
</body>
	
	<script type="text/javascript">
	function updateQuiz(){
		var point = $('input[name=q_point]').val();
		var confirmMessage = "수정하시겠습니까?"
		var quizForm = $("#quizForm");
		var formData = new FormData(quizForm[0]);
		if(confirm(confirmMessage)){
		$.ajax({
			url:"updateQuiz",
			data:formData,
			contentType: false,  // false로 설정
	        processData: false,  // false로 설정
			type : "POST",
			success: function(result){
				if(result == 1){
					if(confirm("수정 성공")){
					}
				}else{
					alert("수정 실패");
					return false;
				}
			},
			error:function(result){
					alert('정보를 잘 못 입력하셨습니다.');
					return false;
			}
		});
	}else{
		alert("수정을 취소하셨습니다.");
		return false;
		}
	}
	
	function deleteQuiz(p_q_num, p_q_title){
		var confirmMessage = p_q_title +"을 삭제하시겠습니까?";
		if(confirm(confirmMessage)){
			$.ajax({
				url:"deleteQuiz",
				data:{q_num:p_q_num},
				dataType:"text",
				success:function(result){
					if(result == 1){
						alert("삭제하였습니다.");
						return "boEventDetail";
					} else {
						alert("참가한 회원이 존재하여 삭제가 불가능합니다.");
						return false;
					}
				}
			});
		} else {
			alert("삭제를 취소하였습니다.");
			return false;
		}
	}
	</script>
</body>
</html>