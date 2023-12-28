package com.choongang.s202350103.ybService;

import java.util.List;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.CommHeart;
import com.choongang.s202350103.model.Community;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OldBook;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.WishList;

public interface MemberService {
	// 로그인
	Member			login(Member member1);
	// 장바구니 총 개수
	int 			totalCart(Member member);
	// 장바구니 리스트
	List<Cart> 		listCart(Cart cart, Member member);
	// 장바구니 총 가격
	int 			totalPrice(Member member);
	// 찜 목록 개수 
	int 			totalWishList(Member member);
	// 찜 목록 리스트
	List<WishList>  memberWishList(WishList wishList);
	// 회원 탈퇴
	Member 			memberWithdraw(Member member);
	// 로그인 시 회원 확인
	Member 			memberChk(String chk_Id);
	// 포인트 리스트
	List<PointList> memberPointList(PointList pointList);
	// 회원 중고판매 개수
	int 			totalSellCnt(Member member);
	// 중고판매 리스트
	List<OldBook> 	oldBookSellList(OldBook oldbook);
	// 이메일로 비밀번호 찾기
	Member 			findEmail(String memberMail);
	// 비밀번호 찾기 후 바꾸기
	int 			memberPwUpdate(String m_pw, Member member); 
	Member 			memberPwChange(String m_num, String m_pw);	
	Member 			memberPwChange1(String m_email, String m_pw);
	// 핸드폰 번호
	Member 			memberFindPh(String phoneHyphen);
	// 문자로 비밀번호 찾기
	Member 			memberPwChangeByPh(String m_ph, String m_pw);
	// 독후감 리스트
	List<Community> communityList(Community community);
	// 독후감 총 개수
	int 			comListTotalCnt(Community community);
	// 독후감 쓰기
	int 			communityInsert(Community community);
	// 독후감 쓰기 시 책 찾기
	List<NewBook>	searchListBook(NewBook newbook);
	// 독후감 책 찾기 시 책 개수
	int 			searchBookCnt(NewBook newbook);
	// 포인트 리스트 총 개수
	int 			pointListCnt(PointList pointList);
	// 독후감 자세히 보기
	Community 		selectBookDetail(int cm_num);
	// 동일 책 독후감 리스트
	List<Community> sameDetailList(int nb_num);
	// 조회 수 업데이트
	int		 		readCntUp(int cm_num);
	// 독후감 수정
	int 			communityUpdateDo(Community community);
	// 독후감 좋아요 누를 시
	int 			communityHitPush(int cm_num);
	// 독후감 삭제
	int 			communityDelete(int cm_num);
	// 회원별 독후감 리스트 개수
	int 			comMyListTotalCnt(int m_num);
	// 회원별 독후감 리스트
	List<Community> communityMyList(Community community);
	// 독후감 수정 시 이미지 삭제
	int 			deleteImage(int cm_num);
	int 			deleteImage1(int cm_num);
	// 회원별 총 포인트
	int 			totalPoint(int m_num);
	// 책 리스트
	List<NewBook> 	ybBookList(NewBook newbook);
	// 좋아요 정보 없을 경우
	int 			commHeartInsert(int cm_num, int m_num);
	// 좋아요 상태 업데이트
	int 			commHeartUpdate(CommHeart commHeart);
	// 좋아요 정보 있는지 확인
	CommHeart 		confirmHeart(CommHeart commHeart);
	// 좋아요 개수 수정
	int 			updateHitCnt(Community community, CommHeart commHeart);
	// 인기 독후감 리스트
	List<Community> popularList(Community community);
	// 책 리스트 개수
	int 			bookListCnt(NewBook newbook);



	


}
	