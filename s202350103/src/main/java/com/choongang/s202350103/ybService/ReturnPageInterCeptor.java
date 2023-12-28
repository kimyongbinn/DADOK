package com.choongang.s202350103.ybService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ReturnPageInterCeptor implements HandlerInterceptor {

	// 로그인 페이지 이동 전, 현재 페이지를 Session에 저장
	private void saveDest(HttpServletRequest request) {
		System.out.println("saveDest Start....");
	    String uri = request.getRequestURI();
	    String query = request.getQueryString();
	    String method = request.getMethod();

	    if ("GET".equals(method)) {
	        // Handle GET request
	        if (query == null || query.equals("null")) {
	            query = "";
	        } else {
	            query = "?" + query;
	        }
	        System.out.println("GET dest: " + (uri + query));
	        request.getSession().setAttribute("dest", uri + query);
	    } else if ("POST".equals(method)) {
	        // Handle POST request
	    	System.out.println("POST dest: " + (uri));
	        System.out.println("POST request detected: " + uri);
	    }
//	    // 기존 URI에 parameter가 있을 경우, 이를 포함
//	    if(query == null || query.equals("null")) {
//	    	query = "";
//	    } else {
//	        query = "?" + query;
//	    }
//	    
//	    if(request.getMethod().equals("GET")) {
//	    	System.out.println("dest: " + (uri + query));
//	        request.getSession().setAttribute("dest", uri + query);
//	    }
	  
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("AfterLoginReturnPaget Prehandle Start...");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			return true;
			
		}
		System.out.println("Login First!");
		saveDest(request);
		
		// 로그인 안한 상태면 로그인 폼으로 이동
		response.sendRedirect("/loginForm");
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}