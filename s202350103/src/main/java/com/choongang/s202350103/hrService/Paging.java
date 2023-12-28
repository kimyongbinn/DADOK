package com.choongang.s202350103.hrService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	//			현재 페이지							페이지 당 게시글 수
	private int currentPage = 1;	private int rowPage = 10;
	//			최대 노출 페이지 수 (이전, 다음 제외)
	private int pageBlock = 10;
	//			페이지 내 시작 게시글 번호				종료 게시글 번호
	private int start;				private int end;
	//			시작 페이지 번호						종료 페이지 번호
	private int startPage;			private int endPage;
	//			전체 게시글 수						전체 페이지 수
	private int total;				private int totalPage;
	
	//					21				null
	public Paging(int total, String currentPage1) {
		this.total = total;	// 21
		if(currentPage1 != null) {
			this.currentPage = Integer.parseInt(currentPage1);	// 2
		}
		// 페이지 내 시작 게시글 번호 = (현재 페이지 - 1) * 페이지 당 게시글 수 + 1
		//					= 이전 페이지까지 채워져야 하는 게시글 수의 다음 번호
		//				1				10
		start = (currentPage - 1) * rowPage + 1;	// 1	11	21
		end   = start + rowPage - 1;				// 10	20	30
		
		// 전체 페이지 수 = (전체 게시글 수 / 페이지 당 게시글 수)를 정수로 올림
		//									21	 /	10
		totalPage = (int)Math.ceil((double)total / rowPage);	// 3	5	14
		
		// 시작 페이지 번호 = 현재 페이지 - (이전 페이지를 최대 노출 페이지 수로 나눈 나머지)
		//				2				2
		startPage = currentPage - (currentPage - 1) % pageBlock;	// 1
		endPage = startPage + pageBlock - 1;	// 10
		//	10			14
		
		// 공갈 페이지 방지
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
