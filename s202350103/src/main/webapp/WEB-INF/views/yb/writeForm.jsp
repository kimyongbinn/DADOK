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

	#container {
		 position: absolute;
		  top: 50%;
		  left: 50%;
		  width: 800px;
		  height: 800px;
		  padding: 20px;	
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		
		  transform: translateX(-50%) translateY(-50%);
			}
	#cm_bookTitle:hover{background: ##c1c7c6; color: white;}
	#cm_bookTitle {color: black;font-size: bold;}
	.form-label {font-size: bold;}
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
	function func() {
		document.form.file.click();
		document.form.text1.value = document.form.file.value();
	}
	
	function searchBtn() {			
		var popupW = 600;
		var popupH = 900;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
	
		var url = "searchBook";
        var name = "searchBook";
        
        window.open(url, name, 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')
		
	}
	
	var receivedImageURL = "";
	var receivedImageURLString = "";
	function setChildValue(title, image, nb_num, cm_rating){
		  receivedImageURL = image;
		  receivedImageURLString = image;
		  document.getElementById("image").src = receivedImageURL;
		  document.getElementById("cm_image").value = receivedImageURLString;
		  document.getElementById("nb_title").value = title;
		  document.getElementById("nb_num").value = nb_num;		  
	}
	
	
	$(function(){
		var result = '${communityInsert}';
		
		if(result == 1){
			alert("등록되었습니다.");
			window.close();
			opener.parent.location.reload();
		} else if(result == 0) {
			alert("필수값(*)들을 빠짐없이 입력해주세요");
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
		if(!frm.nb_title.value) {
			alert("책을 선택해주세요");
			return false;
		} else if(!formValid){
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
           	독후감 작성
         </h1>
      </header>
   </div>
<section class="my-lg-14 my-8" style="width: 90%; ">
     <!-- container -->
     <div class="container" id="container">
      <div class="row">
       <div class="offset-lg-2 col-lg-8 col-12" onsubmit="return chkForm()">
	   <form action="communityInsert" method="post" name="frm" enctype="multipart/form-data" id="frm">
	   	<input type="hidden" name="m_num" id="m_num" value="${member.m_num }">
	   	<input type="hidden" name="nb_num" id="nb_num">
	    <div class="col-md-12 mb-3">
          <label class="form-label" for="title"></label>
          <button type="button" id="cm_bookTitle" name="cm_bookTitle" class="rounded btn form-control btn-outline-gray-400" onclick="searchBtn()">책 검색</button>
          <input type="text" id="nb_title" name="nb_title" class="form-control" placeholder="책 제목" style="margin-top: 15px;" readonly="readonly" required="required">
<!--           <input type="text" id="book_image" name="book_image" class="form-control" placeholder=""> -->
        </div>
		<div class="col-md-12 mb-3">
          <label class="form-label" for="title" > 제목 *</label>
          <input type="text" id="cm_title" name="cm_title" class="form-control" placeholder="제목을 입력하세요" required>
        </div>
        <div class="col-md-12 mb-3">
          <label class="form-label" for="comments"> 독후감 작성 *</label>
          <textarea rows="3" name="cm_content" id="cm_content" class="form-control" placeholder="내용을 10자 이상 입력해 주세요. 주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다." required="required"></textarea>
        </div>
        <div class="col-md-12 mb-3">
        <label class="form-label" for="comments" style="color: red;"><small> * 500자까지 입력 가능합니다. *</small></label>
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
				<input type="radio" id="1-star"  name="cm_rating" value="1"/>
				<label for="1-star" class="star">★</label>
			</div>
	      </div>
        
        <div class="col-md-12 mb-3">
        	<label class="form-label mx-auto" for="comments"> 책 이미지</label>
        	<div class="upload-box mx-auto">
			  <div id="drop-file" class="drag-file mx-auto">
			    <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" id="image" name="image">
			    <input type="hidden" id="cm_image" name="cm_image"> 
			  </div>
	
			</div>
        </div>
        <label class="form-label" for="comments" style="color: red;"><small> * 이미지는 최대 2개까지 선택 가능합니다 *</small></label>
        <div class="form-group">
		          <input type="file" class="form-control form-control-user" name="multiFile" multiple
		          		 id="product_detail_image" accept="image/jpeg, image/png"> <br>
        </div>
        
       	<div class="d-grid gap-2 col-3 mx-auto mt-5">
			 <input type="submit" class="btn btn-soft-primary" value="등록">
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