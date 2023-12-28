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
<style>
  .small-input {
    width: 100px;        
  }
  th{
	width: 20%;	
	vertical-align: middle;
	}
</style>
<body>
<div class="offset-lg-2 col-lg-8 col-12">

	<div class="mb-8">
         <!-- heading -->
         <h1 class="mb-10">출석체크 수정</h1>
      </div>

 <div class="mb-8">
<div class="mt-7 md-10 justify-content-center">
<form id="attendanceForm" >
	<table class="table" style="  border: 1px solid #dfe2e1; ">
		<tr>
			<th scope="col" class="table-active">이벤트 번호  :</th>
			<td>
				<input type="text"   name="a_num"     value="${attendance.a_num}"  style="width: 300px;"  readonly="readonly" class="form-control ">
			</td>
		</tr>
		<tr>
		
		<tr>
			<th scope="col" class="table-active">이벤트 이름</th>
			<td><input class="form-control" type="text"   value="${attendance.a_title}"  name="a_title" style="width: 300px;" required="required"></td>	
		</tr>
		<tr>
			<th scope="col" class="table-active">이벤트 기간</th>
			<td>
				<div style="display: flex;">
					<input class="form-control" type="date" name="a_sdate"  value="${attendance.a_sdate}"  id="a_sdate" required="required" style="width: 22%; margin-right: 5px;"><div class="mt-2">~</div>					
					<input class="form-control" type="date" name="a_edate"  value="${attendance.a_edate}"  id="a_edate" required="required" style="width: 22%; margin-left: 5px;" readonly="readonly">
				</div>
			</td>
		</tr>
		<script>
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
		
		
		<tr>	
			<th scope="col" class="table-active">사진 등록</th>
			<td>
			<input type="hidden" name="a_image"   value="${attendance.a_image}" jdbcType="varchar">
			<input class="form-control" type="file" name="file1" required="required" style="width: 300px;">
			</td>		
		</tr>
		<tr>
			<th scope="row" class="table-active">출석 관리</th>
			<td>
				<table>
				<tr>
	              <th>포인트</th>
	               <td>
	               		<div style="display: flex;">
	        <input class="form-control" type="text" name="a_point" min="1" pattern="\d*" maxlength="3" value="${attendance.a_point}" required="required"> <div class="mt-2">point</div></div>
			
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
		           	  <td><div style="display: flex;">
		           	  <input class="form-control" type="text" name="a_add" min="1" maxlength="1" 
														value="${attendance.a_add}"    style="width: 80px; margin-right: 5px;" required="required"> <div class="mt-2">일 연속 출석 시</div></div></td>
		            </tr>
		            <tr>
		              <th>포인트</th>
		              <td><div style="display: flex;"><input class="form-control" pattern="\d*"  type="text" name="a_addpoint" min="1" maxlength="5" 
										value="${attendance.a_addpoint}" style="width: 80px; margin-right: 5px;" required="required"> <div class="mt-2">point</div></div></td>           
		            </tr>
		        </table>
	        </td>
		</tr>
	</table>
	<div class="d-grid gap-2 d-md-flex justify-content-center" >
		<input type="button"  onclick="updateAtt()" class="btn btn-primary mb-2" value="수정" style="margin-right: 10px"> 
		<input type="button"  class="btn btn-primary mb-2" id="cancleButton"  value="삭제" onclick="deleteAtt(${attendance.a_num },'${attendance.a_title}')" >
	</div>
</form>
</div>
</div>
</div>
	
	
 
<script type="text/javascript">
 function updateAtt() {
	 	var confirmMessage = "수정 하시겠습니까?";
	    var attendanceForm = $("#attendanceForm");
	    var formData = new FormData(attendanceForm[0]);
		if(confirm(confirmMessage)){
	    $.ajax({
	        url: "updateAttendance",
	        data: formData,
	        contentType: false,  // false로 설정
	        processData: false,  // false로 설정
	        type: "POST",
	        success: function (result) {
	            if (result == 1) {
	                if (confirm("수정 성공")) {
	                }
	            } else {
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
	
	function deleteAtt(p_a_num, p_a_title){
		var confirmMessage = p_a_title +"을 삭제하시겠습니까?";
		if(confirm(confirmMessage)){
			$.ajax({
				url:"deleteAtt",
				data:{a_num:p_a_num},
				dataType:"text",
				success:function(result){
					if(result == 1){
						alert("삭제하였습니다.");
						opener.parent.location.reload();
						window.close();
					} else {
						alert("삭제가 불가능한 상태입니다.")
					}
				}
			});
		} else {
			alert("삭제를 취소하였습니다.");
			return false;
			}
		}
 
 	var closeButton = document.getElementById("closeButton");
	closeButton.addEventListener('click',function(){
		window.close();
	});
</script>
</body>
</html>