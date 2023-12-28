package com.choongang.s202350103.ybDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.CommHeart;
import com.choongang.s202350103.model.Community;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OldBook;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.WishList;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl1 implements MemberDao {
	private final SqlSession session;
	private final HttpSession https; 
	// 로그인
	@Override
	public Member login(Member member1) {
		System.out.println("MemberDaoImpl login Start...");
		Member member = null;
		 
		try {
			member = session.selectOne("ybUserLogin", member1);
			System.out.println("MemberDaoImpl login member1 -> " + member.getM_id());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if(member == null) {
			return null;
		} else {
			return member;			
		}
	}
	// 장바구니 총 개수
	@Override
	public int totalCart(Member member) {
		System.out.println("MemberDaoImpl1 totalCart start...");
			int totalCart = 0;
			System.out.println("MemberDaoImpl1 totalCart member -> " + member.getM_id());
		try {
			totalCart = session.selectOne("ybTotalCart", member);	
			System.out.println("MemberDaoImpl1 totalCart() totalCart -> " + totalCart);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalCart() Exception -> " + e.getMessage());
		}
		
		return totalCart;
	}
	// 판매 총 개수
	@Override
	public int totalSellCnt(Member member) {
		System.out.println("MemberDaoImpl1 totalSellCnt() start...");
		int totalSellCnt = 0;
		System.out.println("MemberDaoImpl1 totalSellCnt member -> " + member.getM_num());
		try {
			totalSellCnt = session.selectOne("ybTotalSellCnt", member);
			System.out.println("MemberDaoImpl1 totalSellCnt() totalCart -> " + totalSellCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalSellCnt() Exception -> " + e.getMessage());
		}
		return totalSellCnt;
	}
	// 포인트리스트 개수
	@Override
	public int pointListCnt(PointList pointList) {
		System.out.println("MemberDaoImpl1 pointListCnt() start...");
		int pointListCnt = 0;
		try {
			pointListCnt = session.selectOne("ybPointListCnt", pointList);
			System.out.println("MemberDaoImpl1 pointListCnt() totalCart -> " + pointListCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 pointListCnt() Exception -> " + e.getMessage());
		}
		return pointListCnt;
	}
	// 커뮤니티 총 개수
	@Override
	public int comListTotalCnt(Community community) {
		System.out.println("MemberDaoImpl1 comListTotalCnt() start...");
		int comListTotalCnt = 0;
		try {
			comListTotalCnt = session.selectOne("comListTotalCnt", comListTotalCnt);
			System.out.println("MemberDaoImpl1 comListTotalCnt() totalCart -> " + comListTotalCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 comListTotalCnt() Exception -> " + e.getMessage());
		}
		return comListTotalCnt;
	}
	// 상품 총 개수
	@Override
	public int bookListCnt(NewBook newbook) {
		System.out.println("MemberDaoImpl1 bookListCnt() start...");
		int bookListCnt = 0;
		try {
			bookListCnt = session.selectOne("ybBookListCnt", bookListCnt);
			System.out.println("MemberDaoImpl1 bookListCnt() totalCart -> " + bookListCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 bookListCnt() Exception -> " + e.getMessage());
		}
		return bookListCnt;
	}
	// 장바구니 총 가격
	@Override
	public int totalPrice(Member member) {
		System.out.println("MemberDaoImpl1 totalPrice() start...");
		int totalPrice = 0;
		try {
			totalPrice = session.selectOne("ybTotalPrice", member);
			System.out.println("MemberDaoImpl1 totalPrice totalPrice -> " + totalPrice);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalPrice Exception -> " + e.getMessage());
		}
		return totalPrice;
	}
	// 찜목록
	@Override
	public int totalWishList(Member member) {
		System.out.println("MemberDaoImpl1 totalWishList start...");
		int totalWishList = 0;
		System.out.println("MemberDaoImpl1 totalWishList member -> " + member.getM_id());
		try {
			totalWishList = session.selectOne("ybTotalWishList", member);	
			System.out.println("MemberDaoImpl1 totalWishList() totalWishList -> " + totalWishList);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalWishList() Exception -> " + e.getMessage());
		}
	
	return totalWishList;
	}
	
	// 장바구니 리스트
	@Override
	public List<Cart> listCart(Cart cart, Member member) {
		
		member =(Member) https.getAttribute("member");
		List<Cart> listCart = new ArrayList<Cart>();
		System.out.println("MemberDaoImpl1 listCart() start...");
		cart.setM_num(member.getM_num());
		System.out.println("MemberDaoImpl1 listCart() cart.m_num -> " +cart.getM_num());
		System.out.println("MemberDaoImpl1 listCart() member.m_num -> " + member.getM_num());
		try {
			listCart = session.selectList("ybListCart", cart);
			
			System.out.println("MemberDaoImpl1 listCart.size() -> " + listCart.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 listCart Exception -> " + e.getMessage());
		}
		
		return listCart;
	}
	// 커뮤니티 리스트
	@Override
	public List<Community> communityList(Community community) {
		List<Community> communityList = new ArrayList<Community>();
		System.out.println("MemberDaoImpl1 communityList() start...");
		System.out.println("MemberDaoImpl1 communityList() cart.m_num -> " +community.getM_num());
		try {
			communityList = session.selectList("ybCommnuityList", community);
			
			System.out.println("MemberDaoImpl1 communityList.size() -> " + communityList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 communityList Exception -> " + e.getMessage());
		}
		
		return communityList;
	}
	// 찜 목록 리스트
	@Override
	public List<WishList> memberWishList(WishList wishList) {
		Member member =(Member) https.getAttribute("member");
		List<WishList> memberWishList = new ArrayList<WishList>();
		System.out.println("MemberDaoImpl1 memberWishList() start...");
		wishList.setM_num(member.getM_num());
		System.out.println("MemberDaoImpl1 memberWishList() wishList.m_num -> " +wishList.getM_num());
		System.out.println("MemberDaoImpl1 memberWishList() member.m_num -> " + member.getM_num());
		try {
			memberWishList = session.selectList("ybWishList", wishList);
			
			System.out.println("MemberDaoImpl1 memberWishList.size() -> " + memberWishList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberWishList Exception -> " + e.getMessage());
		}
		return memberWishList;
	}
	// 포인트리스트
	@Override
	public List<PointList> memberPointList(PointList pointList) {
		Member member =(Member) https.getAttribute("member");
		List<PointList> memberPointList = new ArrayList<PointList>();
		pointList.setM_num(member.getM_num());
		
		try {
			memberPointList = session.selectList("ybMemberQuizList", pointList);
			System.out.println("MemberDaoImpl1 memberPointList.size() -> " + memberPointList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberPointList Exception -> " + e.getMessage());
		}
		return memberPointList;
	}
	
	// 회원 탈퇴
	@Override
	public Member memberWithdraw(Member member) {
		System.out.println("MemberDaoImpl1 memberWithdraw() start...");
		member =(Member) https.getAttribute("member");
		System.out.println("MemberDaoImpl1 memberWithdraw() member.m_num -> " + member.getM_num());
		try {
			member = session.selectOne("ybMemberWithdraw", member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberWithdraw Exception -> " + e.getMessage());
		}
		return member;
	}
	
	// 회원 로그인 체크
	@Override
	public Member memberChk(String chk_Id) {
		System.out.println("MemberDaoImpl1 memberChk() start...");
		Member member = new Member();
		try {
			member = session.selectOne("ybMemberChk", chk_Id);	
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberChk() Exception -> " + e.getMessage());
		}
		if(chk_Id == null) {
			return null;	
		} else {
			return member;
		}
		
	}
	// 중고책 판매 리스트
	@Override
	public List<OldBook> oldBookSellList(OldBook oldbook) {
		System.out.println("MemberDaoImpl1 oldBookSellList() start...");
		Member member =(Member) https.getAttribute("member");
		List<OldBook> oldBookSellList = new ArrayList<OldBook>();
		try {
			oldbook.setM_num(member.getM_num());
			System.out.println("MemberServiceImpl1 oldBookSellList member.getNum -> " + oldbook.getM_num());
			oldBookSellList = session.selectList("ybOldBookSellList", oldbook); 
			System.out.println("MemberServiceImpl1 oldBookSellList oldBookSellList -> " + oldBookSellList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 oldBookSellList() Exception -> " + e.getMessage());
		}
		return oldBookSellList;
	}
	// 회원 이메일 
	@Override
	public Member findEmail(String memberMail) {
		System.out.println("MemberDaoImpl1 findEmail() start...");
		Member member = new Member();
		try {
			member = session.selectOne("ybFindEmail", memberMail);
			System.out.println("MemberDaoImpl1 findMail memberMail -> " + memberMail);
			System.out.println("에러에러에ㅓ레러레렝어네");
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 findEmail() Exception -> " + e.getMessage());
		}
		if(memberMail == null) {
			return null;	
		} else {
			return member;
		}
	}
	//  
	@Override
	public int memberPwUpdate(String m_pw, Member member) {
		System.out.println("MemberDaoImpl1 memberPwUpdate() start...");
		System.out.println("MemberDaoImpl1 memberPwUpdate member.getM_id -> " + member.getM_id());
		System.out.println("MemberDaoImpl1 memberPwUpdate m_pw -> " +m_pw);
		int memberPwUpdate = 0;
		try {
			memberPwUpdate = session.selectOne("ybMemberPwUpdate", m_pw);
			System.out.println("MemberDaoImpl1 memberPwUpdate memberPwUpdate -> " + memberPwUpdate);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberPwUpdate() Exception -> " + e.getMessage());
		}
		return memberPwUpdate;
	}
	@Override
	public Member memberPwChange(String m_num, String m_pw) {
		System.out.println("MemberDaoImpl1 memberPwChange() start...");
		Member memberPwChange = null;
		try {
			System.out.println("MemberDaoImpl1 memberPwChange() m_num -> " + m_num);
			System.out.println("MemberDaoImpl1 memberPwChange() m_pw -> " + m_pw);
			HashMap<String, Object> mapUpdate = new HashMap<>();
			mapUpdate.put("m_num", m_num);
			mapUpdate.put("m_pw", m_pw);
			
			memberPwChange = session.selectOne("ybMemberPwUpdate1", mapUpdate);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberPwChange() Exception -> " + e.getMessage());
		}
		return memberPwChange;
	}

	@Override
	public int memCount() {
		System.out.println("MemberDaoImpl1 memCount() start...");
		int memCount = 0;
		try {
			memCount = session.selectOne("ybMemCount");
			System.out.println("MemberDaoImpl1 memCount() memCount -> " + memCount);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memCount() Exception -> " +e.getMessage());
		}
		return memCount;
	}
	@Override
	public Member memberPwChange1(String m_email, String m_pw) {
		System.out.println("MemberDaoImpl1 memberPwChange1() start...");
		Member memberPwChange1 = null;
		try {
			System.out.println("MemberDaoImpl1 memberPwChange1() m_num -> " + m_email);
			System.out.println("MemberDaoImpl1 memberPwChange1() m_pw -> " + m_pw);
			HashMap<String, Object> mapUpdate = new HashMap<>();
			mapUpdate.put("m_email", m_email);
			mapUpdate.put("m_pw", m_pw);
			
			memberPwChange1 = session.selectOne("ybMemberPwUpdate2", mapUpdate);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberPwChange1() Exception -> " + e.getMessage());
		}
		return memberPwChange1;
	}
	@Override
	public Member memberFindPh(String phoneHyphen) {
		System.out.println("MemberDaoImpl1 memberFindPh() start...");
		Member memberFindPh = null;
		try {
			System.out.println("MemberDaoImpl1 memberFindPh() phoneHyphen -> " + phoneHyphen);
			memberFindPh = session.selectOne("ybMemberFindPh", phoneHyphen);
			System.out.println("MemberDaoImpl1 memberFindPh() memberFindPh -> " + memberFindPh);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberFindPh() Exception -> " + e.getMessage());
		}
		return memberFindPh;
	}
	@Override
	public Member memberPwChangeByPh(String m_ph, String m_pw) {
		System.out.println("MemberDaoImpl1 memberPwChangeByPh() start...");
		Member memberPwChangeByPh = null;
		try {
			System.out.println("MemberDaoImpl1 memberPwChangeByPh() m_ph -> " + m_ph);
			System.out.println("MemberDaoImpl1 memberPwChangeByPh() m_pw -> " + m_pw);
			HashMap<String, Object> mapUpdate = new HashMap<>();
			mapUpdate.put("m_ph", m_ph);
			mapUpdate.put("m_pw", m_pw);
			
			memberPwChangeByPh = session.selectOne("ybMemberPwChangeByPh", mapUpdate);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberPwChangeByPh() Exception -> " + e.getMessage());
		}
		return memberPwChangeByPh;
	}
	@Override
	public int communityInsert(Community community) {
		System.out.println("MemberDaoImpl1 communityInsert() start...");
		int communityInsert = 0;
		try {
			communityInsert = session.insert("ybCommunityInsert", community);
			
					
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 communityInsert() Exception -> " + e.getMessage());
		}
		return communityInsert;
	}
	// 커뮤니티 책  검색
	@Override
	public List<NewBook> searchListBook(NewBook newbook) {
		System.out.println("MemberDaoImpl1 searchListBook() start...");
		List<NewBook> searchListBook = new ArrayList<NewBook>();
		
		try {
			searchListBook = session.selectList("ybSearchListBook", newbook);
			System.out.println("MemberDaoImpl1 searchListBook() searchListBook.size() -> " + searchListBook.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 searchListBook() Exception -> " + e.getMessage());
		}
		return searchListBook;
	}
	// 검색 책 갯수
	@Override
	public int searchBookCnt(NewBook newbook) {
		System.out.println("MemberDaoImpl1 searchBookCnt() start...");
		int searchBookCnt = 0;
		try {
			searchBookCnt = session.selectOne("ybSearchBookCnt", newbook);
			System.out.println("MemberDaoImpl1 searchBookCnt() searchBookCnt -> " + searchBookCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 searchBookCnt() Exception -> " + e.getMessage());
		}
		return searchBookCnt;
	}
	@Override
	public Community selectBookDetail(int cm_num) {
		System.out.println("MemberDaoImpl1 selectBookDetail() start...");
		Community community = null;
		try {
			community = session.selectOne("ybSelectBookDetail", cm_num);
			System.out.println("MemberDaoImpl1 selectBookDetail() cm_num -> " + cm_num);
			System.out.println("MemberDaoImpl1 selectBookDetail() community -> " + community);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 selectBookDetail() Exception -> " + e.getMessage());
		}
		return community;
	}
	@Override
	public List<Community> sameDetailList(int nb_num) {
		Community community = new Community();
		System.out.println("MemberDaoImpl1 sameDetailList() start...");
		List<Community> sameDetailList = new ArrayList<Community>();
		System.out.println("MemberDaoImpl1 sameDetailList() nb_num -> " + nb_num);
		try {
			sameDetailList = session.selectList("ybSameDetailList", nb_num);
			System.out.println("MemberDaoImpl1 sameDetailList() sameDetailList.size -> " + sameDetailList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 sameDetailList() Exception -> " + e.getMessage());
		}
		return sameDetailList;
	}
	@Override
	public int readCntUp(int cm_num) {
		int readCntUp = 0;
		System.out.println("MemberDaoImpl1 readCntUp() start...");
		System.out.println("MemberDaoImpl1 readCntUp() cm_num -> " + cm_num);
		try {
			readCntUp = session.update("ybReadCntUp", cm_num);
			System.out.println("MemberDaoImpl1 readCntUp() readCntUp -> " + readCntUp);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 readCntUp() Exception -> " + e.getMessage());
		}
		return readCntUp;
	}
	@Override
	public int communityUpdateDo(Community community) {
		int communityUpdateDo = 0;
		System.out.println("MemberDaoImpl1 communityUpdateDo() start...");
		System.out.println("MemberDaoImpl1 communityUpdateDo() community -> " + community);
		try {
			communityUpdateDo = session.update("ybCommunityUpdateDo", community);
			System.out.println("MemberDaoImpl1 communityUpdateDo() communityUpdateDo -> " + communityUpdateDo);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 communityUpdateDo() Exception -> " + e.getMessage());
		}
		return communityUpdateDo;
	}
	@Override
	public int communityHitPush(int cm_num) {
		int communityHitPush = 0;
		System.out.println("MemberDaoImpl1 communityHitPush() start...");
		System.out.println("MemberDaoImpl1 communityHitPush() cm_num -> " + cm_num);
		try {
			communityHitPush = session.update("ybCommunityHitPush", cm_num);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 communityHitPush() Exception -> " + e.getMessage());
		}
		return communityHitPush;
	}
	@Override
	public int communityDelete(int cm_num) {
		int communityDelete = 0;
		System.out.println("MemberDaoImpl1 communityDelete() start...");
		System.out.println("MemberDaoImpl1 communityDelete() cm_num -> " + cm_num);
		try {
			communityDelete = session.delete("ybCommunityDelete", cm_num);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 communityDelete() Exception -> " + e.getMessage());
		}
		return communityDelete;
	}
	// 내 커뮤니티 리스트 갯수
	@Override
	public int comMyListTotalCnt(int m_num) {
		System.out.println("MemberDaoImpl1 comMyListTotalCnt() start...");
		int comMyListTotalCnt = 0;
		try {
			comMyListTotalCnt = session.selectOne("ybComListTotalCnt", m_num);
			System.out.println("MemberDaoImpl1 comListTotalCnt() comListTotalCnt -> " + comMyListTotalCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 comListTotalCnt() Exception -> " + e.getMessage());
		}
		return comMyListTotalCnt;
	}
	// 내 커뮤니티 리스트
	@Override
	public List<Community> communityMyList(Community community) {
		List<Community> communityMyList = new ArrayList<Community>();
		System.out.println("MemberDaoImpl1 communityMyList() start...");
		System.out.println("MemberDaoImpl1 communityMyList() cart.m_num -> " +community.getM_num());
		try {
			communityMyList = session.selectList("ybCommunityMyList", community);
			
			System.out.println("MemberDaoImpl1 communityMyList.size() -> " + communityMyList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 communityMyList Exception -> " + e.getMessage());
		}	
		return communityMyList;
	}
	@Override
	public int deleteImage(int cm_num) {
		System.out.println("MemberDaoImpl1 deleteImage() start...");
		System.out.println("MemberDaoImpl1 deleteImage() cm_num -> " + cm_num);
		int deleteImage = 0;
		try {
			deleteImage = session.update("ybDeleteImage", cm_num);
			
			System.out.println("MemberDaoImpl1 deleteImage -> " + deleteImage);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 deleteImage Exception -> " + e.getMessage());
		}	
		return deleteImage;
	}
	@Override
	public int deleteImage1(int cm_num) {
		System.out.println("MemberDaoImpl1 deleteImage1() start...");
		System.out.println("MemberDaoImpl1 deleteImage1() cm_num -> " + cm_num);
		int deleteImage1 = 0;
		try {
			deleteImage1 = session.update("ybDeleteImage1", cm_num);
			
			System.out.println("MemberDaoImpl1 deleteImage1 -> " + deleteImage1);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 deleteImage1 Exception -> " + e.getMessage());
		}	
		return deleteImage1;
	}
	@Override
	public int totalPoint(int m_num) {
		System.out.println("MemberDaoImpl1 totalPoint() start...");
		System.out.println("MemberDaoImpl1 totalPoint() cm_num -> " + m_num);
		int totalPoint = 0;
		try {
			totalPoint = session.selectOne("ybTotalPoint", m_num);
			
			System.out.println("MemberDaoImpl1 totalPoint -> " + totalPoint);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalPoint Exception -> " + e.getMessage());
		}	
		return totalPoint;
	}
	@Override
	public List<NewBook> ybBookList(NewBook newbook) {
		System.out.println("MemberDaoImpl1 ybBookList() start...");
		System.out.println("MemberDaoImpl1 ybBookList() newbook -> " + newbook);
		List<NewBook> ybBookList = null;
		try {
			ybBookList = session.selectList("ybBookList", newbook);
			
			System.out.println("MemberDaoImpl1 ybBookList -> " + ybBookList);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 ybBookList Exception -> " + e.getMessage());
		}	
		return ybBookList;
	}
	@Override
	public int commHeartInsert(int cm_num, int m_num) {
		System.out.println("MemberDaoImpl1 commHeartInsert() start...");
		System.out.println("MemberServiceImpl1 commHeartInsert cm_num -> " + cm_num);
		System.out.println("MemberServiceImpl1 commHeartInsert m_num -> " + m_num);
		int commHeartInsert = 0;
		try { // 좋아요 상태에 따른 값 설정
			CommHeart commHeart = new CommHeart();
			commHeart.setCm_num(cm_num);
			commHeart.setM_num(m_num);
				commHeartInsert = session.insert("ybCommHeartInsert", commHeart);
			} catch (Exception e) {
			System.out.println("MemberDaoImpl1 commHeartInsert Exception -> " + e.getMessage());
		}
		return commHeartInsert;
	}
	@Override
	public CommHeart confirmHeart(CommHeart commHeart) {
		System.out.println("MemberDaoImpl1 confirmHeart() start...");
		
		try {
			commHeart = session.selectOne("ybConfirmHeart",commHeart);
			System.out.println("MemberDaoImpl1 confirmHeart() commHeart -> " + commHeart);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 confirmHeart Exception -> " + e.getMessage());
		}
		return commHeart;
	}
	// 좋아요 상태 변경
	@Override
	public int commHeartUpdate(CommHeart commHeart) {
		System.out.println("MemberDaoImpl1 commHeartUpdate() start...");
		System.out.println("MemberDaoImpl1 commHeartUpdate cm_num -> " + commHeart.getCm_num());
		System.out.println("MemberDaoImpl1 commHeartUpdate commHeart.getM_num -> " + commHeart.getM_num());
		System.out.println("MemberDaoImpl1 commHeartUpdate before commHeart.getH_status -> " + commHeart.getH_status());
		int status = commHeart.getH_status();
		int commHeartInsert = 0;
		int h_status = 0;
		try { // 좋아요 상태에 따른 값 설정
			if(status == 1) {
				h_status = 0;
				commHeart.setH_status(h_status);
				commHeartInsert = session.insert("ybCommHeartUpdate", commHeart);
				System.out.println("MemberDaoImpl1 commHeartUpdate after commHeart.getH_status -> " + commHeart.getH_status());
			} else {
				h_status = 1;
				commHeart.setH_status(h_status);
				commHeartInsert = session.insert("ybCommHeartUpdate", commHeart);
				System.out.println("MemberDaoImpl1 commHeartUpdate after commHeart.getH_status -> " + commHeart.getH_status());
			}	
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 commHeartInsert Exception -> " + e.getMessage());
		}
		return commHeartInsert;
	}
	@Override
	public int updateHitCnt(CommHeart commHeart, Community community) {
		System.out.println("MemberDaoImpl1 updateHitCnt() start...");
		System.out.println("MemberDaoImpl1 updateHitCnt cm_num -> " + commHeart.getCm_num());
		System.out.println("MemberDaoImpl1 updateHitCnt m_num -> " + commHeart.getM_num());
		System.out.println("MemberDaoImpl1 updateHitCnt before community.getHitCnt -> " + community.getCm_hitCnt());
		int status = commHeart.getH_status();
		int updateHitCnt = 0;
		int cm_hitCnt = community.getCm_hitCnt();
		try { // 좋아요 상태에 따른 값 설정
			if(status == 0) {
				community.setCm_hitCnt(cm_hitCnt-1);
				updateHitCnt = session.insert("ybUpdateHitCnt", community);
				System.out.println("MemberDaoImpl1 updateHitCnt after community.getHitCnt -> " + community.getCm_hitCnt());
			} else {
				community.setCm_hitCnt(cm_hitCnt+1);
				updateHitCnt = session.insert("ybUpdateHitCnt", community);
				System.out.println("MemberDaoImpl1 updateHitCnt after community.getHitCnt -> " + community.getCm_hitCnt());
			}	
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 commHeartInsert Exception -> " + e.getMessage());
		}
		return updateHitCnt;
	}
	@Override
	public List<Community> popularList(Community community) {
		List<Community> popularList = new ArrayList<Community>();
		System.out.println("MemberDaoImpl1 popularList() start...");
		try {
			popularList = session.selectList("ybPopularList", community);
			
			System.out.println("MemberDaoImpl1 popularList.size() -> " + popularList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 popularList Exception -> " + e.getMessage());
		}
		
		return popularList;	
	}
	
}
	

	


	

	

	
	


