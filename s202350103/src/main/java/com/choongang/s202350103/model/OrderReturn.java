package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class OrderReturn {		 // 주문_교환
	private int    o_order_num;  // 주문번호
	private String o_re_num;     // 반품번호
	private Date   o_re_date;    // 반품일자
	private int    o_re_deli;    // 반품택배사
	private int    o_re_track;   // 반품송장번호
}
