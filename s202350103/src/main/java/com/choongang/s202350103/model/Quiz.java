package com.choongang.s202350103.model;


import lombok.Data;

@Data
public class Quiz {					//퀴즈
	private int    	q_num;			//이벤트번호
	private String 	q_title;		//이벤트제목
	private String 	q_sdate;		//시작일자
	private String 	q_edate;		//종료일자
	private String 	q_image;		//기본이미지
	private int    	q_point;		//지급포인트
	private String 	q_question;		//객관식문제
	private String 	q_select1;		//객관식선지1
	private String 	q_select2;		//객관식선지2
	private String 	q_select3;		//객관식선지3
	private String 	q_select4;		//객관식선지4
	private int    	q_answer;		//객관식정답 
	
	//컨트럴용 이벤트 번호
	private int eNum;
}
