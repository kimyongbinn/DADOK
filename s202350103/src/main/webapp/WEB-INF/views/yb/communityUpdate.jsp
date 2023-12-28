<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
  <title>Contact eCommerce HTML Template - FreshCart </title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->
<title>Insert title here</title>
<style type="text/css">
	.file-label {
				  margin-top: 30px;
				  background-color: #5b975b;
				  color: #fff;
				  text-align: center;
				  padding: 10px 0;
				  width: 65%;
				  border-radius: 6px;
				  cursor: pointer;
				}
	.file {
	 			display: none;
	}
   .upload-box {
			    box-sizing: border-box;
			    margin-right: 20px;
				display: flex;
			    align-items: center;
    }
	.upload-box .drag-file {
				position: relative;
				width: 25%;
				height: 110px;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				border: 2px dashed #a6d529;
				margin: 0px 10px 0 10px;
	}

	.upload-box .drag-file .image {
  				width: 100px; height: 95px;
	}

	.container {
		 position: absolute;
		  top: 50%;
		  left: 50%;
		  width: 600px;
		  height: auto;
		  padding: 30px;
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.25);
		  transform: translateX(-50%) translateY(-50%);
			}
	#cm_bookTitle:hover{background: ##c1c7c6; color: white;}
	#cm_bookTitle {color: black;font-size: bold;}
	.form-label {font-weight: bold;}
	.star-rating {
	  display: flex;
	  flex-direction: row-reverse;
	  font-size: 2.25rem;
	  line-height: 2.5rem;
	  justify-content: space-around;
	  padding: 0 0.2em;
	  text-align: center;
	  width: 5em;
	}
 
	.star-rating input {
	  display: none;
	}
	 
	.star-rating label {
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 2.3px;
	  -webkit-text-stroke-color: #2b2a29;
	  cursor: pointer;
	}
	 
	.star-rating :checked ~ label {
	  -webkit-text-fill-color: gold;
	}
	 
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  -webkit-text-fill-color: #fff58c;
	}
	#textLabel:hover {
		color: white;
	}
	#textLabel {
		font-style: bold; font-size: 20px;
	}		
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
	
	function clickImage1(){
		$("#cm_imageChk1").val("n");
		if($("#cm_imageChk1").prop("checked")){
			$("#cm_imageChk1").val("y");
		} else {
			$("#cm_imageChk1").val("n");
		}
	}
	
	function clickImage2(){
		$("#cm_imageChk2").val("n");
		if($("#cm_imageChk2").prop("checked")){
			$("#cm_imageChk2").val("y");
		} else {
			$("#cm_imageChk2").val("n");
		}
	}
	function imageDelete(cm_num, cm_imageChk1) {
		location.href = "deleteImage?cm_num="+cm_num +"&cm_imageChk1="+cm_imageChk1;
	}
	function imageDelete1(cm_num, cm_imageChk2) {
		location.href = "deleteImage?cm_num="+cm_num +"&cm_imageChk2="+cm_imageChk2;
	}
	function imageDelete2(cm_num, cm_imageChk1, cm_imageChk2) {
		location.href = "deleteImage?cm_num="+cm_num +"&cm_imageChk1="+cm_imageChk1 +"&cm_imageChk2="+cm_imageChk2;
	}
	
	
	$(function(){
		var result = '${result}';
		
		if(result == 1){
			alert("수정되었습니다.");
			window.close();
			opener.parent.location.reload();
		}
	});
	
	function chkForm() {
		 var radios = document.getElementsByName('cm_rating');
		 var formValid = false;
		 var i = 0;
		 
		 while (!formValid && i < radios.length) {
			    if (radios[i].checked) formValid = true;
			    i++;        
			  }
		if(!formValid){
			alert("별점을 선택해주세요");
			return false;
		}else {
			return true;
		}
	}
</script>
</head>
<body>
<main class="textBox">
   <div class="mb-6">
      <header class="top">
         <h1 class="infoTit">
           	독후감 수정
         </h1>
      </header>
   </div>
	<section class="my-lg-14 my-8" style="width: 90%; ">
	     <!-- container -->
	     <div class="container" id="container">
	      <div class="row">
	       <div class="offset-lg-2 col-lg-8 col-12">
		   <form action="communityUpdateDo" method="post" name="" enctype="multipart/form-data" id="frm" onsubmit="return chkForm()">
			   <input type="hidden" name="cm_num" value="${community.cm_num }">
			   <input type="hidden" name="m_num" value="${community.m_num }">
			   <input type="hidden" name="nb_num" value="${community.nb_num }">
			   <input type="hidden" name="cm_image" value="${community.cm_image }">
			   <input type="hidden" name="cm_image1" value="${community.cm_image1 }">
			   <input type="hidden" name="cm_image2" value="${community.cm_image2 }">
			    <div class="col-md-12 mb-3">
		          <label class="form-label" for="title">책 제목 *</label>
		          <input type="text" id="nb_title" name="nb_title" class="form-control mt-2" placeholder="책을 선택해주세요" value="${community.nb_title }" readonly="readonly">
		<!--           <input type="text" id="book_image" name="book_image" class="form-control" placeholder=""> -->
		        </div>
				<div class="col-md-12 mb-3">
		          <label class="form-label" for="title"> 제목 *</label>
		          <input type="text" id="cm_title" name="cm_title" class="form-control" required value="${community.cm_title }">
		        </div>
		        
		        <div class="col-md-12 mb-3">
		          <label class="form-label" for="comments"> 내용 *</label>
		          <textarea rows="3" name="cm_content" id="cm_content" class="form-control">${community.cm_content }</textarea>
		        </div>
		        <label class="form-label" for="comments" style="color: red;"><small> * 500자까지 입력 가능합니다. *</small></label>
		        <div class="col-md-12 mb-3">
			      <label class="form-label" for="comments"> 별점 *</label>
			       <div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="cm_rating" value="5"/>
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="cm_rating" value="4"/>
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="cm_rating" value="3"/>
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="cm_rating" value="2"/>
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star"  name="cm_rating" value="1" />
						<label for="1-star" class="star">★</label>
					</div>
			      </div>
	        
		        <div class="col-md-12 mb-3">
		        	<label class="form-label " for="comments"> 책 이미지</label>
		        	<div class="upload-box">
					  <span id="drop-file" class="drag-file mx-auto">
					    <img src="${community.cm_image }" alt="파일 아이콘" class="image" id="image" name="image">
					    <input type="hidden" id="cm_image" name="cm_image"> 
					  </span>  
					</div>
				</div>
				<div class="col-md-12 mb-3">	
					<label class="form-label mt-3" for="comments"> 등록 된 이미지</label>
					<div>
						<c:if test="${community.cm_image1 != null }">
							<input type="checkbox" name="cm_imageChk1" id="cm_imageChk1" value="n" onclick="clickImage1()"> ${community.cm_image1 } 
						</c:if> <p>
						<c:if test="${community.cm_image2 != null }">
							<input type="checkbox" name="cm_imageChk2" id="cm_imageChk2" value="n" onclick="clickImage2()"> ${community.cm_image2 }
						</c:if>
					</div>
		        </div>
		        
		        <div class="col-md-12 mb-3">
			        <c:if test="${community.cm_image1 != null  && community.cm_image2 == null }">
						이미지 삭제하기 <button type="button" class="btn btn-soft-primary" onclick="imageDelete(cm_num.value, cm_imageChk1.value)" style="border: none;">
						<i class="bi bi-file-earmark-x"></i></button>
					</c:if>
					<c:if test="${community.cm_image1 == null  && community.cm_image2 != null }">
						이미지 삭제하기 <button type="button" class="btn btn-soft-primary" onclick="imageDelete1(cm_num.value, cm_imageChk2.value)" style="border: none;">
						<i class="bi bi-file-earmark-x"></i></button>
					</c:if>
			        <c:if test="${community.cm_image1 != null && community.cm_image2 != null}">
						이미지 삭제하기 <button type="button" class="btn btn-soft-primary" onclick="imageDelete2(cm_num.value, cm_imageChk1.value, cm_imageChk2.value)" style="border: none;">
						<i class="bi bi-file-earmark-x"></i></button>
					</c:if>
				</div>
		        <label class="form-label" for="comments" style="color: red;"><small> * 이미지는 최대 2개까지 선택 가능합니다 *</small></label>
		        <div class="form-group">
				   <input type="file" class="form-control form-control-user" id="product_detail_image" name="multiFile" 
				   		  multiple="multiple" accept="image/jpeg, image/png" onchange="setDetailImage()"></input>
		        </div>
		        
		       <div class="d-grid gap-2 col-3 mx-auto mt-5">
				    <input type="submit" class="btn btn-soft-primary" value="수정">
			   </div>
	       </form>
			</div>
			
	   	</div>
	   </div>
	</section>
</main>
<script type="text/javascript">
	document.getElementById('product_detail_image').addEventListener('change', function() {
	    if(this.files.length > 2) {
	        alert('이미지는 최대2까지 업로드 가능합니다!');
	        this.value = ''; // Clear the selected files
	    }
});
</script>
</body>
</html>