package com.choongang.s202350103.gbDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.choongang.s202350103.domain.KakaoPayApprovalVO;
import com.choongang.s202350103.model.Orderr;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PointChargeDao {
	
	private final SqlSession session;
	private final PlatformTransactionManager transactionManager;
	
	public int InsertUpdatePointCharge(KakaoPayApprovalVO kakaoDto) {
		System.out.println("PointChargeDao InsertUpdatePointCharge start...");
		// insert와 update가 모두 실행되면 result 가 1로 변경
		int result = 0;
		
		// 트랜잭션 시작 (원자성 : 모두 반영되거나 모두 반영되지 않거나)
		TransactionStatus tsStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			// 포인트 이력 테이블에 insert
			result = session.insert("gbInsertPointCharge", kakaoDto);
			System.out.println("PointChargeDao gbInsertPointCharge result -> "+result);
			
			// 회원 테이블에 포인트 충전
			result = session.update("gbUpdateMemberPoint", kakaoDto);
			System.out.println("PointChargeDao gbUpdateMemberPoint result -> "+result);
			
			// sql문이 모두 실행되었을 때 커밋을 실행 (하나라도 오류가 발생하면 커밋되지 않음)
			transactionManager.commit(tsStatus);
			System.out.println("PointChargeDao transaction result -> "+result);
		} catch (Exception e) {
			// 만약 오류가 하나라도 발생하면 모두 rollback
			transactionManager.rollback(tsStatus);
			System.out.println("PointChargeDao InsertUpdatePointCharge Exception -> "+e.getMessage());
		}
		
		return result;
	}
	
}
