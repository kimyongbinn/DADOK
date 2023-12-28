package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class Review {			  // 리뷰
	private long   o_order_num;   // 주문번호
	private int    nb_num;		  // 상품번호
	private String r_title;		  // 리뷰제목
	private String r_content;	  // 리뷰내용
	private Date   r_create_date; // 리뷰등록일
	private int    r_rating;	  // 별점
	
	// 조회용
	private int    start = 1;	private int end = 5;  private int currentPage;
	private int	    m_num;	     // 회원번호
	private String 	m_name;      // 회원이름
	private String  m_image;	// 회원 이미지
	private String  nb_image;    // 상품 이미지
	private String  nb_title;    // 상품 제목
	private int     o_de_count;  // 주문 수량
	private Date    o_order_date;// 주문일자
    // r_rating 별점을 1~5까지 구분해서 받음(total개수 또는 평균값)
	private int    r_rating1;
	private int    r_rating2;
	private int    r_rating3;
	private int    r_rating4;
	private int    r_rating5;
	
	private int    r_review_total;   // 리뷰 총수량
	private double r_review_average; // 리뷰 평균
	private int    r_reviewSelect ;  // 리뷰 리스트 조회선택(1-> 최신순, 2-> 별점순)

	private int    p_status;         // 제품 상세페이지에서 리뷰 페이지로 포커스 이동할 경우 사용
}