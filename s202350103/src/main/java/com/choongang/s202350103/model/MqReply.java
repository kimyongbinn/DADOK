package com.choongang.s202350103.model;

import java.util.Date;

import lombok.Data;

@Data
public class MqReply {

	private int 	mqr_num;		// 답변 번호
	private int 	m_num;			// 답글 작성자
	private int 	m_num_write;	// 게시글 작성자
	private int 	mq_num;			// 문의글 번호
	private String 	mqr_content;	// 답글 내용
	private Date	mqr_date;		// 답글 작성일
	private int 	mqr_recomen;	// 답글 추천수
	private int 	mqr_decl; 		// 댓글 신고수
	private int 	mqr_decl_val;	// 신고 유형
	private int 	mqr_recomen_by;	// 답글 추천인 
}
