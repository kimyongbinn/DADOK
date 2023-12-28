package com.choongang.s202350103.hrDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.choongang.s202350103.model.NewBook;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NewbookDaoImpl implements NewbookDao {
	private final SqlSession session;

	// FO 선물하기 - 상품 정보 조회
	@Override
	public NewBook selectNewbook(int nb_num) {
		System.out.println("NewbookDaoImpl selectNewbook() start..");
		
		NewBook newbook = new NewBook();
		try {
			newbook = session.selectOne("hrSelectNewbook", nb_num);
			System.out.println("NewbookDaoImpl selectNewbook() newbook.getNb_title() -> "+newbook.getNb_title());
		} catch (Exception e) {
			System.out.println("NewbookDaoImpl selectNewbook() e.getMessage() -> "+e.getMessage());
		}
		
		System.out.println("NewbookDaoImpl selectNewbook() end..");
		return newbook;
	}

}
