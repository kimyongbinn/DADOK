package com.choongang.s202350103.shDao;

import java.util.List;

import com.choongang.s202350103.model.AttJoin;

public interface AttJoinDao {

	List<AttJoin> 	 listAttJoin(AttJoin attJoin);
	List<AttJoin> 	 subDate(AttJoin attJoin);
	int 			 checkChance(AttJoin attJoin);
	AttJoin 		 searchAtt(AttJoin attJoin);
	int 			 addAtt(AttJoin attJoin);
	void 			 saveAddAtt(AttJoin attJoin);
	void 			 searchAddAtt(AttJoin attJoin);
	void 			 stampAddAtt(AttJoin attJoin);
	int 			 countAttRow(AttJoin attJoin);
	void 			 checkAtt(AttJoin attJoin);
}
