package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class OrderDetail {			// 주문_상세
	private int    o_order_num;		// 주문번호
	private int	   nb_num;			// 상품번호(신/중고)
	private int	   o_de_count;		// 주문수량
	private int	   o_de_prodtype;	// 상품유형
	
	// 조회용
	private String nb_title;		// 상품명
	private int	   nb_price;		// 상품가격
}