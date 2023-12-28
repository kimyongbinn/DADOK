package com.choongang.s202350103.gbService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.gbDao.TotalOrderDao;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.TotalOrder;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TotalOrderService {
	
	private final TotalOrderDao tod;
	
	public int selectMonthTotalIncome() {
		System.out.println("TotalOrderService selectMonthTotalIncome start...");
		int monthTotalIncome = tod.selectMonthTotalIncome();
		System.out.println("TotalOrderService selectMonthTotalIncome monthTotalIncome -> "+monthTotalIncome);
		
		return monthTotalIncome;
	}

	public int selectMonthTotalCnt() {
		System.out.println("TotalOrderService selectMonthTotalCnt start...");
		int monthTotalCnt = tod.selectMonthTotalCnt();
		System.out.println("TotalOrderService selectMonthTotalCnt monthTotalCnt -> "+monthTotalCnt);
		
		return monthTotalCnt;
	}

	public int selectMonthTotalNewMember() {
		System.out.println("TotalOrderService selectMonthTotalNewMember start...");
		int monthTotalNewMember = tod.selectMonthTotalNewMember();
		System.out.println("TotalOrderService selectMonthTotalNewMember monthTotalCnt -> "+monthTotalNewMember);
		
		return monthTotalNewMember;
	}

	public int selectLastTotalIncome() {
		System.out.println("TotalOrderService selectLastTotalIncome start...");
		int lastTotalIncome = tod.selectLastTotalIncome();
		System.out.println("TotalOrderService selectLastTotalIncome lastTotalIncome -> "+lastTotalIncome);
		
		return lastTotalIncome;
	}

	public int selectLastTotalCnt() {
		System.out.println("TotalOrderService selectLastTotalCnt start...");
		int lastTotalCnt = tod.selectLastTotalCnt();
		System.out.println("TotalOrderService selectLastTotalCnt lastTotalCnt -> "+lastTotalCnt);
		
		return lastTotalCnt;
	}

	public int selectLastTotalNewMember() {
		System.out.println("TotalOrderService selectLastTotalNewMember start...");
		int lastTotalNewMember = tod.selectLastTotalNewMember();
		System.out.println("TotalOrderService selectLastTotalNewMember lastTotalNewMember -> "+lastTotalNewMember);
		
		return lastTotalNewMember;
	}

	public void selectYearOrderCnt(HashMap<String, Object> map) {
		System.out.println("TotalOrderService selectYearOrderCnt start...");
		tod.selectYearOrderCnt(map);
		
	}

	public void selectYearReturnCnt(HashMap<String, Object> map) {
		System.out.println("TotalOrderService selectYearReturnCnt start...");
		tod.selectYearReturnCnt(map);
		System.out.println("TotalOrderService selectYearReturnCnt end...");
		
	}
	
}
