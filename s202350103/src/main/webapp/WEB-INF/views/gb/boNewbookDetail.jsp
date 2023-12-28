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
	
</script>
</head>
<body>
	<form action="updateNewbook" method="post" enctype="multipart/form-data" style="margin-left: 10%; margin-right: 10%;">
		<div class="row">
		  <div class="mb-8">
	         <!-- heading -->
	         <h1 class="mb-1">상품 상세</h1>
	      </div>
		  <div class="col-md-6 row justify-content-center">
			<!-- 도서 이미지 -->
			 <div class="product" id="product" style="width: 20rem;">
			 	<div class="product" id="product" style="width: 20rem;">
			    	<div>
			    	   <c:set var="nb_image" value="${newbook.nb_image }"/>
	                   <c:choose>
	                   	<c:when test="${fn:contains(nb_image, 'http')}">
	                   		<img id="preview" src="${newbook.nb_image}" alt="${newbook.nb_title}" style="border: 1px solid black; width: 18rem; height: 400px;">
	                   	</c:when>
	                   	<c:otherwise>
	                   		<img id="preview" src="${pageContext.request.contextPath}/upload/${newbook.nb_image}" alt="${newbook.nb_title}" style="border: 1px solid black; width: 18rem; height: 400px;">
	                   	</c:otherwise>
	                   </c:choose>
			    	</div>
			 </div>
			 <!-- 파일 선택 -->
			 <div class="input-group">
	    		<input type="file" name="file1" id="img_select" onchange="setImageFromFile(this);" class="form-control mt-3" aria-label="Upload">
	  		 </div>
		  </div>
		 </div>
	
		
		<!-- 도서 간략 정보 -->
		 <div class="col-md-5">
			 <div class="ps-lg-3 mt-6 mt-md-0 ">
			 <input type="hidden" name="nb_num" value="${newbook.nb_num }">
			    <!-- 카테고리 -->
			    <div class="d-flex mt-2 mt-lg-0 mb-3">
	             <div class="me-2 flex-grow">
	               <!-- 카테고리1 검색 -->
	                <select id="category1" name="nb_category1" class="form-select" aria-label="Default select example" onchange="category1Change()" required="required">
	                   <option value=1 <c:if test ="${newbook.nb_category1 eq '1'}"> selected="selected"</c:if>>국내도서</option>
	                   <option value=2 <c:if test ="${newbook.nb_category1 eq '2'}"> selected="selected"</c:if>>해외도서</option>
	     			</select>
	             </div>
	             <span class="me-2"> > </span>
	             <div id="category2">
	                <!-- 카테고리2 -->
	                <c:if test="${newbook.nb_category1 eq 1 }">
		                <select name="nb_category2" class="form-select" aria-label="Default select example" required="required">
		                   <option value=1 <c:if test ="${newbook.nb_category2 eq '1'}"> selected="selected"</c:if>>경제/경영</option>
		                   <option value=2 <c:if test ="${newbook.nb_category2 eq '2'}"> selected="selected"</c:if>>과학</option>
		                   <option value=3 <c:if test ="${newbook.nb_category2 eq '3'}"> selected="selected"</c:if>>소설</option>
		                   <option value=4 <c:if test ="${newbook.nb_category2 eq '4'}"> selected="selected"</c:if>>역사/문화</option>
		                   <option value=5 <c:if test ="${newbook.nb_category2 eq '5'}"> selected="selected"</c:if>>인문</option>
		     			</select>
	     			</c:if>
	     			<c:if test="${newbook.nb_category1 eq 2 }">
		                <select name="nb_category2" class="form-select" aria-label="Default select example" required="required">
		                   <option value=6 <c:if test ="${newbook.nb_category2 eq '6'}"> selected="selected"</c:if>>과학/기술</option>
		                   <option value=7 <c:if test ="${newbook.nb_category2 eq '7'}"> selected="selected"</c:if>>문학</option>
		     			</select>
	     			</c:if>
	             </div>
	          </div>
	          	<!-- 상품번호 -->
	          	<div class="mb-3">
	          		  <span class="form-label">상품번호 : </span>
	                  <input type="text" name="nb_num1" value="${newbook.nb_num }" class="form-control" disabled="disabled">
	            </div>
			    <!-- 도서제목 -->
			    <div class="mb-3">
	                  <span class="form-label">제목 : </span>
	                  <input type="text" name="nb_title" value="${newbook.nb_title}" class="form-control" required="required">
	            </div>
	            <!-- 도서가격 -->
			    <div class="mb-3">
	                  <span class="form-label">가격 : </span>
	                  <input type="number" name="nb_price" value="${newbook.nb_price}" class="form-control" required="required">
	            </div>
	            <!-- 지은이 -->
			    <div class="mb-3">
	                  <span class="form-label">지은이 : </span>
	                  <input type="text" name="nb_writer" value="${newbook.nb_writer}" class="form-control" required="required">
	            </div>
			    <!-- 출판사 -->
			    <div class="mb-3">
	                  <span class="form-label">출판사 : </span>
	                  <input type="text" name="nb_publisher" value="${newbook.nb_publisher}" class="form-control" required="required">
	            </div>
	            <!-- 출간일 -->
			    <div class="mb-3">
	                  <span class="form-label">출간일 : </span>
	                  <input type="date" name="nb_publi_date" value="${newbook.nb_publi_date}" class="form-control" required="required">
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
	                  <textarea class="mb-0 fs-5" name="nb_summary" style="width: 100%; height: 400px;" required="required">${newbook.nb_summary }</textarea>
	                </div>
	                
	                <div class="mb-5">
	                  <h3 class="mb-3">기본정보</h3>
	                   <table class="table fs-6" style="width: 25rem;">
					     <tr>
					       <th class="table-light text-center">ISBN</th>
					       <td><input type="text" name="nb_isbn" value="${newbook.nb_isbn}" class="form-control" required="required"></td>
					     </tr>
						 <tr>
					       <th class="table-light text-center">쪽수</th>
					       <td><input type="number" name="nb_page" value="${newbook.nb_page}" class="form-control" required="required"></td>
					     </tr>
					     <tr>
					       <th class="table-light text-center">크기</th>
					       <td><input type="text" name="nb_size" value="${newbook.nb_size}" class="form-control" required="required"></td>
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
	    <button class="btn btn-primary mt-5 mb-2" type="submit" style="margin-right: 10px;" >수정하기</button>
	   	<button class="btn btn-secondary mt-5 mb-2" type="button" onclick="location.href='bonewbookList'">목록가기</button>
	  </div>
	 </form>
</body>
</html>