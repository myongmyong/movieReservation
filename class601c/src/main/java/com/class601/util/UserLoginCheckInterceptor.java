package com.class601.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.class601.vo.AdminLoginVo;

public class UserLoginCheckInterceptor extends HandlerInterceptorAdapter{
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		HttpSession session = request.getSession(false);
//		
//		if(session == null) {
//			response.sendRedirect(request.getContextPath()+"/admin/login/loginView.do");
//			System.out.println("겁나잘됨");
//			return false;
//		}
//		System.out.println("들어오긴했는데 안됨");
//		
//		AdminLoginVo vo = (AdminLoginVo) session.getAttribute("vo");
//		
//		if(vo == null) {
//			response.sendRedirect(request.getContextPath()+"/admin/login/loginView.do");
//			return false;		
//		}
//		
//		return true;
//		
//	}
	
	
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            //세션값이 널일 경우 로그인페이지로 이동
            if(request.getSession().getAttribute("userId") == null && request.getSession().getAttribute("noUId") == null ){
                response.sendRedirect(request.getContextPath()+"/login/userLoginView.do"); 
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //admin 세션key 존재시 main 페이지 이동
        return true;
    }
    
}
