package com.choongang.s202350103.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choongang.s202350103.gbService.RecentlyBook;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OldBook;
import com.choongang.s202350103.sjService.OldbookService;
import com.choongang.s202350103.sjService.Paging;
import com.choongang.s202350103.sjService.PagingNb;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SjController {

	private final OldbookService obs;
	private final RecentlyBook rb;
	
	@RequestMapping(value = "test")
	public String test(Model model) {
		
		
		return "sj/test";
	}
	
	
	
	@GetMapping(value = "BolistOb")
	public String listOb(HttpSession session ,Member member  ,OldBook oldBook, String currentPage, Model model) {
		
		System.out.println("SjController Start ");
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		if (member != null) {
			oldBook.setM_num(member.getM_num());
		}
		
		
		int totalOb = obs.totalOb(oldBook);
		//Paging 작업
		Paging  page = new Paging(totalOb, currentPage);
		oldBook.setStart(page.getStart());
		oldBook.setEnd(page.getEnd());
		
		System.out.println("oldBook.getOb_status()->"+oldBook.getOb_status());
		List<OldBook> listOb = obs.listOb(oldBook);
		
		model.addAttribute("member" , member);
		model.addAttribute("totalOb", totalOb);
		model.addAttribute("listOb" , listOb);
		model.addAttribute("page" , page);
		model.addAttribute("oldBook",oldBook);
		
		return "sj/boOldBookList";
		
	}
	
	
	@GetMapping(value = "BodetailOb")
	public String detailOb (int ob_num, Model model) {
		System.out.println("SjController Start detailOb...");
		
		OldBook oldBook = obs.detailOb(ob_num);
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
		System.out.println("SjController detailOb ob_ripped()->"+oldBook.getOb_ripped());
		System.out.println("SjController detailOb ob_scribble()->"+oldBook.getOb_scribble());
		System.out.println("SjController detailOb ob_smeary()->"+oldBook.getOb_smeary());
	
		
		model.addAttribute("oldBook",oldBook);
		
		return "sj/boOldBookDetailList";
	
	}
	
	@GetMapping(value = "BoupdateObDetailCheck")//updateFormEmp
	public String updateFormOb(int ob_num, Model model) {
		System.out.println("sjController Start updateForm..." );
		
		OldBook oldBook = obs.detailOb(ob_num);
		
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());

		model.addAttribute("oldBook",oldBook);
		return "sj/boOldBookCheck";

	}

	//BO
	@PostMapping(value="updateOb")
	public String updateOb(OldBook oldBook, Model model) {
        log.info("updateOb Start...");

		int updateCount = obs.updateOb(oldBook);
		System.out.println("sjController oldBook.getOb_num()->"+oldBook.getOb_num());
		System.out.println("sjController oldBook.getOb_report_date->"+oldBook.getOb_report_date());
		System.out.println("sjController oldBook.getOb_status->"+oldBook.getOb_status());
		System.out.println("sjController oldBook.getOb_ripped->"+oldBook.getOb_ripped());
		System.out.println("sjController oldBook.getOb_scribble->"+oldBook.getOb_scribble());
		System.out.println("sjController oldBook.getOb_smeary->"+oldBook.getOb_smeary());
		System.out.println("sjController oldBook.getOb_grade->"+oldBook.getOb_grade());
		System.out.println("sjController oldBook.getOb_pur_price->"+oldBook.getOb_pur_price());
		
		System.out.println("SjController updateCount-->"+updateCount);
		model.addAttribute("uptCnt",updateCount);    // Test Controller간 Data 전달
		model.addAttribute("oldBook",oldBook);
//		model.addAttribute("kk3","Message Test");    // Test Controller간 Data 전달
   		//return "forward:boOldBookList";   
   		return "redirect:BolistOb";   
	}
	
	@RequestMapping(value = "writeFormObReport" ,method = RequestMethod.GET )
	public String writeFormObReport(HttpSession session,Member member , OldBook oldBook,Model model) {
		System.out.println("sjController writeFormObReport start...");
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);
		
		//멤버값 불러오기 
		member = (Member) session.getAttribute("member");
		if(member == null) {
			return "yb/loginForm";
		}else {
			oldBook.setM_num(member.getM_num());
			oldBook.setM_id(member.getM_id());
			oldBook.setM_name(member.getM_name());
		}
		
		System.out.println("member getM_num() ->"+member.getM_num());
		System.out.println("member getM_id() ->"+member.getM_id());
		System.out.println("member getM_name() ->"+member.getM_name());
		
		List<OldBook> oldbookList = obs.oldBookAcc();
		model.addAttribute("oldBookAcc",oldbookList);
		model.addAttribute("member", member);
		model.addAttribute("oldBook",oldBook);
		
		return "sj/foObReport";
	}
	
	@RequestMapping(value = "writeFormObCal" ,method = RequestMethod.POST )
	public String writeFormObCal(HttpSession session,Member member ,OldBook oldBook,Model model) {
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);
		
		
		System.out.println("sjController writeFormObCal start...");
		member = (Member) session.getAttribute("member");
		
		List<OldBook> oldbookList = obs.oldBookAcc();
		model.addAttribute("oldBookAcc",oldbookList);
		model.addAttribute("member", member);
		model.addAttribute("oldBook",oldBook);
		System.out.println("sjController writeFormObCal oldbookList.size()->"+oldbookList.size());
		System.out.println("member getM_num() ->"+member.getM_num());
		System.out.println("member getM_id() ->"+member.getM_id());
		System.out.println("member getM_name() ->"+member.getM_name());
		
		return "sj/foObCalcul";
	}
	
	@RequestMapping(value = "writeFormObTrans" , method = RequestMethod.POST )
	public String writeFormObTrans(HttpSession session,Member member ,OldBook oldBook, Model model) {
		System.out.println("sjController writeFormObTrans start...");
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);
		
		
		member = (Member) session.getAttribute("member");
		List<OldBook> oldbookList = obs.oldBookAcc();
		model.addAttribute("oldBookAcc",oldbookList);
		
		model.addAttribute("member", member);
		model.addAttribute("oldBook",oldBook);
		System.out.println("sjController writeFormObTrans oldBook.getOb_acc_num()->"+oldBook.getOb_acc_num());
		System.out.println("sjController writeFormObTrans oldBook.getOb_acc_name()->"+oldBook.getOb_acc_name());
		System.out.println("sjController writeFormObTrans oldBook.getOb_report_date()->"+oldBook.getOb_report_date());
		System.out.println("sjController writeFormObTrans oldBook.getOb_num()->"+oldBook.getOb_num());
		System.out.println("sjController writeFormObTrans oldBook.getOb_trans_com()->"+oldBook.getOb_trans_com());
		System.out.println("sjController writeFormObTrans oldBook.getOb_trans_num()->"+oldBook.getOb_trans_num());
		System.out.println("sjController writeFormObTrans oldBook.getNb_title()->"+oldBook.getNb_title());
		System.out.println("member getM_num() ->"+member.getM_num());
		System.out.println("member getM_id() ->"+member.getM_id());
		System.out.println("member getM_name() ->"+member.getM_name());
		
		return "sj/foObTrans";
	}
	
	/*
	 * @RequestMapping(value = "writeFormComple" ,method = RequestMethod.GET )
	 * public String writeFormObComple(OldBook oldBook, Model model) {
	 * System.out.println("sjController writeFormObComple start...");
	 * 
	 * List<OldBook> oldbookList = obs.oldBookAcc();
	 * model.addAttribute("oldBookAcc",oldbookList);
	 * System.out.println("sjController writeFormObComple oldbookList.size()->"
	 * +oldbookList.size()); System.out.
	 * println("sjController writeFormObTrans oldBook.getOb_trans_com()->"+oldBook.
	 * getOb_trans_com()); System.out.
	 * println("sjController writeFormObTrans oldBook.getOb_trans_num()->"+oldBook.
	 * getOb_trans_num());
	 * 
	 * 
	 * 
	 * return "sj/foObComple"; }
	 */
	
	@PostMapping(value = "writeOb")
	public String writeOb(HttpSession session,Member member ,OldBook oldBook, Model model) {
		System.out.println("sjController start writeOb...");
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
				ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
				model.addAttribute("recentBookList", recentBookList);
		
		
		
		member = (Member) session.getAttribute("member");
		
		int insertResult = obs.insertOldBook(oldBook);
		
		System.out.println("sjController oldBook->"+oldBook);
		System.out.println("insertResult->>"+insertResult);
		model.addAttribute("member", member);
		model.addAttribute("oldBook",oldBook);
		
		if (insertResult > 0) return "sj/foObComple";
		else {
			model.addAttribute("msg" , "입력실패 확인해보세요");
			return "sj/foObTrans";
	
		}
	}
	
	@GetMapping(value = "bookList")
	public String listMoOb(OldBook oldBook, Model model, String currentPage2) {
		
		System.out.println("SjController Start modalList ");
		
		int totalNb = obs.totalNb();
		//Paging 작업
		PagingNb  page = new PagingNb(totalNb, currentPage2);
		System.out.println("SjController totalNb ->"+totalNb);
		System.out.println("SjControllerpage.getStart()->"+page.getStart());
		System.out.println("SjControllerpage.getEnd()->"+page.getEnd());
		System.out.println("SjControllerpage.getStartPage()->"+page.getStartPage());
		System.out.println("SjControllerpage.getEndPage()->"+page.getEndPage());
		oldBook.setStart(page.getStart());
		oldBook.setEnd(page.getEnd());
		
		
		
		List<OldBook> listMoOb = obs.listMoOb(oldBook);
		System.out.println("SjController oldBook->"+oldBook);
		
		model.addAttribute("listMoOb" , listMoOb);
		model.addAttribute("totalNb", totalNb);
		model.addAttribute("page" , page);
		
		
		
		return "sj/foModalList";
		
	}
	@GetMapping(value = "ModetailNb")
	public String ModetailNb (int nb_num, Model model) {
		System.out.println("SjController Start ModetailNb...");
		
		OldBook oldBook = obs.ModetailNb(nb_num);
		System.out.println("SjController OldBook ModetailNb->"+oldBook);
	
		
		model.addAttribute("oldBook",oldBook);
		
		return "sj/foObReport";
	
	}
	
	@GetMapping(value = "FodetailOb")
	public String detailObFo (int ob_num, Model model) {
		System.out.println("SjController Start detailOb...");
		
		OldBook oldBook = obs.detailOb(ob_num);
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
		System.out.println("SjController detailOb ob_ripped()->"+oldBook.getOb_ripped());
		System.out.println("SjController detailOb ob_scribble()->"+oldBook.getOb_scribble());
		System.out.println("SjController detailOb ob_smeary()->"+oldBook.getOb_smeary());
	
		
		model.addAttribute("oldBook",oldBook);
		
		return "sj/foObDetail";
	}
	
	@GetMapping(value = "folistOb")
	public String folistOb(HttpSession session , OldBook oldBook, String currentPage, Model model) {
		
		// 최근 본 상품 가져오기 (최근 본 상품이 없으면 초기화까지 하는 메소드) -> 최근 본 상품 가져오는 화면은 붙여넣기
		ArrayList<NewBook> recentBookList = rb.selectRecentBookList(session);
		model.addAttribute("recentBookList", recentBookList);
		
		System.out.println("SjController Start ");
		
		int totalOb2 = obs.totalOb2(oldBook);
		//Paging 작업
		Paging  page = new Paging(totalOb2, currentPage);
		
		oldBook.setStart(page.getStart());
		oldBook.setEnd(page.getEnd());
		System.out.println("folistOb  page.getStart()"+page.getStart());
		System.out.println("folistOb page.getEnd() "+page.getEnd());
		
		List<OldBook> OblistFo = obs.listObFo(oldBook);
		
		System.out.println("SjController oldBook " + oldBook);
		model.addAttribute("listObFo" , OblistFo);
		model.addAttribute("totalOb2", totalOb2);
		model.addAttribute("oldBook",oldBook);
		model.addAttribute("page" , page);
		
		return "sj/foInObList";
		
	}
	
	@RequestMapping(value = "foOldBookDetail")
	public String foOldBookDetail (HttpSession session , NewBook newbook, OldBook oldBook, int ob_num, Model model) {
		System.out.println("SjController Start detailOb...");
		
		int obresult = obs.updateReadCnt(oldBook.getOb_num());
		System.out.println("SjController updateReadCnt obresult "+ obresult);
		
		// 세션에 nb_num을 저장하는 서비스 실행
		rb.sessionSave(session, ob_num);
		
		OldBook oldBook1 = obs.detailOb(ob_num);
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook1.getOb_pur_price());
		System.out.println("SjController detailOb ob_ripped()->"+oldBook1.getOb_ripped());
		System.out.println("SjController detailOb ob_scribble()->"+oldBook1.getOb_scribble());
		System.out.println("SjController detailOb ob_smeary()->"+oldBook1.getOb_smeary());
	
		
		model.addAttribute("oldBook",oldBook1);
		
		return "sj/foOldBookDetail";
	
	}
	
	//용빈 정산받기 버튼 컨트롤러
	@PostMapping(value = "foObUpComple")
	public String FoupdateObComple(HttpSession session, Member member , OldBook oldBook, Model model) {
        log.info("FoupdateObComple Start...");
	
        member = (Member) session.getAttribute("member");
        
        
        
        int updateCount = obs.updateObComp(oldBook);
    	System.out.println("SjController updateCount-->"+updateCount);
		model.addAttribute("uptCnt",updateCount);    // Test Controller간 Data 전달
		model.addAttribute("oldBook",oldBook);
		model.addAttribute("member", member);
	
   		return "redirect:memberSellList#";
	}
	@RequestMapping(value = "index")
	public String main22(Model model) {
		
		
		return "common/mainBo";
	}
	
	
}
	
	
	
	


