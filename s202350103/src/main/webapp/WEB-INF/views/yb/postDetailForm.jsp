<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
  <link href="../assets/libs/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />
  <link href="../assets/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">
  <link href="../assets/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
  <link href="../assets/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
  <!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">
<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">
<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
  <!-- Google tag (gtag.js) -->
<!-- End Tag -->
<style type="text/css">
	#div1 {
		background: #fff;
		border-radius: 10px;
		border-left: 1px solid #dfe2e1;
	}
	#div2 {
		background: #fff;
		border-left: 1px solid #dfe2e1;
	}
	#container {
		background-color: rgb(255, 255, 255);
		border-radius: 10px;
	    box-shadow: 0 5px 5px 0 rgba(34, 36, 38, 0.3);
	    padding: 10px;
	    margin-top: 30px;
	}
	.center-text {
	  	text-align: center; /* 텍스트 가운데 정렬 */
	  	position: absolute;
	  	top: 155%;
	  	left: 50%;
	  	font-weight: bold;
	  	color:black;
	  	transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
	}
</style>
<script type="text/javascript">
// 	function openUpdate(cm_num) {
// 		var url = "communityUpdate?cm_num="+cm_num;
// 	    var name = "openUpdate";
// 	    var option = "position= absolute, top= 50%, left= 50%, width= 600, height= 750px, padding= 40px, text-align= center, background-color= rgb(255, 255, 255), border-radius= 10px, box-shadow= 0 2px 3px 0 rgba(34, 36, 38, 0.15), transform= translateX(-50%) translateY(-50%);"
// 		window.open(url, name, option);
// 	}
	
	function openUpdate(cm_num) {			
		var popupW = 600;
		var popupH = 900;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
	
		var url = "communityUpdate?cm_num="+cm_num;
        var name = "openUpdate";
        
        window.open(url, name, 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')
	
	}

	function deleteConfirm(cm_num) {
		if (confirm("정말로 삭제하시겠습니까?") == true){   
			location.href="communityDelete?cm_num="+cm_num;
			return true;
	 	} else {
		    	return false;
	 	}
	}
	function clickHeart(cm_num, m_num, m_num1) {
		if(${sessionScope.member == null }) {
			alert("로그인 후 이용해주시기 바랍니다.");
		} else if(m_num1 == m_num){ 
			alert("본인 게시물은 좋아요 누를 수 없습니다.");
		} else {
			location.href="communityClickHeart?cm_num="+cm_num;
		}	
	}
	
	function communityList() {
		if(document.referrer.includes("memberCommunity")) {
			location.href = "memberCommunity";
		} else {
			location.href = "memberMyCommunity";
				
		}	
	}

</script>

</head>
<%@ include file="../common/headerFo.jsp" %>
<body>
<main>
<div id="container">
  <section class="mt-8">
    <div class="container align-items-center">
      <div class="row" style="padding-left: 20px;">
	
        <div class="col-md-5" style="width: 30rem;">
          <!-- img slide -->
          <div class="product" id="product" >
            <div class="zoom tns-item tns-slide-active" onmousemove="zoom(event)"
              style="background-image: url(${community.cm_image})" id="product-item0">
              <!-- img -->
              <!-- img -->
              <c:set var="cm_image" value="${community.cm_image }"/>
              <c:choose>
           		<c:when test="${fn:contains(cm_image, 'http')}">
           			<a href="newbookDetail?nb_num=${community.nb_num }"><img src="${community.cm_image }" alt="도서 썸네일"  height="650px;"></a>
           		</c:when>
           		<c:otherwise>
           			<a href="newbookDetail?nb_num=${community.nb_num }"><img src="${pageContext.request.contextPath}/upload/${community.cm_image}" alt="도서 썸네일"  height="650px"></a>
           		</c:otherwise>
		 	  </c:choose>
            </div>
			<c:if test="${community.cm_image1 != null }">
	           <div>
	             <div class="zoom" onmousemove="zoom(event)"
	               style="background-image: url(${community.cm_image1})">
	               <!-- img -->
	              	<c:set var="cm_image" value="${community.cm_image }"/>
	             	<c:choose>
	           		<c:when test="${fn:contains(cm_image1, 'http')}">
	           			<img src="${community.cm_image1 }" alt="도서 썸네일" height="650px;">
	           		</c:when>
	           		<c:otherwise>
	           			<img src="${pageContext.request.contextPath}/upload/yb/${community.cm_image1}" alt="도서 썸네일" height="650px;">
	           		</c:otherwise>
		 	    </c:choose>
	             </div>
	           </div>
            </c:if>
            <c:if test="${community.cm_image2 != null }">
            <div>
              <div class="zoom" onmousemove="zoom(event)"
                style="background-image: url(${community.cm_image2})">
                <!-- img -->
               	<c:set var="cm_image" value="${community.cm_image }"/>
              	<c:choose>
	           		<c:when test="${fn:contains(cm_image2, 'http')}">
	           			<img src="${community.cm_image2 }" alt="도서 썸네일" height="650px;">
	           		</c:when>
	           		<c:otherwise>
	           			<img src="${pageContext.request.contextPath}/upload/yb/${community.cm_image2}" alt="도서 썸네일"  height="650px;">
	           		</c:otherwise>
		 	    </c:choose>
              </div>
            </div>
            </c:if>
            <div>
              <div class="" onmousemove="zoom(event)"
                style="background-image: url()">
                <!-- img -->
                <img src="" alt="">
              </div>
            </div>
          </div>
          <!-- product tools -->
          <div class="product-tools">
            <div class="thumbnails row g-3" id="productThumbnails">
              <div class="col-3">
                <div class="thumbnails-img">
                  <!-- img -->
                  <c:set var="cm_image" value="${community.cm_image }"/>
                  <c:choose>
               		<c:when test="${fn:contains(cm_image, 'http')}">
               			<img src="${community.cm_image }" alt="도서 썸네일" height="111.625px">
               		</c:when>
               		<c:otherwise>
               			<img src="${pageContext.request.contextPath}/upload/${community.cm_image}" alt="도서 썸네일" height="111.625px">
               		</c:otherwise>
				  </c:choose>
                </div>
              </div>
              <c:if test="${community.cm_image1 != null }">
              <div class="col-3" >
                <div class="thumbnails-img">
                  <!-- img -->
                  <c:set var="cm_image" value="${community.cm_image }"/>
              	  <c:choose>
	           		<c:when test="${fn:contains(cm_image1, 'http')}">
	           			<img src="${community.cm_image1 }" alt="도서 썸네일" height="111.625px">
	           		</c:when>
	           		<c:otherwise>
	           			<img src="${pageContext.request.contextPath}/upload/yb/${community.cm_image1}" alt=" " height="111.625px">
	           		</c:otherwise>
		 	      </c:choose>
                </div>
              </div>
              </c:if>
              <c:if test="${community.cm_image2 != null }">
              <div class="col-3">
                <div class="thumbnails-img">
                  <!-- img -->
                  <c:set var="cm_image" value="${community.cm_image }"/>
              	  <c:choose>
	           		<c:when test="${fn:contains(cm_image2, 'http')}">
	           			<img src="${community.cm_image2 }" alt="도서 썸네일" height="111.625px">
	           		</c:when>
	           		<c:otherwise>
	           			<img src="${pageContext.request.contextPath}/upload/yb/${community.cm_image2}" alt="" height="111.625px">
	           		</c:otherwise>
		 	      </c:choose>
                </div>
              </div>
              </c:if>
<!--               <div class="col-3"> -->
<!--                 <div class="thumbnails-img"> -->
<!--                   img -->
<!--                   <img src="" alt=""> -->
<!--                 </div> -->
<!--               </div> -->
            </div>
          </div>
        </div>
        <div class="col-md-6 pt-12" id="div2" style="margin-left: 30px; width: 43rem; height: auto">
          <div class="ps-lg-5 mt-6 mt-md-0">
          	조회수 : ${community.cm_readCnt }
            <!-- heading -->
            <h1 class="mb-1 d-block">${community.nb_title } </h1>
            <div class="mb-4">
              <div class="text-warning mt-5 mb-5">
                 <c:forEach var="i" begin="1" end="${community.cm_rating}">
                    <i class="bi bi-star-fill"></i>
                 </c:forEach>
                 <c:forEach var="i" begin="${community.cm_rating + 1}" end="5">
                    <i class="bi bi-star"></i>
                 </c:forEach>
               	 <span class="text-muted small" style="margin-left: 10px;">${community.cm_rating }</span>
              </div>
            <div class="fs-4">
              <!-- price --><span class="fw-bold text-dark">${community.nb_writer }</span> 
              <span><small class="fs-6 ms-2 text-danger">${community.nb_publisher }</small></span>
            </div>
            <!-- hr -->
            <hr class="my-6">
               
            <div>
              <!-- table -->
              <table class="table table-borderless mb-0" style="font-size:17px ">

                <tbody>
                  <tr>
                    <th>글 제목:</th>
                    <td>${community.cm_title }</td>
                  </tr>
                  <tr>
                    <th>작성자:</th>
                    <td>${community.m_name }</td>
                  </tr>
                  <tr>
                    <th>내용:</th>
                    <td></td>
                  </tr>
                  <tr>
                    <td colspan="2" style="word-break:break-all">${community.cm_content }</td>                   
                  </tr>
                  <tr>
                    <th>등록일:</th>
                    <td><fmt:formatDate value="${community.cm_regDate}" pattern="yyyy년MM월dd일"/></td>
                  </tr>
                </tbody>
              </table>
			<input type="hidden" name="cm_num" value="${community.cm_num }" id="cm_num">	
			<input type="hidden" name="m_num" value="${community.m_num }" id="m_num">	
			<input type="hidden" name="m_num" value="${member.m_num }" id="m_num1">
            </div>
            <div class="mt-6 mb-10 row justify-content-start g-17 align-items-center">
              <div class="col-md-10 col-10">
                <!-- btn -->
                <c:if test="${member.m_num == community.m_num }">
	                <button type="button" class="btn btn-outline-success"onclick="openUpdate(cm_num.value)">
	                <i class="bi bi-pencil" title="수정하기"></i></button>
	            </c:if>
	            <c:if test="${member.m_num == community.m_num }">
	               <button type="button" class="btn btn-outline-success" onclick=""><i class="bi bi-trash"  onclick="deleteConfirm(cm_num.value)"></i></button>
	            </c:if>
				<c:if test="${commHeart.h_status == 0 || commHeart == null}">
                	<button type="button" class="btn btn-outline-success" onclick=""><i class="bi bi-hand-thumbs-up"  onclick="clickHeart(cm_num.value, m_num.value, m_num1.value)">(${community.cm_hitCnt })</i></button>
                </c:if>
                <c:if test="${commHeart.h_status == 1 }">
                	<button type="button" class="btn btn-outline-success" onclick=""><i class="bi bi-hand-thumbs-up-fill" onclick="clickHeart(cm_num.value, m_num.value, m_num1.value)">(${community.cm_hitCnt })</i></button>
                </c:if>
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="d-grid gap-2 mt-10 d-md-flex justify-content-center">
		 <button class="btn btn-outline-success mb-2" type="button" 
			 	 onclick="communityList()">목록 이동</button>
	</div>
    </div>
  </section>
</div>
  <!-- section -->
  
  
   <hr class="my-6">
  <section class="my-lg-14 my-14">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-12">
          <!-- heading -->
          <h3>관련 독후감들</h3>
        </div>
      </div>
      <!-- row -->
      <div class="row g-4 row-cols-lg-4 row-cols-2 row-cols-md-2 mt-2">
      <c:if test="${empty sameDetailList }">
			<div class="row">
				<div class="center-text mt-14 md-14">
					등록된 관련 독후감이 없습니다.
				</div>
			</div>
		</c:if>
        <!-- col -->
        <c:forEach var="sameDetail" items="${sameDatailList }">
        <c:if test="${sameDetail.cm_num != community.cm_num }">
        	<div class="col">
	          <div class="card card-product">
	            <div class="card-body">
	              <h2 class="fs-5"><a href="postDetailForm?cm_num=${sameDetail.cm_num }" class="text-inherit text-decoration-none">${sameDetail.cm_title }</a></h2>
	              <input type="hidden" value="${sameDetail.cm_num }"  name="cm_num1">
	              <div class="d-flex justify-content-between text-muted mt-4">
	              	  <div>
			          	 <div class="text-center position-relative ">
				            <a href="postDetailForm?cm_num=${sameDetail.cm_num }">
				              <!-- img -->
				              <div class="img-zoom">  
				                <!-- 도서 이미지 -->	
				                  <c:set var="cm_image" value="${sameDetail.cm_image }"/>
				                  <c:choose>
				               		<c:when test="${fn:contains(cm_image, 'http')}">
				               			<img src="${sameDetail.cm_image }" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 7rem; height: 6rem;">
				               		</c:when>
				               		<c:otherwise>
				               			<img src="${pageContext.request.contextPath}/upload/${sameDetail.cm_image}" alt="도서 썸네일" class="mb-3 img-fluid" style="width: 8rem;  height: 10rem;">
				               		</c:otherwise>
				                  </c:choose>
				              </div>
				            </a>               	
                 		 </div>
			          </div>
	              
		              <div class="mt-4">
			              <h4 class="fs-6"><small>작성자: ${sameDetail.m_name }</small></h4>
			              <h3 class="fs-6"><a href="newbookDetail?nb_num=${sameDetail.nb_num }" class="text-inherit text-decoration-none">${sameDetail.nb_title }</a></h3>
			              <div class="text-warning">
							 <c:forEach var="i" begin="1" end="${sameDetail.cm_rating}">
			                    <i class="bi bi-star-fill"></i>
			                 </c:forEach>
			                 <c:forEach var="i" begin="${sameDetail.cm_rating + 1}" end="5">
			                    <i class="bi bi-star"></i>
			                 </c:forEach>
		               	 	 <span class="text-muted small" style="margin-left: 10px;">${sameDetail.cm_rating }</span>
			              </div>
			          </div>
			          
			         
	              </div>
	              <div class="d-flex justify-content-between align-items-center mt-3">
	                <div><span class="text-dark"><fmt:formatDate value="${sameDetail.cm_regDate}" pattern="yyyy년MM월dd일"/></span>
	                </div>
	                <!-- btn -->
	                <div>
	                      <a class="btn btn-soft-primary" href="postDetailForm?cm_num=${sameDetail.cm_num }"><i class="bi bi-eye"></i></a>
	                      <line x1="12" y1="5" x2="12" y2="19"></line>
	                      <line x1="5" y1="12" x2="19" y2="12"></line>
	                  </div>
	              </div>
	            </div>
	          </div>
	        </div>  
	        </c:if>  
        </c:forEach>
      </div>
    </div>
  </section>

</main>
<%@ include file="../common/footerFo.jsp" %>
  <!-- modal -->
  <!-- Modal -->
<div class="modal fade" id="quickViewModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body p-8">
        <div class="position-absolute top-0 end-0 me-3 mt-3">
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <!-- img slide -->
            <div class="product productModal" id="productModal">
              <div
                class="zoom"
                onmousemove="zoom(event)"
                style="
                  background-image: ;
                "
              >
                <!-- img -->
                <img
                  src=""
                  alt=""
            >
              </div>
              <div>
                <div
                  class="zoom"
                  onmousemove="zoom(event)"
                  style="
                    background-image: ;
                  "
                >
                  <!-- img -->
                  <img
                    src=""
                    alt=""
              >
                </div>
              </div>
              <div>
                <div
                  class="zoom"
                  onmousemove="zoom(event)"
                  style="
                    background-image:;
                  "
                >
                  <!-- img -->
                  <img
                    src=""
                    alt=""
              >
                </div>
              </div>
              <div>
                <div
                  class="zoom"
                  onmousemove="zoom(event)"
                  style="
                    background-image: ;
                  "
                >
               
                </div>
              </div>
            </div>
            <!-- product tools -->
            <div class="product-tools">
              <div class="thumbnails row g-3" id="productModalThumbnails">
                <div class="col-3" class="tns-nav-active">
                  <div class="thumbnails-img">   
                    <!-- img -->
                    
                  </div>
                </div>
                <div class="col-3">
                  <div class="thumbnails-img" >
                    

                  </div>
                </div>
                <div class="col-3">
                  <div class="thumbnails-img">
                    <!-- img -->
                    <!-- img -->
	               	
                  </div>
                </div>
                <div class="col-3">
                  <div class="thumbnails-img">
                    <!-- img -->
                    <img
                      src=""
                      alt=""
                >
                  </div>
                </div>
              </div>
            </div>
          </div>        
        </div>
      </div>
    </div>
  </div>
</div>




  <!-- Javascript-->
  <script src="../assets/libs/rater-js/index.js"></script>
  <script src="../assets/libs/dropzone/dist/min/dropzone.min.js"></script>

  <!-- Libs JS -->
<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/libs/simplebar/dist/simplebar.min.js"></script>

<!-- Theme JS -->
<script src="../assets/js/theme.min.js"></script>

  <script src="../assets/libs/tiny-slider/dist/min/tiny-slider.js"></script>
  <script src="../assets/js/vendors/tns-slider.js"></script>
  <script src="../assets/js/vendors/increment-value.js"></script>





</body>

</html>