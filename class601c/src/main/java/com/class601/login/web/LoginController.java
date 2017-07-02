package com.class601.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.class601.login.service.LoginService;
import com.class601.vo.AdminLoginVo;
import com.class601.vo.UserVo;

@Controller
public class LoginController {

	@Resource(name="loginService")
	LoginService loginService;
	
	@RequestMapping("/login/loginView.do")
	public String loginView(@RequestParam HashMap<String, String> req, ModelMap model) {
		String resultCnt = req.get("resultCnt");
		model.addAttribute("resultCnt",resultCnt);
		
		return "/login/loginView";
	}
	
	
	@RequestMapping("/login/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response){

		String adminId = request.getParameter("adminId");
	    HttpSession session = request.getSession();
	    
	    //웹페이지에서받은 아이디,패스워드 일치시 admin 세션key 생성
	    session.setAttribute("adminId", adminId);

	    return "redirect:/admin/movie/movieList.do";
	    
	}
	
	@RequestMapping("/login/logout.do")
	public String logout(HttpSession session) {
		session.setAttribute("adminId", null);
        return "redirect:/login/loginView.do";
	}
	
	@RequestMapping(value = "/login/chkAdminId.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkAdminId(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		String adminId = (String)req.get("adminId");
		String adminPassword = (String)req.get("adminPassword");
		
		int resultCnt = loginService.login(adminId, adminPassword);

		Map<String, String> resultMap = new HashMap<String, String>();	
		resultMap.put("result", String.valueOf(resultCnt));
		resultMap.put("adminId", adminId);
		
		return resultMap;
	}
	
}
