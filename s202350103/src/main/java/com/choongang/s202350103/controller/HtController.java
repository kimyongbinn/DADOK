package com.choongang.s202350103.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.LifecycleListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choongang.s202350103.domain.AmountVO;
import com.choongang.s202350103.domain.KakaoPayApprovalVO;
import com.choongang.s202350103.gbService.PointChargeService;
import com.choongang.s202350103.hrService.OrderService;
import com.choongang.s202350103.htService.EmailService;
import com.choongang.s202350103.htService.KakaoPay;
//import com.choongang.s202350103.htService.KakaoPay;
import com.choongang.s202350103.htService.OrderrService;
import com.choongang.s202350103.htService.Paging;
import com.choongang.s202350103.htService.ReviewService;
import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OrderGift;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.Review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class HtController {
	private final OrderrService os;
	private final ReviewService rs;
	private final EmailService emailService;
	private final PointChargeService pcs;
	
	// 선물하기 관련 서비스 (희라)
	private final OrderService osHr;
	
	@RequestMapping("/reviewList")
	public String reviewList(Model model, Review review, HttpSession session,  Member member) {
		System.out.println("Controller Start reviewList...");
		
		
		// 임시 상품 등록(나중에 삭제)
		review.setNb_num(100042);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}

		int reviewTotal = rs.reviewTotal(review);
		double reviewAverage = rs.reviewAverage(review);

		review.setR_review_average(reviewAverage);
		review.setR_review_total(reviewTotal);

		for (int i = 1; i < 6; i++) {
			review.setR_rating(i);
			int reviewRatingCnt = rs.reviewRating(review);
			// 도서 리뷰 별점 평균
			switch (i) {
			case 1:
				review.setR_rating1((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 2:
				review.setR_rating2((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 3:
				review.setR_rating3((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 4:
				review.setR_rating4((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 5:
				review.setR_rating5((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			}
		}

		if (review.getEnd() == 0) {
			review.setEnd(5);
		}
		System.out.println("Controller Start review.getStart->" + review.getStart());
		System.out.println("Controller Start review.getEnd->" + review.getEnd());

		List<Review> listReview = rs.listReview(review);
		
		model.addAttribute("member",member);
		model.addAttribute("listReview", listReview);
		model.addAttribute("review", review);
		// model.addAttribute("reviewTotal", reviewTotal);

		return "/ht/foProductReviewList";
	}

	 @GetMapping("/MyReviewList")
	 public String MyReviewList(Model model, Orderr orderr, String currentPage, HttpSession session, Member member) {
		 System.out.println("HtController MyReviewList Start...");
		
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		
		orderr.setM_num(member.getM_num());
		
		// orderr 전체  Count ?
		int totalReviewCnt = rs.totalReviewCnt(orderr);
		System.out.println("totalReviewCnt--> " + totalReviewCnt);
		
		// Paging 작업
		Paging  page = new Paging(totalReviewCnt, currentPage);
		// Parameter orderr --> Page만 추가 setting
		orderr.setStart(page.getStart());    // 시작시 1
		orderr.setEnd(page.getEnd()); 		 // 시작시 5
		System.out.println("Start--> " + page.getStart());
		System.out.println("End--> " + page.getEnd());
		System.out.println("M_num--> " + orderr.getM_num());
		
		 
		List<Orderr> reviewWriteList = rs.reviewWriteList(orderr);
		System.out.println("HtController MyReviewList() reviewWriteList.size() --> "+ reviewWriteList.size());
		 
		model.addAttribute("page", page);
		model.addAttribute("reviewWriteList", reviewWriteList);
		model.addAttribute("member",member); 
		System.out.println("page--> " + page); 
		return "/ht/foMyReviewList";
	}
	 
	 @GetMapping("/MyReviewedList")
	 public String MyReviewedList(Model model, Review review, String currentPage, HttpSession session, Member member) {
		 System.out.println("HtController MyReviewList Start...");
		
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		review.setM_num(member.getM_num());
		 
		// orderr 전체 Count ?
		int totalReviewedCnt = rs.totalReviewedCnt(review);
		System.out.println("totalReviewedCnt--> " + totalReviewedCnt);
		System.out.println("currentPage--> " + currentPage);
		
		// Paging 작업 
		Paging page = new Paging(totalReviewedCnt, currentPage);
		
	    List<Review> reviewedWriteList = null;
		
		try {
			 //Parameter orderr --> Page만 추가 setting
			 System.out.println("Start--> " + page.getStart());
			 System.out.println("End--> " + page.getEnd());
			 review.setStart(page.getStart());//시작시 1 
			 review.setEnd(page.getEnd()); // 시작시 5
			 
			 review.setM_num(member.getM_num());
			 
			 
			 reviewedWriteList = rs.reviewedWriteList(review);
			 System.out.println("HtController MyReviewList() reviewedWriteList.size() --> "+ reviewedWriteList.size());
		 } catch (Exception e) {
			 System.out.println("HtController MyReviewList Exception -> " + e.getMessage());
		}
		 
		 
		 System.out.println("page--> " + page);
		 model.addAttribute("page", page);
		 model.addAttribute("reviewedWriteList", reviewedWriteList);
		 model.addAttribute("member",member);
		  
		 return "/ht/foMyReviewedList";
	}
	  
	 @RequestMapping("/reviewForm")
	 public String reviewForm(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewList...");
		
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		Review reviewOne = rs.reviewOne(review);
		
		model.addAttribute("member",member);
		model.addAttribute("review", review);
		model.addAttribute("reviewOne", reviewOne);
		
		return "/ht/foReviewWriteForm";
	}

	 @RequestMapping("/reviewWritePro")
	 public String reviewInsert(Model model, Review review, HttpSession session, Member member) {
		System.out.println("HtController reviewInsert Start...");
		
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		int result = rs.reviewInsert(review);
		System.out.println("HtController reviewInsert result-->" + result);
		
		model.addAttribute("result", result);
		model.addAttribute("member",member);
		
		return "/ht/foReviewWritePro";
	}
	 
	 @RequestMapping("/reviewUpdateForm")
	 public String reviewUpdateForm(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewUpdateForm...");
		System.out.println("reviewUpdateForm review---> "  + review);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		//PK 이용한 Review 조회 로직 추가
		Review writedReview = rs.writedReview(review);
		writedReview.setCurrentPage(review.getCurrentPage());
		
		model.addAttribute("writedReview", writedReview);
		model.addAttribute("member",member);
		
		return "/ht/foReviewUpdateForm";
	}
	 
	 @RequestMapping("/reviewUpdatePro")
	 public String reviewUpdatePro(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewUpdateForm...");
		System.out.println("reviewUpdatePro review---> "  + review);
		
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		int result = rs.reviewUpdate(review);
		
		System.out.println("result --> " + result);
		
		model.addAttribute("result", result);
		model.addAttribute("review", review);
		model.addAttribute("member",member);
		
		return "/ht/foReviewUpdatePro";
	}
	 
	 @RequestMapping("/reviewDelete")
	 public String reviewDelete(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewDelete...");

		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		int result = rs.reviewDelete(review);
		
		System.out.println("result --> " + result);
		
		model.addAttribute("result", result);
		model.addAttribute("review", review);
		model.addAttribute("member",member);
		
		return "/ht/foReviewDelete";
	}
	// 결제 폼
	 @RequestMapping("/orderForm")
	 public String orderForm(Model model, HttpSession session, Member member, NewBook newBook, Cart cart, int paymentType) {
		System.out.println("Controller Start orderForm ...");
		int totalPrice = 0;
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		Member member2 = os.selectMember(member);
		
		String[] splitPh   = member2.getM_ph().split("-");
		String[] splitAddr = member2.getM_addr().split("/");
		
		System.out.println("orderForm member2 --> "+ member2);
		System.out.println("paymentType--> "+ paymentType);
		
		System.out.println("newBook getC_count--> "+ newBook.getC_count());
		System.out.println("newBook getOb_num--> "+ newBook.getOb_num());
		
		
		// paymentType 1--> 바로결제, 2--> 장바구니 결제
		if (paymentType == 1) {
			// ob_num이 null이면 새상품 아니면 중고
			if(newBook.getOb_num() == 0) {
				List<NewBook> orderOne = os.orderOne(newBook);
				System.out.println("HtController orderOne--->" + orderOne);
				for(NewBook newBook2 : orderOne ) {
					totalPrice += (newBook2.getNb_price() * newBook2.getC_count());
					newBook.setTotalPrice(totalPrice);
					if ( totalPrice > 50000) newBook.setO_deliv_price(0);
					else                     newBook.setO_deliv_price(3000);
				}
				
				model.addAttribute("orderList", orderOne);
				model.addAttribute("cart", newBook);
				System.out.println("HtController totalPrice--->" + totalPrice);
			} else {
				List<NewBook> OldOrderOne = os.orderOne(newBook);
				System.out.println("HtController OldOrderOne1--->" + OldOrderOne);
				for(NewBook newBook3 : OldOrderOne ) {
					totalPrice += newBook3.getOb_sell_price();
					newBook.setTotalPrice(totalPrice);
					if ( totalPrice > 50000) newBook.setO_deliv_price(0);
					else                     newBook.setO_deliv_price(3000);
				}
				
				System.out.println("HtController OldOrderOne2--->" + OldOrderOne.get(0).getOb_num());
				
				model.addAttribute("orderList", OldOrderOne);
				model.addAttribute("cart", newBook);
				System.out.println("HtController totalPrice--->" + totalPrice);
			}
			
			
		} else if (paymentType == 2) {
			// 장바구니 결제(여러개)
			List<Cart> orderList = os.orderList(cart, member2);
			System.out.println("HtController orderList kkk --->" + orderList);
			for(Cart cart1 : orderList ) {
				totalPrice += (cart1.getNb_price() * cart1.getC_count());
			}
			cart.setTotalPrice(totalPrice);
			if ( totalPrice > 50000) cart.setO_deliv_price(0);
			else                     cart.setO_deliv_price(3000);
			
			model.addAttribute("orderList", orderList);
			model.addAttribute("cart", cart);
			System.out.println("HtController totalPrice--->" + totalPrice);
			System.out.println("HtController cart.getO_deliv_price())--->" + cart.getO_deliv_price());

		} 
		
		
		model.addAttribute("paymentType",paymentType);
		model.addAttribute("member",member2);
		model.addAttribute("splitPh",splitPh);
		model.addAttribute("splitAddr",splitAddr);
		
		return "/ht/foOrderForm";
	}

	 @RequestMapping("/orderAction")
	 public String orderAction(
								RedirectAttributes redirect,
					            String m_email1, 
					            String m_email, 
					
					            String m_ph1,
					            String m_ph2,
					            String m_ph3,
					
					            String m_addr1,
					            String m_addr2,
					            String m_addr,
					            
					            @ModelAttribute("destination") int    destination, // 1-> 최근 배송지 / 2-> 배송지 직접 입력
					            Model model, HttpSession session, Member member, Cart cart,
					            @ModelAttribute("orderr") Orderr orderr, 
					            @ModelAttribute("orderGift") OrderGift orderGift
								 ) {
		System.out.println("Controller orderAction Start...");
		System.out.println("Controller orderAction 1 orderr.getPaymentType()-->"+orderr.getPaymentType());
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		System.out.println("HtController orderAction o_order_count--> "+ orderr.getO_order_count());
		
		orderr.setM_num(member.getM_num());
		orderr.setM_name(member.getM_name());
		
		// 최근 주소지 = 1, 직접입력 = 2
		if(destination == 2) {
			orderr.setO_rec_addr("("+m_addr1+")/"+ m_addr2 +"/"+ m_addr );	// 우편번호 주소 상세주소 병합
			orderr.setO_rec_mail(m_email1+"@"+m_email);						// 이메일 병합
			orderr.setO_rec_ph(m_ph1+"-"+m_ph2+"-"+m_ph3);					// 전화번호 병합
			System.out.println("HtController orderAction orderr--> "+ orderr);
			System.out.println("HtController getO_rec_ph --> "+ orderr.getO_rec_ph());
			System.out.println("HtController o_rec_addr --> "+ orderr.getO_rec_addr());
		}
		
		System.out.println("HtController orderr-->"+orderr);
		
		System.out.println("Htcontroller orderAction 2 orderr.getPaymentType()---> " + orderr.getPaymentType());
		
		List<Cart> list =  new ArrayList<Cart>();
		
		System.out.println("HtController orderr.getOb_num()-->"+orderr.getOb_num());
		System.out.println("HtController orderr.getNb_num()-->"+orderr.getNb_num());
		
		if(orderr.getPaymentType() == 1) {
			cart.setM_num(member.getM_num());
			
			if(orderr.getOb_num() == 0) {
				cart.setNb_num(orderr.getNb_num());
			} else {
				cart.setOb_num(orderr.getOb_num());
			}
			cart.setC_count(orderr.getO_de_count());
			list.add(cart);
			System.out.println("orderAction list--> " + list);
		} else if (orderr.getPaymentType() == 2) {
			list = os.orderList(cart, member);

			System.out.println("orderAction list--> " + list);
		} 

		// Orderr 테이블 insert
		// 일반&선물 -> 주문번호 없음 / 포인트 충전 -> 주문번호 있음
		if(orderr.getO_order_num() == 0) {
			// 선물 -> o_type = 2
			if(orderr.getO_type() == 2) {
				osHr.givingGiftAction(member, orderr, orderGift);
			} else {
				os.orderInsert(orderr, list); //프로시저를 사용하므로 return값이 없어도 된다. orderr DTO에 값을 가지고 나온다. DAO 참고
				orderr.setO_type(1);
			}
		}else {
			orderr.setO_order_count(1);
			orderr.setNb_title("포인트 충전");
			System.out.println("orderr111 -> "+orderr);
		}
		
		//카카오페이 결제하기전 전송할 데이터 담기
		KakaoPayApprovalVO kakaoSendData = null;
		try {
			kakaoSendData = kakaoSendData(orderr);
		} catch (Exception e) {
			System.out.println("controller KakaoPayApprovalVO kakaoSendData -> " + e.getMessage());
		}
		
		System.out.println("KakaoPayApprovalVO kakaoSendData---> " +  kakaoSendData);
		
		redirect.addFlashAttribute("kakaoSendData", kakaoSendData);
		
		
		
		return "redirect:kakaoPay";
	}
	 
	 // 내장 클래스
	 // 카카오페이 결제하기 위해 필요한 필수 데이터를 카카오페이 DTO에 담는 내장 클래스
	 // 필수 데이터 1.partner_order_id(주문번호 또는 회원번호), 
	 //		    2.partner_user_id(회원 번호),
	 //			3.amount(결제 금액),
	 //         4.item_name(상품명),
	 //			5.quantity(결제 수량)
	 private KakaoPayApprovalVO kakaoSendData(Orderr orderr) {
		//필수 데이터 조회
		System.out.println("kakaoSendData orderr---> " + orderr);
		
		//카카오에서 요청한 DTO 변수명과 타입으로 변경
		String partner_order_id = String.valueOf(orderr.getO_order_num()); //주문번호 또는 회원번호
		String partner_user_id  = String.valueOf(orderr.getM_num()); //회원이름
		Integer quantity = orderr.getO_order_count(); //결제 수량
		Integer install_month = orderr.getO_type();   // 주문유형 (선물여부)
		String cid_secret = orderr.getO_rec_mail();	  // 메일
		String item_code = orderr.getM_name();			  // 회원이름
		//String item_code = orderr.getO_gift_msg();	  // 선물 메시지
		
		
		String item_name = null; //상품명
		if(quantity == 1) {// 1개 구매일 경우
			item_name = orderr.getNb_title(); 
		} else {           // 여러개 구매일 경우
			item_name = orderr.getNb_title() + " 외 " + (quantity-1) + "개";
		}
		AmountVO amountVO = new AmountVO();
		amountVO.setTotal(orderr.getO_pay_price()); //결제금액
		amountVO.setPoint(orderr.getO_point());		//사용포인트
		
		
		// kakaopay에 보낼것을 KakaoPayApprovalVO DTO에 담기
		KakaoPayApprovalVO kakaoDto = new KakaoPayApprovalVO();
		kakaoDto.setPartner_order_id(partner_order_id);
		kakaoDto.setPartner_user_id(partner_user_id);
		kakaoDto.setItem_name(item_name);
		kakaoDto.setQuantity(quantity);
		kakaoDto.setInstall_month(install_month);
		kakaoDto.setCid_secret(cid_secret);
		kakaoDto.setItem_code(item_code);
		kakaoDto.setAmount(amountVO);
		
		System.out.println("kakaoDto---> " + kakaoDto);
		
		// 결제할 정보담은 DTO 리턴
		return kakaoDto;
	 }
	 

	 // 카카오페이 결제 요청
	 @Setter(onMethod_ = @Autowired)
	 private KakaoPay kakaopay;  // Service

	 @RequestMapping("/kakaoPay") //Get : 정보를 요청하기위해 사용(Read), Post : 정보를 입력하기위해 사용(Create)
	 public String kakaoPay(RedirectAttributes redirect,
			 				@ModelAttribute("kakaoSendData") KakaoPayApprovalVO kakaoSendData) {
		 log.info("kakaoPay post............................................");
		 
		 System.out.println("kakaoPay kakaoSendData---> " + kakaoSendData);
		 
		 redirect.addFlashAttribute("kakaoSendData",kakaoSendData);
		 return "redirect:" + kakaopay.kakaoPayReady(kakaoSendData, redirect);
	 }
	 
	 // 결제 성공
	 @RequestMapping("/kakaoPaySuccess") // pg_token : 결제승인 요청을 인증하는 토큰 사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달
	 public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, 
			 						@ModelAttribute("kakaoDto") KakaoPayApprovalVO kakaoDto, Model model, HttpSession session, Member member, Orderr orderr) throws MessagingException {
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		 
		 
		 System.out.println("kakaoPaySuccess get............................................");
		 System.out.println("kakaoPaySuccess pg_token : " + pg_token);
		 System.out.println("kakaoPaySuccess kakaoDto --> " + kakaoDto);
		 
		 // orderr update 결과
		 int result = 0;
		 
		 // 카카오 결제 성공 응답 데이터
		 //KakaoPayApprovalVO kakaoResponse =  null;
		 try {
			// 카카오 결제 성공 응답 데이터
			kakaoDto =  kakaopay.kakaoPayInfo(pg_token, kakaoDto);
			
			System.out.println("kakaoDto22---> " + kakaoDto);
			
			
			if(kakaoDto.getPartner_order_id().length() != 4) {
				orderr = os.obNumSelect(kakaoDto);
				System.out.println("kakaoPaySuccess obNumSelect---> " + orderr);
			}
			
			if (String.valueOf(orderr.getNb_num()).startsWith("2")) {
				System.out.println("2로 시작해");
				kakaoDto.setGreen_deposit(orderr.getNb_num());
			} else {
				System.out.println("1로 시작해");
			}
			

			// 일반 & 선물 주문
			if(kakaoDto.getPartner_order_id().length() != 4) {
				// 일반 주문
				if(kakaoDto.getInstall_month() == 1) {
					// orderr update(주문상태 변경)
					result = os.paySuccess(kakaoDto);
					
				// 선물 주문 -> ORDERR UPDATE & POINT INSERT 수행
				} else if(kakaoDto.getInstall_month() == 2) {
					result = osHr.givingGiftActionSuccess(kakaoDto);
				}
			
			// 포인트 충전
			}else {
				int m_num = member.getM_num();
				
				result = pcs.InsertUpdatePointCharge(kakaoDto);
				System.out.println("GbController pointChargeTest result -> "+result);
				
				return "redirect:memberPointList?m_num="+m_num+"&result="+result;
			}
			 
		 }catch (Exception e) {
			 result = 0;
			 System.out.println("kakaoPaySuccess Exception -> " + e.getMessage());
		}
		 // 메일 보내기(고도화 예정)
		 //emailService.sendEmail("whgudxor1@naver.com", "Test Subject", "Hello, this is a test email.");
		 
		 System.out.println("kakaoPaySuccess end");
		 
		 model.addAttribute("kakaoResponse", kakaoDto);
		 model.addAttribute("result", result);
		 model.addAttribute("member", member);
		 
		 return "/ht/foPaySuccess";
	 }
	 
	 // 결제 실패
	 @RequestMapping("/kakaoPaySuccessFail") // pg_token : 결제승인 요청을 인증하는 토큰 사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달
	 public String kakaoPaySuccessFail(Model model, HttpSession session, Member member) {
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		 
		 
		 System.out.println("kakaoPaySuccess get............................................");
		 
		 int result = 2;
		 
		 try {
			 model.addAttribute("result", result);
			 model.addAttribute("member", member);
		 }catch (Exception e) {
		  System.out.println("kakaoPaySuccessFail Exception -> " + e.getMessage());
			
		}
		 System.out.println("kakaoPaySuccessFail end");
		 return "/ht/foPaySuccess";
	 }
	 
	 @RequestMapping("/kakaoPayCancel") // pg_token : 결제승인 요청을 인증하는 토큰 사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달
	 public String kakaoPayCancel(Model model, HttpSession session, Member member) {
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		 
		 
		 System.out.println("kakaoPayCancel get............................................");
		 
		 int result = 3;
		 
		 try {
			 model.addAttribute("result", result);
			 model.addAttribute("member", member);
		 }catch (Exception e) {
		  System.out.println("kakaoPayCancel Exception -> " + e.getMessage());
			
		}
		 System.out.println("kakaoPayCancel end");
		 return "/ht/foPaySuccess";
	 }
	 
}