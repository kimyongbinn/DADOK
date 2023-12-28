package com.choongang.s202350103.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberQ {

	private int m_num;			// 회원 번호
	private int mq_num;			// 회원 문의번호
	private String mq_title;	// 회원 문의 제목
	private String mq_content;	// 회원 문의 내용
	private Date mq_date;		// 회원 문의 작성일
	private int mq_hidden;		// 회원 문의 비밀글 여부
	
	// 조회용 (문의 작성자)
	private String 	m_id;		// 회원 아이디
	private String 	m_name;		// 회원 이름
	private String	m_addr;		// 회원 주소 
	private String 	m_email;	// 회원 이메일
	private String  m_image;	// 회원 이미지
	private int 	m_admin;	// 관리자 여부
	
	// 조회용 (답글 및 답글 작성자)
	private int 	mqr_num;		// 답변 번호
	private int 	m_num_write;	// 게시글 작성자
	private String 	mqr_content;	// 답글 내용
	private Date	mqr_date;		// 답글 작성일
	private int 	mqr_recomen;	// 답글 추천수
	private int 	mqr_decl; 		// 댓글 신고수
	private int 	mqr_decl_val;	// 신고 유형
	
	// 페이징 
	private String  pageNum;		
	private int     start;		
	private int 	end;
	
}
