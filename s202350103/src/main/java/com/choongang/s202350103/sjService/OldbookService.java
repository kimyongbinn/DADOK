package com.choongang.s202350103.sjService;

import java.util.List;

import com.choongang.s202350103.model.OldBook;

public interface OldbookService {

	int 				 totalOb(OldBook oldBook);
	List<OldBook>		 listOb(OldBook oldBook);
	OldBook				 detailOb(int ob_num);
	int 				 updateOb(OldBook oldBook);
	int     			 insertOldBook(OldBook oldBook);
	List<OldBook>        oldBookAcc();
	List<OldBook>        listMoOb(OldBook oldBook);
	OldBook              ModetailNb(int nb_num);
	List<OldBook>        listObFo(OldBook oldBook);
	int                  totalOb2(OldBook oldBook);
	int                  updateObComp(OldBook oldBook);
	int                  totalNb();
	int                  updateReadCnt(int ob_num);
	List<OldBook>        selectRendomObNum();



	  
		  
		
}
