package com.choongang.s202350103.gbService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.hrDao.NewbookDao;
import com.choongang.s202350103.model.NewBook;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service
@RequiredArgsConstructor
public class RecentlyBook {
	private final NewBookService nbs;
	
	// 세션에 nb_num 담기
	public void sessionSave(HttpSession session, int nb_num) {
		
		// 세션에 최근 본 상품이 없을 경우 0으로 초기화(메인화면에서 바로 상품 상세페이지 이동해야 해서 여기서도 session에 0값 넣어주어야 함.)
		if(session.getAttribute("recentBookNum0") == null) {
			session.setAttribute("recentBookNum0", 0);
		}
		if(session.getAttribute("recentBookNum1") == null) {
			session.setAttribute("recentBookNum1", 0);
		}
		if(session.getAttribute("recentBookNum2") == null) {
			session.setAttribute("recentBookNum2", 0);
		}
		
		
		if((int)session.getAttribute("recentBookNum0") != 0) { // 3번째 세션까지 모두 찼을 때
			System.out.println("3번쨰까지 다 참");
			for(int i=0 ; i< 3; i++) { // i == 0, 1, 2
				// 중복된 값이 있다면
				if((int)session.getAttribute("recentBookNum"+i) == nb_num) {
					System.out.println("중복됨.");
					for(int j=i-1 ; j >= 0 ; j--) { 
						int sessionNum = (int)session.getAttribute("recentBookNum"+j);
						session.setAttribute("recentBookNum"+i, sessionNum);
					}
					session.setAttribute("recentBookNum0", nb_num);
					return;
				}
			}
			
			for(int i=0 ; i< 3; i++) { // i == 0, 1, 2
				// 중복된 값이 없다면
				if((int)session.getAttribute("recentBookNum"+i) != nb_num) { 
					System.out.println("중복되지 않음.");
					int sessionFirst = (int)session.getAttribute("recentBookNum0");
					int sessionSecond = (int)session.getAttribute("recentBookNum1");
					// 두번쨰 세션 값에 첫번째 세션 값 넣기
					session.setAttribute("recentBookNum1", sessionFirst);
					// 세번째 세션 값에 두번째 세션 값 넣기
					session.setAttribute("recentBookNum2", sessionSecond);
					// 새롭게 받아온 도서 번호를 첫번쨰 세션에 넣기
					session.setAttribute("recentBookNum0", nb_num);
					return;
				}
				
			}
			
		}
		else { // 처음 3번째까지 세션에 값을 넣을 때
			// 첫번쨰
			if((int)session.getAttribute("recentBookNum2") == 0) {
				session.setAttribute("recentBookNum2", nb_num);
			}
			// 두번째
			else if((int)session.getAttribute("recentBookNum1") == 0) {
				// 첫번째 값과 동일하면 값을 넣지 않고 함수 종료
				if((int)session.getAttribute("recentBookNum2") == nb_num) {
					System.out.println("2번 인덱스 값이랑 동일해서 종료할거야");
					return;
				}else {	// 동일하지 않다면 값 넣기
					session.setAttribute("recentBookNum1", nb_num);
				}
			}
			// 세번째
			else if((int)session.getAttribute("recentBookNum0") == 0) {
				// 첫번째 값과 동일하다면 함수 종료
				if((int)session.getAttribute("recentBookNum1") == nb_num) {
					return;
				}
				// 두번째 값과 동일하다면 첫번째 값을 두번쨰로 이동한 후 첫번쨰 값에다가 새로운 값 삽입
				else if((int)session.getAttribute("recentBookNum2") == nb_num){
					int sessionFirst = (int)session.getAttribute("recentBookNum1");
					session.setAttribute("recentBookNum2", sessionFirst);
					session.setAttribute("recentBookNum1", nb_num);
				}
				// 두번쨰도 동일하지 않다면 첫번쨰에 바로 삽입
				else {
					session.setAttribute("recentBookNum0", nb_num);
				}
			}
		}
	}
	
	// 세션에 담긴 nb_num을 받아서 Newbook DTO에 담기
	public ArrayList<NewBook> selectRecentBookList(HttpSession session) {
		
		// 세션에 최근 본 상품이 없을 경우 0으로 초기화
		if(session.getAttribute("recentBookNum0") == null) {
			session.setAttribute("recentBookNum0", 0);
		}
		if(session.getAttribute("recentBookNum1") == null) {
			session.setAttribute("recentBookNum1", 0);
		}
		if(session.getAttribute("recentBookNum2") == null) {
			session.setAttribute("recentBookNum2", 0);
		}
		
		ArrayList<NewBook> recentBookList = new ArrayList<NewBook>();
		
		for (int i = 0 ; i < 3; i++) {
			int book_num = (int) session.getAttribute("recentBookNum"+i);
			// System.out.println("nb_num1111->"+book_num);
			if(book_num != 0) {
				NewBook recentBook = nbs.selectRecentBookList(book_num);
				recentBookList.add(recentBook);
			}
		}
			
		return recentBookList;
	}

}