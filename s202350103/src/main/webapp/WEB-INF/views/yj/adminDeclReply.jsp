<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript">
	
	function replyUpdate(){
		
		var replyUpdate = confirm("누적 횟수를 초기화 하시겠습니까?");
		
		if(replyUpdate == true){
			return true;
		}else{
			return false;
		}
	}

</script>

<script type="text/javascript">

	function replyDelete(mqr_num){
		if(confirm("해당 답글을 삭제 하시겠습니까?"))
		  
			$.ajax({
				type: "POST",
				url: "replyDelete",
				data: {mqr_num: mqr_num},
				success : function (response){
					if(response == "success"){
						alert("삭제 되었습니다.");
						location.reload();
					}else{
						alert("잠시 후 다시 시도해주세요.");
					}
				}
			});
			
		        
		 return false;
	}

</script>

</head>
<body>

  <div class="mb-8">
         <!-- heading -->
         <h1 class="mb-1">신고답글</h1>
         <p><strong style="color: #198754;">총 ${declReplyCount } 건 의 신고 접수 답글</strong></p>
			   <span class="text-danger">*</span> 누적 신고 15 회 이상 시 자동 삭제 됩니다
			      <span class="text-danger">*</span>

      </div>
	


<div class="row">
		<div class="col-lg-12">
			<div>
				<div class="card-body p-0">
					<div class="table-responsive ">
						<table
							class="table table-centered table-hover mb-0 text-nowrap table-borderless table-with-checkbox">
							<thead class="bg-light">
								<tr>
									<th>작성일</th>
									<th>신고횟수/유형</th>
									<th>이메일</th>
									<th>작성자</th>
									<th>내용</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reply" items="${adminDeclReply }">
								<form action="replyUpdate" method="post" id="frm" onsubmit="return replyUpdate();">
								<input type="hidden" name="mqr_num" value="${reply.mqr_num}" >
								
									<tr>
										<td><fmt:formatDate value="${reply.mqr_date }"
												pattern="yyyy-MM-dd 일 HH 시 ss 분" /></td>
										
										<td>
										<strong>
											<c:if test="${reply.mqr_decl > 5 }">
												<span style="color: red;">${reply.mqr_decl}</span> 회  접수 (
											</c:if>		
											<c:if test="${reply.mqr_decl < 5 }">
												<span>${reply.mqr_decl}</span> 회  접수 (
											</c:if>	
											<c:choose>
												<c:when test="${reply.mqr_decl_val == 1 }">
													불쾌한 표현										
												</c:when>			
												<c:when test="${reply.mqr_decl_val == 2 }">
													불법 정보										
												</c:when>			
												<c:when test="${reply.mqr_decl_val == 3 }">
													욕설/비방											
												</c:when>			
												<c:when test="${reply.mqr_decl_val == 4 }">
													유해매체/음란물											
												</c:when>			
												<c:when test="${reply.mqr_decl_val == 5 }">
													개인정보 노출											
												</c:when>			
												<c:when test="${reply.mqr_decl_val == 6 }">
													명예훼손/저작권											
												</c:when>			
												<c:otherwise>
													기타 사유
												</c:otherwise>
												
											</c:choose>
										)</strong></td>

										<td>
											${reply.m_email} 
										</td>


										<td>
											${reply.m_id} (${reply.m_name })
										</td>

										<td>
										<textarea readonly="readonly"  rows="3" cols="25" name="mqr_content" class="form-control">${reply.mqr_content}</textarea>
										</td>


										<td>
											<div class="dropdown">
												<a href="#" class="text-reset" data-bs-toggle="dropdown"
													aria-expanded="false"> <i
													class="feather-icon icon-more-vertical fs-5"></i>
												</a>
												<ul class="dropdown-menu">
													<li>
														<button  class="dropdown-item"  type="submit" >
														<i class="bi bi-arrow-repeat me-3"></i>
														초기화</button></li>
													<li>
													<a class="dropdown-item" href="replyDelete" onclick="return replyDelete(${reply.mqr_num});">
														<i class="bi bi-trash me-3"></i>
														삭제</a></li>
												</ul>
											</div>
										</td>

									</tr>
								</form>
								</c:forEach>
							</tbody>
							
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>




</body>
</html>