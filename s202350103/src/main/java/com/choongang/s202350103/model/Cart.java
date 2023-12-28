package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class Cart {				// 장바구니
	private int 	m_num; 		// 회원번호
	private int 	nb_num;		// 상품번호
	private int 	c_count;	// 상품개수

	// 조회용
	private String  nb_title;
	private int  	nb_price;
	private String	nb_writer;
	private String  nb_publisher;
	private String 	nb_image;
	private int  	totalPrice;    // 총 결제 금액
	private int  	o_deliv_price; // 배송비
	private int		ob_num;		   //중고상품번호
	private int     quantity;      // 총 결제 수량
	// 페이징 작업용
	private String  pageNum;	// 페이지	
	private int     start;		
	private int 	end;
	
	
}
