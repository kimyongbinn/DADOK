package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class WishList {		// 찜하기
	private int 	m_num; 		// 회원번호
	private int 	nb_num;		// 상품번호
	private int 	w_wish;	// 찜여부
	
	// 조회용
	private String  nb_title;
	private String	nb_price;
	private String	nb_writer;
	private String  nb_publisher;
	private String 	nb_image;
	private int  	totalPrice;
	
	// 페이징
	private String  pageNum;	// 페이지	
	private int     start;		
	private int 	end;
}
