package com.choongang.s202350103.hrDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDao {
	private final SqlSession session;
	
	public int memTot() {
		System.out.println("Dao start..");
		int result = 0;
		try {
			result = session.selectOne("hrMemTot");
			System.out.println("Dao result -> "+ result);
		} catch (Exception e) {
			System.out.println("Dao e.getMessage() -> "+e.getMessage());
		}
		return result;
	}
}
