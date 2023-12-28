package com.choongang.s202350103.hrService;

import org.springframework.stereotype.Service;
import com.choongang.s202350103.hrDao.NewbookDao;
import com.choongang.s202350103.model.NewBook;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NewbookServiceImpl implements NewbookService {
	private final NewbookDao nd;

	// FO 선물하기 - 상품 정보 조회
	@Override
	public NewBook selectNewbook(int nb_num) {
		System.out.println("NewbookServiceImpl selectNewbook() start..");
		
		NewBook newbook = nd.selectNewbook(nb_num);
		System.out.println("NewbookServiceImpl selectNewbook() newbook.getNb_title() -> "+newbook.getNb_title());
		
		System.out.println("NewbookServiceImpl selectNewbook() end..");
		return newbook;
	}

}
