package com.choongang.s202350103.shDao;

import java.util.List;

import com.choongang.s202350103.model.AttJoin;
import com.choongang.s202350103.model.Attendance;

public interface AttendanceDao {
	
	// 출석 이벤트 갯수
	int 			 totalAtt();
	//EventList.이벤트 번호 받아오기 위함 메소드
	List<Attendance> listEvent(Attendance attendance);
	int 			 divideAttNum(int eNum);
	Attendance 		 attendance(int eNum);
	int 			 startMonth(int eNum);
	int 			 startYear(int eNum);
	int 			 createAtt(Attendance attendance);
	List<Attendance> boEventList(Attendance attendance);
	int 			 updateAttendance(Attendance attendance);
	List<Attendance> searchEvent(Attendance attendance);
	int 			 deleteAtt(int a_num);
	List<Attendance> searchDetail11(Attendance attendance);
	List<Attendance> searchDetail12(Attendance attendance);
	List<Attendance> searchDetail13(Attendance attendance);
	int 			 checkAddAtt(int a_num);

	

}
