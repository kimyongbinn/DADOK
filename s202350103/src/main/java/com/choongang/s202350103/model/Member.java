package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class Member {					// 회원
		private int 	m_num;			// 회원 번호
		private String 	m_id;			// 회원 아이디
		private String 	m_name;			// 회원 이름
		private String	m_pw;			// 회원 비밀번호
		private String 	m_ph;			// 회원 전화번호
		private String	m_addr;			// 회원 주소 
		private String 	m_email;		// 회원 이메일
		private String 	m_birth; 		// 회원 생일
		private Date 	m_date;			// 회원 가입일
		private int	 	m_point;		// 회원 포인트
		private int 	m_admin;		// 관리자 여부
		private int 	m_wd;			// 탈퇴자 여부 
		private String  m_image;		// 회원 이미지
		
					 // 조회 및 join 용	
		
		// 회원
		private String  m_reid; 		// 추천인 ID
		
		// 페이징 작업용
		private String  pageNum;		// 페이지	
		private int     start;			// 첫 페이지
		private int 	end;			// 마지막 페이지
		
		// 회원 검색 용 
		private String search;   		// 검색어
		private String keyword;			// 검색조건
		
		// 리뷰
		private long   o_order_num; 	// 주문번호
		private int    nb_num;		  	// 상품번호
		private Date   r_create_date; 	// 리뷰등록일
		private String nb_image;		// 상품 이미지
		private String nb_title;		// 상품 제목
		private String nb_writer;		// 상품 저자
		private String r_title;		  	// 리뷰제목
		private String r_content;	 	// 리뷰내용
		private int    r_rating;	 	// 별점
		
		// 주문조회
		private Date   o_order_date;	// 주문일자
		private String o_rec_name;		// 수령_이름
		private int	   o_pay_price;		// 결제금액
		private int	   o_status;		// 주문상태
		private int    o_de_count;		// 주문수량
		private int    o_type;			// 주문유형
		private int    nb_price;		// 도서가격	
		
}
