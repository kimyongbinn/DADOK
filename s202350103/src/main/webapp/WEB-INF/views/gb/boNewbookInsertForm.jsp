<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript">
	// 동적 셀렉트 함수 (국내, 해외에 맞는 카테고리 나오도록)
	function category1Change() {
		var incategory2 = ['경제/경영','과학','소설','역사/문화','인문'];
		var outcategory2 = ['과학/기술','문학'];
		var category1 = $('#category1').val();
		var category2;
		var HTML = "";
		
		if(category1 == 1){
			category2 = incategory2;
		}else{
			category2 = outcategory2;
		}
		
		$('#category2').empty();
		HTML += "<select name='nb_category2' class='form-select' aria-label='Default select example'>";
		for (var i=1; i<=category2.length; i++){
			HTML += "<option value="+i+">"+category2[i-1]+"</option>";
		}
		HTML += "</select>";
		$('#category2').append(HTML);
	}
	
	// 이미지 파일 변경 시 화면에도 자동으로 변경 (preview)
	function setImageFromFile(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){
				$('#preview').attr('src', e.target.result);
			};
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function chk() {
		if(isNaN(frm.nb_price.value)){
			alert("도서 가격에 숫자만 입력해주세요.");
			frm.nb_price.focus;
			frm.nb_price.value="";	// 입력한 글자 지우기
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
	<form action="insertBoNewbook" name="frm" method="post" enctype="multipart/form-data" onsubmit="return chk()" style="margin-left: 10%; margin-right: 10%;">
		<div class="row">
		  <div class="mb-8">
	         <!-- heading -->
	         <h1 class="mb-1">상품 등록</h1>
	      </div>
		  <div class="col-md-6 row justify-content-center">
			<!-- 도서 이미지 -->
			 <div class="product" id="product" style="width: 20rem;">
			 	<div class="product" id="product" style="width: 20rem;">
			    	<div>
	                   	<img id="preview" alt="${newbook.nb_title}" style="border: 1px solid black; width: 18rem; height: 400px;">
			    	</div>
			 </div>
			 <!-- 파일 선택 -->
			 <div class="input-group">
	    		<input type="file" name="file1" id="img_select" onchange="setImageFromFile(this);" class="form-control mt-3" aria-label="Upload" required="required">
	  		 </div>
		  </div>
		 </div>
	
		
		<!-- 도서 간략 정보 -->
		 <div class="col-md-5">
			 <div class="ps-lg-3 mt-6 mt-md-0 ">
			    <!-- 카테고리 -->
			    <div class="d-flex mt-2 mt-lg-0 mb-3">
	             <div class="me-2 flex-grow">
	               <!-- 카테고리1 검색 -->
	                <select id="category1" name="nb_category1" class="form-select" aria-label="Default select example" onchange="category1Change()" required="required">
	                   <option value=1>국내도서</option>
	                   <option value=2>해외도서</option>
	     			</select>
	             </div>
	             <span class="me-2"> > </span>
	             <div id="category2">
		                <select name="nb_category2" class="form-select" aria-label="Default select example" required="required">
		                   <option value=1 >경제/경영</option>
		                   <option value=2 >과학</option>
		                   <option value=3 >소설</option>
		                   <option value=4 >역사/문화</option>
		                   <option value=5 >인문</option>
		     			</select>
	             </div>
	          </div>
			    <!-- 도서제목 -->
			    <div class="mb-3">
	                  <span class="form-label">제목 : </span> 
	                  <input type="text" name="nb_title" class="form-control" required="required">
	            </div>
	            <!-- 도서가격 -->
			    <div class="mb-3">
	                  <span class="form-label">가격 : </span> 
	                  <input type="number" id="nb_price" name="nb_price" class="form-control" required="required">
	            </div>
	            <!-- 지은이 -->
			    <div class="mb-3">
	                  <span class="form-label">지은이 : </span> 
	                  <input type="text" name="nb_writer" class="form-control" required="required">
	            </div>
			    <!-- 출판사 -->
			    <div class="mb-3">
	                  <span class="form-label">출판사 : </span>
	                  <input type="text" name="nb_publisher" class="form-control" required="required">
	            </div>
	            <!-- 출간일 -->
			    <div class="mb-3">
	                  <span class="form-label">출간일 : </span>
	                  <input type="date" name="nb_publi_date" class="form-control" required="required">
	            </div>
	          </div>
			</div>
		</div>
			    
	    <!-- 도서 간략 내용 -->
	    <div>
	      <div class="row justify-content-center">
	        <div class="col-md-10 mt-5">
	          <!-- 탭 메뉴들 -->
	          <ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
	            <!-- 도서 상세 내용 탭 버튼 -->
	            <li class="nav-item" role="presentation">
	              <!-- btn --> <button class="nav-link active" id="product-tab" data-bs-toggle="tab"
	                data-bs-target="#product-tab-pane" type="button" role="tab" aria-controls="product-tab-pane"
	                aria-selected="true">상세 정보</button>
	            </li>
	          </ul>
	          <!-- 탭 상세 내용들 -->
	          <div class="tab-content" id="myTabContent">
	            <!-- 도서 상세 내용 -->
	            <div class="tab-pane fade show active" id="product-tab-pane" role="tabpanel" aria-labelledby="product-tab"
	              tabindex="0">
	              <div class="my-8">
	                <div class="mb-5">
	                  <h3 class="mb-3">줄거리</h3>
	                  <textarea class="mb-0 fs-5" name="nb_summary" style="width: 100%; height: 400px;" required="required"></textarea>
	                </div>
	                
	                <div class="mb-5">
	                  <h3 class="mb-3">기본정보</h3>
	                   <table class="table fs-6" style="width: 25rem;">
					     <tr>
					       <th class="table-light text-center">ISBN</th>
					       <td><input type="text" name="nb_isbn" class="form-control" required="required"></td>
					     </tr>
						 <tr>
					       <th class="table-light text-center">쪽수</th>
					       <td><input type="number" name="nb_page" class="form-control" required="required"></td>
					     </tr>
					     <tr>
					       <th class="table-light text-center">크기</th>
					       <td><input type="text" name="nb_size" class="form-control" required="required"></td>
					     </tr>  
					   </table>
	                </div>
	              </div>
	            </div>
			 </div>
		  </div>
		 </div>
	  </div>
	  <div class="d-grid gap-2 d-md-flex justify-content-md-center" style="border-top: 1px solid gray; margin-right: 10%;">
	   	<button class="btn btn-primary mt-5 mb-2" type="submit" style="margin-right: 10px;">등록하기</button>
	   	<button class="btn btn-secondary mt-5 mb-2" type="button" onclick="location.href='bonewbookList'">목록가기</button>
	  </div>
	 </form>
</body>
</html>