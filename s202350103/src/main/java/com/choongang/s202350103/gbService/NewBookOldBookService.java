package com.choongang.s202350103.gbService;

import java.util.List;

import com.choongang.s202350103.model.NewBookOldBook;

public interface NewBookOldBookService {

	List<NewBookOldBook> selectSameOldBookList(int nb_num);

}
