package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class OrderExch {		 // 주문_교환
	private int    o_order_num;  // 주문번호
	private String o_ex_num;	 // 교환번호
	private Date   o_ex_date;    // 교환일자
	private int    o_ex_deli;    // 교환 택배사
	private int    o_ex_track;   // 교환 송장번호
}
