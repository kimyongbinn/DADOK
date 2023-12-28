package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class Refund {			   // 환불
	private int    o_order_num;    // 주문번호
	private String r_refund_num;   // 환불번호
	private int    r_bank;		   // 환불은행
	private int    r_bank_num;	   // 환불계좌
	private String r_bank_name;    // 환불예금주명
	private String r_refund_type;  // 환불유형
}
