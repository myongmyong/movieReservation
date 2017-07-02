package com.class601.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class601.comm.service.IdGenService;
import com.class601.guest.book.service.GuestBookConOrCnlService;
import com.class601.login.service.GuestLoginService;
import com.class601.vo.GuestBookVo;
import com.class601.vo.GuestVo;
import com.class601.vo.UserVo;

@Controller
public class GuestLoginController {
	
	public static final String TABLE_NAME = "NO_U_INFO";

	@Resource(name="guestLoginService")
	GuestLoginService guestLoginService;
	
	@Resource(name="guestBookConOrCnlService")
	GuestBookConOrCnlService guestBookConOrCnlService;
	
	@Resource(name="idGenService")
	IdGenService idGenService;
	
	
	@RequestMapping("/login/guestLoginView.do")
	public String guestLoginView(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		return "/login/guestLoginView";
	}
	
	@RequestMapping("/login/guestBookView.do")
	public String guestBookView(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		return "/login/guestBookView";
	}
	
	@RequestMapping("/login/guestBookConView.do")
	public String guestBookConView(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		return "/login/guestBookConView";
	}
	
	
	@RequestMapping("/login/guestRegist.do")
	public String guestRegist(@RequestParam HashMap<String, String> req, HttpServletRequest request, ModelMap model){
	   
		String noUId = "guest" + idGenService.getNextId(TABLE_NAME);
	    String noUPw = req.get("noUPassword");
	    String noUBirth = req.get("noUBirth");
	    String noUNm = req.get("noUNm");
	    String noUMobileCarrier = req.get("noUMobileCarrier");
	    String noUHp = req.get("cellphoneInit")+req.get("cellphoneMiddle")+req.get("cellphoneEnd");

	    guestLoginService.guestRegist(noUId, noUPw, noUBirth, noUNm, noUMobileCarrier, noUHp);
	    
        request.getSession().setAttribute("noUId", noUId);
	        
	    return "redirect:/user/booking/showtimetable.do"; // 예매페이지로 넘어감

	}
	
	@RequestMapping(value = "/login/guestChkLogin.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object guestChkLogin(@RequestParam HashMap<String, String> req, ModelMap model){
	   
	    String noUPw = req.get("noUPw");
	    String noUBirth = req.get("noUBirth");
	    String noUNm = req.get("noUNm");
	    String noUMobileCarrier = req.get("noUMobileCarrier");
	    String noUHp = req.get("noUHp");

	    GuestVo vo = guestLoginService.guestLogin(noUPw, noUBirth, noUNm, noUMobileCarrier, noUHp);
	    String tempId = vo.getNoUId();
	    GuestBookVo tempVo = new GuestBookVo();
	    tempVo.setNoUId(tempId);
	    GuestBookVo resultVo = guestBookConOrCnlService.guestBookCon(tempVo);
	    String noUId = resultVo.getNoUId();
		Map<String, String> resultMap = new HashMap<String, String>();	
		resultMap.put("noUId", noUId);
	    
	    return resultMap;
	}
	
	@RequestMapping("/login/guestLogin.do")
	public String guestLogin(@RequestParam HashMap<String, String> req, HttpServletRequest request, ModelMap model){
	   
	    String noUPw = req.get("noUPassword");
	    String noUBirth = req.get("noUBirth");
	    String noUNm = req.get("noUNm");
	    String noUMobileCarrier = req.get("noUMobileCarrier");
	    String noUHp = req.get("cellphoneInit")+req.get("cellphoneMiddle")+req.get("cellphoneEnd");

	    GuestVo resultVo = guestLoginService.guestLogin(noUPw, noUBirth, noUNm, noUMobileCarrier, noUHp);

	    request.getSession().setAttribute("noUId", resultVo.getNoUId());
	    return "redirect:/guest/book/guestBookConOrCnl.do"; 

	}
	
	@RequestMapping("/login/guestLogout.do")
	public String logout(HttpSession session) {
		session.setAttribute("noUId", null);
        return "";
	}
	
}
