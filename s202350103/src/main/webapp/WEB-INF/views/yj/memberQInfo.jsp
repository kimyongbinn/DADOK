<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>
<%@ include file="../common/sideFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript">
	function replyCon(){
		
			alert("로그인 후 이용 가능합니다.");
        }

</script>

<script>
	// 댓글 신고
	  document.addEventListener("DOMContentLoaded", function () {
	    const form = document.getElementById("replyDeclId");
	    const select = form.querySelector("select[name='mqr_decl_val']");
	    const submitButton = form.querySelector("button[type='submit']");
	
	    form.addEventListener("submit", function (event) {
	      if (select.value === "명확한 사유가 있는 경우 신고해주시기 바랍니다. 감사합니다") {
	        event.preventDefault(); // 폼 제출 중지
	        alert("신고 유형을 선택해 주세요.");
	      
	      }else{
	    	  alert("접수가 완료 되었습니다.");
	      }
	      
	    });
	  });
</script>

<script type="text/javascript">
	// 댓글 추천
	function likeReply(mqr_num){
		
		$.ajax({
			type : "POST",
			url : "likeReply",
			data : { mqr_num : mqr_num },
			success : function (response){
				if(response.success){
					var likeCountElemnt = $("#likeCount" + mqr_num);
					var currentCount = parseInt(likeCountElemnt.text());
					likeCountElemnt.text(currentCount + 1);
					
				}else{
					alert("현재 추천을 할 수 없습니다. \n잠시 후 시도 해 주세요.");
				}
			},
			error: function(){
				alert("잠시 후 다시 시도해 주세요.");
			},
		});
	}
	
</script>

</head>
<body>

<c:set value="${memberQInfo }" var="mq"/>
	<div class="card mb-8" style="border-left: none; border-right: none; border-top: none;" >
	  <div class="card-header">
		  <div class="mb-3">
			<span style="color: #024098;">자유게시판</span>
		  </div>	
	
		<div class="mb-3" style="display: flex; align-items: center;">
		    <h2>${mq.mq_title}</h2>
		</div>
		
		<div class="mb-2">
		    <span style="font-size: 15px;">
		        <strong><fmt:formatDate value="${mq.mq_date}" pattern="yyyy 년 MM 월 dd 일 HH:mm"/></strong>
		    </span>
		</div>
	
		<div class="mb-3">
			<img alt="" src="${mq.m_image }" width="35px;" height="35px;" class="rounded-circle"> &nbsp;
		    	
		    	<c:if test="${mq.m_admin == 1 }">
					<span style="font-weight: bold; color: green; font-size: 22px;">DADOK</span>
		    	</c:if>

		    	<c:if test="${mq.m_admin == 0 }">
		    	<span style="font-size: 20px;"> 
			    	<strong>${mq.m_id } <small>(${mq.m_name})</small></strong>
		    	</span>
				</c:if>		    	
		    	
		</div>
	
	  </div>
	</div>	

		<div class="mb-15">
		
		<pre style="font-size: 18px; font-weight: bold;">${mq.mq_content }</pre>
		</div>		

		<div class="mb-8">
			<hr>	 	
		</div>		
	
		<div class="d-grid gap-2 col-3 mx-auto mb-10">
		    <a href="memberQnaList" class="btn btn-primary btn-success">목록</a>
		</div>
		
		<div style="color: #002b63;">
			<i class="bi bi-exclamation-circle"></i> 답변을 등록하시려면 로그인 해주세요.<br>
			<i class="bi bi-exclamation-circle"></i> 개인정보가 포함된 글에 대한 법적 책임은 글쓴이에게 있으니 유의하시기 바랍니다.<br>
			<i class="bi bi-exclamation-circle"></i> 누적 신고 댓글은 <span style="color: red;">자동삭제</span>  됩니다 .
		</div>
		
		
		<div class="mb-5" >
			<hr style="border-color: #c1c7c6;">	 	
		</div>		
		
		
		
		<div class="mb-5" style="display: grid; grid-template-columns: 1fr auto;">
		    <span style="color: #002b63; font-size: 18px; font-weight: bold;" >
				<c:choose>
					<c:when test="${replyCount > 0 }">
				    	답변 
						${replyCount }
					</c:when>

					<c:when test="${replyCount == 0 }">
						작성된 답변이 없습니다.
					</c:when>
					
				</c:choose>
		    
		    </span>
		  
		 <c:if test="${sessionScope.member != null }">   
		    <button class="btn btn-success mb-2"
			   data-bs-toggle="modal" data-bs-target="#exampleModal" data-whatever="@mdo" onclick="onModal();">
			   답변 등록
			 </button>
		 </c:if>  
		    
	    <c:if test="${sessionScope.member == null }">
	    	<a onclick="replyCon();" class="btn btn-success mb-2">답변 등록</a>
		</c:if>
		    
		</div>
		<div class="mb-8" >
			<hr style="border-color: #c1c7c6;">	 	
		</div>		


				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelOne" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
		        <form action="replyInsert" method="post">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabelOne">답변등록</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			        </button>
			      </div>
		      
			      <div class="modal-body">
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">작성자</label><p>
			            <input type="hidden" name="m_num" value="${member.m_num }">
			            <input type="hidden" name="mq_num" value="${mq.mq_num }">
			            <input type="hidden" name="m_num_write" value="${mq.m_num }">
			            
			          	<span style="font-weight: bold;">
				          	${member.m_id } ( ${member.m_name } )
			          	</span>	
			          
			          </div>
			          <div class="mb-3">
			            <label for="message-text" class="col-form-label">답변을 남겨주세요.</label>
			            <textarea class="form-control mb-2" id="message-text" name="mqr_content" required="required"></textarea>
			          
			          <div style="font-weight: bold;">
			          <i class="bi bi-exclamation-circle" style="color: red;"></i>&nbsp;
						<span style="color: #002b63;">비방이나 욕설, 허위사실 등 </span>을  적시 할 경우 <span style="color:#db3030; ">삭제</span> 
						혹은 <span style="color:#db3030; ">법적조치</span> 를 취할 수 있음을 알려드립니다.		          
			          </div>
			          
			          </div>
			      </div>
		      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-success mb-2">등록</button>
			      </div>
		        </form>
		    </div>
		  </div>
		</div> 
			
			
		
		
	<c:forEach items="${mqReplyList }" var="reply">
		<div class="mb-6">
			<img alt="" src="${reply.m_image }" width="30px;" height="30px;" class="rounded-circle"> 
				<c:if test="${reply.m_admin == 0 }">
					&nbsp;${reply.m_id } (${reply.m_name })  &nbsp; |  &nbsp;
					<fmt:formatDate value="${reply.mqr_date }" pattern="yyyy 년 MM 월 dd 일 HH:mm"/>
				</c:if>
	
				<c:if test="${reply.m_admin == 1 }">
					&nbsp;<span style="color: green; font-weight: bold; font-size: 18px;">DADOK</span>  <small>(관리자 답변)</small> &nbsp; |  &nbsp;
					<fmt:formatDate value="${reply.mqr_date }" pattern="yyyy 년 MM 월 dd 일 HH:mm"/>
				</c:if>
		</div>
		
				
			<div style="display: grid; grid-template-columns: 1fr auto;">
				<div class="mb-15">
				<pre style="font-size: 17px; font-weight: bold;">${reply.mqr_content }</pre>
				</div>
				
		<c:choose>
			<c:when test="${sessionScope.member != null }">
			
			<div class="mb-5" style="display: flex; justify-content: flex-end; align-items: flex-end;">
				<c:if test="${reply.m_admin == 0 }">
				
				   <button class="btn btn-soft-success" onclick="likeReply(${reply.mqr_num})">
				 	<i class="bi bi-hand-thumbs-up-fill"></i> &nbsp; 
				    <span id="likeCount${reply.mqr_num}">${reply.mqr_recomen }</span></button>&nbsp;&nbsp; 
		
				    <button class="btn btn-soft-success" data-bs-toggle="modal" data-bs-target="#exampleModalCenter${reply.mqr_num}">
				 	 <i class="bi bi-bell-fill"></i> &nbsp;
					    신고하기
					</button>
				
				</c:if>
			</div>
				
			</c:when>
			
			
		</c:choose>
	
				<div class="modal fade" id="exampleModalCenter${reply.mqr_num}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    
	        		<form action="replyDecl" method="post" id="replyDeclId">
	        			<input type="hidden" name="mqr_num" value="${reply.mqr_num }" >
	        			<input type="hidden" name="mqr_decl" value="${reply.mqr_decl }" >
	        			<input type="hidden" name="m_num" value="${member.m_num }">
	        			
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalCenterTitle">댓글 신고 접수</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					        </button>
					      </div>
					    
					      <div class="modal-body">
					       <label for="message-text" class="col-form-label">신고 유형을 선택 해 주세요.</label><p>
				        		
				        		 <select class="form-select" aria-label="Default select example" name="mqr_decl_val">
								  <option selected disabled>명확한 사유가 있는 경우 신고해주시기 바랍니다. 감사합니다</option>
								  <option value="1">- 불쾌한 표현이 포함되어있습니다. -</option>
								  <option value="2">- 불법 정보를 포함하고 있습니다. -</option>
								  <option value="3">- 지나친 욕설 및 비방 -</option>
								  <option value="4">- 청소년 유해매체 또는 음란물 -</option>
								  <option value="5">- 개인정보 노출 게시물 -</option>
								  <option value="6">- 명예훼손 및 저작권 침해 요소 -</option>
								</select>			        	
					        	
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-success mb-2">접수</button>
					      </div>
					    </div>
		        	</form>
				  </div>
				</div>
				
				
				
				
				
				
			</div>
		
		<hr>		
		
	</c:forEach>

<%@ include file="../common/footerFo.jsp" %>

</body>
</html>