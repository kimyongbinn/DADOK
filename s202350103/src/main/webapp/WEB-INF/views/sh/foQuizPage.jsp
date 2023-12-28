<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz이벤트</title>
<style type="text/css">
	#quiz-div {
		display: flex; 
		justify-content: center;
		position: relative;
	}
	#quiz-image {
		background-image: url(../assets/images/png/sketchbook2.png); 
		height: 450px;
		width: 600px; 
		background-repeat: no-repeat;
		vertical-align: middle;
	}
	#quiz-content{
		position: absolute;
		top: 50%;
		left: 49%;
		width: 50%;
		transform: translate(-50%, -50%);
		font-size : 20px;
		text-align: center;
	}
	label {
		width : 200px;
		font-size : 20px;
	}
</style>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript">
	function checkAnswer(){
		var selected = document.querySelector('input[name="select"]:checked');
	    if (!selected || selected === null) {
	        alert("정답을 선택하세요.");
	        return false;
	    } else{ 
	    		var confirmMessage = "제출 기회는 1번입니다. 제출하시겠습니까?";
	    		if(confirm(confirmMessage)){
	    		var point = '${quiz.q_point}';
				var select = selected.value;
				var answer = $('[name=answer]').val();
				if(select == answer){
					if(${chance} == 0){
						alert("정답입니다. "+point+"포인트 획득하셨습니다.");
						location.href="checkQuiz?m_num="+${m_num}+"&eNum="+${eNum};
						return true;
					}
				} else {
					alert("오답입니다.");
					location.href = "wrongQuiz?m_num="+${m_num}+"&eNum="+${eNum};
					return false;
				}
	    	} else {
	    		return false;
	    	}
		}
	}
</script>
<body>
<div>
	<div class="card-body text-center py-8" style="background-color: #F2F2F2; border-radius: 100px;">
		<h1 class="mb-5" style="text-align: center;">✨${quiz.q_title }✨</h1>
		<div style="text-align: center; color: #0aad0a;">${quiz.q_sdate} ~ ${quiz.q_edate}</div>   
			<div>
			<div id="quiz-div">
				<div id="quiz-image"></div>
				<div id="quiz-content">
					<p>${quiz.q_question }</p>
				</div>
			</div>
			<div class="form-check" style="display: flex; align-items: center; justify-content: center;">
			<form onsubmit="checkAnswer()">
				<input type="hidden" name="m_num" value="${m_num}">
		  		<input type="hidden" name="eNum" value="${eNum}">
				<input type="hidden" name="answer"   value="${quiz.q_answer}">
				<c:choose>
					<c:when test="${chance==0}">
						<div class="d-grid gap-2 d-md-block mt-5">
		                    <input type="radio" class="btn-check" name="select" id="success-outlined1" value="1" autocomplete="off" >
							<label class="btn btn-outline-success" for="success-outlined1" style="font-size : 20px;">${quiz.q_select1}</label>
							
							<input type="radio" class="btn-check" name="select" id="success-outlined2" value="2" autocomplete="off" >
							<label class="btn btn-outline-success" for="success-outlined2" style="font-size : 20px;">${quiz.q_select2}</label>
							
							<input type="radio" class="btn-check" name="select" id="success-outlined3" value="3" autocomplete="off" >
							<label class="btn btn-outline-success" for="success-outlined3" style="font-size : 20px;">${quiz.q_select3}</label>
							
							<input type="radio" class="btn-check" name="select" id="success-outlined4" value="4" autocomplete="off" >
							<label class="btn btn-outline-success" for="success-outlined4" style="font-size : 20px;">${quiz.q_select4}</label>
		                </div>
		                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-8">
						   <button type="submit" class="btn btn-dark mb-2" type="button">정답 제출</button>
						</div>	
					</c:when>
				</c:choose>	
			</form>
			</div>
		</div>
	</div>
</div>
 
 <br>
<hr style="margin-bottom: 50px;">

<div class="card mb-10">
   <div class="card-header">
    <h6 class="card-title">보상안내</h6>
    	<span>[${month}월 출석 이벤트]</span><br>
		<span>정답 시 : ${quiz.q_point }포인트</span><br>
  </div>	

  <div class="card-header">
    <h6 class="card-title">유의사항</h6>
    	<span>[이벤트 기간 안내]</span><br>
		<span>참여 기간 : ${quiz.q_sdate} 00:00 ~${quiz.q_edate} 00:00 </span><br>
		<br>
		<span>[공통 안내]</span><br>
		<span>-본 이벤트는 당사의 사정에 따라 일정 및 내용이 변경될 수 있습니다.</span><br>
		<span>-이벤트 기간 내 ID당 1회 참여 가능합니다.(모바일, PC 중복 응모 불가)</span><br>
		<span>-이벤트 기간 내 정답 제출 기회는 1회 가능합니다.(모바일, PC 중복 불가)</span><br>
		<span>-본 이벤트 혜택은 참여 즉시 자동 지급되며, 최대 1분까지 시간 소요될 수 있습니다.</span><br>
		<span>-포인트는 적립금으로 부여되며, 지급된 이벤트 혜택은 '마이페이지 -> 포인트' 항목에서 확인 가능합니다.</span><br>
		<span>-타인의 명의도용 등 부정한 방법으로 이벤트 참여 시, 지급된 혜택은 회수될 수 있으며 법적 책임이 따를 수 있습니다.</span><br>
  </div>
</div>
	
	
	<script type="text/javascript">

</script>
<%@ include file="../common/footerFo.jsp" %>
</body>
</html>