package com.choongang.s202350103.hrService;

import java.util.List;

import com.choongang.s202350103.domain.KakaoPayApprovalVO;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.OrderDetail;
import com.choongang.s202350103.model.OrderGift;
import com.choongang.s202350103.model.Orderr;

public interface OrderService {
	int 		 	  countOrderrList();
	List<Orderr> 	  selectOrderrList(Orderr orderr);
	Orderr 			  selectOrderr(long o_order_num);
	int 			  statusCancellation(long o_order_num);
	int 			  statusDelivered(long o_order_num);
	int 			  statusConfirmation(long o_order_num);
	int 			  statusShipping(Orderr orderr);
	int 		 	  statusExchange(Orderr orderr);
	int 		 	  statusReturn(Orderr orderr);
	List<OrderDetail> selectOrderProduct(long o_order_num);
	int 			  givingGiftAction(Member member, Orderr orderr, OrderGift orderGift);
	Orderr 			  selectOrderr_GiftType(long o_order_num);
	OrderGift 		  selectOrderGift(long o_order_num);
	int 			  gettingGiftAction(Orderr orderr, OrderGift orderGift);
	int 			  orderUpload(List<Orderr> orderrList);
	int 			  givingGiftActionSuccess(KakaoPayApprovalVO ka);
	
}
