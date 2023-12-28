package com.choongang.s202350103.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.choongang.s202350103.ybService.AdminAuthorityInterCeptor;
import com.choongang.s202350103.ybService.ReturnPageInterCeptor;
import com.choongang.s202350103.ybService.LoginInterCeptor;
import com.choongang.s202350103.yjService.YjInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	@Override					//bean 안걸어줘도 됨
	public void addInterceptors(InterceptorRegistry registry) {
		// 로그인 관련 InterCeptor (비로그인 시 접근 막을 페이지)					
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/memberMyPage");					// 마이페이지
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/adminMemberList");				// 회원목록
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/memberCartList");					// 장바구니
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/foGivingGift");					// 선물하기
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/foOrderDetail");					// 마이페이지 - 주문상세
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/writeForm");						// 커뮤니티 글 등록
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/searchBook");						// 커뮤니티 글 등록 책 선택
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/FodetailOb");						// 마이페이지 - 정산화면
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/eventIn");						// 이벤트 페이지
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/reviewList");						// 제품별 리뷰 리스트
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/MyReviewList");					// 나의 리뷰 리스트(작성 가능한 리스트)
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/MyReviewedList");					// 나의 리뷰 리스트(작성한 리스트)
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/reviewForm");						// 리뷰 등록
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/orderForm");						// 주문 등록
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/memberMyCommunity");				// 커뮤니티 내 게시물
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/memberPointList");				// 내 포인트리스트
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/writeOb");               			// 중고판매 신청완료
	    registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/writeFormObCal");         	   	// 중고판매 정산안내
	    registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/writeFormObTrans");       	  	// 중고판매 운송장
	    registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/eventIn"); 						// 이벤트 페이지
	    
		// 영준 InterCeptor (Parameter로 다룬 페이지)
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyOrder"); 					// 내 주문
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyInfo");						// 내 정보
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberQna");							// 질문 등록
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberQnaOne");						// 1:1 문의
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyOna");						// 내 질문
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberPointList");					// 내 포인트 이력
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/myMqDelete");						// 내 문의 삭제
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyReply");						// 내 댓글
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyPage");						// 마이페이지
		
		// 로그인 후 관리자 권한 InterCeptor (비관리자 접근 막을 페이지)
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/mainBo");				// 관리자 메인
//		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/adminMemberList");		// 관리자 회원목록
//		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/adminMemberInfo");		// 관리자 회원상세
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/memberSearch");			// 관리자 회원검색
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boOrderList");			// 관리자 주문목록
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boOrderDetail");		// 관리자 주문상세
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/BodetailOb");			// 관리자 중고 검수내역
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/BolistOb");				// 관리자 중고 판매 내역
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boNewbookDetail");		// 관리자 상품목록
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/bonewbookList");		// 관리자 상품상세
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/bonewbookInsert");		// 관리자 상품등록
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boSearchNewbookList");	// 관리자 상품검색
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boEventList");			// 관리자 이벤트목록
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boAttendance");			// 관리자 이벤트(출석) 생성
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boQuiz");				// 관리자 이벤트(퀴즈) 생성
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/selectMemberPoint");	// 관리자 회원 포인트 수정
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boEventDetail");		// 관리자 이벤트 정보 수정
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boEventList");			// 관리자 이벤트 목록
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boJoinedMember");		// 관리자 이벤트 포인트 내역
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/adminDeclReply");		// 관리자 신고 답글 관리
		
		
		
		// 로그인 인터셉터 이후 이전 페이지로 돌아가기
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/memberMyCommunity");			// 내 독후감목록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/memberMyPage");				// 마이페이지
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/memberCartList");			// 장바구니
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/foGivingGift");				// 선물하기
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/foOrderDetail");				// 마이페이지 - 주문상세
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/writeForm");					// 커뮤니티 글 등록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/searchBook");				// 커뮤니티 글 등록 책 선택
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/FodetailOb");				// 마이페이지 - 정산화면
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/eventIn");					// 이벤트 페이지
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/reviewList");				// 제품별 리뷰 리스트
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/MyReviewList");				// 나의 리뷰 리스트(작성 가능한 리스트)
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/MyReviewedList");			// 나의 리뷰 리스트(작성한 리스트)
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/reviewForm");				// 리뷰 등록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/orderForm");					// 주문 등록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/memberMyCommunity");			// 커뮤니티 내 게시물
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/memberPointList");			// 커뮤니티 내 게시물
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/writeOb");               	// 중고판매 신청완료
	    registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/writeFormObCal");         	// 중고판매 정산안내
	    registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/writeFormObTrans");       	// 중고판매 운송장
	    registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/eventIn"); 					// 이벤트 페이지
//      ---------------------------------- 관리자 ----------------------
	    registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/mainBo");					// 관리자 메인
//		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/adminMemberList");			// 관리자 회원목록
//		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/adminMemberInfo");			// 관리자 회원상세
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/memberSearch");				// 관리자 회원검색
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boOrderList");				// 관리자 주문목록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boOrderDetail");				// 관리자 주문상세
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/BodetailOb");				// 관리자 중고 검수내역
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/BolistOb");					// 관리자 중고 판매 내역
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boNewbookDetail");			// 관리자 상품목록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/bonewbookList");				// 관리자 상품상세
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/bonewbookInsert");			// 관리자 상품등록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boSearchNewbookList");		// 관리자 상품검색
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boEventList");				// 관리자 이벤트목록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boAttendance");				// 관리자 이벤트(출석) 생성
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boQuiz");					// 관리자 이벤트(퀴즈) 생성
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/selectMemberPoint");			// 관리자 회원 포인트 수정
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boEventDetail");				// 관리자 이벤트 정보 수정
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boEventList");				// 관리자 이벤트 목록
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/boJoinedMember");			// 관리자 이벤트 포인트 내역
		registry.addInterceptor(new ReturnPageInterCeptor()).addPathPatterns("/adminDeclReply");			// 관리자 신고 답글 관리
	
	}
}