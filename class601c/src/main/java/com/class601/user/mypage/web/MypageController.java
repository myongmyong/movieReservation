package com.class601.user.mypage.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.comm.service.CodeService;
import com.class601.comm.service.IdGenService;
import com.class601.user.movies.service.MoviesService;
import com.class601.user.mypage.service.MypageService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.BookVo;
import com.class601.vo.MovieVo;


@Controller
public class MypageController {


	@Resource(name ="mypageService")
	MypageService mypageService;
	


	@RequestMapping (value ="/user/mypage/bookingInfo.do")
	public String bookingInfo(HttpServletRequest request, @RequestParam HashMap<String, String> req, ModelMap model){
		String userId = (String) request.getSession().getAttribute("userId");
		
		List<BookVo> bookingList = mypageService.bookingInfo(userId);
		List<BookVo> bookedList = mypageService.bookedInfo(userId);
		
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("bookedList", bookedList);
		
		return "user/mypage/bookingInfo";
	}
	
	@RequestMapping (value ="/user/mypage/bookingValid.do")
	public String bookingValid(@RequestParam HashMap<String, String> req, ModelMap model){
		String bookingId = req.get("bookingId");
		String userId = req.get("userId");
		
		BookVo vo = new BookVo();
		vo.setBookingId(bookingId);
		vo.setUserId(userId);
		
		BookVo resultVo = mypageService.bookMovieInfo(vo);
		
		model.addAttribute("resultVo",resultVo);
		
		return "user/mypage/bookingValid";
	}
	
	@RequestMapping (value ="/user/mypage/memberInfoDetail.do")
	public String memberInfoDetail(@RequestParam HashMap<String, String> req, ModelMap model){
		

		
		return "user/mypage/memberInfoDetail";
	}
	
	@RequestMapping (value ="/user/mypage/memberInfoModify.do")
	public String memberInfoModify(@RequestParam HashMap<String, String> req, ModelMap model){
		

		
		return "redirect:user/mypage/memberInfoDetail.do";
	}
	
}
