package com.class601.user.booking.web;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.show.service.ShowService;
import com.class601.comm.service.IdGenService;
import com.class601.user.booking.service.BookingService;
import com.class601.util.Utils;
import com.class601.vo.BookingVo;
import com.class601.vo.ShowVo;

@Controller
public class BookingController {
	
	public static final String BOOKING = "BOOKING";
	public static final String PAY = "PAY";

	
	@Resource(name="showService")
	ShowService showService;

	@Resource(name="bookingService")
	BookingService bookingService;

	@Resource(name="idGenService")
	IdGenService idGenService;
		
	@RequestMapping(value="/user/booking/payView.do")
	public String payView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String showId = req.get("showId");
		String userId = Utils.toEmptySpace(req.get("userId"));
		String noUId  = Utils.toEmptySpace(req.get("noUId"));
		String seatInfo = req.get("seatInfo");
		
		ShowVo vo = new ShowVo();
		vo.setShowId(showId);
		
		ShowVo resultVo = showService.selectPayInfo(vo);
		int cinemaPrice = Integer.parseInt(resultVo.getCinemaTypePrice());
		int timePrice = Integer.parseInt(resultVo.getTimeTypePrice());
		
		String totalPrice = String.valueOf(cinemaPrice + timePrice);
		
		model.addAttribute("showId",showId);
		model.addAttribute("userId",userId);
		model.addAttribute("noUId",noUId);
		model.addAttribute("seatInfo",seatInfo);
		model.addAttribute("totalPrice",totalPrice);
		
		return "/user/booking/payView";
	}

	@RequestMapping(value="/user/booking/pay.do")
	public String pay(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String num = idGenService.getNextId(BOOKING);
		String nextNum = Utils.makeId(num);
		String nextId = "BOOKING"+nextNum;
		
		String pNum = idGenService.getNextId(PAY);
		String pNextNum = Utils.makeId(pNum);
		String pNextId = "PAY"+pNextNum;
		
		String showId = req.get("showId");
		String userId = Utils.toEmptySpace(req.get("userId"));
		String noUId  = Utils.toEmptySpace(req.get("noUId"));
		String seatInfo = req.get("seatInfo");
		String totalPrice = req.get("totalPrice");
		
		BookingVo vo = new BookingVo();
		vo.setBookingId(nextId);
		vo.setShowId(showId);
		vo.setUserId(userId);
		vo.setNoUId(noUId);
		vo.setBookingSeat(seatInfo);
		vo.setPayAmnt(totalPrice);
		vo.setPayId(pNextId);
		
		
		bookingService.insertBookingInfo(vo);
		bookingService.insertPayInfo(vo);
		
		BookingVo payInfo = new BookingVo();  
		
		if(userId != ""){
			payInfo = bookingService.selectPay(vo);		
		}else{
			payInfo = bookingService.noSelectPay(vo);
		}		

		model.addAttribute("payInfo",payInfo);
		
		return "/user/booking/paySuccess";
	}
}