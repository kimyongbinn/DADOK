package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class OrderGift {		  // 주문_선물
	private long   o_order_num;   // 주문번호
	private String o_gift_num;    // 선물번호
//	private String o_gift_name;   // 받는사람_이름
//	private String o_gift_ph;     // 받는사람_전화번호
	private int    o_gift_card;   // 선물카드
	private String o_gift_msg;    // 선물메세지
	private int    o_gift_accept; // 수락여부
}
