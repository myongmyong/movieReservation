package com.class601.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.class601.vo.AdminLoginVo;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
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
            //admin이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
            if(request.getSession().getAttribute("adminId") == null ){
                    response.sendRedirect(request.getContextPath()+"/login/loginView.do"); 
                    return false;
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        //admin 세션key 존재시 main 페이지 이동
        return true;
    }
    
}
