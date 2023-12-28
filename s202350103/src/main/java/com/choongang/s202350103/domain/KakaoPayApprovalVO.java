package com.choongang.s202350103.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApprovalVO { // 카카오페이에서 결과값 받는 DTO
	//response
    private String aid;
    private String tid; //결제 고유번호, 결제 준비 API 응답에 포함
    private String cid; //가맹점 코드
    private String cid_secret; //가맹점 코드 인증키
    private String sid; 
    private String partner_order_id; //가맹점 주문번호, 결제 준비 API 요청과 일치해야 함
    private String partner_user_id;  // 가맹점 회원 id, 결제 준비 API 요청과 일치해야 함
    private String payment_method_type;  // 결제 수단, CARD 또는 MONEY 중 하나
    private AmountVO amount;
    private CardVO card_info;  // 결제 상세 정보, 결제수단이 카드일 경우만 포함
    private String item_name;  // 상품 이름, 최대 100자
    private String item_code;  // 상품 코드, 최대 100자
    private String payload;    // 결제 승인 요청에 대해 저장한 값, 요청 시 전달된 내용
    private Integer quantity;  // 상품 수량
    private Integer tax_free_amount; 
    private Integer vat_amount;      
    private Date created_at;  // 결제 준비 요청 시각
    private Date approved_at; // 결제 승인 시각
    private Integer install_month;	// 카드 할부개월, 0~12 (-> o_type 선물여부로 사용)
    private Integer green_deposit; //중고번호
    
}