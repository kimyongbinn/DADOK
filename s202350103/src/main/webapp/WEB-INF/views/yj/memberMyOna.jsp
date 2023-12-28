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
	
	function delCon(){
		
		var delcon = confirm("삭제 하시겠습니까?");
		
		if(delcon == true){
			return true;
		}else{
			return false;
		}
	}

</script>

<script type="text/javascript">

	function updateCon(){
		
		var updateCon = confirm("해당 글을 수정하시겠습니까?");
		
		if(updateCon == true){
			return true;
		}else{
			return false;
		}
	}

</script>

<style type="text/css">
.center-text {
  text-align: center; /* 텍스트 가운데 정렬 */
  position: absolute;
  left: 50%;
  font-weight: bold;
  color:black;
  transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
}

</style>

</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<div class="mb-8">
				<!-- heading -->
				<h2 class="mb-2">내 게시글</h2>
				<p>
					<a href="#">${member.m_id } 님의 작성 목록입니다.</a>
				</p>
			</div>
			
	<c:choose>
		<c:when test="${empty memberMyQnaList}">
			
			 <div class="row">
			<div class="center-text">
				작성한 게시글이 없습니다. 
			</div>
			</div>
			
		</c:when>
		
		<c:otherwise>
						
			<div>
	
				<div class="card-body p-0">
					<!-- table -->
					<div class="table-responsive ">
						<table
							class="table table-centered table-hover mb-0 text-nowrap table-borderless table-with-checkbox">
							<thead class="bg-light">
								<tr>
									<th>작성일</th>
									<th>글유형</th>
									<th>제목</th>
									<th>내용</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="mymq" items="${memberMyQnaList }">
								<form action="myMqUpdate" method="post" id="frm" onsubmit="return updateCon();">
								<input type="hidden" name="m_num" value="${member.m_num }">
								<input type="hidden" name="mq_num" value="${mymq.mq_num}" >
								
									<tr>
										<td><fmt:formatDate value="${mymq.mq_date }"
												pattern="yyyy-MM-dd HH:ss" /></td>
										
										<td>
											<c:if test="${mymq.mq_hidden == 1}">
													<i class="bi bi-lock-fill"></i> 
												<span>비밀글</span>
												
											</c:if>
											
											<c:if test="${mymq.mq_hidden == 0}">
												<span>일반글</span>
											</c:if>
										</td>
										
										<td>
											<input type="text" name="mq_title" class="form-control"  value="${mymq.mq_title }">
										</td>

										<td>
										<textarea rows="3" cols="" name="mq_content" class="form-control">${mymq.mq_content }</textarea>
										</td>

										<td>
											<div class="dropdown">
												<a href="#" class="text-reset" data-bs-toggle="dropdown"
													aria-expanded="false"> <i
													class="feather-icon icon-more-vertical fs-5"></i>
												</a>
												<ul class="dropdown-menu">
													<li>
													<a class="dropdown-item" href="myMqDelete?mq_num=${mymq.mq_num }&m_num=${mymq.m_num}" onclick="return delCon();">
														<i class="bi bi-trash me-3"></i>
														삭제</a></li>
													<li>
														<button  class="dropdown-item"  type="submit" >
														<i class="bi bi-pencil-square me-3 "></i>
														수정</button></li>
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

		</c:otherwise>
			
		</c:choose>
		</div>
	</div>
	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>