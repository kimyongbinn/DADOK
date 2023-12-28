<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/headerFo.jsp"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<title>DADOK</title>

</head>
<body>

	<!-- 메인 상단 슬라이드( 이벤트 노출? )  -->
	<main>
		<section class="">
			<div class="container">
				<div class="hero-slider ">


					<div
						style="background: url(../assets/images/png/7777.png) no-repeat; background-size: cover; border-radius: .5rem; background-position: center; height: 520px;">
						<div
							class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
							<h2 class="text-dark display-6 fw-bold mt-4"></h2>
							<p class="lead"></p>

						</div>
					</div>

					<div
						style="background: url(../assets/images/png/dadok.png) no-repeat; border-radius: .5rem; background-position: center; width: 1264px; height: 520px;">
						<div
							class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
							<h2 class="text-dark display-6 fw-bold mt-4"></h2>
							<p class="lead"></p>

						</div>
					</div>


					<div
						style="background: url(../assets/images/slider/quiz.png) no-repeat; background-size: cover; border-radius: .5rem; background-position: center; height: 520px;">
						<div
							class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
							<span class="badge text-bg-info">퀴즈 이벤트</span>

							<h2 class="text-dark display-6 fw-bold mt-4">
								퀴즈 풀고 ! <br> <span style="color: #fff3cd;">포인트도 받고 !</span>
							</h2>
							<p class="lead">정답을 맞춰보세요</p>
							<a href="eventList" class="btn btn-dark mt-3">퀴즈 풀러가기 <i
								class="feather-icon icon-arrow-right ms-1"></i></a>
						</div>
					</div>

					<div class="position-relative"
						style="background: url(./assets/images/slider/attendanceEvent.png) no-repeat, url('../assets/images/slider/mainEx2.png') no-repeat; height: 520px; background-size: 70%, 100%; border-radius: .5rem; background-position: center;">
						<div
							class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
							<span class="badge text-bg-warning">출석 이벤트</span>
							<h2 class="text-dark display-6 fw-bold mt-4">
								<span style="color: #198754;">출석</span> 하고<br>포인트 적립받자!
							</h2>
							<p class="lead" style="font-weight: bold;">
								3일 연속 출석 시 <span style="color: #016bf8;">추가 포인트 적립 !</span>
							</p>
							<a href="eventList" class="btn btn-dark mt-3">출석체크 하러가기 <i
								class="feather-icon icon-arrow-right ms-1"></i></a>
						</div>
					</div>

					<div class=" "
						style="background: url(./assets/images/slider/memberQnAImage.png) no-repeat; background-size: cover; border-radius: .5rem; background-position: center; height: 520px;">
						<div
							class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
							<span class="badge bg-light-primary text-dark-primary">Q &
								A</span>
							<h2 class="text-dark display-6 fw-bold mt-4">
								무엇이든 <br>물어보세요 !
							</h2>
							<p class="lead">
								이용중 불편한 점 및 <br>
								<span style="color: #198754;">문의사항을 작성해주세요</span>
							</p>
							<a href="memberQnaList" class="btn btn-dark mt-3">문의하기 <i
								class="feather-icon icon-arrow-right ms-1"></i></a>
						</div>
					</div>

					<div class=" "
						style="background: url(./assets/images/slider/dadokMain.png) no-repeat; background-size: cover; border-radius: .5rem; background-position: center; height: 520px;">
						<div
							class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
							<span class="badge bg-light-primary text-dark-primary">DADOK</span>
							<h2 class="text-dark display-7 fw-bold mt-4 text-white">
								소중한 사람에게
								<p>책 선물 어떠세요?
							</h2>
							<p class="lead">
								DADOK 과 함께 <br>
								<span style="color: #198754; font-weight: bold;">행복한<span
									style="color: #581313;">크리스마스</span> 되세요!
								</span>
							</p>
							<a href="innewbookList" class="btn btn-dark mt-3">선물고르기<i
								class="feather-icon icon-arrow-right ms-1"></i></a>
						</div>
					</div>



				</div>
			</div>
		</section>


		<!-- 상단 슬라이드 상품 (10개 노출 , 줄일 수 있음)-->
		<section class="mb-lg-10 mt-lg-14 my-8">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-6">


						<!-- 상단 메뉴 -->
						<!-- row -->
						<div class="row align-items-center mb-6">
							<div class="col-lg-10 col-10 ">
								<!-- heading -->
								<h3 class="mb-0">카테고리별 BEST 도서💕</h3>
							</div>
							<div class="col-lg-2 col-2">
								<div class="slider-arrow  " id="slider-second-arrows"></div>
							</div>
						</div>

					</div>
				</div>

				<!--  상품 시작 -->
				<!-- slider -->
				<div class="product-slider-second " id="slider-second">
					<!-- 다독 전체 1등 -->
					<div class="item">
						<!-- item -->
						<div class="card card-product mb-lg-4" style="height: 430px;">
							<div class="card-body" style="height: 430px;">
								<!-- 상단 뱃지 -->
								<div class="text-center position-relative ">
									<div class=" position-absolute top-0 start-0">
										<span class="badge bg-danger">다독 1등</span>
									</div>
									<!-- 도서 이미지 -->
									<a href="newbookDetail?nb_num=${hitBook1.nb_num }"> <c:choose>
											<c:when test="${fn:contains(hitBook1.nb_image, 'http')}">
												<img src="${hitBook1.nb_image }" alt="도서 썸네일"
													class="mb-3 img-fluid" style="height: 18rem;">
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/upload/${hitBook1.nb_image}"
													alt="도서 썸네일" class="mb-3 img-fluid" style="height: 18rem;">
											</c:otherwise>
										</c:choose>
									</a>
								</div>
								<!-- 도서 카테고리 -->
								<div class="text-small mb-1">
									<a href="newbookDetail?nb_num=${hitBook1.nb_num }"
										class="text-decoration-none text-muted"> <small> <c:choose>
												<c:when test="${hitBook1.nb_category1 eq 1}">국내도서 </c:when>
												<c:when test="${hitBook1.nb_category1 eq 2}">해외도서 </c:when>
											</c:choose> > <c:choose>
												<c:when test="${hitBook1.nb_category2 eq 1}"> 경제/경영</c:when>
												<c:when test="${hitBook1.nb_category2 eq 2}"> 과학</c:when>
												<c:when test="${hitBook1.nb_category2 eq 3}"> 소설</c:when>
												<c:when test="${hitBook1.nb_category2 eq 4}"> 역사/문화</c:when>
												<c:when test="${hitBook1.nb_category2 eq 5}"> 인문</c:when>
												<c:when test="${hitBook1.nb_category2 eq 6}"> 과학/기술</c:when>
												<c:when test="${hitBook1.nb_category2 eq 7}"> 문학</c:when>
											</c:choose>
									</small>
									</a>
								</div>
								<!-- 도서 제목 -->
								<h2 class="fs-6">
									<a href="newbookDetail?nb_num=${hitBook1.nb_num }"
										class="text-inherit text-decoration-none">${hitBook1.nb_title }</a>
								</h2>
								<!-- 도서 가격 -->
								<div
									class="d-flex justify-content-between align-items-center mt-3">
									<div>
										<span class="text-dark"><fmt:formatNumber
												value="${hitBook1.nb_price}" groupingUsed="true" />원</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 카테고리별 1등-->
					<c:forEach var="categoryHitBook" items="${hitList }">
						<div class="item">
							<!-- item -->
							<div class="card card-product mb-lg-4">
								<div class="card-body" style="height: 430px;">
									<div class="text-center position-relative">
										<!-- 상단 뱃지 -->
										<div class=" position-absolute top-0 start-0">
											<span class="badge bg-success"> <c:choose>
													<c:when test="${categoryHitBook.nb_category2 eq '1'}">
				                       			[경제/경영] 1등
				                       		</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq '2'}">
				                       			[과학] 1등
				                       		</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq '3'}">
				                       			[소설] 1등
				                       		</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq '4'}">
				                       			[역사/문화] 1등
				                       		</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq '5'}">
				                       			[인문] 1등
				                       		</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq '6'}">
				                       			[과학/기술] 1등
				                       		</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq '7'}">
				                       			[문학] 1등
				                       		</c:when>
												</c:choose>
											</span>
										</div>
										<!-- img -->
										<a href="newbookDetail?nb_num=${categoryHitBook.nb_num }">
											<c:choose>
												<c:when
													test="${fn:contains(categoryHitBook.nb_image, 'http')}">
													<img src="${categoryHitBook.nb_image }" alt="도서 썸네일"
														class="mb-3 img-fluid" style="height: 18rem;">
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/upload/${categoryHitBook.nb_image}"
														alt="도서 썸네일" class="mb-3 img-fluid" style="height: 18rem;">
												</c:otherwise>
											</c:choose>
										</a>
									</div>
									<!-- 도서 카테고리명 -->
									<div class="text-small mb-1">
										<a href="newbookDetail?nb_num=${categoryHitBook.nb_num }"
											class="text-decoration-none text-muted"> <small>
												<c:choose>
													<c:when test="${categoryHitBook.nb_category1 eq 1}">국내도서 </c:when>
													<c:when test="${categoryHitBook.nb_category1 eq 2}">해외도서 </c:when>
												</c:choose> > <c:choose>
													<c:when test="${categoryHitBook.nb_category2 eq 1}"> 경제/경영</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq 2}"> 과학</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq 3}"> 소설</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq 4}"> 역사/문화</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq 5}"> 인문</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq 6}"> 과학/기술</c:when>
													<c:when test="${categoryHitBook.nb_category2 eq 7}"> 문학</c:when>
												</c:choose>
										</small>
										</a>
									</div>
									<!-- 도서 제목 -->
									<h2 class="fs-6">
										<a href="newbookDetail?nb_num=${categoryHitBook.nb_num }"
											class="text-inherit text-decoration-none">${categoryHitBook.nb_title }
										</a>
									</h2>
									<!-- 도서 가격 -->
									<div
										class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark"><fmt:formatNumber
													value="${categoryHitBook.nb_price}" groupingUsed="true" />원</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 상단 이미지 슬라이드 끝 -->
			</div>
		</section>

		<!-- 중단 메뉴 및 바로가기 -->
		<section>
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-6 mb-3 mb-lg-0">
						<div>
							<div class="py-10 px-8 rounded"
								style="background: url(./assets/images/banner/event.png) no-repeat; background-size: cover; background-position: center;">
								<div>
									<h3 class="fw-bold mb-1">이벤트 리스트</h3>
									<p class="mb-4">
										다양한 이벤트에 참여하고<br> <span style="color: #198754;">포인트를
											적립</span>하세요.
									</p>
									<a href="eventList" class="btn btn-dark">이벤트 바로가기</a>
								</div>
							</div>

						</div>

					</div>
					<div class="col-12 col-md-6 ">

						<div>
							<div class="py-10 px-8 rounded"
								style="background: url(./assets/images/banner/orderBook.png) no-repeat; background-size: cover; background-position: center;">
								<div>
									<h3 class="fw-bold mb-1">중고상품 등록</h3>
									<p class="mb-4">
										다 읽은 책. 버리기 아까우시죠?<br>
										<span style="color: #198754;">DADOK</span>에서 고민 해결하세요!
									</p>
									<a href="writeFormObReport" class="btn btn-dark">중고상품 등록</a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- 중단 상품  -->
		<section class="my-lg-14 my-8">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-6">

						<h3 class="mb-0">화제의 신상 도서✨</h3>

					</div>
				</div>

				<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
					<!-- 중단 배치 상품 시작 -->

					<!-- 신작도서 5개 리스트-->
					<c:forEach var="releaseNewbook" items="${releaseNewbookList }">
						<div class="col">
							<!-- item -->
							<div class="card card-product mb-lg-4">
								<div class="card-body" style="height: 430px;">
									<div class="text-center position-relative">
										<!-- 도서 이미지 -->
										<a href="newbookDetail?nb_num=${releaseNewbook.nb_num }">
											<c:choose>
												<c:when
													test="${fn:contains(releaseNewbook.nb_image, 'http')}">
													<img src="${releaseNewbook.nb_image }" alt="도서 썸네일"
														class="mb-3 img-fluid" style="height: 18rem;">
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/upload/${releaseNewbook.nb_image}"
														alt="도서 썸네일" class="mb-3 img-fluid" style="height: 18rem;">
												</c:otherwise>
											</c:choose>
										</a>
									</div>
									<!-- 도서 카테고리명 -->
									<div class="text-small mb-1">
										<a href="newbookDetail?nb_num=${releaseNewbook.nb_num }"
											class="text-decoration-none text-muted"> <small>
												<c:choose>
													<c:when test="${releaseNewbook.nb_category1 eq 1}">국내도서 </c:when>
													<c:when test="${releaseNewbook.nb_category1 eq 2}">해외도서 </c:when>
												</c:choose> > <c:choose>
													<c:when test="${releaseNewbook.nb_category2 eq 1}"> 경제/경영</c:when>
													<c:when test="${releaseNewbook.nb_category2 eq 2}"> 과학</c:when>
													<c:when test="${releaseNewbook.nb_category2 eq 3}"> 소설</c:when>
													<c:when test="${releaseNewbook.nb_category2 eq 4}"> 역사/문화</c:when>
													<c:when test="${releaseNewbook.nb_category2 eq 5}"> 인문</c:when>
													<c:when test="${releaseNewbook.nb_category2 eq 6}"> 과학/기술</c:when>
													<c:when test="${releaseNewbook.nb_category2 eq 7}"> 문학</c:when>
												</c:choose>
										</small>
										</a>
									</div>
									<!-- 도서 제목 -->
									<h2 class="fs-6">
										<a href="newbookDetail?nb_num=${releaseNewbook.nb_num }"
											class="text-inherit text-decoration-none">${releaseNewbook.nb_title }
										</a>
									</h2>
									<!-- 도서 가격 -->
									<div
										class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark"><fmt:formatNumber
													value="${releaseNewbook.nb_price}" groupingUsed="true" />원</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

					<!--  카드 1 끝  -->

				</div>
			</div>
		</section>


		<!-- 하단 메뉴 -->
		<section>

			<div class="container" style="margin: auto;">
				<div class="row">
					<div class="col-md-12 mb-6">
						<h3 class="mb-0">추천 중고 서적</h3>
					</div>
				</div>

				<div class="table-responsive-xl pb-10">

					<div
						class="row row-cols-lg-4 row-cols-1 row-cols-md-2 g-4 flex-nowrap">

						<!-- 카드의 시작 1 -->

						<c:forEach var="RandomOb" items="${ObNumRedomSel}">
							<div class="col">

								<div class="card card-product">
									<div class="card-body" style="height: 430px;">
										<a href="foOldBookDetail?ob_num=${RandomOb.ob_num}"> <!-- 상품 이미지 -->
											<div class="text-center  position-relative ">
												<c:choose>
													<c:when test="${fn:contains(RandomOb.nb_image, 'http')}">
														<img src="${RandomOb.nb_image }" alt="도서 썸네일"
															class="mb-3 img-fluid" style="height: 18rem;">
													</c:when>
													<c:otherwise>
														<img
															src="${pageContext.request.contextPath}/upload/${RandomOb.nb_image}"
															alt="도서 썸네일" class="mb-3 img-fluid"
															style="height: 18rem;">
													</c:otherwise>
												</c:choose>
											</div> <!--  이미지 끝(액션) --> <!-- 내용 -->
											<div class="text-small mb-1">
												<small style="color: #8C8C8C;"> <c:choose>
														<c:when test="${RandomOb.nb_category1 eq 1}">국내도서 </c:when>
														<c:when test="${RandomOb.nb_category1 eq 2}">해외도서 </c:when>
													</c:choose> > <c:choose>
														<c:when test="${RandomOb.nb_category2 eq 1}"> 경제/경영</c:when>
														<c:when test="${RandomOb.nb_category2 eq 2}"> 과학</c:when>
														<c:when test="${RandomOb.nb_category2 eq 3}"> 소설</c:when>
														<c:when test="${RandomOb.nb_category2 eq 4}"> 역사/문화</c:when>
														<c:when test="${RandomOb.nb_category2 eq 5}"> 인문</c:when>
														<c:when test="${RandomOb.nb_category2 eq 6}"> 과학/기술</c:when>
														<c:when test="${RandomOb.nb_category2 eq 7}"> 문학</c:when>
													</c:choose>
												</small>
											</div>
											<div>
												<h2 class="fs-6">${RandomOb.nb_title}</h2>
											</div> <!--  가격 -->
											<div
												class="d-flex justify-content-between align-items-center mt-3">
												<div>

													<span class="text" style="color: #000000;"><fmt:formatNumber
															value="${RandomOb.ob_sell_price}" groupingUsed="true" />원</span>
												</div>
											</div> <!-- 버튼  -->


										</a>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

				</div>


				<!-- 카드의 끝 -->
			</div>


		</section>


		<!-- 하단 컨텐츠  -->
		<!--  <section class="my-lg-14 my-8">
      <div class="container">
        <div class="row">
         섹션 1
          <div class="col-md-6 col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/clock.svg" alt=""></div>
              <h3 class="h5 mb-3">제목1</h3>
              <p>아이콘 만 가져다 쓰거나 바로가기 만들수 있음
              </p>
            </div>
          </div>
          
          섹션 2
          <div class="col-md-6  col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/gift.svg" alt=""></div>
              <h3 class="h5 mb-3">제목2</h3>
              <p>내용
              </p>
            </div>
          </div>
          
           섹션 3
          <div class="col-md-6 col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/package.svg" alt=""></div>
              <h3 class="h5 mb-3">제목3</h3>
              <p>내용
              </p>
            </div>
          </div>
          
          
          섹션 4
          <div class="col-md-6 col-lg-3">
            <div class="mb-8 mb-xl-0">
              <div class="mb-6"><img src="assets/images/icons/refresh-cw.svg" alt=""></div>
              <h3 class="h5 mb-3">제목4</h3>
              <p>내용
                <a href="#!">임픽트 내용</a>
                </p>
            </div>
          </div>
        </div>
      </div>
    </section> -->


	</main>


	<!--  상품 상세보기 클릭시 액션-->
	<div class="modal fade" id="quickViewModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body p-8">
					<div class="position-absolute top-0 end-0 me-3 mt-3">
						<!-- X 버튼 눌러 상세보기 닫기  -->
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>

					</div>

					<!--  상세 보기클릭시 메인 이미지 액션 -->
					<div class="row">
						<div class="col-lg-6">
							<!--  이미지 슬라이드  -->
							<div class="product productModal" id="productModal">
								<!--  마우스 오버시 확대 기능 -->
								<div class="zoom" onmousemove="zoom(event)"
									style="background-image: url(./assets/images/products/product-single-img-1.jpg);">
									<!-- img -->
									<img src="./assets/images/products/product-single-img-1.jpg"
										alt="">
								</div>
								<div>
									<div class="zoom" onmousemove="zoom(event)"
										style="background-image: url(./assets/images/products/product-single-img-2.jpg);">
										<!-- img -->
										<img src="./assets/images/products/product-single-img-2.jpg"
											alt="">
									</div>
								</div>
								<div>
									<div class="zoom" onmousemove="zoom(event)"
										style="background-image: url(./assets/images/products/product-single-img-3.jpg);">
										<!-- img -->
										<img src="./assets/images/products/product-single-img-3.jpg"
											alt="">
									</div>
								</div>
								<div>
									<div class="zoom" onmousemove="zoom(event)"
										style="background-image: url(./assets/images/products/product-single-img-4.jpg);">
										<!-- img -->
										<img src="./assets/images/products/product-single-img-4.jpg"
											alt="">
									</div>
								</div>
							</div>


							<!-- 하단 이미지 -->
							<div class="product-tools">
								<div class="thumbnails row g-3" id="productModalThumbnails">
									<div class="col-3" class="tns-nav-active">
										<div class="thumbnails-img">
											<!-- 이미지 1 -->
											<img src="./assets/images/products/product-single-img-1.jpg"
												alt="">
										</div>
									</div>
									<div class="col-3">
										<div class="thumbnails-img">
											<!-- 이미지 2 -->
											<img src="./assets/images/products/product-single-img-2.jpg"
												alt="">
										</div>
									</div>
									<div class="col-3">
										<div class="thumbnails-img">
											<!-- 이미지 3 -->
											<img src="./assets/images/products/product-single-img-3.jpg"
												alt="">
										</div>
									</div>
									<div class="col-3">
										<div class="thumbnails-img">
											<!-- 이미지 4 -->
											<img src="./assets/images/products/product-single-img-4.jpg"
												alt="">
										</div>
									</div>
								</div>
							</div>
						</div>

						<!--  상세보기 이미지 내용 -->
						<div class="col-lg-6">
							<div class="ps-lg-8 mt-6 mt-lg-0">
								<a href="#!" class="mb-4 d-block">뭐 어쩌고 저쩌고</a>
								<h2 class="mb-1 h1">상품 제목</h2>
								<!--  별점  -->
								<div class="mb-4">
									<small class="text-warning"> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small><a
										href="#" class="ms-2">(30 reviews)</a>
								</div>

								<!-- 가격 -->
								<div class="fs-4">
									<span class="fw-bold text-dark">$실제가격</span> <span
										class="text-decoration-line-through text-muted">$할인가격</span><span><small
										class="fs-6 ms-2 text-danger">할인률% Off</small></span>
								</div>
								<hr class="my-6">

								<!--  버튼  -->
								<div class="mb-4">
									<button type="button" class="btn btn-outline-secondary">
										버튼1</button>
									<button type="button" class="btn btn-outline-secondary">
										버튼2</button>
									<button type="button" class="btn btn-outline-secondary">
										버튼3</button>
								</div>

								<!--  수량 증감소 -->
								<div>
									<!-- input -->
									<div class="input-group input-spinner  ">
										<input type="button" value="-"
											class="button-minus  btn  btn-sm " data-field="quantity">
										<input type="number" step="1" max="10" value="1"
											name="quantity"
											class="quantity-field form-control-sm form-input   ">
										<input type="button" value="+" class="button-plus btn btn-sm "
											data-field="quantity">
									</div>
								</div>
								<div
									class="mt-3 row justify-content-start g-2 align-items-center">

									<div class="col-lg-4 col-md-5 col-6 d-grid">
										<!-- button -->
										<!-- btn -->
										<button type="button" class="btn btn-primary">
											<i class="feather-icon icon-shopping-bag me-2"></i> 장바구니 담기
										</button>
									</div>


									<div class="col-md-4 col-5">
										<!-- 버튼 1 -->
										<a class="btn btn-light" href="#" data-bs-toggle="tooltip"
											data-bs-html="true" aria-label="Compare"><i
											class="bi bi-arrow-left-right"></i></a>

										<!-- 버튼 2 찜하기? -->
										<a class="btn btn-light" href="#!" data-bs-toggle="tooltip"
											data-bs-html="true" aria-label="Wishlist"><i
											class="feather-icon icon-heart"></i></a>
									</div>
								</div>

								<!--  상품 정보 -->
								<hr class="my-6">
								<div>
									<table class="table table-borderless">
										<tbody>
											<tr>
												<td>대략적 상품정보 노출?</td>
												<td>값</td>
											</tr>
											<tr>
												<td>Availability:</td>
												<td>In Stock</td>
											</tr>
											<tr>
												<td>Type:</td>
												<td>Fruits</td>
											</tr>
											<tr>
												<td>Shipping:</td>
												<td><small>01 day
														shipping.<span class="text-muted">(
															Free pickup today)</span>
												</small></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="common/footerFo.jsp"%>

</body>

</html>