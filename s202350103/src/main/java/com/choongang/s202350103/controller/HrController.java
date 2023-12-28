package com.choongang.s202350103.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.supercsv.cellprocessor.Optional;
import org.supercsv.cellprocessor.ParseInt;
import org.supercsv.cellprocessor.constraint.NotNull;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvBeanReader;
import org.supercsv.prefs.CsvPreference;
//import com.choongang.s202350103.hrService.MemberService;
import com.choongang.s202350103.ybService.MemberService;
import com.choongang.s202350103.hrService.NewbookService;
import com.choongang.s202350103.hrService.OrderService;
import com.choongang.s202350103.hrService.Paging;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OrderDetail;
import com.choongang.s202350103.model.OrderGift;
import com.choongang.s202350103.model.Orderr;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j 
public class HrController {
	//private final MemberService  msTest;
	private final OrderService 	 os;
	private final NewbookService ns;
	private final JavaMailSender mailSender;
	private final MemberService  ms;			// ybService
	
	@RequestMapping(value = "helloFo")
	public String memTot1(Model model) {
		System.out.println("Controller start..");
		//int result = msTest.memTot();
		//System.out.println("Controller result -> "+ result);
		//model.addAttribute("result", result);
		return "commonFo";
	}
	
	@RequestMapping(value = "helloBo")
	public String memTot2(Model model) {
		System.out.println("Controller start..");
		//int result = msTest.memTot();
		//System.out.println("Controller result -> "+ result);
		//model.addAttribute("result", result);
		return "commonBo";
	}
	
	// BO 주문목록
	// boOrderList.jsp
	@RequestMapping(value = "boOrderList")
	public String selectOrderrList(Model model, Orderr orderr, String currentPage) {
		System.out.println("HrController selectOrderrList() start..");
		// 전체 건수
		int cnt = os.countOrderrList();
		
		// 페이징
		Paging page = new Paging(cnt, currentPage);
		orderr.setStart(page.getStart());
		orderr.setEnd(page.getEnd());
		
		// 목록
		List<Orderr> orderrList = os.selectOrderrList(orderr);
		System.out.println("HrController cnt -> "+ cnt);
		System.out.println("HrController orderrList.size() -> "+ orderrList.size());
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("orderrList", orderrList);
		model.addAttribute("page", page);
		
		System.out.println("HrController selectOrderrList() end..");
		return "/hr/boOrderList";
	}
	
	// BO 주문상세
	// boOrderDetail.jsp
	@RequestMapping(value = "boOrderDetail")
	public String selectOrderrBo(Model model, long o_order_num, String currentPage) {
		System.out.println("HrController selectOrderrBo() start..");
		System.out.println("currentPage -> "+currentPage);
		
		Orderr orderr = new Orderr();
		orderr = os.selectOrderr(o_order_num);
		System.out.println("HrController selectOrderrBo() orderr.getM_name() -> "+orderr.getM_name());
		
		model.addAttribute("orderr", orderr);
		model.addAttribute("currentPage", currentPage);
		
		System.out.println("HrController selectOrderrBo() end..");
		return "/hr/boOrderDetail";
	}
	
	// BO 주문상세 - 취소처리 (1 -> 5)
	// 주문 접수 상태일 때, 취소처리 버튼 클릭 시 주문상태값 취소로 변경
	@ResponseBody
	@RequestMapping("/statusCancellation")
	public String statusCancellation(long o_order_num) {
		System.out.println("HrController statusCancellation() start..");

		System.out.println("HrController statusCancellation() o_order_num -> "+o_order_num);
		int result = os.statusCancellation(o_order_num);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusCancellation() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusCancellation() end..");
		return stringResult;
	}
	// BO 주문상세 - 배송완료 (2 -> 3)
	// 배송중 상태일 때, 배송완료 버튼 클릭 시 주문상태값 배송완료로 변경
	@ResponseBody
	@RequestMapping("/statusDelivered")
	public String statusDelivered(long o_order_num) {
		System.out.println("HrController statusDelivered() start..");
		
		System.out.println("HrController statusDelivered() o_order_num -> "+o_order_num);
		int result = os.statusDelivered(o_order_num);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusDelivered() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusDelivered() end..");
		return stringResult;
	}
	// BO 주문상세 - 구매확정 (3 -> 4)
	// 배송완료 상태일 때, 구매확정 버튼 클릭 시 주문상태값 구매확정로 변경
	@ResponseBody
	@RequestMapping("/statusConfirmation")
	public String statusConfirmation(long o_order_num) {
		System.out.println("HrController statusConfirmation() start..");
		
		System.out.println("HrController statusConfirmation() o_order_num -> "+o_order_num);
		int result = os.statusConfirmation(o_order_num);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusConfirmation() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusConfirmation() end..");
		return stringResult;
	}
	// BO 주문상세 - 발송처리 팝업
	@RequestMapping("/boShippingPopup")
	public String boShippingPopup(Model model, long o_order_num) {
		System.out.println("HrController boShippingPopup() start..");
		
		model.addAttribute("o_order_num", o_order_num);
		
		System.out.println("HrController boShippingPopup() end..");
		return "/hr/boShippingPopup";
	}
	// BO 주문상세 - 발송처리 (1 -> 2)
	@ResponseBody
	@RequestMapping("/statusShipping")
	public String statusShipping(Orderr orderr) {
		System.out.println("HrController statusShipping() start..");
		
		System.out.println("HrController statusShipping() o_order_num -> "+orderr.getO_order_num());
		int result = os.statusShipping(orderr);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusShipping() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusShipping() end..");
		return stringResult;
	}
	// BO 주문상세 - 교환처리 팝업
	@RequestMapping("/boExchangePopup")
	public String boExchangePopup(Model model, long o_order_num) {
		System.out.println("HrController boExchangePopup() start..");
		
		model.addAttribute("o_order_num", o_order_num);
		
		System.out.println("HrController boExchangePopup() end..");
		return "/hr/boExchangePopup";
	}
	// BO 주문상세 - 교환처리 (3 -> 6)
	@ResponseBody
	@RequestMapping("/statusExchange")
	public String statusExchange(Orderr orderr) {
		System.out.println("HrController statusExchange() start..");
		
		System.out.println("HrController statusExchange() o_order_num -> "+orderr.getO_order_num());
		int result = os.statusExchange(orderr);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusExchange() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusExchange() end..");
		return stringResult;
	}
	// BO 주문상세 - 반품처리 팝업
	@RequestMapping("/boReturnPopup")
	public String boReturnPopup(Model model, long o_order_num) {
		System.out.println("HrController boReturnPopup() start..");
		
		model.addAttribute("o_order_num", o_order_num);
		
		System.out.println("HrController boReturnPopup() end..");
		return "/hr/boReturnPopup";
	}
	// BO 주문상세 - 반품처리 (3 -> 7)
	@ResponseBody
	@RequestMapping("/statusReturn")
	public String statusReturn(Orderr orderr) {
		System.out.println("HrController statusReturn() start..");
		
		System.out.println("HrController statusReturn() o_order_num -> "+orderr.getO_order_num());
		int result = os.statusReturn(orderr);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusReturn() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusReturn() end..");
		return stringResult;
	}
	// BO 주문상세 - 상품목록
	// boOrderProductPopup.jsp
	@RequestMapping("/boOrderDetail/List")
	public String selectOrderProduct(Model model, long o_order_num) {
		System.out.println("HrController selectOrderProduct() start..");
		
		List<OrderDetail> orderDetailList = os.selectOrderProduct(o_order_num);
		System.out.println("HrController orderDetailList.size() -> "+ orderDetailList.size());

		model.addAttribute("cnt", orderDetailList.size());
		model.addAttribute("orderDetailList", orderDetailList);

		System.out.println("HrController selectOrderProduct() end..");
		return "/hr/boOrderProductPopup";
	}
	
	
	// FO 주문상세
	// foOrderDetail.jsp
	@RequestMapping(value = "/foOrderDetail")
	public String selectOrderrFo(Model model, long o_order_num) {
		System.out.println("HrController selectOrderrFo() start..");
		
		Orderr orderr = new Orderr();
		orderr = os.selectOrderr(o_order_num);
		System.out.println("HrController selectOrderrFo() orderr.getM_name() -> "+orderr.getM_name());
		
		model.addAttribute("orderr", orderr);
		
		System.out.println("HrController selectOrderrFo() end..");
		return "/hr/foOrderDetail";
	}
	
	// FO 선물하기 - 화면
	// foGivingGift.jsp
	@RequestMapping("/foGivingGift")
	public String givingGift(Model model, Member member, HttpSession session, int nb_num, int quantity) {
		System.out.println("HrController givingGift() start..");
		
		// model에 회원 정보 저장
		member = (Member) session.getAttribute("member");
		// 실시간 포인트 업데이트
		member.setM_point(ms.totalPoint(member.getM_num()));
		System.out.println("HrController givingGift() member.getM_name() -> "+member.getM_name());
		model.addAttribute("member", member);
		
		// model에 상품 정보 저장
		NewBook newbook = ns.selectNewbook(nb_num);
		System.out.println("HrController givingGift() newbook.getNb_title() -> "+newbook.getNb_title());
		model.addAttribute("newbook", newbook);
		
		// model에 선택 수량 저장
		model.addAttribute("quantity", quantity);
		
		System.out.println("HrController givingGift() end..");
		return "/hr/foGivingGift";
	}
	
//	// FO 선물하기 - 액션   ---> HtController의 "orderAction"로 바로 연결하게 됨
//	@RequestMapping("foGivingGiftAction")
//	public String givingGiftAction(Model model, HttpSession session, Member member, Orderr orderr, OrderGift orderGift, RedirectAttributes redirect) {
//		System.out.println("HrController givingGiftAction() start..");
//		
//		// session으로부터 member 도출
//		member = (Member) session.getAttribute("member");
//		System.out.println("HrController givingGift() member.getM_name()->"+member.getM_name());
//		model.addAttribute("member", member);
//		
//		// value 확인
//		// ORDERR
//			// m_num
//			System.out.println("member.getM_num()->"+member.getM_num());
//			System.out.println("orderr.getM_num()->"+orderr.getM_num());
//			// o_pay_price
//			System.out.println("orderr.getO_pay_price()->"+orderr.getO_pay_price());
//			// o_deliv_price
//			System.out.println("orderr.getO_deliv_price()->"+orderr.getO_deliv_price());
//			// o_point
//			System.out.println("orderr.getO_point()->"+orderr.getO_point());
//			// o_rec_name
//			System.out.println("orderr.getO_rec_name()->"+orderr.getO_rec_name());
//			// o_rec_mail
//			System.out.println("orderr.getO_rec_mail()->"+orderr.getO_rec_mail());
//			// o_rec_ph 
//			System.out.println("orderr.getO_rec_ph()->"+orderr.getO_rec_ph());
//			// nb_num
//			System.out.println("orderr.getNb_num()->"+orderr.getNb_num());
//			// o_de_count
//			System.out.println("orderr.getO_de_count()->"+orderr.getO_de_count());
//
//		// ORDER_GIFT
//			// o_gift_card
//			System.out.println("orderGift.getO_gift_card()->"+orderGift.getO_gift_card());
//			// o_gift_msg
//			System.out.println("orderGift.getO_gift_msg()->"+orderGift.getO_gift_msg());
//			
//		// 결제 연결
//		redirect.addFlashAttribute("orderr", orderr);
//		redirect.addFlashAttribute("orderGift", orderGift);
//		int destination = 0;
//		redirect.addFlashAttribute("destination", destination);
//		
//		return "redirect:orderAction";
//	}
	
	// FO 선물받기 - 화면
	// foGettingGift.jsp
	@RequestMapping("/foGettingGift")
	public String gettingGift(Model model, long o_order_num) {
		System.out.println("HrController gettingGift() start..");
		
		// o_order_num -> orderr 객체 조회
		// 기본 컬럼 : o_rec_name, o_rec_mail, o_rec_ph
		// 조인 컬럼 : m_name, m_ph, nb_image, nb_title, o_de_count
		Orderr orderr = os.selectOrderr_GiftType(o_order_num);
		System.out.println("HrController gettingGift() orderr.getM_name() -> "+orderr.getM_name());
		
		// o_order_num -> orderGift 객체 조회
		// 기본 컬럼 : o_gift_card, o_gift_msg
		OrderGift orderGift = os.selectOrderGift(o_order_num);
		System.out.println("HrController gettingGift() orderGift.getO_gift_num() -> "+orderGift.getO_gift_num());		
		
		// model에 orderr, orderGift 객체 저장
		model.addAttribute("orderr", orderr);
		model.addAttribute("orderGift", orderGift);

		// 선물 수락여부 확인
		int o_gift_accept = orderGift.getO_gift_accept();
		System.out.println("HrController gettingGift() o_gift_accept -> "+o_gift_accept);
		
		if(o_gift_accept == 0) {
			System.out.println("HrController gettingGift() 미수락 선물받기");
			System.out.println("HrController gettingGift() end..");
			return "/hr/foGettingGift";
		} else {
			System.out.println("HrController gettingGift() 수락 선물받기 시도");
			System.out.println("HrController gettingGift() end..");
			return "/hr/foGettingGiftAccepted";
		}
	}
	
	// FO 선물받기 - 액션
	@RequestMapping("/foGettingGiftAction")
	public String gettingGiftAction(Model model, HttpSession session, Orderr orderr, OrderGift orderGift
									, String o_rec_addr1, String o_rec_addr2, String o_rec_addr3) {
		System.out.println("HrController gettingGiftAction() start..");
		
		// value 확인
		// ORDERR
			// o_order_num
			System.out.println("orderr.getO_order_num()->"+orderr.getO_order_num());
			// o_rec_name
			System.out.println("orderr.getO_rec_name()->"+orderr.getO_rec_name());
			// o_rec_mail
			System.out.println("orderr.getO_rec_mail()->"+orderr.getO_rec_mail());
			// o_rec_ph 
			System.out.println("orderr.getO_rec_ph()->"+orderr.getO_rec_ph());
			
		// value 세팅
//			orderGift.setO_gift_name(orderr.getO_rec_name());
//			orderGift.setO_gift_ph(orderr.getO_rec_mail());
			
			orderr.setO_rec_addr("("+o_rec_addr1+")/"+ o_rec_addr2 +"/"+ o_rec_addr3 );
			System.out.println("orderr.getO_rec_addr()->"+orderr.getO_rec_addr());

		// Service Method 실행 후 model에 result 저장
			int result = os.gettingGiftAction(orderr, orderGift);
			model.addAttribute("result", result);

		System.out.println("HrController gettingGiftAction() end..");
		return "/hr/foGettingGiftAction";
	}

	// BO 주문목록 - 임의 주문 생성 팝업
	@RequestMapping("/boOrderUploadPopup")
	public String orderUploadPopup(Model model) {
		System.out.println("HrController orderUploadPopup() start..");
		
		System.out.println("HrController orderUploadPopup() end..");
		return "/hr/boOrderUploadPopup";
	}
	// BO 주문목록 - 임의 주문 생성 액션(CSV 파일 업로드)
	@PostMapping("/boOrderUploadAction")
	public String orderUpload(Model model, HttpServletRequest request, MultipartFile csvFile) throws IOException {
		System.out.println("HrController orderUpload() start..");
		
		// result 선언
		int result = 2;
		
		// csvFile 확인
		System.out.println("HrController orderUpload() csvFile -> "+csvFile);
		
		// 업로드 경로&파일명 선언
		String uploadPath = "";		
		String savedName  = "";
		
		// file에 담긴 값이 있다면 업로드 경로 할당 & 업로드
		if(csvFile.getOriginalFilename().length() > 0) {
			// 업로드 경로 할당
			uploadPath = request.getSession().getServletContext().getRealPath("/upload/hr");
			System.out.println("HrController orderUpload() uploadPath -> "+uploadPath);
			
			// 업로드
			savedName = uploadFile(csvFile.getOriginalFilename(), csvFile.getBytes(), uploadPath);
			System.out.println("HrController orderUpload() savedName -> "+savedName);
		}
		
		// CSV 파일 읽을 수 있는 CsvBeanReader 인스턴스 생성
		try(CsvBeanReader reader = new CsvBeanReader(
								   new BufferedReader(
								   new InputStreamReader(
								   new FileInputStream(uploadPath+"/"+savedName), "EUC-KR")),
								   CsvPreference.STANDARD_PREFERENCE)){
			
			// 헤더
			// 첫번째 행을 column명으로 취급하기 위해 별도의 배열에 저장
			String[] headers = reader.getHeader(true);
			for(String columnName : headers) {
				System.out.println("HrController orderUpload() columnName -> "+columnName);
			}
			
			// 제약 조건 & 데이터 타입 파싱
			CellProcessor[] processors = new CellProcessor[] {new ParseInt(new NotNull()),
															  new ParseInt(new NotNull()),
															  new ParseInt(new NotNull()),
															  new NotNull(),
															  new NotNull(),
															  new NotNull(),
															  new NotNull(),
															  new Optional(),
															  new ParseInt(new NotNull()),
															  new ParseInt(new NotNull())
															 };
			
			// 데이터 저장할 DTO 선언
			Orderr orderr = new Orderr();
			List<Orderr> orderrList = new ArrayList<Orderr>();
			
			// 라인별 읽기 & DTO 저장
			while(true) {
				// 라인별 읽기
				orderr = reader.read(Orderr.class, headers, processors);
				
				// 읽은 데이터가 null이면 반복문 종료
				if(orderr == null) {
					break;
				
				// 읽은 데이터가 null이 아니면 orderrList에 누적 저장
				} else {
					System.out.println("");
					System.out.println("HrController orderUpload() orderr -> "+orderr);
					orderrList.add(orderr);
				}
			}
			
			// Service Insert Method 실행
			result = os.orderUpload(orderrList);
			System.out.println("HrController orderUpload() 최종 result -> "+result);
			
		} catch (Exception e) {
			System.out.println("HrController orderUpload() e.getMessage() -> "+e.getMessage());
		} 
		
		// model에 result 저장
		model.addAttribute("result", result);

		System.out.println("HrController orderUpload() end..");
		return "/hr/boOrderUploadPopup";
	}
	// 내장 메소드
	// 파일 업로드 후 파일명 반환
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws IOException {
		System.out.println("HrController uploadFile() start..");
		 
		// 파일명에 붙여 식별자 역할을 할 고유의 문자열 생성
		// Universally Unique IDentifier (세계적으로 유일한 식별자)
		UUID uid = UUID.randomUUID();
		
		// Directory가 존재하지 않을 경우, 신규 Directory 생성
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			// 신규 폴더(Directory) 자동 생성
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : "+uploadPath);
		}
		
		// 파일명이 동일할 경우 덮어씌워질 수 있기 때문에 UUID를 붙여 식별
		String savedName = uid.toString() + "_" + originalName;
		
		// 파일 업로드
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);	// org.springframework.util.FileCopyUtils
		
		System.out.println("HrController uploadFile() end..");
		return savedName;
	}

}
