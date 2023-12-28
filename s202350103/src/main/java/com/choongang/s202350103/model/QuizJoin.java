package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class QuizJoin {				//퀴즈_참여
	private int    m_num;			//회원번호
	private int    q_num;			//이벤트번호
	private Date   q_par_pdate;		//참여일자
}
