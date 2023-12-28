package com.choongang.s202350103.yjService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.choongang.s202350103.model.Member;

public class YjInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션에 저장된 member 객체 가져옴
		Member member = (Member)request.getSession().getAttribute("member");

		//  비 로그인 시 
		if(member == null) {
			response.sendRedirect("/loginForm");
			return false;
		}
		// 세션에서 현재 로그인된 m_num
		int loginMNum = member.getM_num();
		// URL 에 입력된 m_num 
		int urlMNum = Integer.parseInt(request.getParameter("m_num"));
		
		// 로그인된 회원 번호와 URL 로 입력하는 회원번호 비 일치시
		if(loginMNum != urlMNum) {
			response.sendRedirect("/custom404");
			return false;
		}
		
		return true;
	}
	
	
	
	
}
