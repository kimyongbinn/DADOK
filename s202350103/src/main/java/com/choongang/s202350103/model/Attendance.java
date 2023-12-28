package com.choongang.s202350103.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Attendance {				//출석부
	private int    	 a_num;				//이벤트번호
	private String   a_title;			//이벤트제목
	private String   a_sdate;			//시작일자
	private String   a_edate;			//종료일자
	private String 	 a_image;			//기본이미지
	private int    	 a_point;			//지급포인트
	private int    	 a_add;				//연속출석조건
	private int    	 a_addpoint;		//추가지급포인트
	
	// 이벤트 정렬 및 말머리 조회용
	private int event_type;				// 출석, 퀴즈 유형
	private int event_status;			// 이벤트 진행상태 확인용
	
	//이벤트 조회용(Quiz)
	private int 	rn;				//count(row)
	private int    	q_num;			//이벤트번호
	private String 	q_title;		//이벤트제목
	private String 	q_sdate;		//시작일자
	private String 	q_edate;		//종료일자
	private String 	q_image;		//기본이미지
	
	//페이징용(Paging)
	private int start;
	private int end;
	
	//이벤트 정보 수정용
	private MultipartFile file1;
	
}
