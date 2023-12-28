package com.choongang.s202350103.shDao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Attendance;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.PointList;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PointListDaoImpl implements PointListDao {
	
	private final SqlSession session;

	@Override
	public List<PointList> selectMemberPoint(Member member) {
		System.out.println("PointListDao selectMemberPoint() Start..");
		System.out.println("PointListDao selectMemberPoint() member -> " + member);
		List<PointList> memberPointList = null;
		try {
			memberPointList = session.selectList("shSelectMemberPoint",member);
			System.out.println("PointListDao selectMemberPoint() memberPointList -> "+memberPointList);
		} catch (Exception e) {
			System.out.println("pointListDao selectMemberPoint() Exception ->"+e.getMessage());
		}
		return memberPointList;
	}

	@Override
	public int pointSum(int m_num) {
		System.out.println("PointListDao pointSum() Start..");
		int sum = 0;
		 try {
			sum = session.selectOne("shPointSum",m_num);
		} catch (Exception e) {
			System.out.println("pointListDao pointSum() Exception ->"+e.getMessage());
		}
		return sum;
	}

	@Override
	public int boUpdatePlusPoint(Member member) {
		System.out.println("PointList boUpdatePlusPoint() Start..");
		int updateResult = 0;
		try {
			updateResult = session.update("shBoUpdatePlusPoint",member);
		} catch (Exception e) {
			System.out.println("pointListDao boUpdatePlusPoint() Exception ->"+e.getMessage());
		}
		return updateResult;
	}

	@Override
	public int boInsertPlusPoint(Member member) {
		System.out.println("PointList boInsertPlusPoint() Start..");
		int insertResult = 0;
		try {
			insertResult = session.insert("shBoInsertPlusPoint",member);
		} catch (Exception e) {
			System.out.println("pointListDao boInsertPlusPoint() Exception ->"+e.getMessage());
		}
		return insertResult;
	}

	@Override
	public int boInsertMinusPoint(Member member) {
		System.out.println("PointList boInsertMinusPoint() Start..");
		int insertResult = 0;
		try {
			insertResult = session.insert("shBoInsertMinusPoint",member);
		} catch (Exception e) {
			System.out.println("PointListDao boInsertMinusPoint() Exception->"+e.getMessage());
		}
		return insertResult;
	}

	@Override
	public int boUpdateMinusPoint(Member member) {
		System.out.println("PointList boUpdateMinusPoint() Start..");
		int updateResult = 0;
		try {
			updateResult = session.update("shBoUpdateMinusPoint",member);
		} catch (Exception e) {
			System.out.println("PointListDao boUpdateMinusPoint() Exception->"+e.getMessage());
		}
		return updateResult;
	}
	
	@Override
	public int joinedList(int eNum) {
		System.out.println("PointList joinedList() Start...");
		int result = 0;
		try {
			result = session.selectOne("shJoinedList", eNum);
		} catch (Exception e) {
			System.out.println("PointList joinedList() Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public List<PointList> boJoinedMember(Attendance attendance) {
		System.out.println("PointList boJoinedMember() Start...");
		List<PointList> pointList = null;
		try {
			pointList = session.selectList("shBoJoinedMember", attendance);
		} catch (Exception e) {
			System.out.println("PointList boJoinedMember() Exception->"+e.getMessage());
		}
		return pointList;
	}

	@Override
	public int memberPointList(int m_num) {
		System.out.println("PointList memberPointList() Start...");
		System.out.println("PointList memberPointList() m_num -> " + m_num);
		int result = 0;
		try {
			result = session.selectOne("shMemberPointList",m_num);
		} catch (Exception e) {
			System.out.println("PointList memberPointList() Exception ->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int joinedCount(int eNum) {
		System.out.println("PointList joinedCount() Start..");
		int count = 0;
		try {
			count = session.selectOne("shJoinedCount",eNum);
		} catch (Exception e) {
			System.out.println("PointList joinedCount() Start...");
		}
		return count;
	}

	@Override
	public List<PointList> boMemberSelect(PointList pointList) {
		System.out.println("PointList boMemberSelect() Start...");
		List<PointList> pointListList = null;
		try {
			pointListList = session.selectList("boMemberSelect", pointList);
		} catch (Exception e) {
			System.out.println("PointList boJoinedMember() Exception->"+e.getMessage());
		}
		return pointListList;
	}

	@Override
	public int joinedCountSelect(int eNum) {
		System.out.println("PointList joinedCount() Start..");
		int count = 0;
		try {
			count = session.selectOne("shJoinedCountSelect",eNum);
		} catch (Exception e) {
			System.out.println("PointList joinedCount() Start...");
		}
		return count;
	}

	

}
