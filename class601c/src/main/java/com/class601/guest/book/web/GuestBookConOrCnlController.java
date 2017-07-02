package com.class601.guest.book.web;

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
import com.class601.vo.UserVo;

@Controller
public class GuestBookConOrCnlController {
	
	public static final String TABLE_NAME = "NO_U_INFO";

	@Resource(name="guestBookConOrCnlService")
	GuestBookConOrCnlService guestBookConOrCnlService;
	
	@RequestMapping("/guest/book/guestBookConOrCnl.do")
	public String guestLoginView(HttpServletRequest request, @RequestParam HashMap<String, String> req, ModelMap model) {
		String noUId = (String) request.getSession().getAttribute("noUId");
		System.out.println(noUId);
		GuestBookVo vo = new GuestBookVo();
		vo.setNoUId(noUId);
		
		GuestBookVo resultVo = guestBookConOrCnlService.guestBookCon(vo);
		//System.out.println(resultVo.getNoUNm());
		model.addAttribute("resultVo", resultVo);
	    
		return "/guest/book/guestBookConOrCnl";
	}
	
	@RequestMapping("/guest/book/guestBookCnl.do")
	public String guestBookView(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		return "redirect:/login/guestLoginView.do"; // 메인 페이지 생성해야함...
	}
	
}
