package com.choongang.s202350103.gbDao;

import java.util.List;

import com.choongang.s202350103.model.NewBookOldBook;

public interface NewBookOldBookDao {

	List<NewBookOldBook> selectSameOldBookList(int nb_num);

}
