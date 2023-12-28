package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class PointCharge {
	private int chargeAmount;	// 충전금액
	private int m_num;			// 회원정보
	private int o_pay_type;		// 결제유형(카카오페이)
}
