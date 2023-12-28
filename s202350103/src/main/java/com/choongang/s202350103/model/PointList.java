package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class PointList {			//포인트 이력
	private int    	p_num;			//적립번호
	private long   	o_order_num;	//주문번호
	private int    	m_num;			//회원번호
	private int    	a_num;			//이벤트번호(출석)
	private int    	q_num;			//이벤트번호(퀴즈)
	private Date   	a_par_pdate;	//참여일자
	private int   	p_list_type;	//적립유형
	private int   	m_point;		//포인트
	
	// 조회용
	private int		eNum;			//이벤트번호 종합
	private String 	title;			//이벤트제목
	private int    	point;			//이벤트 지급포인트
	private Date    date1;			//이벤트 지급날짜
	private int     type1;			//이벤트 유형
	private int		rn;				//rownum
	private String  date;			//참가인원 조회용

   // 페이징 작업용
   private String  pageNum;      // 페이지   
   private int     start;         // 첫 페이지
   private int     end;         // 마지막 페이지
}

