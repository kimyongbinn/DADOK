package com.choongang.s202350103.ybService;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.CommHeart;
import com.choongang.s202350103.model.Community;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OldBook;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.WishList;
import com.choongang.s202350103.ybDao.MemberDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl1 implements MemberService {
	private final MemberDao md;
	private final HttpSession session;
	
	// 로그인
	@Override
	public Member login(Member member1) {
		System.out.println("MemberServiceImpl1 login Start");
		member1 = md.login(member1);
		
		return member1;
	}

	// 장바구니 상품 개수
	@Override
	public int totalCart(Member member) {
		System.out.println("MemberServiceImpl1 totalCart Start...");
		int totalCart = md.totalCart(member);
		System.out.println("MemberServiceImpl1 totalCart totalCart -> "  + totalCart);
		return totalCart;
	}

	// 장바구니 목록
	@Override
	public List<Cart> listCart(Cart cart, Member member) {
		System.out.println("MemberServiceImpl1 listCart start...");
		System.out.println("MemberServiceImpl1 listCart() member.m_num -> " + member.getM_num());
		List<Cart> listCart = md.listCart(cart, member);
		
		return listCart;
	}
	@Override
	public List<Community> communityList(Community community) {
		System.out.println("MemberServiceImpl1 communityList start...");
		List<Community> communityList = md.communityList(community);

		return communityList;
	}

	// 장바구니 총 금액
	@Override
	public int totalPrice(Member member) {
		System.out.println("MemberServiceImpl1 totalPrice start...");
		System.out.println("MemberServiceImpl1 totalPrice member.m_num -> " + member.getM_num());
		int totalPrice = 0;
		
		totalPrice = md.totalPrice(member);
		return totalPrice;
	}

	// 찜 갯수
	@Override
	public int totalWishList(Member member) {
		System.out.println("MemberServiceImpl1 totalWishList start...");
		System.out.println("MemberServiceImpl1 totalWishList member.m_num -> " + member.getM_num());
		int totalWishList = 0;
		
		totalWishList = md.totalWishList(member);
		return totalWishList;
	}
	
	@Override
	public int comListTotalCnt(Community community) {
		int comListTotalCnt = 0;
		comListTotalCnt = md.comListTotalCnt(community);
		return comListTotalCnt;
	}

	// 판매 개수
	@Override
	public int totalSellCnt(Member member) {
		System.out.println("MemberServiceImpl1 totalSellCnt start...");
		System.out.println("MemberServiceImpl1 totalSellCnt member.m_num -> " + member.getM_num());
		int totalSellCnt = md.totalSellCnt(member);
		return totalSellCnt;
	}
	// 상품 총 개수
	@Override
	public int bookListCnt(NewBook newbook) {
		System.out.println("MemberServiceImpl1 bookListCnt start...");
		int bookListCnt = md.bookListCnt(newbook);
		return bookListCnt;
	}
	// 포인트 리스트 개수
	@Override
	public int pointListCnt(PointList pointList) {
		System.out.println("MemberServiceImpl1 pointListCnt start...");
		int pointListCnt = md.pointListCnt(pointList);
		return pointListCnt;
	}

	// 회원 찜목록
	@Override
	public List<WishList> memberWishList(WishList wishList) {
		
		Member member =(Member) session.getAttribute("member");
		System.out.println("MemberServiceImpl1 listCart start...");
		System.out.println("MemberServiceImpl1 listCart() member.m_num -> " + member.getM_num());
		List<WishList> memberWishList = md.memberWishList(wishList);
		
		return memberWishList;
	}
	
	// 포인트 리스트
	@Override
	public List<PointList> memberPointList(PointList pointList) {
		Member member =(Member) session.getAttribute("member");
		System.out.println("MemberServiceImpl1 listCart start...");
		System.out.println("MemberServiceImpl1 listCart() member.m_num -> " + member.getM_num());
		List<PointList> memberPointList = md.memberPointList(pointList);
		
		return memberPointList;
	}
	// 회원 탈퇴
	@Override
	public Member memberWithdraw(Member member) {
		System.out.println("MemberServiceImpl1 memberWithdraw start...");
		member =(Member) session.getAttribute("member");
		System.out.println("MemberServiceImpl1 memberWithdraw member.m_id -> " + member.getM_id());
		Member memberWithdraw = md.memberWithdraw(member);
		return memberWithdraw;
	}
	// 회원 체크
	@Override
	public Member memberChk(String chk_Id) {
		System.out.println("MemberServiceImpl1 memberChk start...");
		Member member = md.memberChk(chk_Id);
		if(member != null) {
			return member;	
		} else {
			return null;
		}
	}
	// 중고책 판매 리스트
	@Override
	public List<OldBook> oldBookSellList(OldBook oldbook) {
		System.out.println("MemberServiceImpl1 oldBookSellList start...");
		Member member =(Member) session.getAttribute("member");
		List<OldBook> oldBookSellList = md.oldBookSellList(oldbook);
		System.out.println("MemberServiceImpl1 oldBookSellList member.m_id -> " + member.getM_id());
		return oldBookSellList;
	}
	
	// 비밀번호 찾기 이메일 체크
	@Override
	public Member findEmail(String memberMail) {
		System.out.println("MemberServiceImpl1 findEmail start...");
		Member member = md.findEmail(memberMail);
		if(member != null) {
			return member;	
		} else {
			return null;
		}	
	}
	// 회원 비밀번호 수정
	@Override
	public int memberPwUpdate(String m_pw, Member member) {
		System.out.println("MemberServiceImpl1 memberPwUpdate start...");
		member =(Member) session.getAttribute("member");
		System.out.println("MemberServiceImpl1 memberPwUpdate member.getM_id -> " +member.getM_id());
		System.out.println("MemberServiceImpl1 memberPwUpdate m_pw -> " + m_pw);
		
		int memberPwUpdate = md.memberPwUpdate(m_pw, member);	
		return memberPwUpdate;
	}
	// 회원 비밀번호 변경
	@Override
	public Member memberPwChange(String m_num, String m_pw) {
		System.out.println("MemberServiceImpl1 memberPwChange start...");
		System.out.println("MemberServiceImpl1 memberPwChange() m_num -> " + m_num);
		System.out.println("MemberServiceImpl1 memberPwChange() m_pw -> " + m_pw);
		Member memberPwChange = md.memberPwChange(m_num, m_pw);
		return memberPwChange;
	}
	// 회원 비밀번호 변경
	@Override
	public Member memberPwChange1(String m_email, String m_pw) {
		System.out.println("MemberServiceImpl1 memberPwChange start...");
		System.out.println("MemberServiceImpl1 memberPwChange() m_num -> " + m_email);
		System.out.println("MemberServiceImpl1 memberPwChange() m_pw -> " + m_pw);
		Member memberPwChange1 = md.memberPwChange1(m_email, m_pw);
		return memberPwChange1;
	}
	// 회원 핸드폰 번호 찾기
	@Override
	public Member memberFindPh(String phoneHyphen) {
		System.out.println("MemberServiceImpl1 memberFindPh start...");
		Member memberFindPh = md.memberFindPh(phoneHyphen);
		return memberFindPh;
	}

	@Override
	public Member memberPwChangeByPh(String m_ph, String m_pw) {
		System.out.println("MemberServiceImpl1 memberPwChangeByPh start...");
		System.out.println("MemberServiceImpl1 memberPwChangeByPh() m_ph -> " + m_ph);
		System.out.println("MemberServiceImpl1 memberPwChangeByPh() m_pw -> " + m_pw);
		Member memberPwChangeByPh = md.memberPwChangeByPh(m_ph, m_pw);
		return memberPwChangeByPh;
	}

	@Override
	public int communityInsert(Community community) {
		System.out.println("MemberServiceImpl1 communityInsert start...");
		int communityInsert = md.communityInsert(community);
		return communityInsert;
	}
	// 커뮤니티 책 검색
	@Override
	public List<NewBook> searchListBook(NewBook newbook) {
		System.out.println("MemberServiceImpl1 searchListBook start...");
		List<NewBook> searchListBook = md.searchListBook(newbook);
		System.out.println("MemberServiceImpl1 searchListBook searchBookList.size() -> " + searchListBook.size());
		return searchListBook;
	}
	// 검색 책 갯수
	@Override
	public int searchBookCnt(NewBook newbook) {
		System.out.println("MemberServiceImpl1 searchBookCnt start...");
		int searchBookCnt = md.searchBookCnt(newbook);
		System.out.println("MemberServiceImpl1 searchBookCnt searchBookCnt -> " + searchBookCnt);
		return searchBookCnt;
	}
	// 커뮤니티 조회
	@Override
	public Community selectBookDetail(int cm_num) {
		System.out.println("MemberServiceImpl1 selectBookDetail start...");
		System.out.println("MemberDaoImpl1 selectBookDetail() cm_num -> " + cm_num);
		Community community = md.selectBookDetail(cm_num);
		return community;
	}
	// 같은 책 독후감 리스트
	@Override
	public List<Community> sameDetailList(int nb_num) {
		System.out.println("MemberServiceImpl1 selectBookDetail start...");
		List<Community> sameDetailList = md.sameDetailList(nb_num);
		return sameDetailList;
	}
	// 조회수 up
	@Override
	public int readCntUp(int cm_num) {
		System.out.println("MemberServiceImpl1 readCntUp start...");
		int readCntUp = md.readCntUp(cm_num);
		return readCntUp;
	}
	// 독후감 수정
	@Override
	public int communityUpdateDo(Community community) {
		System.out.println("MemberServiceImpl1 communityUpdateDo start...");
		System.out.println("MemberServiceImpl1  communityUpdateDo() community -> " + community);
		int communityUpdateDo = md.communityUpdateDo(community);
		return communityUpdateDo;
	}
	// 독후감 좋아요 up
	@Override
	public int communityHitPush(int cm_num) {
		System.out.println("MemberServiceImpl1 communityUpdateDo start...");
		System.out.println("MemberServiceImpl1  communityUpdateDo() cm_num -> " + cm_num);
		int communityHitPush = md.communityHitPush(cm_num);
		return communityHitPush;
	}
	// 독후감 삭제
	@Override
	public int communityDelete(int cm_num) {
		System.out.println("MemberServiceImpl1 communityDelete start...");
		System.out.println("MemberServiceImpl1 communityDelete() cm_num -> " + cm_num);
		int communityDelete = md.communityDelete(cm_num);
		return communityDelete;
	}
	// 내 독후감 개수
	@Override
	public int comMyListTotalCnt(int m_num) {
		int comMyListTotalCnt = 0;
		comMyListTotalCnt = md.comMyListTotalCnt(m_num);
		return comMyListTotalCnt;
	}
	// 내 독후감 리스트
	@Override
	public List<Community> communityMyList(Community community) {
		System.out.println("MemberServiceImpl1 communityMyList start...");
		List<Community> communityMyList = md.communityMyList(community);

		return communityMyList;
	}
	// 독후감 수정 시 이미지 삭제
	@Override
	public int deleteImage(int cm_num) {
		System.out.println("MemberServiceImpl1 deleteImage start...");
		int deleteImage = md.deleteImage(cm_num);
		System.out.println("MemberServiceImpl1 deleteImage start...");
		return deleteImage;
	}
	// 독후감 수정 시 이미지 삭제
	@Override
	public int deleteImage1(int cm_num) {
		System.out.println("MemberServiceImpl1 deleteImage1 start...");
		int deleteImage1 = md.deleteImage1(cm_num);
		System.out.println("MemberServiceImpl1 deleteImage1 start...");
		return deleteImage1;
	}
	// 총 포인트
	@Override
	public int totalPoint(int m_num) {
		System.out.println("MemberServiceImpl1 totalPoint start...");
		int totalPoint = md.totalPoint(m_num);
		return totalPoint;
	}
	// 독후감 등록 시 책 검색
	@Override
	public List<NewBook> ybBookList(NewBook newbook) {
		System.out.println("MemberServiceImpl1 ybBookList start...");
		List<NewBook> ybBookList = md.ybBookList(newbook);
		
		return ybBookList;
	}
	// 좋아요 누르기 insert
	@Override
	public int commHeartInsert(int cm_num, int m_num) {
		System.out.println("MemberServiceImpl1 commHeartInsert start...");
		System.out.println("MemberServiceImpl1 commHeartInsert cm_num -> " + cm_num);
		System.out.println("MemberServiceImpl1 commHeartInsert m_num -> " + m_num);
		
		int commHeartInsert = md.commHeartInsert(cm_num, m_num);
		return commHeartInsert;
	}
	// 좋아요 누를 시 업데이트
	@Override
	public int commHeartUpdate(CommHeart commHeart) {
		System.out.println("MemberServiceImpl1 commHeartUpdate start...");
		int commHeartUpdate = md.commHeartUpdate(commHeart);
		return commHeartUpdate;
	}
	// 좋아요 확인
	@Override
	public CommHeart confirmHeart(CommHeart commHeart) {
		System.out.println("MemberServiceImpl1 confirmHeart start...");
		CommHeart CommHeart = md.confirmHeart(commHeart);
		return CommHeart;
	}
	// 좋아요 누를 시 좋아요 갯수 수정
	@Override
	public int updateHitCnt(Community community, CommHeart commHeart) {
		System.out.println("MemberServiceImpl1 updateHitCnt start...");
		int updateHitCnt = md.updateHitCnt(commHeart, community);
		return updateHitCnt;
	}
	// 인기있는 독후감 리스트
	@Override
	public List<Community> popularList(Community community) {
		System.out.println("MemberServiceImpl1 popularList start...");
		List<Community> popularList = md.popularList(community);
		return popularList;
	}

	


	
	
}
