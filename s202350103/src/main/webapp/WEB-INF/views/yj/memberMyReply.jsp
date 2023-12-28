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
	function myReplyDelete(){
		
		var delcon = confirm("댓글을 삭제 하시겠습니까?");
		
		if(delcon == true){
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

	<h2>내 댓글</h2>
	<div class="mb-8">
		<a href="#">${member.m_id } 님이 작성하신 댓글입니다.</a>
	</div>
	<p>
	
	<c:if test="${empty memberMyReply}">
		 <div class="row">
			<div class="col-lg-12">
			<div class="center-text mt-5 mb-10" >
				작성된 댓글이 없습니다. <p><p>
			    <a href="memberQnaList" class="btn btn-soft-success ">자유게시판</a> 
			</div>
			</div>
		</div>
	</c:if>

<div class="offset-lg-1 col-lg-9 col-12">	

	<c:forEach items="${memberMyReply}" var="reply" varStatus="status">
   <div class="row">
      <div class="col-12">
         <div style="font-weight: bold; font-size: 15px; ">
            <fmt:formatDate value="${reply.mqr_date }" pattern="yy년 MM월 dd일 HH시 ss분"/> 작성
         </div>
         
         <div class="d-flex justify-content-between align-items-center">
            <div></div>
            <div class="mb-2" style="font-weight: bold;">
               <a class="link-success" href="memberQInfo?mq_num=${reply.mq_num }">게시글보기</a>
               <i class="bi bi-arrow-right" style="color: #198754;"></i>
            </div>
            
         </div>
         <div class="accordion mb-6" id="accordionExample">
            <div class="accordion-item">
               <h2 class="accordion-header" id="heading${status.index + 1 }">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse"
                     data-bs-target="#collapse${status.index + 1 }" aria-expanded="false" aria-controls="collapse${status.index + 1 }">
                    <div class="link-info" style="font-size: 16px;">${reply.mq_title }</div>&nbsp;에 작성한 댓글
                  </button>
               </h2>
               <div id="collapse${status.index + 1 }" class="accordion-collapse collapse"
                  aria-labelledby="heading${status.index + 1 }" data-bs-parent="#accordionExample">
                 
                  <div class="accordion-body d-flex justify-content-between align-items-center">
           			
           			<div class="d-flex">
					   <div>
					      <strong style="font-size: 18px;">${reply.mqr_content }</strong>
					   </div>&nbsp;
					   <div>
					      <code><i class="bi bi-hand-thumbs-up-fill"></i>(${reply.mqr_recomen })</code>
					   </div>
					</div>
                     
                     
                     
                  	<div class="dropdown">
                        <a href="#" class="text-reset" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="feather-icon icon-more-vertical fs-5"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                 <button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal${reply.mqr_num }" data-whatever="@mdo">
                                    <i class="bi bi-pencil-square me-3"></i>
                            		        수정
                                </button>
                            </li>
                            
                            <li>
                            <form action="myReplyDelete" method="post" onsubmit="return myReplyDelete();">
                            	<input type="hidden" name="mqr_num" value="${reply.mqr_num }">
                            	<input type="hidden" name="m_num" value="${member.m_num }">
                                <button class="dropdown-item" type="submit" >
                                    <i class="bi bi-trash me-3"></i>
                                 	   삭제
                                </button>
                            
                            </form>
                            </li>
                        </ul>
                    </div>
                     
                     
                     <div class="modal fade" id="exampleModal${reply.mqr_num }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelOne" aria-hidden="true">
							  <div class="modal-dialog" role="document">
						        <form action="myReplyUpdate" method="post">
						        <input type="hidden" name="mqr_num" value="${reply.mqr_num }">
						        <input type="hidden" name="m_num" value="${reply.m_num }">
						        
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabelOne">댓글 수정</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							        </button>
							      </div>
							      <div class="modal-body">
							          <div class="mb-3">
							            <label for="recipient-name" class="col-form-label"><span style="font-weight: bold;">기존 댓글</span></label><p>
							           ${reply.mqr_content }
							          </div>
							          <div class="mb-3">
							            <label for="message-text" class="col-form-label"><span style="font-weight: bold;">수정 내용</span></label>
							            <textarea class="form-control" id="message-text" name="mqr_content"></textarea>
							          </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit"  class="btn btn btn-success">작성 완료</button>
							      </div>
							    </div>
						        </form>
							  </div>
							</div> 
                     
                     
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   
</c:forEach>

	
	</div>


	<%@ include file="../common/footerFo.jsp"%>

</body>
</html>