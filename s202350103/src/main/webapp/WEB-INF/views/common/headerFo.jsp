<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../yb/aboutLogin2.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">

  <title>DADOK</title>
  <link href="../assets/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">
  <link href="../assets/libs/nouislider/dist/nouislider.min.css" rel="stylesheet">
  <link href="./assets/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
  <link href="./assets/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
  
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/DADOKLOGO.png">

<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->

<!-- End Tag 금비 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function search() {
		var search_type = $("#search_type").val();
		var search_keyword = $("#search_keyword").val();
		// alert("내가 선택한 검색 조건 -> "+search_type + " 키워드는 "+search_keyword);
		
		location.href = "/searchNewbookList?search_type="+search_type+"&search_keyword="+search_keyword;
	}
	
</script>

<script type="text/javascript">
	
	function loginCon(){
		alert("로그인 후 이용해주세요.");
		location.href="loginForm"
	}

</script>

</head>

<body>

<!-- 전체 화면 일 때  -->
  <div class="border-bottom ">
    <div class="bg-light py-1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-12 text-center text-md-start">
          <span> DADOK </span>
          </div>
          	
          	<!-- 우측 최상단 구성 -->
          	 <div class="col-6 text-end d-none d-md-block">


				 <c:if test="${sessionScope.member == null }">
             			<div class="list-inline-item me-6">
						<!-- 로그인 아이콘 -->
				       	<a href="loginForm" class="position-relative text-success">                  
				        	<strong><i class="feather-icon icon-log-out me-1">
				        	</i>로그인</strong>
		               		<span class="visually-hidden">unread messages</span>
		                </a></div>


						<div class="list-inline-item me-6">
						<!-- 회원가입 아이콘 -->
				       	<a href="memberJoin" class="text-success">                  
				        	<strong><i class="bi bi-person-plus-fill me-1">
				        	</i>회원가입</strong>
		               		<span class="visually-hidden">unread messages</span>
		                </a>
		                </div>
		                
		                
	                    <div class="list-inline-item me-6">
						<a href="memberMyPage?m_num=${member.m_num }" class="text-success">
							<strong><i class="bi bi-person-circle"></i>&nbsp;
							마이페이지</strong>
		               		<span class="visually-hidden">unread messages</span>
		               	</a>
		               	</div>
		                
		          </c:if> 
		                
		            <!-- 로그인 시 -->
			     		<c:if test="${sessionScope.member != null }">
			                <!-- 장바구니 아이콘 -->
						    <div class="list-inline-item me-5" >
						    	<a href="memberCartList" style="color: #002b63;" class="text-success"><strong>
						      		<i class="bi bi-cart2 fs-6 me-1" style="color: #198754;"></i>장바구니
						     	 	<span class="visually-hidden">unread messages</span></strong>
						    	</a>
						  </div>
			     			<div class="list-inline-item me-5">
								<!-- 로그아웃 아이콘 -->
								<a href="memberLogout"  style="color: #002b63;" class="text-success"><strong>
									<i class="feather-icon icon-log-out me-1"></i>로그아웃
				               		<span class="visually-hidden">unread mes</span></strong>
			               		</a>
			               	</div>
			             
		                  <div class="list-inline-item me-5">
								<a href="memberMyPage?m_num=${member.m_num }" style="color: #002b63;" class="text-success"><strong>
								<i class="bi bi-person-circle"></i>
								마이페이지</strong></a>
			               	</div>
			               	
			             <c:if test="${member.m_admin == 1 }">
			               		 <div class="list-inline-item me-5">
									<a href="mainBo" style="color: #581313;"><strong>
				               		<i class="bi bi-universal-access-circle" ></i>
									 관리자전환</strong></a>
				               	</div>
			             </c:if>
			             
		              </c:if>  

          	 </div>
          	
        </div>
      </div>
    </div>
    <div class="py-5">
      <div class="container">
        <div class="row w-100 align-items-center gx-lg-2 gx-0">
          <div class="col-xxl-2 col-lg-2" style="margin-right: 35px;">

	<!-- 로고/제목(데스크톱) -->
            <a class="navbar-brand d-none d-lg-block" href="/" style="width: 200px;"  >
				<h1 style="width: 200px; margin-right: 10px;">
				<img alt="" src="../assets/images/favicon/DADOKLOGO.png" >
				DADOK
				</h1>
            </a>

<!-- 				
<div> 아이콘 제작자 <a href="https://www.freepik.com" title="Freepik"> Freepik </a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com'</a></div> 
-->
	
<!-- 화면 줄었을 때 작업 -->
            <div class="d-flex justify-content-between w-100 d-lg-none">
	
	<!-- 로고/제목(모바일) -->	
			  <a href="/">
				<h1>
				<img alt="" src="../assets/images/favicon/DADOKLOGO.png" >
				DADOK
				</h1>
			  </a>
              <div class="d-flex align-items-center lh-1">
				
                <div class="list-inline me-4">
	               
                 <!-- 회원가입 아이콘 -->
                 	<!-- 비로그인시 -->
                 <c:if test="${sessionScope.member == null }">	
	                  <div class="list-inline-item">
	                    <a href="#!" class="text-muted" data-bs-toggle="modal" data-bs-target="#userModal">
	                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
	                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
	                        class="feather feather-user">
	                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
	                        <circle cx="12" cy="7" r="4"></circle>
	                      </svg>
	                    </a>
	                  </div>
                  </c:if>
                  <c:if test="${sessionScope.member != null }">	
                  	 <div class="list-inline-item">
	                    <a href="memberMyPage?m_num=${member.m_num }" class="text-muted" >
	                      <img alt="" src="${member.m_image }" width="20px" height="20px" class="rounded-circle">
	                    </a>
	                  </div>
                  </c:if>
                  
            <!--  장바구니 아이콘 -->      
                  <div class="list-inline-item">

                    <a class="text-muted position-relative " data-bs-toggle="" data-bs-target=""
                      href="memberCartList" role="button" aria-controls="offcanvasRight">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-shopping-bag">
                        <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                        <line x1="3" y1="6" x2="21" y2="6"></line>
                        <path d="M16 10a4 4 0 0 1-8 0"></path>
                      </svg>
                      
                      <!-- 항목 아이콘 -->
                      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
                      	<c:if test="${sessionScope.member == null }">0</c:if>
                      	<c:if test="${sessionScope.member != null }">${totalCart }</c:if>
                        <span class="visually-hidden">unread messages</span>
                      </span>
                    
                    
                    </a>
                  </div>

                </div>
                
                    <c:if test="${sessionScope.member != null }">	
               		<div>
						<c:if test="${member.m_num != 0 }"> 	
									 
							 <a href="memberLogout"  style="color: #002b63;" class="text-success">
							<i class="feather-icon icon-log-out me-1" style="font-size: 20px;"></i>
	               		</a>
						
						<c:if test="${member.m_admin == 1 }"> 	
							 
							 <a href="mainBo" style="color: #581313;">
		               		<i class="bi bi-universal-access-circle" style="font-size: 20px;"></i>
							 </a>&nbsp;
						</c:if>							 
						
						</c:if> 	
	               	</div>
       			</c:if>
                
                
                
                
              <!-- 메뉴 버튼 -->  
                <button class="navbar-toggler collapsed" type="button" data-bs-toggle="offcanvas" data-bs-target="#navbar-default" aria-controls="navbar-default" aria-label="Toggle navigation">
                  <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                    class="bi bi-text-indent-left text-primary" viewBox="0 0 16 16">
                    <path
                      d="M2 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm.646 2.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1 0 .708l-2 2a.5.5 0 0 1-.708-.708L4.293 8 2.646 6.354a.5.5 0 0 1 0-.708zM7 6.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm-5 3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
                  </svg>
                </button>
              
              
              </div>
                
            </div>

          </div>
        
		<div class="col-md-2 col-md-7  d-block">
		    <!-- 검색 금비 -->
	        <div class="input-group" style="margin-left: 10px;">
	        
				<select id="search_type" class="w-25 rounded" style="border-color: rgb(223, 226, 225);" >
					<option value="title">도서제목</option>
					<option value="writer">지은이</option>
					<option value="publisher">출판사</option>
				</select>&nbsp;&nbsp;
	            <input id = "search_keyword" class="form-control rounded" type="search" placeholder="찾으실 도서를 검색해보세요." >
	      
		
        <!-- 검색 버튼 -->
        <div class="col-md-1 col-xxl-2 d-lg-block">
          <div style="margin-left: 40px; width: 65px; margin-right: 30px;">
	          <button type="button" class="btn  btn-outline-gray-400 text-muted" data-bs-toggle="modal"
            	data-bs-target="#locationModal" onclick="search()">검색  </button>
            	</div>
</div>
</div>
        </div>
          
          <div class="col-md-2 col-xxl-2 text-end d-none d-lg-block" style="margin-left: 40px;">
		  
		     <!-- 로그인 시 -->
		     <div class="text-center">
			     		<c:if test="${sessionScope.member != null }">
			     		
			               	<c:if test="${member.m_image != null}">
									<!-- 내 아이콘 -->
									<a href="memberMyInfo?m_num=${member.m_num }" class="">
									<img  src="${member.m_image }" width="50px" height="50px" alt="회원이미지" class="rounded-circle">
				               		</a><br>
			               	</c:if>
			               	
								<a href="memberMyPage?m_num=${member.m_num }" style="color: #002b63; font-weight: bold;">
								${member.m_name }(${member.m_id })<span style="color: black;">님<br> 환영합니다.</span></a>			     		
						</c:if>	
			     	</div>
			     	</div>	
   	  		</div>
      
    	</div>
  
    </div>
   </div>
    
    

    <nav class="navbar navbar-expand-lg navbar-light navbar-default" style="padding-bottom: 0px;" aria-label="Offcanvas navbar large">
    
    <!-- 메인 광고  -->
      <div class="container">


        <div class="offcanvas offcanvas-start" tabindex="-1" id="navbar-default" aria-labelledby="navbar-defaultLabel">
          <div class="offcanvas-header pb-1">
			
			<!-- 로고 위치 이미지 참조  -->
			<a href="./index.html">
				<h1>
				DADOK</h1>
            </a>	
<!--        <a href="./index.html"><img src="./assets/images/logo/freshcart-logo.svg" alt="eCommerce HTML Template">
            </a>
 -->            
            
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
          </div>
          
        <!-- 작은화면 메뉴 작업 -->
          <div class="offcanvas-body">
           
            <div class="d-block d-lg-none mb-4">
              <form action="#">
              <!-- 검색(작은화면) -->
                <div class="input-group ">
                  <input class="form-control rounded" type="search" placeholder="검색 ">
                  <span class="input-group-append">
                    <button class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end" type="button">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-search">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                      </svg>
                    </button>
                  </span>
                </div>
              </form>
              
              <!-- 검색 버튼 -->
              <div class="mt-2">
                <button type="button" class="btn  btn-outline-gray-400 text-muted w-100 " data-bs-toggle="modal"
                  data-bs-target="#locationModal">
					검색 버튼
                </button>
              </div>
            </div>
            
            <!-- 작은화면 메인메뉴 버튼 -->
            <div class="d-block d-lg-none mb-4">
              <a class="btn btn-primary w-100 d-flex justify-content-center align-items-center" data-bs-toggle="collapse"
                href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" >
                <span class="me-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                    fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-grid">
                    <rect x="3" y="3" width="7" height="7"></rect>
                    <rect x="14" y="3" width="7" height="7"></rect>
                    <rect x="14" y="14" width="7" height="7"></rect>
                    <rect x="3" y="14" width="7" height="7"></rect>
                  </svg></span> 메인메뉴
              </a>
              <!-- 작은화면 메인메뉴 버튼 클릭시 옵션 -->
              <div class="collapse mt-2" id="collapseExample">
                <div class="card card-body">
                  <ul class="mb-0 list-unstyled">
                    <li><a class="dropdown-item" href="innewbookList?nb_category1=1">국내도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="innewbookList?nb_category1=2">해외도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="folistOb?currentPage=1&nb_category1=1">중고 국내도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="folistOb?currentPage=1&nb_category1=2">중고 해외도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="writeFormObReport">중고판매
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="eventList">이벤트
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="memberCommunity">독후감
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="memberQnaList">자유게시판
                <i class="bi bi-dot"></i>
                </a></li>
                  </ul>
                </div>
              </div>
            </div>
            
           <!-- 전체화면 메뉴 클릭시  -->
            <div class="dropdown me-3 d-none d-lg-block">
              <button class="btn btn-primary px-6 " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
                aria-expanded="false">
                <span class="me-1">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-grid">
                    <rect x="3" y="3" width="7" height="7"></rect>
                    <rect x="14" y="3" width="7" height="7"></rect>
                    <rect x="14" y="14" width="7" height="7"></rect>
                    <rect x="3" y="14" width="7" height="7"></rect>
                  </svg></span> 메인메뉴
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="innewbookList?nb_category1=1">국내도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="innewbookList?nb_category1=2">해외도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="folistOb?currentPage=1&nb_category1=1">중고 국내도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="folistOb?currentPage=1&nb_category1=2">중고 해외도서
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="writeFormObReport">중고판매
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="eventList">이벤트
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="memberCommunity">독후감
                <i class="bi bi-dot"></i>
                </a></li>
                <li><a class="dropdown-item" href="memberQnaList">자유게시판
                <i class="bi bi-dot"></i>
                </a></li>
              </ul>
            </div>
            
            
            <div class="">
              <ul class="navbar-nav align-items-center ">
                
               <!-- 상세 메뉴 -->
                <li class="nav-item dropdown w-100 w-lg-auto dropdown-fullwidth">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                  <span style="font-weight: bold; ">도서 상품</span>  
                  </a>
                  <div class=" dropdown-menu pb-0">
                    <div class="row p-2 p-lg-4" style="font-size: 15px; ">
                      <div class="col-lg-3 col-12 mb-4 mb-lg-0" style="width: 20%;">
                        <h6 class="text-success ps-3" style="font-size: 17px;"><a href="innewbookList?nb_category1=1" class="link-success">국내 도서</a></h6>
                        <a class="dropdown-item" href="innewbookList?nb_category1=1&nb_category2=1">경제/경영</a>
                        <a class="dropdown-item" href="innewbookList?nb_category1=1&nb_category2=2">과학</a>
                        <a class="dropdown-item" href="innewbookList?nb_category1=1&nb_category2=3">소설</a>
                        <a class="dropdown-item" href="innewbookList?nb_category1=1&nb_category2=4">역사/문화</a>
                        <a class="dropdown-item" href="innewbookList?nb_category1=1&nb_category2=5">인문</a>
                      </div>
                      <div class="col-lg-3 col-12 mb-4 mb-lg-0" style="width: 20%;">
                        <h6 class="text-success ps-3" style="font-size: 17px;"><a href="innewbookList?nb_category1=2" class="link-success">해외 도서</a></h6>
                        <a class="dropdown-item" href="innewbookList?nb_category1=2&nb_category2=6">과학/기술</a>
                        <a class="dropdown-item" href="innewbookList?nb_category1=2&nb_category2=7">문학</a>
                      </div>
                      
                   <div class="col-lg-3 col-12 mb-4 mb-lg-0" style="width: 20%;">
                        <h6 class="text-success ps-3" style="font-size: 17px;"><a href="folistOb?currentPage=1&nb_category1=1" class="link-success">중고 국내도서</a></h6>
                        <a class="dropdown-item" href="folistOb?nb_category1=1&nb_category2=1">경제/경영</a>
                        <a class="dropdown-item" href="folistOb?nb_category1=1&nb_category2=2">과학</a>
                        <a class="dropdown-item" href="folistOb?nb_category1=1&nb_category2=3">소설</a>
                        <a class="dropdown-item" href="folistOb?nb_category1=1&nb_category2=4">역사/문화</a>
                        <a class="dropdown-item" href="folistOb?nb_category1=1&nb_category2=5">인문</a>
                      </div>
                      
  					 <div class="col-lg-3 col-12 mb-4 mb-lg-0" style="width: 20%;">
                        <h6 class="text-success ps-3" style="font-size: 17px;"><a href="folistOb?currentPage=1&nb_category1=2" class="link-success">중고 해외도서</a></h6>
                        <a class="dropdown-item" href="folistOb?nb_category1=2&nb_category2=6">과학/기술</a>
                        <a class="dropdown-item" href="folistOb?nb_category1=2&nb_category2=7">문학</a>
                      </div>

						<div class="col-lg-3 col-12 mb-4 mb-lg-0" style="width: 20%;">
						  <div class="card border-0">
						    <div>
						      <h5 class="mb-3 fs-4">DADOK 추천
						     	<i class="bi bi-hand-thumbs-up"></i>
						      </h5>
						 
						 	</div>
			
							  <div class="table-responsive-xxl">
                                <div class="row flex-nowrap">
                                    <div class="col">
                                        <div class="card border-0 card-hover">
                                            <a href="newbookDetail?nb_num=100049" class="img-zoom"> 
                                            <img src="../../assets/images/banner/ad-banner-1.jpg" alt="" class=" rounded"></a>
                                            <div style= "background: #DCEBFE;"
                                             	class="position-absolute  w-100 bottom-0 py-3 px-4 rounded-bottom">
                                             	<a href="newbookDetail?nb_num=100049" class="d-flex align-items-center btn-transition">
                                             	<span style="color: #0aad0a;">바로구매</span>
                                                    <i class="feather-icon icon-chevron-right fs-5"></i></a>
                                            </div>
                                        </div>
                                    </div>	 
								 </div>
							 </div>
							</div>
						</div>
                    </div>
                  </div>
                </li>
                
             

                 <li class="nav-item w-100 w-lg-auto">
                  <a class="nav-link" href="writeFormObReport">
       		   <span style="font-weight: bold;">중고판매 </span>
       		   <i class="bi bi-dot"></i>
                  </a>
                </li>
               
               
                 <li class="nav-item w-100 w-lg-auto">
                  <a class="nav-link" href="eventList">
               	<span style="font-weight: bold;">이벤트 </span>
               	<i class="bi bi-dot"></i>
                  </a>
                </li>
               
                
               
                
                <li class="nav-item dropdown w-100 w-lg-auto">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
				<span style="font-weight: bold;">커뮤니티</span>
                  </a>
                  <ul class="dropdown-menu" style="font-size: 15px;">
                    <li><a class="dropdown-item" href="memberCommunity">독후감</a></li>
                    <li><a class="dropdown-item" href="memberQnaList">자유게시판</a></li>
                    
                  </ul>
                </li>
                
                <li class="nav-item dropdown w-100 w-lg-auto">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
				<span style="font-weight: bold;">고객센터</span>
                  </a>
                  <ul class="dropdown-menu" style="font-size: 15px;">
               
                 <c:if test="${sessionScope.member != null }">
                    <li><a class="dropdown-item" href="memberQnaOne?m_num=${member.m_num }">1 : 1 문의</a></li>
                  </c:if>  

                 <c:if test="${sessionScope.member == null }">
                    <li><a class="dropdown-item" href="#" onclick="loginCon();">1 : 1 문의</a></li>
                  </c:if>  
                    
                  </ul>
                </li>
                
                
                
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>


</div>


<!-- 마이페이지 아이콘 클릭시  -->
<!--  로그인 팝업으로 써도 될듯? -->
<!-- 비로그인시 -->
<c:if test="${sessionScope.member == null }">
	<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content p-4">
	      <div class="modal-header border-0">
	        <h5 class="modal-title fs-3 fw-bold" id="userModalLabel">로그인</h5>
	
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	
	      <div class="modal-body">
<!-- 	        <form action=""> -->
	          <div class="mb-3">
	            <label for="fullName" class="form-label">아이디</label>
	            <input type="text" class="form-control" name="m_id1" id="m_id1" placeholder="아이디를 입력하세요 " required="">
	          </div>

	          <div class="mb-5">
	            <label for="password" class="form-label">비밀번호</label>
	            <input type="password" class="form-control" name="m_pw1" id="m_pw1" placeholder="비밀번호를 입력하세요" required="">
	            <input class="form-check-input" type="checkbox" id="idSaveCheck1" name="idSaveCheck" value="remember" >
                <small class="form-text"> <label class="form-check-label" for="idSaveCheck"> 아이디 기억하기</label></small>
           
	            <small class="form-text" style="float: right; "> 계정 찾기 <a href="memberFindAccount">계정 찾기</a></small>
	          </div>
<!-- 	 -->
	          <button type="submit" class="btn btn-primary" onclick="loginChk(m_id1.value, m_pw1.value)" id="btnSearch1">로그인</button>
<!-- 	        </form> -->
	      </div>
	      <div class="modal-footer border-0 justify-content-center">
	                  계정이 없으신가요? <a href="memberJoin">회원가입</a>
	      </div>
	    </div>
	  </div>
	</div>
</c:if>
<c:if test="${sessionScope.member != null }">


</c:if>

<!--  장바구니 아이콘 클릭시 -->
<%-- <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header border-bottom">
    <div class="text-start">
      <h5 id="offcanvasRightLabel" class="mb-0 fs-4">장바구니</h5>
      <small>${member.m_name }</small>
    </div>
  <!-- X 버튼 클릭시 사이드바 슬라이드 -->
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">

    <div class="">
      <div class="alert alert-danger p-2" role="alert">
        뭐 경고 문구 대충 이런거  <a href="#!" class="alert-link">써도되고 안써도 되고</a>
      </div>

<!-- 사이드바 장바구니 메뉴 -->
      <ul class="list-group list-group-flush" id="cart${status.index }">

	<!-- 장바구니 리스트 -->
	<c:forEach var="cart" items="${listCart }" varStatus="status"> 
        <li class="list-group-item py-3 ps-0 border-top">
			
          <div class="row align-items-center">

            <div class="col-6 col-md-6 col-lg-7">
              <div class="d-flex">
            	
            <!--  이미지 1  -->
            <c:choose>
	          <c:when test="${fn:contains(cart.nb_image, 'http')}">
	              <img src="${cart.nb_image}" alt="Ecommerce"
	                class="icon-shape icon-xxl">
	          </c:when>
	          <c:otherwise>
	              <img src="${pageContext.request.contextPath}/upload/${cart.nb_image}" alt="Ecommerce"  class="icon-shape icon-xxl">
	          </c:otherwise>
            </c:choose>     
                <div class="ms-3">
			<!--  이미지 1 제목 -->
              <a href="./pages/shop-single.html" class="text-inherit">
                <h6 class="mb-0"><a href="newbookDetail?nb_num=${cart.nb_num }" class="text-inherit">${cart.nb_title }</a></h6>
              </a>
              <span><small class="text-muted">${cart.nb_publisher }</small></span>
			  <span><small class="text-muted">${cart.nb_publisher }</small></span>

              <!-- text -->
              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span
                    class="me-1 align-text-bottom">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                      stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                      class="feather feather-trash-2 text-success">
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                      </path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg></span><span class="text-muted">삭제 아이콘</span></a></div>
                  </div>
                </div>
            </div>

		<!-- 수량 input 버튼 -->
            <div class="col-4 col-md-3 col-lg-3">
			
		<!-- 수량 증 감소 -->	
              <div class="input-group input-spinner  ">
                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity" onclick="cartQuantityMinus(${status.index})">
                <input type="number" step="1" max="10" value="1" name="quantity"
                  class="quantity-field form-control-sm form-input   ">
                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity" onclick="cartQuantityPlus(${status.index})">
              </div>

            </div>
     
		<!--  가격 -->
            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
              <span class="fw-bold"><fmt:formatNumber value="${cart.nb_price * cart.c_count}" pattern="#,###" />원</span>

            </div>
          </div>

        </li>
       </c:forEach>
		
      </ul>
	<!--  장바구니 그룹  버튼 -->
      <div class="d-flex justify-content-between mt-4">
        <a href="#!" class="btn btn-primary">당장사버리기</a>
        <a href="#!" class="btn btn-dark">업데이트</a>
      </div>

    </div>
  </div>
</div>
--%>

<!-- 메인 시작 -->
  <main>

<!-- 현재 경로 -->
  <!-- section-->
  <div class="mt-4">
    <div class="container">
      <!-- row -->
      <div class="row ">
        <!-- col -->
        <div class="col-12">
          <!-- breadcrumb -->
    
        </div>
      </div>
    </div>
  </div>
  
  
  <!-- section -->
  <div>
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row gx-10">
        <!-- col -->
        
        