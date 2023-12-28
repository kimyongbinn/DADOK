package com.choongang.s202350103.yjDao;

import java.util.List;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.MemberQ;
import com.choongang.s202350103.model.MqReply;

public interface MemberDao {
	
	// 아이디 중복 검사 
	int idConfirm(String m_id);
	// 회원가입
	int joinResult(Member member);
	// 추천인 포인트 적립
	int memberJoinPoint(String m_reid);
	// 추천인 포인트 리스트 Insert
	int memberJoinPointList(String m_reid);
	// 회원가입 포인트 이력에 insert
	int joinPoint();
	// 회원 상세
	Member memberInfo(int m_num);
	// 회원 정보 수정
	int memberUpdate(Member member);
	// 회원 번호 검증
	String memberPhFind(String m_ph);
	// 인증 후 회원 상세
	Member memberFindGetId(String m_ph);
	// 내 리뷰 리스트
	List<Member> memberMyReview(int m_num);
	// 관리자 회원 전체 조회
	List<Member> adminMemberList(Member member);
	// 내 주문 리스트
	List<Member> memberMyOrder(int m_num);
	// 전체 회원 카운트 
	int totalMember();
	// 회원 이메일 검증
	String memberEmailFind(String m_email);
	// 이메일 인증후 회원정보 상세 
	Member memberFindGetIdEmail(String m_email);
	// 회원 문의
	int memberQInsert(MemberQ memberQ);
	// 문의 리스트
	List<MemberQ> memberQnaList(MemberQ memberQ);
	// 문의 카운트
	int mqCount();
	// 문의 상세 
	MemberQ memberQInfo(int mq_num);
	// 내 문의 리스트
	List<MemberQ> memberMyQnaList(int m_num);
	// 내 주문 카운트
	int totalOrderCnt(int m_num);
	// 관리자 - 회원 정보 수정
	int adminMemberUpdate(Member member);
	// 내 문의 삭제 
	int myMqDelete(int mq_num);
	// 내 문의 수정
	int myMqUpdate(MemberQ memberQ);
	// 관리자 - 회원삭제
	int adminMemberDelete(int m_num);
	// 관리자 - 검색후 회원 카운트
	int memberSearchCnt(Member member);
	// 관리자 - 회원 검색 
	List<Member> adminMemberSearch(Member member);
	// 관리자 - 회원 주소 간편조회 AJAX
	String adminAddrSearch(int m_num);
	// 관리자 - 일반 회원 카운트
	int nomalMember();
	// 관리자 - 관리자 카운트
	int adminMember();
	// 관리자 - 활동 회원 카운트
	int activeMember();
	// 관리자 - 탈퇴 회원 카운트
	int wdMember();
	// 문의 답변 리스트 
	List<MqReply> mqReplyList(int mq_num);
	// 답글 카운트
	int replyCount(int mq_num);
	// 답글 작성
	int replyInsert(MqReply reply);
	// 답글 추천
	int likeReply(Long mqr_num);
	// 답글 신고
	int declReply(MqReply reply);
	// 관리자 - 답글 관리
	List<MemberQ> adminDeclReply();
	// 신고 접수 횟수
	int declCount(int mqr_num);
	// 신고누적 답글 삭제
	void deleteReply(int mqr_num);
	// 관리자 - 신고횟수 초기화
	int replyUpdate(int mqr_num);
	// 관리자 - 신고 댓글 카운트
	int declReplyCount();
	// 문의글에 달린 댓글 삭제
	void deleteReplyAndMQ(int mq_num);
	// 내가 작성한 답글
	List<MemberQ> memberMyReply(int m_num);
	// 내 답글 수정
	int myReplyUpdate(MemberQ memberq);

	
	
	
}
