package com.choongang.s202350103.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.s202350103.gbService.RecentlyBook;
import com.choongang.s202350103.gbService.TotalOrderService;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.MemberQ;
import com.choongang.s202350103.model.MqReply;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.TotalOrder;
import com.choongang.s202350103.yjService.MemberService;
import com.choongang.s202350103.yjService.Paging;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
@Slf4j
public class YjController {
	
	private final HttpSession session;	// 세션
	private final com.choongang.s202350103.ybService.MemberService ys; // 용빈 서비스
	private final MemberService ms;			// 서비스
	private final RecentlyBook rb;
	private final TotalOrderService tos;
	
	private final JavaMailSender mailSender;	// 메일 전송 객체
	final DefaultMessageService messageService; // 문자전송 API
	
	public YjController(MemberService ms,HttpSession session,JavaMailSender mailSender, com.choongang.s202350103.ybService.MemberService ys, RecentlyBook rb,  TotalOrderService tos) {
		// 세션
		this.session = session;
		// 서비스
		this.ms = ms;
		// 문자 전송 API 							API 키, API Secret Key
		this.messageService = NurigoApp.INSTANCE.initialize("NCSI4UORH4AWJGTE", "ZYW9R5J88TDYQ2855DNUH8ZTJZNEENPR", "https://api.coolsms.co.kr");
		// 메일 전송 객체
		this.mailSender = mailSender;
		// 마이페이지 멤버서비스 용빈
		this.ys = ys;
		// 도서 최근상품 리스트 서비스  금비
		this.rb = rb;
		// 관리자페이지 주문 통계
		this.tos = tos;
		
	}

	//  회원 가입 약관 페이지 이동
	@RequestMapping("/memberJoin")
	public String memberJoin(Model model) {
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		return "yj/memberJoin";

	}
	
	// 회원 가입 폼 이동
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm(Model model) {
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		return "yj/memberJoinForm";
	}
	
	// 아이디 중복검사
	@GetMapping("/idConfirm")
	public String idConfirm(@RequestParam String m_id, Model model) {
	
		System.out.println("YjController m_id ->" + m_id);
	
	int resultId = ms.idConfirm(m_id);
	System.out.println(resultId);
	
	if(resultId > 0) {
		model.addAttribute("no","중복된 ID 입니다. 로그인을 진행해주세요.");
		
	}else {
		model.addAttribute("m_id",m_id);
		model.addAttribute("ok",m_id + " 는 사용 할 수 있는 ID 입니다.");
	}
	
	// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
	ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
	model.addAttribute("recentBookList", recentBookList);

	return "yj/memberJoinForm";
	
	}
	
	// 회원가입 
	// @RequestParam -> 특정 파라미터
	// @ModelAttribute -> 객체 바인딩 
	@PostMapping("/memberJoinAction")
	public String memberJoinAction(	
									 String m_email1, 
									 String m_email2, 
									
									@RequestParam("m_ph1") String m_ph1,
									@RequestParam("m_ph2") String m_ph2,
									@RequestParam("m_ph3") String m_ph3,
									
									@RequestParam("m_birth") String m_birth,
									@RequestParam("m_birth1") String m_birth1,
									
									@RequestParam("m_addr1") String m_addr1,
									@RequestParam("m_addr2") String m_addr2,
									@RequestParam("m_addr") String m_addr,
									
									@ModelAttribute Member member, Model model, HttpSession session) {
	
		System.out.println("memberJoinAction Start ...");
		System.out.println(m_email2);
		System.out.println(m_email1+"@"+m_email2);
		
		member.setM_email(m_email1+"@"+m_email2);	// 이메일 병합
		member.setM_ph(m_ph1+"-"+m_ph2+"-"+m_ph3);	// 전화번호 병합
		member.setM_birth(m_birth+m_birth1);		// 생년월일 성별 병합
		member.setM_addr("("+m_addr1+")/"+ m_addr2 +"/"+ m_addr ); // 우편번호 주소 상세주소 병합
		
		
		
		String m_emailAll = member.getM_email();
		String m_phAll = member.getM_ph();
		String m_birthAll = member.getM_birth();
		String m_addrAll = member.getM_addr();
		
		System.out.println("m_emailAll ->"+ m_emailAll);
		System.out.println("m_phAll ->"+ m_phAll);
		System.out.println("m_birthAll ->" + m_birthAll);
		System.out.println("m_addrAll ->" + m_addrAll);
		
		// 추천인 입력시 포인트 적립 메서드 호출
		String m_reid = member.getM_reid();
		// 값이 null 이 아니거나 변수가 비어있지 않을 때 
		if (m_reid != null && !m_reid.isEmpty()) {
			
			memberJoinPoint(m_reid);
		}
		// 회원 가입
		int joinResult = ms.joinResult(member);
		
		// 회원 가입시  포인트 이력에 insert 
//		int joinPoint = ms.joinPoint();
		
		model.addAttribute("joinResult",joinResult);
		System.out.println("joinResult ->" + joinResult);
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		
		return  "redirect:/memberJoinOk";
	}
	
	// 회원 가입 완료 
	@GetMapping("/memberJoinOk")
	public String memberJoinOk(Model model) {

		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		return "yj/memberJoinOk";
	}
	
	
	// 회원 가입시 추천인  포인트 적립
	@PostMapping("memberJoinPoint")
	public void memberJoinPoint(String m_reid) {
		// 추천인 포인트 적립 
		int memberJoinPoint = ms.memberJoinPoint(m_reid);
		
		//  추천인 입력시 포인트 이력에 insert
		int memberJoinPointList = ms.memberJoinPointList(m_reid);
	}
	
	
		
	// 마이 페이지 이동
		@RequestMapping ("/memberMyPage")
		public String memberMyPage(int m_num, Model model, HttpSession session) {

			Member member = new Member();
			member =(Member) session.getAttribute("member");
			

			int totalWishList = ys.totalWishList(member);
			int totalSellCnt = ys.totalSellCnt(member);
			
			System.out.println("마이페이지 회원 넘버 ->"+m_num);
			int totalOrderCnt = ms.totalOrderCnt(m_num);
			int totalPoint = ys.totalPoint(member.getM_num());
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("totalPoint", totalPoint);
			model.addAttribute("totalWishList", totalWishList);
			model.addAttribute("totalSellCnt", totalSellCnt);
			model.addAttribute("totalOrderCnt",totalOrderCnt);
			model.addAttribute("recentBookList", recentBookList);
			
			System.out.println("Controller sadasdasd" + totalWishList);
			
			return "yj/memberMyPage";
		}
	
	
	
	// 내정보 상세
	@GetMapping("/memberMyInfo")
	public String memberMyInfo(int m_num, Model model) {
		
		Member member = ms.memberInfo(m_num);
		
		String[] splitPh = member.getM_ph().split("-");
		String[] splitEmail = member.getM_email().split("@");
		String[] splitAddr = member.getM_addr().split("/");
		System.out.println("상세에서 splitEmail -> "+splitEmail[1]);
		System.out.println("상세에서 email -> "+member.getM_email());
		
		
		model.addAttribute("splitPh",splitPh);
		model.addAttribute("splitEmail",splitEmail);
		model.addAttribute("splitAddr",splitAddr);
		
		model.addAttribute("member",member);
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		
		return "yj/memberMyInfo";
	}
	
	// 회원정보 수정 -> 수정 후 로그아웃
	@PostMapping("/memberUpdate")
	public String memberUpdate (@RequestParam("m_num") int m_num ,

								@RequestParam("m_image") String m_image,
			
								@RequestParam("m_email1") String m_email1, 
								@RequestParam("m_email2") String m_email2, 
								
								@RequestParam("m_ph1") String m_ph1,
								@RequestParam("m_ph2") String m_ph2,
								@RequestParam("m_ph3") String m_ph3,
								
								@RequestParam("m_addr1") String m_addr1,
								@RequestParam("m_addr2") String m_addr2,
								@RequestParam("m_addr") String m_addr,
								
								@ModelAttribute Member member, Model model,
								HttpSession session) {
	
		System.out.println(m_num);	
		System.out.println(m_image);
		System.out.println("m_email2 -> "+m_email2);
		
		member.setM_email(m_email1+"@"+m_email2);	// 이메일 병합
		member.setM_ph(m_ph1+"-"+m_ph2+"-"+m_ph3);	// 전화번호 병합
		member.setM_addr(m_addr1+"/"+ m_addr2 +"/"+ m_addr ); // 우편번호 주소 상세주소 병합
		
		
		String m_emailAll = member.getM_email();
		String m_phAll = member.getM_ph();
		String m_addrAll = member.getM_addr();
		
		System.out.println("m_emailAll ->"+ m_emailAll);
		System.out.println("m_phAll ->"+ m_phAll);
		System.out.println("m_addrAll -> " + m_addrAll);
		
		int memberUpdate = ms.memberUpdate(member);
		model.addAttribute("memberUpdate",memberUpdate);
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		session.invalidate(); // 세션 초기화
		
		return  "redirect:/loginForm";
	}
	
	
	
	// 계정 찾기 화면 이동
	@RequestMapping("memberFindAccount")
	public String memberFindAccount(Model model) {

		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		return"yj/memberFindAccount";
	}
	
	// 아이디 찾기 화면 이동
	@RequestMapping("memberFrinId")
	public String memberFrinId(Model model) {
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);

		return "yj/memberFrinId";
	}
		
	// 인증 화면 이동
	@RequestMapping("memberFindAc")
	public String memberPhFindId(@RequestParam("auth") String auth, Model model ) {
		
		if("ph".equals(auth)) {
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
			
			return "yj/memberFindAcPh";
		}else {
			
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);

			return "yj/memberFindAcEmail";
		}
		
	}
	
	// 인증 랜덤번호 발송 메서드
    private String ranCode() {
    	Random random = new Random();
    	int min = 100000;
    	int max = 999999;
    	
    	int ranCode = random.nextInt((max - min) + 1) + min;
    	
    	return String.valueOf(ranCode);
    }
    
    // 전화번호 하이픈 - 추가 	
	private String phoneHyphen(String m_ph) {
		
		StringBuilder phoneHyphen = new StringBuilder();
		
		int phLength = m_ph.length();
		for(int i = 0; i < phLength; i++) {
			// 전화번호의 마지막자리까지 인덱스 부여 
			char digit = m_ph.charAt(i);
			
			// 전화번호에 하이픈을 추가할 위치 
			if(i == 3 || i == 7) {
				phoneHyphen.append('-');
			}
			phoneHyphen.append(digit);
		}
		return phoneHyphen.toString();
	}
	    
	    
     // 인증 메시지 발송 
	  @PostMapping("/memberAuthPhone") 
	  public String memberAuthPhone(@RequestParam String m_ph,
			  						@ModelAttribute Member member,	
			  						Model model) {
		  
		  // 허이픈 추가 메서드 호출 
		  String phoneHyphen = phoneHyphen(m_ph);
		  System.out.println(phoneHyphen);
		  // 변환된 전화번호 찾기
		  String memberPhFind = ms.memberPhFind(phoneHyphen);
		  System.out.println("yjController memberPhFind -> " + memberPhFind);
		  
		  // DB 에 있는 전화번호와 일치 시 메시지 발송
		  if (phoneHyphen.equals(memberPhFind)) {
			  Message message = new Message();
			  // 랜덤코드 추가 메서드 호출 
			  String ranCode = ranCode();
			  System.out.println("yjController 전송된 코드 :" + ranCode);
			  
			  // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력. "-" 제외
			  message.setFrom("01024846106"); 			// 발신번호 입력
			  message.setTo(m_ph); 						// 수신번호 입력
			  // 한글 45자, 영자 90자 이하 입력되면 자동으로 SMS타입의 메시지가 추가
			  message.setText("[(주)DADOK] ["+ranCode+"] 인증번호를 정확히 입력해주세요.");
			  
			  SingleMessageSentResponse response = this.messageService.sendOne(new
					  SingleMessageSendingRequest(message)); System.out.println(response);
					  
			  model.addAttribute("okPh","발송된 인증번호를 입력해주세요.");
			  model.addAttribute("m_ph",m_ph);
			  model.addAttribute("ranCode",ranCode);

			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);

			  return "yj/memberFindAcPh"; 

		  }else {
			  model.addAttribute("noPh","가입되지 않은 회원입니다.");
			  
				// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);

			  return "yj/memberFindAcPh"; 
		  }
	  }
	  
	  // 인증번호 일치 여부 , 일치시 회원정보 상세
	  @PostMapping("memberFindGetId")
	  public String memberFindGetId(@RequestParam String m_ph,
			  						@RequestParam String inputCode,
			  						@RequestParam String ranCode,
			  						Model model	, HttpSession session) {
		  System.out.println("입력코드 : " + inputCode);
		  System.out.println("전송코드 : " + ranCode);
		  
		  if(inputCode.equals(ranCode)) {
			  	
			  // 하이픈 추가 메서드
			  String phoneHyphen = phoneHyphen(m_ph);
			  
			  Member member = ms.memberFindGetId(phoneHyphen);
			  
			  // 전화번호 * 처리 -> 스트링 포맷
			  // 구현 예정
			  
			  // 가입일 처리 -> 데이트 포맷
			  Date m_date = member.getM_date();
			  SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
			  String formatM_date = dataFormat.format(m_date);
			  
			  model.addAttribute("formatM_date",formatM_date );
			  model.addAttribute("member",member);
				// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);
			  
			  return "yj/memberFindGetId"; 
			  
		  }else {
			  model.addAttribute("noAuth","인증번호가 일치하지 않습니다. 다시 진행해 주세요.");
				// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);

			  return "yj/memberFindAcPh"; 
		  }
	  }
	  
	  
	  
	  
	// 이메일 인증  
	@RequestMapping("/memberAuthEmail")
	public String mailTransport(@RequestParam String m_email,  Model model) {
		System.out.println(m_email);
		
		// 입력받은 메일이 DB 에 저장되어있는 회원의 메일 주소 인지 체크
		String memberEmailFind = ms.memberEmailFind(m_email);
		
		// DB 에 존재하는 회원의 메일이라면 
		if(m_email.equals(memberEmailFind)) {
			System.out.println("email 일치");
		
			try {
			// 메일전송 표준 포맷 	
			MimeMessage message = mailSender.createMimeMessage();
			// 메일전송 객체 
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true , "UTF-8");
			
			String setfrom = "960921@gmail.com";	// 보내는 사람 이메일 (생략시 오류)
			String tomail = memberEmailFind;   		// 받는 사람 이메일
			String title = "(주)DADOK 인증메일 발송";  	// 제목
			
			// 랜덤코드 메서드 호출하여 변수저장
			String ranCode = ranCode();
			
			messageHelper.setFrom(setfrom);    		// 보내는 사람 이메일 (생략시 오류)
			messageHelper.setTo(tomail);       		// 받는사람 이메일
			messageHelper.setSubject(title);   		// 메일제목 (생략 가능) -> 생략시 try 안걸어줘도됨
													
			// 메일 내용 -> 랜덤코드 호출
			messageHelper.setText(ranCode + "  : 인증번호를 정확히 입력해주세요."); 
			// 메일 전송
			mailSender.send(message);
			
			// 전송 후 
			// 메시지 , 입력한 값, 랜덤코드(인증번호) 저장 후 리턴
			model.addAttribute("okEmail","전송된 이메일을 확인해 주세요.");
			model.addAttribute("m_email",m_email);
			model.addAttribute("ranCode",ranCode);

			// 실패시 
			}catch (Exception e) {
				System.out.println(e.getMessage());
				System.out.println("yjController Email Send Error");
			}
			
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
			
			return "yj/memberFindAcEmail";
		
		// 	존재하지 않은 메일주소 일시 
		}else {
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
			
			System.out.println("불 일치");
			model.addAttribute("noEmail","가입되지 않은 회원입니다.");
			
			return "yj/memberFindAcEmail";
		}
		
	}
	
	 // 이메일 인증번호 일치 여부 , 일치시 회원정보 상세
	  @PostMapping("memberFindGetIdEmail")
	  public String memberFindGetIdEmail(@RequestParam String m_email,
			  							@RequestParam String inputCode,
			  							@RequestParam String ranCode,
			  							Model model, HttpSession session) {
		  System.out.println("이메일 입력코드 : " + inputCode);
		  System.out.println("이메일 전송코드 : " + ranCode);
		  
		  if(inputCode.equals(ranCode)) {
			  
			  Member member = ms.memberFindGetIdEmail(m_email);
			  
			  // 전화번호 * 처리 -> 스트링 포맷
			  // 구현 예정
			  
			  // 가입일 처리 -> 데이트 포맷
			  Date m_date = member.getM_date();
			  SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
			  String formatM_date = dataFormat.format(m_date);
			  
			  model.addAttribute("formatM_date",formatM_date );
			  model.addAttribute("member",member);
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);
			  
			  return "yj/memberFindGetId"; 
			  
		  }else {
				// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);
			  
			  model.addAttribute("noAuth","인증번호가 일치하지 않습니다. 다시 진행해 주세요.");
			  return "yj/memberFindAcEmail"; 
		  }
	  }
	  
	
	  
	  // 내리뷰 리스트 조회 
	  @GetMapping("memberMyReview")
	  public String memberMyReview(@RequestParam int m_num , Model model) {
		  
		  System.out.println(m_num);
		  
		  List<Member> memberMyReview = ms.memberMyReview(m_num);
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
 		  model.addAttribute("memberMyReview",memberMyReview);
 		  
		  return "yj/memberMyReview";
	  }
	  
	  // 내 주문 리스트 날짜 포맷
	  private String formatDate(Date date) {
		  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy. MM. dd");
		  return dateFormat.format(date);
	  }
	  
	  // 내 주문 리스트
	  @GetMapping("memberMyOrder")
	  public String memberMyOrder(@RequestParam int m_num, Model model) {
		  
		  System.out.println(m_num);
		  
//		  member = (Member) session.getAttribute("member");
//		  if(member == null) {
//			  return "yb/loginForm";
//		  }
		  
		  List<Member> memberMyOrder = ms.memberMyOrder(m_num);
		  
		  //LinkedHashMap  맵의 키-값 쌍 을 유지 시켜 삽입 순서 보장 -> 키와 값을 순서대로 유지하고 순서기반 접근
		  Map<String, List<Member>> orderNumGroups = new LinkedHashMap<>();
		  
		  for(Member member : memberMyOrder) {
			  String orderDate = formatDate(member.getO_order_date());
			  String orderNum = String.valueOf(member.getO_order_num());

			  if(!orderNumGroups.containsKey(orderNum)) {
				  orderNumGroups.put(orderNum, new ArrayList<Member>());
			  }
			  orderNumGroups.get(orderNum).add(member);
		  }

		  System.out.println(orderNumGroups);
		  
		  int totalOrderCnt = ms.totalOrderCnt(m_num);
			
		  model.addAttribute("totalOrderCnt",totalOrderCnt);
		  model.addAttribute("orderNumGroups",orderNumGroups);

			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberMyOrder";
	  }
	  
	  
	  // 관리자-회원 전체 조회
	  @GetMapping("adminMemberList")
	  public String adminMemberList(Member member, String currentPage, Model model ) {
		  // 전체회원 count
		  int totalMember = ms.totalMember();
		  
		  // 페이징
		  Paging page = new Paging(totalMember, currentPage);
		  member.setStart(page.getStart());
		  member.setEnd(page.getEnd());
		  
		  List<Member> adminMemberList = ms.adminMemberList(member);
		  
		  model.addAttribute("totalMember",totalMember);
		  model.addAttribute("adminMemberList", adminMemberList);
		  model.addAttribute("page", page);
		  
		  return "yj/adminMemberList";
	  }
	
	  // 관리자-페이지 이동
	  @RequestMapping("mainBo")
	  public String mainBo(Model model) {
		  // 총 회원
		  int totalMember = ms.totalMember();
		  // 일반 회원
		  int nomalMember = ms.nomalMember();
		  // 관리자 
		  int adminMember = ms.adminMember();
		  // 활동 회원
		  int activeMember = ms.activeMember();
		  // 탈퇴 회원
		  int wdMember = ms.wdMember();
		  
		  model.addAttribute("nomalMember",nomalMember);
		  model.addAttribute("adminMember",adminMember);
		  model.addAttribute("activeMember",activeMember);
		  model.addAttribute("wdMember",wdMember);

		  float averNomalMember = ((float)nomalMember / totalMember) * 100;
		  float averAdminMember = ((float)adminMember / totalMember) * 100;
		  float averActiveMember = ((float)activeMember / totalMember) * 100;
		  float averWdMember = ((float)wdMember / totalMember) * 100;
		  
		  model.addAttribute("totalMember",totalMember);
		  model.addAttribute("averNomalMember",averNomalMember);
		  model.addAttribute("averAdminMember",averAdminMember);
		  model.addAttribute("averActiveMember",averActiveMember);
		  model.addAttribute("averWdMember",averWdMember);
		  
		  
		  int declReplyCount = declReplyCount();
		  model.addAttribute("declReplyCount",declReplyCount);
		  
		  // 이번달 월 구하기
		  LocalDate date = LocalDate.now();
		  int month = date.getMonthValue();
		  System.out.println("month -> "+month);
		  
		  // 이번달 총 수입
		  int monthTotalIncome = tos.selectMonthTotalIncome();
		  // 지난달 총 수입
		  int lastTotalIncome = tos.selectLastTotalIncome();		  
		  
		  // 이번달 주문 건수
		  int monthTotalCnt = tos.selectMonthTotalCnt();
		  // 지난달 주문 건수
		  int lastTotalCnt = tos.selectLastTotalCnt();
		  
		  // 이번달 신규 가입 고객 수
		  int monthTotalNewMember = tos.selectMonthTotalNewMember();
		  // 지난달 주문 건수
		  int lastTotalNewMember = tos.selectLastTotalNewMember();
		  
		  // 올해 주문 총 건수 *********
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  tos.selectYearOrderCnt(map);
		  
		  List<TotalOrder> totalOrderList = (List<TotalOrder>) map.get("order_cnt_list");
		  for(TotalOrder totalorder : totalOrderList) {
			  System.out.println("totalorder.getOrder_cnt()"+totalorder.getOrder_cnt());
		  }
		  
		  // 올해 반품 총 건수 **********
		  tos.selectYearReturnCnt(map);
		  
		  List<TotalOrder> totalReturnList = (List<TotalOrder>) map.get("order_return_list");
		  for(TotalOrder totalreturn : totalReturnList) {
			  System.out.println("totalreturn.getOrder_cnt()->"+totalreturn.getOrder_cnt());
		  }
		  
		  // model에 담아서 jsp 단으로 보내기	
		  model.addAttribute("totalIncome", monthTotalIncome);
		  model.addAttribute("monthTotalCnt", monthTotalCnt);
		  model.addAttribute("monthTotalNewMember", monthTotalNewMember);
		  model.addAttribute("lastTotalIncome",lastTotalIncome);
		  model.addAttribute("lastTotalCnt",lastTotalCnt);
		  model.addAttribute("lastTotalNewMember",lastTotalNewMember);
		  model.addAttribute("totalOrderList", totalOrderList);
		  model.addAttribute("totalReturnList", totalReturnList);
		  
		  model.addAttribute("month", month);
		  
		  return "common/mainBo";
	  }
	  
	 
	  // 이미지 리스트
	  public List<String> imageList(){
		  
		  List<String> imageUrl = new ArrayList<String>();
		  imageUrl.add("../assets/images/memberImage/1.jpg");
		  imageUrl.add("../assets/images/memberImage/2.jpg");
		  imageUrl.add("../assets/images/memberImage/3.jpg");
		  imageUrl.add("../assets/images/memberImage/4.jpg");
		  imageUrl.add("../assets/images/memberImage/5.jpg");
		  imageUrl.add("../assets/images/memberImage/6.jpg");
		  imageUrl.add("../assets/images/memberImage/7.jpg");
		  imageUrl.add("../assets/images/memberImage/8.jpg");
		  imageUrl.add("../assets/images/memberImage/9.jpg");
		  imageUrl.add("../assets/images/memberImage/10.jpg");
		  imageUrl.add("../assets/images/memberImage/11.jpg");
		  imageUrl.add("../assets/images/memberImage/12.jpg");
		  imageUrl.add("../assets/images/memberImage/13.jpg");
		  imageUrl.add("../assets/images/memberImage/14.jpg");
		  imageUrl.add("../assets/images/memberImage/15.jpg");
		  imageUrl.add("../assets/images/memberImage/16.jpg");
		  imageUrl.add("../assets/images/memberImage/17.jpg");
		  imageUrl.add("../assets/images/memberImage/18.jpg");
		  imageUrl.add("../assets/images/memberImage/19.jpg");
		  imageUrl.add("../assets/images/memberImage/default2.png");
		  imageUrl.add("../assets/images/memberImage/20.jpg");
		  
		  return imageUrl;
	  }
	  
	  // 회원 상세정보 이미지 수정
	  @RequestMapping("/memberImageSelect")
	  public String memberImageSelect(Model model) {
		  
		  List<String> imageList = imageList();
		  model.addAttribute("imageList",imageList);
		  
		  return "yj/memberImageSelect";
	  }
	  
	  // 문의 등록 폼
	  @GetMapping("/memberQna")
	  public String memberQna(@RequestParam int m_num, Model model) {
		  System.out.println(m_num);
		  
		  Member member = ms.memberInfo(m_num);
		  model.addAttribute("member",member);
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberQna";
	  }
	  
	  // 문의 등록 
	  @PostMapping("/memberQInsert")
	  public String memberQInsert(@RequestParam int m_num ,
			  					@RequestParam String mq_title,
			  					@RequestParam String mq_content,
			  					@RequestParam int mq_hidden,
			  					@ModelAttribute MemberQ memberQ ,
			  					Model model) {
		  System.out.println(m_num);
		  System.out.println(mq_title);
		  System.out.println(mq_content);
		  System.out.println(mq_hidden);
		  
		  int memberQInsert = ms.memberQInsert(memberQ);

			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  model.addAttribute("memberQInsert",memberQInsert); 
		  
		  return "redirect:/memberQnaList";
	  }
	  
	  
	  // 문의 리스트
	  @GetMapping("/memberQnaList")
	  public String memberQnaList(MemberQ memberQ, String currentPage, Model model) {
		  // 문의 글 카운트
		  int mqCount = ms.mqCount();
		  
		  Paging page = new Paging(mqCount,currentPage);

		  memberQ.setStart(page.getStart());
		  memberQ.setEnd(page.getEnd());
		  
		  List<MemberQ> memberQnaList = ms.memberQnaList(memberQ);
		  
		  model.addAttribute("mqCount",mqCount);
		  model.addAttribute("page",page);
		  model.addAttribute("memberQnaList",memberQnaList);
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberQnaList";
	  }
	  
	  // 문의 상세조회
	  @GetMapping("/memberQInfo")
	  public String memberQInfo(@RequestParam int mq_num, 
			  					Model model, HttpServletRequest request) {
		  
		  // 문의 상세 조회
		  MemberQ memberQInfo  = ms.memberQInfo(mq_num);
		  // 답글 카운트
		  int replyCount = ms.replyCount(mq_num);
		  // 답글 조회
		  List<MqReply> mqReplyList = ms.mqReplyList(mq_num);
		  
		  int mq_hidden = memberQInfo.getMq_hidden();
		  int m_num = memberQInfo.getM_num();
		  int m_admin = memberQInfo.getM_admin();

		  System.out.println("yj con memberQInfo mq_hidden :" +mq_hidden);
		  System.out.println("yj con memberQInfo m_num :" +m_num);
		  System.out.println("yj con memberQInfo m_admin :" +m_admin);
		  
		  // 비밀글 일 때  
		  if(mq_hidden == 1) {
			  // 세션에 저장된 회원을 호출
			  Member member = (Member) session.getAttribute("member");
			  // 회원이 일반 회원 일 경우 
			  if(member.getM_admin() == 0) {
				  // 세션의 회원 번호와 게시글의 회원번호가 일치하지 않을때 
				  if(member.getM_num() != memberQInfo.getM_num()) {
					  return "redirect:/custom404";
				  }
			  }
		  }
		 
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  model.addAttribute("memberQInfo",memberQInfo);
		  model.addAttribute("replyCount",replyCount);
		  model.addAttribute("mqReplyList",mqReplyList);

		  return "yj/memberQInfo";
		  
	  }
	  
	  
	  // 1 : 1 문의 폼
	  @GetMapping("/memberQnaOne")
	  public String memberQnaOne(@RequestParam int m_num, Model model) {
		  
		  System.out.println(m_num);
		  
		  Member member = ms.memberInfo(m_num);
		  model.addAttribute("member",member);
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberQnaOne";
	  }
	 
	  
	  // 1 : 1 문의 이메일 전송
	  @PostMapping("/memberOneMail")
	  public String memberOneMail(@RequestParam int m_num,
			  					@RequestParam String m_email,	
			  					@RequestParam String m_id,
			  					@RequestParam String mq_title,
			  					@RequestParam String mq_content,
			  					Model model) {
		  	
		  System.out.println(m_num);
		  System.out.println(m_email);		  
		  System.out.println(m_id);
		  System.out.println(mq_title);
		  System.out.println(mq_content);
		  
		  try {
			  
		  	MimeMessage message2 = mailSender.createMimeMessage();
			// 메일전송 객체 
			MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true , "UTF-8");
			
			String setfrom = "dadok202350103@gmail.com";	// 보내는 사람 이메일 (생략시 오류)
			String tomail = "dadok202350103@gmail.com";   		// 받는 사람 이메일
			String title = mq_title;  	// 제목
			
			messageHelper2.setFrom(setfrom);    		// 보내는 사람 이메일 (생략시 오류)
			messageHelper2.setTo(tomail);       		// 받는사람 이메일
			messageHelper2.setSubject(title);   		// 메일제목 (생략 가능) -> 생략시 try 안걸어줘도됨
													
			// 메일 내용 
			messageHelper2.setText("(" +m_id +") 님의 발신 \n수신가능 메일 ( "+m_email+ " ) \n \n"+mq_content ); 
			// 메일 전송
			mailSender.send(message2);
			
			// 전송 후 
		  } catch (MessagingException e) {
			  e.printStackTrace();
		  }
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberQnaOne";
	  }
	  
	  // 내문의 
	  @GetMapping("/memberMyOna")
	  public String memberMyOna(@RequestParam int m_num ,Model model) {
		  
		  System.out.println(m_num);
		  
		  List<MemberQ> memberMyQnaList = ms.memberMyQnaList(m_num);
		  
		  model.addAttribute("memberMyQnaList",memberMyQnaList);
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberMyOna";
	  }
	  
	  // 관리자 - 회원상세 
	  @GetMapping("/adminMemberInfo")
	  public String adminMemberInfo(@RequestParam int m_num , Model model) {
		  
			Member member = ms.memberInfo(m_num);
			
			model.addAttribute("member",member);
			
			return "yj/adminMemberInfo";
	  }
	  
	  // 관리자 - 회원정보 업데이트 
	  @PostMapping("/adminMemberUpdate")
	  public String adminMemberUpdate(@ModelAttribute Member member,@RequestParam int m_num, 
			  						 Model model) {
		  
		  // 회원정보 수정 
		  int adminMemberUpdate = ms.adminMemberUpdate(member);
		  model.addAttribute("adminMemberUpdate",adminMemberUpdate);
		
		  // 수정된 회원 정보 
		  Member updateMember = ms.memberInfo(m_num);
		  model.addAttribute("member",updateMember);
		  
		  
		  return "yj/adminMemberInfo";
		  
	  }
	  
	  // 내 문의 삭제 
	  @GetMapping("/myMqDelete")
	  public String myMqDelete(@RequestParam int mq_num,@RequestParam int m_num,  Model model) {
		  System.out.println("yj myDel ->" + mq_num);
		  System.out.println("yj myDel ->" + m_num);
		  
		  // 게시글에 달린 댓글 삭제
		  ms.deleteReplyAndMQ(mq_num);
		  // 게시글 삭제 
		  int myMqDelete = ms.myMqDelete(mq_num);
		  
		  List<MemberQ> memberMyQnaList = ms.memberMyQnaList(m_num);
			
		  model.addAttribute("myMqDelete",myMqDelete);
		  model.addAttribute("memberMyQnaList",memberMyQnaList);
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberMyOna";
	  }
	  
	  // 내 문의 수정
	  @PostMapping("/myMqUpdate")
	  public String myMqUpdate(	@ModelAttribute MemberQ memberQ ,
			  					@RequestParam int mq_num, 
			  					@RequestParam int m_num, 
			  						Model model) {
		  
		  System.out.println("yj myUpdate ->" + mq_num);
		  System.out.println("yj myUpdate ->" +m_num);
		  
		  int myMqUpdate = ms.myMqUpdate(memberQ);
		  
		  List<MemberQ> memberMyQnaList = ms.memberMyQnaList(m_num);
		  
		  model.addAttribute("myMqUpdate",myMqUpdate);
		  model.addAttribute("memberMyQnaList",memberMyQnaList);
		  
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberMyOna";
	  }
	  
	  // 관리자 - 회원 삭제
	  @GetMapping("/adminMemberDelete")
	  public String adminMemberDelete(@RequestParam int m_num, Model model) {
	      System.out.println(m_num);
	      
	      try {
	          int adminMemberDelete = ms.adminMemberDelete(m_num);
	          
	          if (adminMemberDelete < 1) {
	              // 삭제 작업 실패
	              return "redirect:/custom404";
	          }
	      } catch (Exception e) {
	          // 오류 발생 
	          return "redirect:/custom404";
	      }
	      
	      // 삭제 성공
	      return "redirect:/adminMemberList";
	  }
	  
	  // 관리자 - 회원 검색
	  @GetMapping("memberSearch")
	  public String memberSearch(Member member, String currentPage, Model model, HttpServletRequest request) {
		  
		  // 전체회원 count
		  int searchTotalMember = ms.memberSearchCnt(member);
		  
		  System.out.println(searchTotalMember);
		  // 페이징
		  Paging page = new Paging(searchTotalMember, currentPage);
		  member.setStart(page.getStart());
		  member.setEnd(page.getEnd());
		  
		  List<Member> adminMemberSearch = ms.adminMemberSearch(member);
		  
		  model.addAttribute("totalMember",searchTotalMember);
		  model.addAttribute("adminMemberList", adminMemberSearch);
		  model.addAttribute("member",member);
		  model.addAttribute("page", page);
		  
		  return "yj/adminMemberList";
	  
	  }
	  
	  // 404  테스트
	  @GetMapping("/custom404")
	  public String cutom404() {
		  return "yj/yjCustom404";
	  }
	  
	  // 관리자 - 회원 주소 간편조회 
	  @ResponseBody 
	  @RequestMapping(value = "adminMemberAddr")
	  public String adminMemberAddr(int m_num) {
		  	System.out.println("yj Ajax m_num ->" + m_num);
			
			String m_addr = ms.adminAddrSearch(m_num);
			
		  	System.out.println("yj Ajax m_addr ->" + m_addr);
			
			return m_addr;
	  }
	  
	  // 문의 답변 작성
	  @PostMapping("/replyInsert")
	  public String replyInsert(@ModelAttribute MqReply reply,@RequestParam int mq_num , Model model) {
		  
		  System.out.println(mq_num);
		  
		  int replyInsert = ms.replyInsert(reply);
		  
		  model.addAttribute("replyInsert",replyInsert);
  			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "redirect:/memberQInfo?mq_num="+mq_num;
	  }
	  
	  // 문의 답변 추천
	  @ResponseBody
	  @PostMapping("/likeReply")
	  public Map<String, Object> likeReply(@RequestParam("mqr_num") Long mqr_num
			  								) {
		Map<String, Object> response = new HashMap<>();  	

		try {
			int likeReply = ms.likeReply(mqr_num);
			response.put("success", true);

		}catch (Exception e) {
			response.put("success", false);
		}
		
		return response;
	  }
	  
	  // 문의 답변 신고 
	  @PostMapping("/replyDecl")
	  public String replyDecl( int mqr_num,
			  @ModelAttribute MqReply reply, Model model) {

		  int declReply = ms.declReply(reply);

		  // 신고 접수 후 총 신고 횟수
		  int declCount = ms.declCount(mqr_num);
		  // 신고 15회 누적시 답글삭제
		  if(declCount >= 15) {
			  ms.deleteReply(mqr_num);
		  }
		  
		  return "redirect:/memberQnaList";
	  }
	  
	  // 관리자 - 답글 관리 
	  @GetMapping("/adminDeclReply")
	  public String adminDeclReply(Model model) {
		  
		  List<MemberQ> adminDeclReply = ms.adminDeclReply();
		  int declReplyCount = declReplyCount();
		  
		  model.addAttribute("declReplyCount",declReplyCount);
		  model.addAttribute("adminDeclReply",adminDeclReply);
		  
		  return "yj/adminDeclReply";
	  }
	  
	  // 관리자 - 신고 횟수 초기화
	  @PostMapping("/replyUpdate")
	  public String replyUpdate(int mqr_num) {
		  
		  int replyUpdate = ms.replyUpdate(mqr_num);
		  
		  return "redirect:/adminDeclReply";
	  }
	  // 관리자 - 문의 답변 직접 삭제
	  @ResponseBody
	  @PostMapping("/replyDelete")
		  public String replyDelete(@RequestParam int mqr_num) {
			  ms.deleteReply(mqr_num);
			  return "success";
	  }
	  
	  
	  // 관리자 - 신고 댓글 카운트
	  public int declReplyCount() {
		  int declReplyCount = ms.declReplyCount();
		  return declReplyCount;
	  }
	  
	  // 내가 작성한 답글
	  @GetMapping("/memberMyReply")
	  public String memberMyReply(@RequestParam int m_num, Model model) {
		  
		  List<MemberQ> memberMyReply = ms.memberMyReply(m_num);
		  model.addAttribute("memberMyReply",memberMyReply);
			// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);
		  
		  return "yj/memberMyReply";
	  }
	  // 내 답글 수정
	  @PostMapping("/myReplyUpdate")
	  public String myReplyUpdate(String mqr_content ,
			  				      @RequestParam int m_num,
								  @ModelAttribute MemberQ memberq ,
								  Model model) {
		  
		  memberq.setMqr_content(mqr_content + " (수정)");
		  System.out.println(memberq.getMqr_content());
		  
		  int myReplyUpdate = ms.myReplyUpdate(memberq);

		  // 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
			ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
			model.addAttribute("recentBookList", recentBookList);

		  return "redirect:/memberMyReply?m_num="+m_num;
	  }
	  
	  // 내 댓글 삭제 
	  @PostMapping("/myReplyDelete")
	  public String myReplyDelete(@RequestParam int mqr_num, @RequestParam int m_num) {
		  ms.deleteReply(mqr_num);
		  return "redirect:/memberMyReply?m_num="+m_num;
	  }


}