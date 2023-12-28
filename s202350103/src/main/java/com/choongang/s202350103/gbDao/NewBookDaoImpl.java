package com.choongang.s202350103.gbDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.WishList;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NewBookDaoImpl implements NewBookDao { 
	private final SqlSession session;
	
	@Override
	public List<NewBook> selectInNewBookList(NewBook newbook) {
		List<NewBook> listInNewBook = null;
		try {
			System.out.println("NewBookDaoImpl selectInNewBookList Start...");
		listInNewBook = session.selectList("gbSelectInNbList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookList listInNewBook.size() -> "+listInNewBook.size());
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectInNewBookList -> "+e.getMessage());
		}
		
		return listInNewBook;
	}

	@Override
	public int selectInNewBookCnt(NewBook newbook) {
		int inNewbookCnt = 0;
		try {
			System.out.println("NewBookDaoImpl selectInNewBookCnt Start...");
			inNewbookCnt = session.selectOne("gbSelectInNbCnt", newbook);
			System.out.println("NewBookDaoImpl selectInNewBookCnt inNewbookCnt");
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectInNewBookCnt -> "+e.getMessage());
		}
		
		return inNewbookCnt;
	}

	@Override
	public int selectSearchNewBookCnt(NewBook newbook) {
		int searchNewbookCnt = 0;
		try {
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt Start...");
			searchNewbookCnt = session.selectOne("gbSearchSelectInNbCnt", newbook);
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt searchNewbookCnt -> "+searchNewbookCnt);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt -> "+e.getMessage());
		}
		
		return searchNewbookCnt;
	}

	@Override
	public List<NewBook> selectSearchNewBookList(NewBook newbook) {
		List<NewBook> listSearchNewbook = null;
		try {
			System.out.println("NewBookDaoImpl selectSearchNewBookList Start...");
			listSearchNewbook = session.selectList("gbSelectSearchBList", newbook);
			System.out.println("NewBookDaoImpl selectSearchNewBookList listSearchNewbook.size() -> "+listSearchNewbook.size());
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectSearchNewBookList -> "+e.getMessage());
		}
		
		return listSearchNewbook;
	}

	@Override
	public NewBook selectNewBookDetail(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectNewBookDetail Start...");
		NewBook selectNewbook = null;
		try {
			selectNewbook = session.selectOne("gbSelectNewBook", newbook);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectNewBookDetail -> "+e.getMessage());
		}
		return selectNewbook;
	}

	@Override
	public int updateReadCnt(int nb_num) {
		System.out.println("NewBookDaoImpl updateReadCnt Start...");
		int result = 0;
		try {
			result = session.update("gbUpdateReadCnt", nb_num);
			System.out.println("NewBookDaoImpl selectNewBookDetail result->"+result);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl updateReadCnt -> "+e.getMessage());
		}
		
		return result;
	}

	@Override
	public List<NewBook> selectHitNbNum() {
		System.out.println("NewBookDaoImpl selectHitNbNum Start...");
		List<NewBook> hit_nb_num = null;
		
		try {
			hit_nb_num = session.selectList("gbSelectHitNbNum");
			System.out.println("hit_nb_num -> "+hit_nb_num.size());
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectHitNbNum -> "+e.getMessage());
		}
		
		return hit_nb_num;
	}

	@Override
	public int selectWishStatus(WishList wishlist) {
		System.out.println("NewBookDaoImpl selectWishStatus start...");
		int wishStatus = session.selectOne("gbselectWishStatus", wishlist);
		System.out.println("NewBookDaoImpl selectWishStatus wishStatus -> "+wishStatus);
		return wishStatus;
	}

	@Override
	public int InsertUpdateWish(WishList wishlist) {
		System.out.println("NewBookDaoImpl InsertUpdateWish start...");
		int result = session.insert("gbInsertUpdateWish", wishlist);
		System.out.println("NewBookDaoImpl InsertUpdateWish result->"+result);
		return result;
	}

	@Override
	public int insertCart(Cart cart) {
		int result = 0;
		System.out.println("NewBookDaoImpl insertCart start...");
		result = session.insert("gbInsertCart", cart);
		System.out.println("NewBookDaoImpl insertCart cart->"+result);
		return result;
	}

	@Override
	public int updateCartCount(Cart cart) {
		System.out.println("NewBookDaoImpl updateCartCount start...");
		int result = session.update("gbUpdateCartCount", cart);
		System.out.println("NewBookDaoImpl updateCartCount result->"+result);
		
		return result;
	}

	@Override
	public void deleteCart(Cart cart) {
		System.out.println("NewBookDaoImpl updateCartCount start...");
		session.delete("gbDeleteCart", cart);
		
	}

	@Override
	public List<NewBook> selectSearchBoNewBookList(NewBook newbook) {
		List<NewBook> listSearchNewbook = null;
		try {
			System.out.println("NewBookDaoImpl selectSearchNewBookList Start...");
			listSearchNewbook = session.selectList("gbSelectSearchBOBList", newbook);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectSearchNewBookList -> "+e.getMessage());
		}
		
		return listSearchNewbook;
	}

	@Override
	public NewBook selectBoNewBookDetail(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectBoNewBookDetail Start...");
		NewBook bonewbook = null;
		try {
			bonewbook = session.selectOne("gbselectBoNewBookDetail", newbook);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectBoNewBookDetail -> "+e.getMessage());
		}
		return bonewbook;
	}

	@Override
	public int updateBoNewbook(NewBook newbook) {
		System.out.println("NewBookDaoImpl updateBoNewbook Start...");
		int result = 0;
		try {
			result = session.update("gbUpdateBoNewbook", newbook);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl updateBoNewbook -> "+e.getMessage());
		}
		return result;
	}

	@Override
	public List<NewBook> selectBoNewBookList(NewBook newbook) {
		List<NewBook> listBoNewbook = null;
		try {
			System.out.println("NewBookDaoImpl selectBoNewBookList Start...");
			listBoNewbook = session.selectList("gbSelectInNbList", newbook);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectBoNewBookList -> "+e.getMessage());
		}
		
		return listBoNewbook;
	}

	@Override
	public int deleteBoNewbook(int nb_num) {
		System.out.println("NewBookDaoImpl deleteBoNewbook Start...");
		int result = 0;
		try {
			result = session.delete("gbDeleteBoNewbook", nb_num);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl deleteBoNewbook -> "+e.getMessage());
		}
		return result;
	}

	@Override
	public int insertBoNewbook(NewBook newbook) {
		System.out.println("NewBookDaoImpl insertBoNewbook Start...");
		int result = 0;
		try {
			result = session.insert("gbInsertBoNewbook", newbook);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl insertBoNewbook -> "+e.getMessage());
		}
		return result;
	}

	@Override
	public NewBook selectRecentBookList(int book_num) {
		System.out.println("NewBookDaoImpl selectRecentBookList Start...");
		NewBook recentBook = null;
		try {
			recentBook = session.selectOne("gbSelectRecentBookList", book_num);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectRecentBookList -> "+e.getMessage());
		}
		return recentBook;
	}

	@Override
	public NewBook selectAllHitNbNum() {
			System.out.println("NewBookDaoImpl selectHitNbNum Start...");
			NewBook hitBook = null;
			
			try {
				hitBook = session.selectOne("gbSelectAllHitNbNum");
				// System.out.println("NewBookDaoImpl selectNewBookDetail hitBook->"+hitBook);
			} catch (Exception e) {
				System.out.println("NewBookDaoImpl selectHitNbNum -> "+e.getMessage());
			}
			
			return hitBook;
		}

	@Override
	public List<NewBook> selectReleaseNewbookListNum() {
		// 최근 신작 도서 5개 도서 리스트
		System.out.println("NewBookDaoImpl selectReleaseNewbookListNum Start...");
		List<NewBook> releaseNewbookList = null;
		
		try {
			releaseNewbookList = session.selectList("gbReleaseNewbookList");
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectReleaseNewbookListNum -> "+e.getMessage());
		}
		
		return releaseNewbookList;
	}

	}

