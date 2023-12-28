package com.choongang.s202350103.shDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.choongang.s202350103.model.AttJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AttJoinDaoImpl implements AttJoinDao {

	private final SqlSession session;
	// Transaction 관리
	private final PlatformTransactionManager transactionManager;
	
	@Override
	public List<AttJoin> listAttJoin(AttJoin attJoin) {
		System.out.println("AttJoinDaoImpl listAttJoin() Start..");
		List<AttJoin> attJoinList = null;
		System.out.println("m_num->"+ attJoin.getM_num());
	    System.out.println("a_num->"+ attJoin.getA_num());
		try {
			attJoinList = session.selectList("shAttJoinList",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDaoImpl listAttJoin() Exception ->"+e.getStackTrace());
		}
		return attJoinList;
	}

	@Override
	public List<AttJoin> subDate(AttJoin attJoin) {
		List<AttJoin> dateList = null;
		try {
			dateList = session.selectList("shSubDate",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao subDate() Exception ->"+e.getMessage());
		}
		return dateList;
	}
	
	@Override
	public int checkChance(AttJoin attJoin) {
		int chance = 0;
		try {
			chance = session.selectOne("shCheckAttChance",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao checkChance() Exception->"+e.getMessage());
		}
		return chance;
	}	

	@Override
	public void checkAtt(AttJoin attJoin) {
		
		TransactionStatus txStatus = 
				transactionManager.getTransaction(new DefaultTransactionDefinition());
		int result;
		int result1, result2 , result3 = 0;
		try {
			result1 = session.insert("shStampAtt",attJoin);
			result2 = session.update("shSaveAttPoint",attJoin);
			result3 = session.insert("shAttPointList",attJoin);
		
		if(result1 == 1 && result2 == 1&&result3 == 1) {
			result = 1;
		}
		
		// COMMIT
		transactionManager.commit(txStatus);
		} catch (Exception e) {
			// ROLLBACK
			transactionManager.rollback(txStatus);
			
			System.out.println("AttJoinDao checkAtt() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("AttJoinDao checkAtt() end..");
}
	
	@Override
	public AttJoin searchAtt(AttJoin attJoin) {
		try {
			attJoin = session.selectOne("shSearchAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao searchAtt() Exception->"+e.getMessage());
		}
		return attJoin;
	}	

	@Override
	public int addAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao addAtt() Start..");
		int count = 0;
		try {
			count = session.selectOne("shAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao addAtt() Exception->"+e.getMessage());
		}
		return count;
	}

	@Override
	public void stampAddAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao stampAddAtt() Start..");
		try {
			session.insert("shStampAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao stampAddAtt() Exception->"+e.getMessage());
		}
	}
	
	@Override
	public void saveAddAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao addAtt() Start..");
		try {
			session.update("shSaveAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao saveAddAtt() Exception->"+e.getMessage());
		}
	}

	@Override
	public void searchAddAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao addAtt() Start..");
		try {
			session.insert("shSearchAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao searchAddAtt() Exception->"+e.getMessage());
		}
	}

	@Override
	public int countAttRow(AttJoin attJoin) {
		System.out.println("AttJoinDao countAttRow() Start..");
		int rowCount = 0;
		try {
			rowCount = session.selectOne("shCountAttRow",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao countAttRow() Exception->"+e.getMessage());
		}
		return rowCount;
	}

	

}

