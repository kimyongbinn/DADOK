package com.choongang.s202350103.model;

import java.util.Date;

import lombok.Data;

@Data
public class Community {
	private int 	cm_num;				// 게시글 번호
	private int 	m_num;				// 회원 번호
	private int     nb_num;
	private String 	cm_title;			// 게시글 제목		
	private String 	cm_content;			// 게시글 내용
	private String  cm_readCnt;
	private String	cm_image;			// 이미지
	private int 	cm_hitCnt;			// 조회수
	private int 	cm_rating;
	private Date 	cm_regDate; 		// 게시글 등록일
	private String	cm_image1;			// 업로드이미지1
	private String	cm_image2;			// 업로드이미지2
	// 페이징 작업용
	private String  pageNum;			// 페이지	
	private int     start;				// 첫 페이지
	private int 	end;				// 마지막 페이지
	
	// 조회용
	private String nb_title;			// 제목
	private String nb_writer;			// 작가
	private String nb_publisher;		// 출판사
	private String m_name;				// 회원 이름
	
	
}
