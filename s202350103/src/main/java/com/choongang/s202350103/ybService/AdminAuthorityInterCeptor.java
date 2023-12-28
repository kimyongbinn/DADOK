package com.choongang.s202350103.ybService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.model.Member;

public class AdminAuthorityInterCeptor implements HandlerInterceptor {
	
	private static final String LOGIN = "login";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("AdminAuthorityInterCeptor postHandle Start...");
		
		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object member = modelMap.get("member");
		Object dest = null;
		Member member1 = (Member) session.getAttribute("member");
		if(member != null) {
			System.out.println("Login success!");
			session.setAttribute(LOGIN, member);
			
			// 이전 페이지 불러오기
			dest = session.getAttribute("dest");
			
//			response.sendRedirect(dest != null ? dest.toString() : "/");
			String redirectUrl = dest != null ? dest.toString() : "/";
			System.out.println("AdminAuthorityInterCeptor postHandle redirectUrl => " + redirectUrl);
			
			session.setAttribute("redirectUrl", redirectUrl);	
			// 마지막에 세션에 저장된 주소 삭제
			session.removeAttribute("dest");  	  
		} else if(member1.getM_admin() != 1) {
			System.out.println("AdminAuthorityInterCeptor Start... You do not have permission. Just Administrator allow");
          response.sendRedirect("custom404");
//          return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
	}
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("AdminAuthorityInterCeptor preHandle() Start...");
		
		// session 객체를 가져옴
        HttpSession session = request.getSession();
        
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
//        Object obj = session.getAttribute("member");
        
       	//  비 로그인 시 
//    	if(obj == null) {
//    		System.out.println("LoginInterCeptor Start... You do not have permission. Please log in first");
//
//    		session.removeAttribute(LOGIN);
//			response.sendRedirect("/loginForm");
//			return false;
//		}
//        
//        if(obj != null) {
//        	// 로그인 후 관리자 아니면 관리자 페이지 접근 X
//        	Member member = (Member) session.getAttribute("member");
//        	if(member.getM_admin() != 1) {
//        		System.out.println("AdminAuthorityInterCeptor Start... You do not have permission. Just Administrator allow");
//                response.sendRedirect("custom404");
//                return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
//        	}
//       
//        }
        
        if(session.getAttribute(LOGIN) == null) {
    		System.out.println("AdminAuthorityInterCeptor Start... You do not have permission. Please log in first");

    		session.removeAttribute(LOGIN);
//			response.sendRedirect("/loginForm");
//			return false;
		}
        
        if(session.getAttribute(LOGIN) != null) {
        	// 로그인 후 관리자 아니면 관리자 페이지 접근 X
        	Member member = (Member) session.getAttribute("member");
        	System.out.println("AdminAuthorityInterCeptor Start... You do not have permission. Just Administrator allow");
        	if(member.getM_admin() != 1) {
        		System.out.println("AdminAuthorityInterCeptor Start... You do not have permission. Just Administrator allow");
                response.sendRedirect("custom404");
                return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        	}
        }
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
	}
	
	
}


