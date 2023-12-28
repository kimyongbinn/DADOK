package com.choongang.s202350103.sjService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingNb {
	
	private int currentPage2 = 1;  private int rowPage  = 10 ;
	private int pageBlock = 5;
	private int start; 			private int end;
	private int startPage;	    private int endPage;
	private int totalNb;  		private int totalNbPage;
	
	public PagingNb(int totalNb, String currentPage3) {
		this.totalNb = totalNb;
		if (currentPage3 != null) {
			this.currentPage2 = Integer.parseInt(currentPage3);
					
		}
		start = (currentPage2 -1) * rowPage + 1;
		end   = start + rowPage - 1; 
		
		totalNbPage = (int) Math.ceil((double)totalNb / rowPage);
		
		startPage = currentPage2 - (currentPage2 -1) % pageBlock;
		endPage   = startPage + pageBlock - 1;
		
		if (endPage > totalNbPage) {
			 endPage = totalNbPage;
		}	
	}
	
	
}
