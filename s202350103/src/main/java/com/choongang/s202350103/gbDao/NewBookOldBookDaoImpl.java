package com.choongang.s202350103.gbDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.NewBookOldBook;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NewBookOldBookDaoImpl implements NewBookOldBookDao {
	private final SqlSession session;
	
	@Override
	public List<NewBookOldBook> selectSameOldBookList(int nb_num) {
		System.out.println("NewBookOldBookDaoImpl selectSameOldBookList start...");
		List<NewBookOldBook> sameOldBookList = null;
		try {
			sameOldBookList = session.selectList("gbSelectSameOldBookList", nb_num);
			System.out.println("NewBookOldBookDaoImpl selectSameOldBookList sameOldBookList ->"+sameOldBookList.size());
		} catch (Exception e) {
			System.out.println("NewBookOldBookDaoImpl selectSameOldBookList -> "+e.getMessage());
		}
		return sameOldBookList;
	}

}
