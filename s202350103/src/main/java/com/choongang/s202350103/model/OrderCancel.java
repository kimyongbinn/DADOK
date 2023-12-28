package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class OrderCancel {		 // 주문_취소
	private int    o_order_num;  // 주문번호
	private String o_can_num;    // 취소번호
	private Date   o_can_date;   // 취소일자
}
