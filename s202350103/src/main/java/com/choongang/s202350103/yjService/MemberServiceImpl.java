package com.choongang.s202350103.yjService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.MemberQ;
import com.choongang.s202350103.model.MqReply;
import com.choongang.s202350103.yjDao.MemberDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberDao md;
	
	// 아이디 중복검사
	@Override
	public int idConfirm(String m_id) {
		int resultId = md.idConfirm(m_id);
		return resultId;
	}
	// 회원가입
	@Override
	public int joinResult(Member member) {
		int joinResult = md.joinResult(member);
		return joinResult;
	}
	// 추천인 포인트 적립
	@Override
	public int memberJoinPoint(String m_reid) {
		int memberJoinPoint = md.memberJoinPoint(m_reid);
		return memberJoinPoint;
	}
	// 추천인 포인트 리스트 Insert
	@Override
	public int memberJoinPointList(String m_reid) {
		int memberJoinPointList = md.memberJoinPointList(m_reid);
		return memberJoinPointList;
	}
	// 회원가입 포인트 이력에 insert
	@Override
	public int joinPoint() {
		int joinPoint = md.joinPoint();
		return joinPoint;
	}
	// 내정보 상세
	@Override
	public Member memberInfo(int m_num) {
		Member member = md.memberInfo(m_num);
		return member;
	}
	// 회원정보 수정
	@Override
	public int memberUpdate(Member member) {
		int memberUpdate = md.memberUpdate(member);
		return memberUpdate;
	}
	// 회원 번호 검증
	@Override
	public String memberPhFind(String m_ph) {
		String memberPhFind = md.memberPhFind(m_ph);
		return memberPhFind;
	}
	// 인증 후 회원상세
	@Override
	public Member memberFindGetId(String m_ph) {
		Member member = md.memberFindGetId(m_ph);
		return member;
	}
	// 내 리뷰 리스트
	@Override
	public List<Member> memberMyReview(int m_num) {
		List<Member> memberMyReview = md.memberMyReview(m_num);
		return memberMyReview;
	}
	// 관리자 회원 전체 조회
	@Override
	public List<Member> adminMemberList(Member member) {
		List<Member> adminMemberList = md.adminMemberList(member);
		return adminMemberList;
	}
	// 내 주문 리스트
	@Override
	public List<Member> memberMyOrder(int m_num) {
		List<Member> memberMyOrder = md.memberMyOrder(m_num);
		return memberMyOrder;
	}
	// 전체 회원 카운트
	@Override
	public int totalMember() {
		int totalMember = md.totalMember();
		return totalMember;
	}
	// 회원 이메일 검증
	@Override
	public String memberEmailFind(String m_email) {
		String memberEmailFind = md.memberEmailFind(m_email);
		return memberEmailFind;
	}
	// 이메일  인증후 회원정보 상세
	@Override
	public Member memberFindGetIdEmail(String m_email) {
		Member member = md.memberFindGetIdEmail(m_email);
		return member;
	}
	// 문의 등록
	@Override
	public int memberQInsert(MemberQ memberQ) {
		int memberQInsert = md.memberQInsert(memberQ);
		return memberQInsert;
	}
	// 문의 리스트
	@Override
	public List<MemberQ> memberQnaList(MemberQ memberQ) {
		List<MemberQ> memberQnaList = md.memberQnaList(memberQ);
		return memberQnaList;
	}
	// 문의 카운트
	@Override
	public int mqCount() {
		int mqCount = md.mqCount();
		return mqCount;
	}
	// 문의 상세
	@Override
	public MemberQ memberQInfo(int mq_num) {
		MemberQ memberQInfo = md.memberQInfo(mq_num);
		return memberQInfo;
	}
	// 내 문의 리스트
	@Override
	public List<MemberQ> memberMyQnaList(int m_num) {
		List<MemberQ> memberMyQnaList = md.memberMyQnaList(m_num);
		return memberMyQnaList;
	}
	// 내 주문 카운트
	@Override
	public int totalOrderCnt(int m_num) {
		int totalOrderCnt = md.totalOrderCnt(m_num);
		return totalOrderCnt;
	}
	// 관리자 회원 정보 수정
	@Override
	public int adminMemberUpdate(Member member) {
		int adminMemberUpdate = md.adminMemberUpdate(member);
		return adminMemberUpdate;
	}
	// 내 문의 삭제 
	@Override
	public int myMqDelete(int mq_num) {
		int myMqDelete = md.myMqDelete(mq_num);
		return myMqDelete;
	}
	// 내 문의 수정
	@Override
	public int myMqUpdate(MemberQ memberQ) {
		int myMqUpdate = md.myMqUpdate(memberQ);
		return myMqUpdate;
	}
	// 관리자 - 회원 삭제
	@Override
	public int adminMemberDelete(int m_num) {
		int adminMemberDelete = md.adminMemberDelete(m_num);
		return adminMemberDelete;
	}
	// 관리자 - 검색후 회원 카운트
	@Override
	public int memberSearchCnt(Member member) {
		int totalMember = md.memberSearchCnt(member);
		return totalMember;
	}
	// 관리자 - 회원 검색
	@Override
	public List<Member> adminMemberSearch(Member member) {
		List<Member> adminMemberSearch = md.adminMemberSearch(member);
		return adminMemberSearch;
	}
	// 관리자 - 회원 주소 간편조회 AJAX
	@Override
	public String adminAddrSearch(int m_num) {
		
		return  md.adminAddrSearch(m_num);
	}
	// 관리자 - 일반회원 카운트
	@Override
	public int nomalMember() {
		int nomalMember = md.nomalMember();
		return nomalMember;
	}
	// 관리자 - 관리자 카운트
	@Override
	public int adminMember() {
		int adminMember = md.adminMember();
		return adminMember;
	}
	// 관리자 - 활동 회원 카운트
	@Override
	public int activeMember() {
		int activeMember = md.activeMember();
		return activeMember;
	}
	// 관리자 - 탈퇴 회원 카운트
	@Override
	public int wdMember() {
		int wdMember = md.wdMember();
		return wdMember;
	}
	// 문의 답변 리스트 
	@Override
	public List<MqReply> mqReplyList(int mq_num) {
		List<MqReply> mqReplyList = md.mqReplyList(mq_num);
		return mqReplyList;
	}
	// 답글 카운트
	@Override
	public int replyCount(int mq_num) {
		int replyCount = md.replyCount(mq_num);
		return replyCount;
	}
	// 답글 작성
	@Override
	public int replyInsert(MqReply reply) {
		int replyInsert = md.replyInsert(reply);
		return replyInsert;
	}
	// 답글 추천
	@Override
	public int likeReply(Long mqr_num) {
		int likeReply =  md.likeReply(mqr_num);
		return likeReply;
	}
	// 답글 신고
	@Override
	public int declReply(MqReply reply) {
		int declReply = md.declReply(reply);
		return declReply;
	}
	// 관리자 - 답글 관리
	@Override
	public List<MemberQ> adminDeclReply() {
		List<MemberQ> adminDeclReply = md.adminDeclReply();
		return adminDeclReply;
	}
	// 신고접수 횟수
	@Override
	public int declCount(int mqr_num) {
		int declCount = md.declCount(mqr_num);
		return declCount;
	}
	// 신고누적 답글 삭제
	@Override
	public void deleteReply(int mqr_num) {
		md.deleteReply(mqr_num);
	}
	// 관리자 - 신고횟수 초기화
	@Override
	public int replyUpdate(int mqr_num) {
		int replyUpdate = md.replyUpdate(mqr_num);
		return replyUpdate;
	}
	// 관리자 - 신고댓글 카운트
	@Override
	public int declReplyCount() {
		int declReplyCount = md.declReplyCount();
		return declReplyCount;
	}
	// 문의글에 달린 댓글 삭제
	@Override
	public void deleteReplyAndMQ(int mq_num) {
		md.deleteReplyAndMQ(mq_num);
	}
	// 내가 작성한 답글
	@Override
	public List<MemberQ> memberMyReply(int m_num) {
		List<MemberQ> memberMyReply = md.memberMyReply(m_num);
		return memberMyReply;
	}
	// 내 답글 수정
	@Override
	public int myReplyUpdate(MemberQ memberq) {
		int myReplyUpdate = md.myReplyUpdate(memberq);
		return myReplyUpdate;
	}
	
	
	
	
}
