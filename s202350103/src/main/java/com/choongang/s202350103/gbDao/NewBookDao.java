package com.choongang.s202350103.gbDao;

import java.util.List;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.WishList;

public interface NewBookDao { 

	List<NewBook> 	selectInNewBookList(NewBook newbook);
	int 		  	selectInNewBookCnt(NewBook newbook);
	int 			selectSearchNewBookCnt(NewBook newbook);
	List<NewBook> 	selectSearchNewBookList(NewBook newbook);
	NewBook 		selectNewBookDetail(NewBook newbook);
	int 			updateReadCnt(int nb_num);
	List<NewBook> 	selectHitNbNum();
	int 			selectWishStatus(WishList wishlist);
	int 			InsertUpdateWish(WishList wishlist);
	int 			insertCart(Cart cart);
	int 			updateCartCount(Cart cart);
	void 			deleteCart(Cart cart);
	List<NewBook> 	selectSearchBoNewBookList(NewBook newbook);
	NewBook 		selectBoNewBookDetail(NewBook newbook);
	int 			updateBoNewbook(NewBook newbook);
	List<NewBook> 	selectBoNewBookList(NewBook newbook);
	int 			deleteBoNewbook(int nb_num);
	int 			insertBoNewbook(NewBook newbook);
	NewBook 		selectRecentBookList(int nb_num);
	NewBook 		selectAllHitNbNum();
	List<NewBook> 	selectReleaseNewbookListNum();   
} 
