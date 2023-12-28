package com.choongang.s202350103.ybDao;


import java.util.List;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.CommHeart;
import com.choongang.s202350103.model.Community;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OldBook;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.WishList;

public interface MemberDao {
	Member				login(Member member1);

	int 				totalCart(Member member);

	List<Cart> 			listCart(Cart cart, Member member);

	int 				totalPrice(Member member);

	int 				totalWishList(Member member);

	List<WishList>  	memberWishList(WishList wishList);

	Member				memberWithdraw(Member member);

	Member 				memberChk(String chk_Id);

	List<PointList> 	memberPointList(PointList pointList);

	int 				totalSellCnt(Member member);

	List<OldBook> 		oldBookSellList(OldBook oldbook);

	Member 				findEmail(String memberMail);

	int 				memberPwUpdate(String m_pw, Member member);

	Member 				memberPwChange(String m_num, String m_pw);

	int       			memCount();

	Member 				memberPwChange1(String m_email, String m_pw);

	Member 				memberFindPh(String phoneHyphen);

	Member 				memberPwChangeByPh(String m_ph, String m_pw);

	List<Community> 	communityList(Community community);

	int 				comListTotalCnt(Community community);

	int 				communityInsert(Community community);

	List<NewBook> 		searchListBook(NewBook newbook);

	int 				searchBookCnt(NewBook newbook);

	int 				pointListCnt(PointList pointList);

	Community 			selectBookDetail(int cm_num);

	List<Community> 	sameDetailList(int nb_num);

	int		 			readCntUp(int cm_num);

	int 				communityUpdateDo(Community community);

	int 				communityHitPush(int cm_num);

	int 				communityDelete(int cm_num);

	int 				comMyListTotalCnt(int m_num);

	List<Community> 	communityMyList(Community community);

	int 				deleteImage(int cm_num);

	int 				deleteImage1(int cm_num);

	int 				totalPoint(int m_num);

	List<NewBook> 		ybBookList(NewBook newbook);

	int 				commHeartInsert(int cm_num, int m_num);

	CommHeart 			confirmHeart(CommHeart commHeart);

	int 				commHeartUpdate(CommHeart commHeart);

	int 				updateHitCnt(CommHeart commHeart, Community community);

	List<Community>	 	popularList(Community community);

	int 				bookListCnt(NewBook newbook);


}
