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
	function checkDate(){
		//alert("테스트");
		var curDate = new Date();
		var curDate1 = curDate.getFullYear()+"-"+(curDate.getMonth()+1)+"-"+curDate.getDate();
		//alert(curDate1);
		var sdate = $('input[name=a_sdate]').val();
		var edate = $('input[name=a_edate]').val();
		//alert("sdate->"+sdate);
		//alert("edate->"+edate);
		if(sdate>edate){
			alert("이벤트 기간 설정을 잘 못 되었습니다.");
			return false;
		} else if(curDate1>sdate&&curDate1<=edate){
			alert("이벤트 기간은 현재일자 이후로만 설정 가능합니다.");
			return false;
		} else if(curDate1 >= edate){
			alert("기간이 종료된 이벤트는 생성하실 수 없습니다.");
			return false;
		} else if(curDate1 < edate){
			document.forms["createAttForm"].action;
			return true;
		} else {
			alert("오류 발생");
			return false;
		}
	}
</script>
<style>
	.title{
		font-size: 25px; 
		font-weight: bold;
	}
	th{
		width: 20%;	
		vertical-align: middle;
		text-align: center;
	}
	
</style>
<body>

<div class="offset-lg-2 col-lg-8 col-12">

	<div class="mb-8">
         <!-- heading -->
         <h1 class="mb-10">출석체크 등록</h1>
      </div>

 <div class="mb-8">
<div class="mt-7 md-10 justify-content-center">
<form id="createAttForm" action="createAtt" onsubmit="return checkDate()" method="post" enctype="multipart/form-data">
	<table class="table" style="  border: 1px solid #dfe2e1; ">
		<tr>
			<th scope="col" class="table-active">이벤트 이름</th>
			<td><input class="form-control" type="text" name="a_title" style="width: 300px;" required="required"></td>	
		</tr>
		<tr>
			<th scope="col" class="table-active">이벤트 기간</th>
			<td>
				<div style="display: flex;">
					<input class="form-control" type="date" name="a_sdate" id="a_sdate" required="required" style="width: 22%; margin-right: 5px;"><div class="mt-2">~</div>					
					<input class="form-control" type="date" name="a_edate" id="a_edate" required="required" style="width: 22%; margin-left: 5px;" readonly="readonly">
				</div>
			</td>
		</tr>
		<tr>	
			<th scope="col" class="table-active">사진 등록</th>
			<td><input class="form-control" type="file" name="file1" required="required" style="width: 300px;"></td>		
		</tr>
		<tr>
			<th scope="row" class="table-active">출석 관리</th>
			<td>
				<table style="text-align: center;">
				<tr>
	              <th>포인트</th>
	               <td>
	               		<div style="display: flex;"><input class="form-control" type="number" name="a_point" 
														   style="width: 80px; margin-right: 5px;" required="required"> <div class="mt-2">point</div></div>
					</td>        
	            </tr>
	        	</table>
	        </td>
		</tr>
		<tr>
			<th scope="row" class="table-active">연속 출석</th>
			<td>
				<table>
					<tr>
		              <th>조건</th>
		           	  <td><div style="display: flex;"><input class="form-control" type="number" name="a_add" min="1" maxlength="1" 
														   style="width: 80px; margin-right: 5px;" required="required"> <div class="mt-2">일 연속 출석 시</div></div></td>
		            </tr>
		            <tr>
		              <th>포인트</th>
		              <td><div style="display: flex;"><input class="form-control" type="number" name="a_addpoint" min="1" maxlength="5" 
														     style="width: 80px; margin-right: 5px;" required="required"> <div class="mt-2">point</div></div></td>           
		            </tr>
		        </table>
	        </td>
		</tr>
	</table>
	<div class="d-grid gap-2 d-md-flex justify-content-center" >
		<input type="submit" class="btn btn-primary mb-2" value="등록하기" style="margin-right: 10px"> 
		<input type="button"  class="btn btn-secondary mb-2" id="cancleButton"  value="목록가기">
	</div>
</form>
</div>
</div>
</div>

<script type="text/javascript">
	var cancleButton = document.getElementById("cancleButton");
	cancleButton.addEventListener('click',function(){
		location.href='mainBo';
	});
	
	//시작일 설정시 a_edate에 해당 월 마지막 날 입력
	 $(document).ready(function() {
		    $('#a_sdate').on('change', function() {
		      // 시작일을 선택하면 종료일이 해당 달의 마지막 날짜로 자동 설정됩니다.
		      const startDate = new Date($(this).val());
		      const lastDay = new Date(startDate.getFullYear(), startDate.getMonth() + 1, 1);
		      const formattedLastDay = lastDay.toISOString().split('T')[0];
		      
		      console.log('formattedLastDay:', formattedLastDay);
		      
		      $('#a_edate').val(formattedLastDay);
		    });
		    	
		  });
</script>
</body>
</html>