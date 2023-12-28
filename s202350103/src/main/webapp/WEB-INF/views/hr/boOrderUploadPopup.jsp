<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.top {
	                position: relative;
	                display: flex; 
	                justify-content: space-between;
	                padding: 0.5rem 1.4rem;
	                background-color: #3CB371;
	                vertical-align: middle;
	            }
	            
	     h1.infoTit {
	     				margin-top : 10px;
	                    font-size: 20px; 
	                    color:#ffffff;
	                }
	     .textBox {
	     				margin-left: 5%;
	     				margin-right: 5%;
	     			 }
	</style>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		// 매 load마다 수행되는 function
		// 최초 load
		// 주문목록의 '수기 주문 업로드' 버튼과 'boOrderUploadPopup' 컨트롤러를 타고 들어옴
		// 따라서 result 값이 없으므로 아무런 alert이 뜨지 않음
		
		// 이후 load
		// 이 페이지의 '업로드하기' submit 버튼과 'boOrderUploadAction' 컨트롤러를 타고 들어옴
		// 따라서 result 값에 성공여부가 저장되어 있고 alert을 띄울 수 있음
		
		$(function() {
			var result = '${result}';
			// alert("result -> "+result);
			
			if(result == 1) {
				alert("성공적으로 주문을 업로드했습니다!");
				window.close();
			} else if (result == 2) {
				alert("주문 업로드에 실패했습니다. \n확인 후 재시도해주세요.");
			}
		})
	
	</script>

</head>
<body>
   <div class="mb-6">
		<header class="top">
			<h1 class="infoTit">
				수기 주문 업로드
			</h1>
		</header>
   </div>
<main class="textBox">
   <div>
      <!-- heading -->
      <div class="row">
         <div class="mb-3">
            <!-- form -->
            <form name="frm" action="boOrderUploadAction" method="post" enctype="multipart/form-data">
	        	<!-- 파일 선택 -->
	        	<div class="input-group">
	        		<input type="file" name="csvFile" id="img_select" class="form-control mt-3" aria-label="Upload" required="required">
	        	</div><p><p>
	        	
	        	<span class="text-danger">
	        		* 반드시 CSV 형식의 파일을 업로드해주시길 바랍니다. <br>
	        		* 콤마(,)없이 작성 및 업로드해주시길 바랍니다. <br>
	        		* 주문번호 1건 당 상품 1건만 업로드 가능합니다.
	        	</span><p><p><p>
	        	
	        	<!-- 업로드하기 -->
	        	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	        		<button class="btn btn-dark mb-2" type="submit">업로드하기</button>
	        	</div>
	        </form>
         </div>
      </div>
   </div>
</main>
</body>
</html>