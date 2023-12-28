package com.choongang.s202350103.shService;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choongang.s202350103.shDao.AttJoinDao;
import com.choongang.s202350103.shDao.AttendanceDao;
import com.choongang.s202350103.shDao.PointListDao;
import com.choongang.s202350103.shDao.QuizDao;
import com.choongang.s202350103.shDao.QuizJoinDao;
import com.choongang.s202350103.model.AttJoin;
import com.choongang.s202350103.model.Attendance;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.Quiz;
import com.choongang.s202350103.model.QuizJoin;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointServiceImpl implements PointService {

	private final AttendanceDao ad;
	private final QuizDao		qd;
	private final AttJoinDao	ajd;
	private final QuizJoinDao	qjd;
	private final PointListDao  pld;
	
	@Override
	public int totalAtt() {
		System.out.println("PointService totalAtt() Start..");
		int totalAtt = ad.totalAtt();
		System.out.println("PointService totalAtt()->"+ totalAtt);
		return totalAtt;
	}

	@Override
	public int totalQuiz() {
		System.out.println("PointService totalQuiz() Start..");
		int totalQuiz = qd.totalQuiz();
		System.out.println("PointService totalQuiz()->"+ totalQuiz);
		return totalQuiz;
	}

	@Override
	public List<Attendance> listEvent(Attendance attendance) {
		System.out.println("PointService listEvent() Start..");
		List<Attendance> eventList = ad.listEvent(attendance);
		System.out.println("PointService listEvent().size()->"+eventList.size());
		return eventList;
	}

	@Override
	public Attendance detailAttendance(int eNum) {
		System.out.println("PointService listAttendance() Start...");
		Attendance attendance = ad.attendance(eNum);
		return attendance;
	}
	
	@Override
	public int divideAttNum(int eNum) {
		System.out.println("PointService divideAttNum() Start...");
		int num = ad.divideAttNum(eNum);
		System.out.println("PointService divideAttNum() num->"+num);
		return num;
	}

	@Override
	public List<AttJoin> listAttJoin(AttJoin attJoin) {
		System.out.println("PointService listAttJoin() Start...");
		List<AttJoin> attJoinList = ajd.listAttJoin(attJoin);
		System.out.println("PointService listAttJoin.size()->"+attJoinList.size());
		return attJoinList;
	}

	@Override
	public Quiz detailQuiz(int eNum) {
		System.out.println("PointService detailQuiz() Start...");
		Quiz quiz = qd.quiz(eNum);
		return quiz;
	}

	@Override
	public List<QuizJoin> listQuizJoin(int m_num) {
		System.out.println("PointService listAttJoin() Start...");
		List<QuizJoin> quizJoinList = qjd.listQuizJoin(m_num);
		return quizJoinList;
	}

	@Override
	public int startMonth(int eNum) {
		int sMonth = ad.startMonth(eNum);
		return sMonth;
	}

	@Override
	public int startYear(int eNum) {
		int sYear = ad.startYear(eNum);
		return sYear;
	}

	@Override
	public int createAtt(Attendance attendance) {
		int result = ad.createAtt(attendance);
		return result;
	}

	@Override
	public List<AttJoin> subDate(AttJoin attJoin) {
		List<AttJoin> dateList = ajd.subDate(attJoin);
		return dateList;
	}

	@Override
	public void checkAtt(AttJoin attJoin) {
		ajd.checkAtt(attJoin);
	}

	@Override
	public int checkChance(AttJoin attJoin) {
		int chance = ajd.checkChance(attJoin);
		return chance;
	}

	@Override
	public int checkChance(QuizJoin quizJoin) {
		int chance = qjd.checkChance(quizJoin);
		return chance;
	}

	@Override
	public void checkedAnswer(QuizJoin quizJoin) {
		qjd.checkedAnswer(quizJoin);
	}

	@Override
	public void savePoint(QuizJoin quizJoin) {
		qjd.savePoint(quizJoin);
	}

	@Override
	public AttJoin searchAtt(AttJoin attJoin) {
		attJoin = ajd.searchAtt(attJoin);
		return attJoin;
	}

	@Override
	public QuizJoin searchQuiz(QuizJoin quizJoin) {
		quizJoin = qjd.searchQuiz(quizJoin);
		return quizJoin;
	}

	@Override
	public void quizPointList(QuizJoin quizJoin) {
		qjd.quizPointList(quizJoin);
		
	}

	@Override
	public int addAtt(AttJoin attJoin) {
		System.out.println("PointService addAtt() Start..");
		int count = ajd.addAtt(attJoin);
		return count;
	}

	@Override
	public void stampAddAtt(AttJoin attJoin) {
		System.out.println("PointService stampAddAtt() Start..");
		ajd.stampAddAtt(attJoin);
	}
	
	@Override
	public void saveAddAtt(AttJoin attJoin) {
		System.out.println("PointService saveAddAtt() Start..");
		ajd.saveAddAtt(attJoin);
	}

	@Override
	public void searchAddAtt(AttJoin attJoin) {
		System.out.println("PointService searchAddAtt() Start..");
		ajd.searchAddAtt(attJoin);
	}

	@Override
	public int createQuiz(Quiz quiz) {
		System.out.println("PointService createQuiz() Start..");
		int result = qd.createQuiz(quiz);
		return result;
	}

	@Override
	public List<Attendance> boEventList(Attendance attendance) {
		System.out.println("PointService boEventList() Start...");
		List<Attendance> attendanceList = ad.boEventList(attendance);
		return attendanceList;
	}

	@Override
	public int updateQuiz(Quiz quiz) {
		System.out.println("PointService updateQuiz() Start..");
		int result = qd.updateQuiz(quiz);
		return result;
	}

	@Override
	public int updateAttendance(Attendance attendance) {
		System.out.println("PointService updateAttendance() Start..");
		int result = ad.updateAttendance(attendance);
		return result;
	}
	
	@Override
	public List<Attendance> searchEvent(Attendance attendance) {
		System.out.println("PointService searchEvent() Start..");
		List<Attendance> boEventList = ad.searchEvent(attendance);
		return boEventList;
	}

	@Override
	public List<PointList> selectMemberPoint(Member member) {
		System.out.println("PointService selectMemberPoint() Start..");
		List<PointList> memberPointList = pld.selectMemberPoint(member);
		return memberPointList;
	}

	@Override
	public int pointSum(int m_num) {
		System.out.println("PointService pointSum() Start..");
		int sum = pld.pointSum(m_num);
		return sum;
	}

	@Override
	public int boUpdatePlusPoint(Member member) {
		System.out.println("PointService boUpdatePlusPoint() Start..");
		int updateResult = pld.boUpdatePlusPoint(member);
		return updateResult;
	}

	@Override
	public int boInsertPlusPoint(Member member) {
		System.out.println("PointService boInsertPlusPoint() Start..");
		int insertResult = pld.boInsertPlusPoint(member);
		return insertResult;
	}

	@Override
	public int boInsertMinusPoint(Member member) {
		System.out.println("PointService boInsertMinusPoint() Start..");
		int insertResult = pld.boInsertMinusPoint(member);
		return insertResult;
	}

	@Override
	public int boUpdateMinusPoint(Member member) {
		System.out.println("PointService boUpdateMinusPoint() Start..");
		int updateResult = pld.boUpdateMinusPoint(member);
		return updateResult;
	}

	@Override
	public int checkAddAtt(int a_num) {
		System.out.println("PointService checkAddAtt() Start...");
		int addAtt = ad.checkAddAtt(a_num);
		return addAtt;
	}

	@Override
	public int countAttRow(AttJoin attJoin) {
		System.out.println("PointService countAttRow() Start...");
		int rowCount = ajd.countAttRow(attJoin);
		return rowCount;
	}

	@Override
	public int deleteAtt(int a_num) {
		System.out.println("PointService deleteAtt() Start...");
		int result = ad.deleteAtt(a_num);
		return result;
	}

	@Override
	public int deleteQuiz(int q_num) {
		System.out.println("PointService deleteQuiz() Start..");
		int result = qd.deleteQuiz(q_num);
		return result;
	}
	
	@Override
	public int joinedList(int eNum) {
		System.out.println("PointService joinedList() Start..");
		int result = pld.joinedList(eNum);
		return result;
	}

	@Override
	public List<PointList> boJoinedMember(Attendance attendance) {
		System.out.println("PointService boJoinedMember() Start...");
		List<PointList> pointList = pld.boJoinedMember(attendance); 
		return pointList;
	}

	@Override
	public int memberPointList(int m_num) {
		System.out.println("PointService memberPointList Start...");
		int result = pld.memberPointList(m_num);
		return result;
	}

	@Override
	public int joinedCount(int eNum) {
		System.out.println("PointService JoinedCount start");
		int count = pld.joinedCount(eNum);
		return count;
	}
	
	@Override
	public List<PointList> boMemberSelect(PointList pointList) {
		System.out.println("PointService boMemberSelect start");
		List<PointList> pointListList = pld.boMemberSelect(pointList);
		return pointListList;
	}

	@Override
	public int joinedCountSelect(int eNum) {
		System.out.println("PointService joinedCountSelect start");
		int count = pld.joinedCountSelect(eNum);
		return count;
	}

	@Override
	public List<Attendance> searchDetail11(Attendance attendance) {
		System.out.println("PointService searchDetail11 start");
		List<Attendance> list = ad.searchDetail11(attendance);
		return list;
	}

	@Override
	public List<Attendance> searchDetail12(Attendance attendance) {
		System.out.println("PointService searchDetail12 start");
		List<Attendance> list = ad.searchDetail12(attendance);
		return list;
	}

	@Override
	public List<Attendance> searchDetail13(Attendance attendance) {
		System.out.println("PointService searchDetail13 start");
		List<Attendance> list = null;
		list = ad.searchDetail13(attendance);
		return null;
	}

}
