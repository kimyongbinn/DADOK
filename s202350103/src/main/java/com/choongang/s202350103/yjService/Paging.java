package com.choongang.s202350103.yjService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	// 페이징 모듈
	
	private int currentPage = 1;	//	현재 페이지 번호 기본값 1
	private int rowPage   = 10;		// 	한 페이지당 표시항목 기본값 10
	
	private int pageBlock = 10;		//	한번에 표시할 페이지 블록 
//	ex) 1부터10 다음페이지는 11 부터 20
	
	private int start;				// 현재 데이터 시작 인덱스
	private int end;				// 마지막 데이터 인덱스
	
	private int startPage;			// 현재 페이지 블록에 표시할 페이지번호
	private int endPage;			// 마지막 페이지 블록에 표시할 페이지번호
	
	private int total;				// 전체 데이터 총 수 
	private int totalPage;			// 전체 페이지 수 
	
	// 페이징 모듈 초기화
	
	// 생성자를 통해 전체 데이터 개수와 현재 페이지를 받아옴
	public Paging(int totalMember, String currentPage1) {
	    // 전체 데이터 개수를 설정.
	    this.total = totalMember;
	    
	    //  currentPage1이 null이 아닌 경우, 
	    //	문자열 형태의 현재 페이지 값을 정수로 변환하여 설정.
	    if (currentPage1 != null) {
	        this.currentPage = Integer.parseInt(currentPage1);
	    }
	    
	    // 현재 페이지에 따라 데이터의 범위를 계산하여 설정.
	    // start: 현재 페이지에서 표시할 데이터의 시작 인덱스
	    // end: 현재 페이지에서 표시할 데이터의 끝 인덱스
	    start = (currentPage - 1) * rowPage + 1;  // 현재 페이지의 첫 번째 데이터의 인덱스
	    end   = start + rowPage - 1;              // 현재 페이지의 마지막 데이터의 인덱스
	    
	    // 전체 페이지 수를 계산
	    // total: 전체 데이터 개수, rowPage: 한 페이지당 표시할 데이터 개수
	    totalPage = (int) Math.ceil((double) total / rowPage);  // 데이터를 나누어 페이지 수를 올림 처리.
	    
	    // 현재 페이지 블록에 표시할 페이지 번호의 범위를 계산하여 설정.
	    // startPage: 현재 페이지 블록의 첫 번째 페이지 번호
	    // endPage: 현재 페이지 블록의 마지막 페이지 번호
	    startPage = currentPage - (currentPage - 1) % pageBlock; // 현재 페이지 블록의 첫 번째 페이지 번호
	    endPage = startPage + pageBlock - 1;  // 현재 페이지 블록의 마지막 페이지 번호
	    
	    // 마지막 페이지 번호가 전체 페이지 수를 초과하지 않도록 검사하고 조정.
	    if (endPage > totalPage) {
	        endPage = totalPage;
	    }
	}

	
}
