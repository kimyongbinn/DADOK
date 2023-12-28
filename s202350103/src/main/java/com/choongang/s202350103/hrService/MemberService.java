package com.choongang.s202350103.hrService;

import org.springframework.stereotype.Service;
import com.choongang.s202350103.hrDao.MemberDao;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberDao md;
	
	public int memTot() {
		System.out.println("Service start..");
		int result = md.memTot();
		System.out.println("Service result -> "+ result);
		return result;
	}
}
