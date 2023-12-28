package com.choongang.s202350103.htService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.domain.KakaoPayApprovalVO;
import com.choongang.s202350103.htDao.OrderrDao;
import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderrServiceImpl implements OrderrService {
	private final OrderrDao od;

	@Override
	public int orderTotal() {
		System.out.println("HtService orderTotal Start...");
		int total = od.orderTotal();
		System.out.println("Service orderTotal() total--> " + total);
		return total;
	}

	@Override
	public List<NewBook> orderOne(NewBook newBook) {
		System.out.println("HtService orderOne Start...");
		List<NewBook> orderOne = od.orderOne(newBook);
		return orderOne;
	}

	@Override
	public List<Cart> orderList(Cart cart, Member member) {
		System.out.println("HtService orderList Start...");
		List<Cart> orderList = od.orderList(cart, member);
		return orderList;
	}

	@Override // 프로시저를 사용하기 때문에 void이어야 한다. 
	public void orderInsert(Orderr orderr, List<Cart> list) {
		System.out.println("HtService orderInsert Start...");
		od.orderInsert(orderr, list);
		return ;
	}

	@Override
	public Orderr orderPayment(Orderr orderr) {
		Orderr orderr2 = od.orderPayment(orderr);
		return orderr2;
	}

	@Override
	public int paySuccess(KakaoPayApprovalVO ka) {
		System.out.println("HtService orderInsert Start...");
		int result = od.paySuccess(ka);
		return result;
	}

	@Override
	public Member selectMember(Member member) {
		System.out.println("HtService selectMember Start...");
		member = od.selectMember(member);
		return member;
	}

	@Override
	public Orderr obNumSelect(KakaoPayApprovalVO kakaoDto) {
		System.out.println("HtService obNumSelect Start...");
		Orderr orderr = od.obNumSelect(kakaoDto);
		return orderr;
	}



	

}
