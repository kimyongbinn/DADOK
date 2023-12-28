package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class AttJoin {				//출석부_참여
	private int    	m_num;			//회원번호
	private int    	a_num;			//이벤트번호
	private Date   	a_par_pdate;	//참여일자
	
	//연속 출석용
	private int		a_add;			//연속출석 일자		
}
