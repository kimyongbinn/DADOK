package com.choongang.s202350103.gbDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.TotalOrder;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TotalOrderDao {
	
	private final SqlSession session;
	
	public int selectMonthTotalIncome() {
		System.out.println("TotalOrderDao selectMonthTotalIncome start...");
		int monthTotalIncome = 0;
		
		try {
			monthTotalIncome = session.selectOne("gbSelectMonthTotalIncome");
			System.out.println("TotalOrderDao selectMonthTotalIncome monthTotalIncome -> "+monthTotalIncome);
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectMonthTotalIncome Exception -> "+e.getMessage());
		}
		
		return monthTotalIncome;
	}

	public int selectMonthTotalCnt() {
		System.out.println("TotalOrderDao selectMonthTotalCnt start...");
		int monthTotalCnt = 0;
		
		try {
			monthTotalCnt = session.selectOne("gbSelectMonthTotalCnt");
			System.out.println("TotalOrderDao selectMonthTotalCnt monthTotalCnt -> "+monthTotalCnt);
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectMonthTotalCnt Exception -> "+e.getMessage());
		}
		
		return monthTotalCnt;
	}

	public int selectMonthTotalNewMember() {
		System.out.println("TotalOrderDao selectMonthTotalNewMember start...");
		int monthTotalNewMember = 0;
		
		try {
			monthTotalNewMember = session.selectOne("gbSelectMonthTotalNewMember");
			System.out.println("TotalOrderDao selectMonthTotalNewMember monthTotalCnt -> "+monthTotalNewMember);
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectMonthTotalNewMember Exception -> "+e.getMessage());
		}
		
		return monthTotalNewMember;
	}

	public int selectLastTotalIncome() {
		System.out.println("TotalOrderDao selectLastTotalIncome start...");
		int lastTotalIncome = 0;
		
		try {
			lastTotalIncome = session.selectOne("gbSelectLastTotalIncome");
			System.out.println("TotalOrderDao selectLastTotalIncome lastTotalIncome -> "+lastTotalIncome);
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectLastTotalIncome Exception -> "+e.getMessage());
		}
		
		return lastTotalIncome;
	}

	public int selectLastTotalCnt() {
		System.out.println("TotalOrderDao selectLastTotalCnt start...");
		int lastTotalCnt = 0;
		
		try {
			lastTotalCnt = session.selectOne("gbSelectLastTotalCnt");
			System.out.println("TotalOrderDao selectLastTotalCnt lastTotalCnt -> "+lastTotalCnt);
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectLastTotalCnt Exception -> "+e.getMessage());
		}
		
		return lastTotalCnt;
	}

	public int selectLastTotalNewMember() {
		System.out.println("TotalOrderDao selectLastTotalNewMember start...");
		int lastTotalNewMember = 0;
		
		try {
			lastTotalNewMember = session.selectOne("gbSelectLastTotalNewMember");
			System.out.println("TotalOrderDao selectLastTotalNewMember lastTotalNewMember -> "+lastTotalNewMember);
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectLastTotalNewMember Exception -> "+e.getMessage());
		}
		
		return lastTotalNewMember;
	}

	public void selectYearOrderCnt(HashMap<String, Object> map) {
		System.out.println("TotalOrderDao selectYearOrderCnt start...");
		
		try {
			session.selectOne("gbSelectYearOrderCnt", map);
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectYearOrderCnt Exception -> "+e.getMessage());
		}
		
	}

	public void selectYearReturnCnt(HashMap<String, Object> map) {
		System.out.println("TotalOrderDao selectYearReturnCnt start...");
		
		try {
			session.selectOne("gbSelectYearReturnCnt", map);
			System.out.println("TotalOrderDao selectYearReturnCnt end...");
		} catch (Exception e) {
			System.out.println("TotalOrderDao selectYearReturnCnt Exception -> "+e.getMessage());
		}
		
	}

}
