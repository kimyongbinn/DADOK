package com.choongang.s202350103.yjDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.MemberQ;
import com.choongang.s202350103.model.MqReply;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao{

	private final SqlSession session;
	
	// 아이디 중복검사 
	@Override
	public int idConfirm(String m_id) {
		int resultId = session.selectOne("resultId",m_id);
		return resultId;
	}
	// 회원 가입 
	@Override
	public int joinResult(Member member) {
		int joinResult = session.insert("joinResult",member);
		return joinResult;
	}
	// 추천인 포인트 적립
	@Override
	public int memberJoinPoint(String m_reid) {
		int	memberJoinPoint = session.update("memberJoinPoint", m_reid);
		return memberJoinPoint;
	}
	// 추천인 포인트 리스트 Insert
	@Override
	public int memberJoinPointList(String m_reid) {
		int memberJoinPointList = session.insert("memberJoinPointList", m_reid);
		return memberJoinPointList;
	}
	// 회원가입 포인트 이력에 insert
	@Override
	public int joinPoint() {
		int joinPoint = session.insert("joinPoint");
		return joinPoint;
	}
	// 회원 상세 
	@Override
	public Member memberInfo(int m_num) {
		Member member = session.selectOne("memberInfo",m_num);
		return member;
	}
	// 회원 정보 수정
	@Override
	public int memberUpdate(Member  member) {
		int memberUpdate = session.update("memberUpdate", member);
		return memberUpdate;
	}
	// 회원 번호 검증
	@Override
	public String memberPhFind(String m_ph) {
		String memberPhFind = session.selectOne("memberPhFind",m_ph);
		return memberPhFind;
	}
	// 인증 후 회원 상세
	@Override
	public Member memberFindGetId(String m_ph) {
		Member member = session.selectOne("memberFindGetId",m_ph);
		return member;
	}
	// 내 리뷰 리스트
	@Override
	public List<Member> memberMyReview(int m_num) {
		List<Member> memberMyReview = session.selectList("memberMyReview",m_num);
		return memberMyReview;
	}
	// 관리자 회원 전체 조회
	@Override
	public List<Member> adminMemberList(Member member) {
		List<Member> adminMemberList = session.selectList("adminMemberList",member);
		return adminMemberList;
	}
	// 내 주문 리스트
	@Override
	public List<Member> memberMyOrder(int m_num) {
		List<Member> memberMyOrder = session.selectList("memberMyOrder",m_num);
		return memberMyOrder;
	}
	// 전체 회원 카운트
	@Override
	public int totalMember() {
		int totalMember = session.selectOne("totalMember");
		return totalMember;
		
	}
	// 회원 이메일 검증
	@Override
	public String memberEmailFind(String m_email) {
		String memberEmailFind = session.selectOne("memberEmailFind",m_email);
		return memberEmailFind;
	}
	// 이메일 인증후 회원정보 상세 
	@Override
	public Member memberFindGetIdEmail(String m_email) {
		Member member = session.selectOne("memberFindGetIdEmail",m_email);
		return member;
	}
	// 회원 등록
	@Override
	public int memberQInsert(MemberQ memberQ) {
		int memberQInsert = session.insert("memberQInsert",memberQ);
		return memberQInsert;
	}
	// 문의 리스트
	@Override
	public List<MemberQ> memberQnaList(MemberQ memberQ) {
		List<MemberQ> memberQnaList = session.selectList("memberQnaList",memberQ);
		return memberQnaList;
	}
	// 문의 카운트
	@Override
	public int mqCount() {
		int mqCount = session.selectOne("mqCount");
		return mqCount;
	}
	// 문의 상세
	@Override
	public MemberQ memberQInfo(int mq_num) {
		MemberQ memberQInfo = session.selectOne("memberQInfo",mq_num);
		return memberQInfo;
	}
	// 내 문의 리스트
	@Override
	public List<MemberQ> memberMyQnaList(int m_num) {
		List<MemberQ> memberMyQnaList = session.selectList("memberMyQnaList",m_num);
		return memberMyQnaList;
	}
	// 내 주문 카운트
	@Override
	public int totalOrderCnt(int m_num) {
		int totalOrderCnt = session.selectOne("totalOrderCnt",m_num);
		return totalOrderCnt;
	}
	// 관리자 - 회원 정보 수정
	@Override
	public int adminMemberUpdate(Member member) {
		int adminMemberUpdate = session.update("adminMemberUpdate",member);
		return adminMemberUpdate;
	}
	// 내 문의 삭제 
	@Override
	public int myMqDelete(int mq_num) {
		int myMqDelete = session.delete("myMqDelete",mq_num);
		return myMqDelete;
	}
	// 내 문의 수정
	@Override
	public int myMqUpdate(MemberQ memberQ) {
		int myMqUpdate = session.update("myMqUpdate",memberQ);
		return myMqUpdate;
	}
	// 관리자 - 회원 삭제
	@Override
	public int adminMemberDelete(int m_num) {
		int adminMemberDelete = session.delete("adminMemberDelete",m_num);
		return adminMemberDelete;
	}
	// 관리자 - 검색 후 회원 카운트
	@Override
	public int memberSearchCnt(Member member) {
		int totalMember = session.selectOne("memberSearchCnt",member);
		return totalMember;
	}
	// 관리자 - 회원 검색
	@Override
	public List<Member> adminMemberSearch(Member member) {
		List<Member> adminMemberSearch = session.selectList("adminMemberSearch", member);
		return adminMemberSearch;
	}
	// 관리자 - 회원주소 간편조회 AJAX 
	@Override
	public String adminAddrSearch(int m_num) {
		String adminAddrSearch = session.selectOne("adminAddrSearch",m_num);
		return adminAddrSearch;
	}
	// 관리자 - 일반 회원 카운트
	@Override
	public int nomalMember() {
		int nomalMember = session.selectOne("nomalMember");
		return nomalMember;
	}
	// 관리자 - 관리자 카운트
	@Override
	public int adminMember() {
		int adminMember = session.selectOne("adminMember");
		return adminMember;
	}
	// 관리자 - 활동 회원 카운트
	@Override
	public int activeMember() {
		int activeMember = session.selectOne("activeMember");
		return activeMember;
	}
	// 관리자 - 탈퇴 회원 카운트
	@Override
	public int wdMember() {
		int wdMember = session.selectOne("wdMember");
		return wdMember;
	}
	// 문의 답변 리스트
	@Override
	public List<MqReply> mqReplyList(int mq_num) {
		List<MqReply> mqReplyList = session.selectList("mqReplyList",mq_num);
		return mqReplyList;
	}
	// 답글 카운트
	@Override
	public int replyCount(int mq_num) {
		int replyCount = session.selectOne("replyCount",mq_num);
		return replyCount;
	}
	// 답글 작성
	@Override
	public int replyInsert(MqReply reply) {
		int replyInsert = session.insert("replyInsert",reply);
		return replyInsert;
	}
	// 답글 추천
	@Override
	public int likeReply(Long mqr_num) {
		int likeReply = session.update("likeReply",mqr_num);
		return likeReply;
	}
	// 답글 신고
	@Override
	public int declReply(MqReply reply) {
		int declReply = session.update("declReply",reply);
		return declReply;
	}
	// 관리자 - 답글 관리
	@Override
	public List<MemberQ> adminDeclReply() {
		List<MemberQ> adminDeclReply = session.selectList("adminDeclReply");
		return adminDeclReply;
	}
	// 신고 접수 횟수
	@Override
	public int declCount(int mqr_num) {
		int declCount = session.selectOne("declCount",mqr_num);
		return declCount;
	}
	// 신고 누적 답글삭제
	@Override
	public void deleteReply(int mqr_num) {
		session.delete("deleteReply",mqr_num);
	}
	// 관리자 - 신고 횟수 초기화
	@Override
	public int replyUpdate(int mqr_num) {
		int replyUpdate = session.update("replyUpdate",mqr_num);
		return replyUpdate;
	}
	// 관리자 - 신고댓글 카운트
	@Override
	public int declReplyCount() {
		int declReplyCount = session.selectOne("declReplyCount");
		return declReplyCount;
	}
	// 문의글에 달린 댓글 삭제
	@Override
	public void deleteReplyAndMQ(int mq_num) {
		session.delete("deleteReplyAndMQ",mq_num);
	}
	// 내가 작성한 답글
	@Override
	public List<MemberQ> memberMyReply(int m_num) {
		List<MemberQ> memberMyReply = session.selectList("memberMyReply",m_num);
		return memberMyReply;
	}
	// 내 답글 수정
	@Override
	public int myReplyUpdate(MemberQ memberq) {
		int myReplyUpdate = session.update("myReplyUpdate",memberq);
		return myReplyUpdate;
	}
	

	


}
