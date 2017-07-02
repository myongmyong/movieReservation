package com.class601.admin.show.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class601.admin.show.service.ShowService;
import com.class601.comm.service.IdGenService;
import com.class601.user.booking.service.BookingService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.BookingVo;
import com.class601.vo.ShowVo;
import com.class601.vo.UserVo;

@Controller
public class ShowController {
	
	public static final String TABLE_NAME = "SHOW";
	
	@Resource(name="showService")
	ShowService showService;
	
	@Resource(name="bookingService")
	BookingService bookingService;

	@Resource(name="idGenService")
	IdGenService idGenService;

	
	@RequestMapping(value="/admin/show/showList.do")
	public String selectShowList(@RequestParam HashMap<String, String> req, ModelMap model){

		String showId = Utils.toEmptySpace(req.get("showId"));
		String pageNo = Utils.toPaging(req.get("pageNo"));
		
		ShowVo vo = new ShowVo();
		vo.setShowId(showId);
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<ShowVo> resultList = showService.selectShowList(vo);
		int totalCnt = showService.selectShowListCount(vo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		model.addAttribute("showId", showId);
		
		return "admin/show/showList";
	}
	
	
	@RequestMapping(value="/admin/show/showDetailView.do")
	public String showDetail(@RequestParam HashMap<String, String> req, ModelMap model){
		String showId = req.get("showId");
		
		ShowVo vo = new ShowVo();
		vo.setShowId(showId);
		
		ShowVo resultVo = showService.showDetail(vo);
		
		model.addAttribute("show", resultVo);
		
		return "admin/show/showDetailView";
	}
	
	@RequestMapping(value="/admin/show/showInsertView.do")
	public String showInsertView(@RequestParam HashMap<String, String> req, ModelMap model){
		String num = idGenService.getNextId(TABLE_NAME);
		String nextNum = Utils.makeId(num);
		String nextId = "SHOW"+nextNum;
				
		model.addAttribute("nextId", nextId);
				
		return "admin/show/showInsertView";
	}
	
	@RequestMapping(value="/admin/show/showInsert.do")
	public String showInsert(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String showId = req.get("showId");
		String movieId = req.get("movieId");
		String theaterId = req.get("theaterId");
		String cinemaId = req.get("cinemaId");
		String timeTypeId = req.get("timeTypeId");
		String startTime = req.get("startTime");
		String showDate = req.get("showDate");
		
		ShowVo vo = new ShowVo();
		vo.setShowId(showId);
		vo.setMovieId(movieId);
		vo.setTheaterId(theaterId);
		vo.setCinemaId(cinemaId);
		vo.setTimeTypeId(timeTypeId);
		vo.setStartTime(startTime);
		vo.setShowDate(showDate);
		
		showService.showInsert(vo);
		
		return "redirect:/admin/show/showList.do";
	}
	
	@RequestMapping(value="/admin/show/showModify.do")
	public String showModify(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String showId = req.get("showId");
		String movieId = req.get("movieId");
		String theaterId = req.get("theaterId");
		String cinemaId = req.get("cinemaId");
		String timeTypeId = req.get("timeTypeId");
		String startTime = req.get("startTime");
		String showDate = req.get("showDate");

		
		ShowVo vo = new ShowVo();
		
		
		vo.setShowId(showId);
		vo.setMovieId(movieId);
		vo.setTheaterId(theaterId);
		vo.setCinemaId(cinemaId);
		vo.setTimeTypeId(timeTypeId);
		vo.setStartTime(startTime);
		vo.setShowDate(showDate);
		
		showService.showModify(vo);
		
		return "redirect:/admin/show/showList.do";
	}
	
	@RequestMapping(value="/admin/show/showDelete.do")
	public String showDelete(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String showId = req.get("showId");
		
		ShowVo vo = new ShowVo();
		vo.setShowId(showId);
		
		showService.showDelete(vo);
		
		return "redirect:/admin/show/showList.do";
	}
	
	@RequestMapping(value = "/admin/show/chkShowInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkShowInfo(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		String theaterId 	= (String)req.get("theaterId");
		String cinemaId 	= (String)req.get("cinemaId");
		String startTime	= (String)req.get("startTime");
		String showDate 	= (String)req.get("showDate");
		
		ShowVo vo = new ShowVo();
		vo.setTheaterId(theaterId);
		vo.setCinemaId(cinemaId);
		vo.setStartTime(startTime);
		vo.setShowDate(showDate);
		
		int resultId = showService.chkShowInfo(vo);

		Map<String, String> resultMap = new HashMap<String, String>();	
		resultMap.put("result", String.valueOf(resultId));
		
		return resultMap;
	}
	
	@RequestMapping(value="/user/booking/showtimetable.do")
	public String selectBookList(@RequestParam HashMap<String,String> req,ModelMap model){
		
		String movieId = (String)req.get("movieId");

		ShowVo vo = new ShowVo();
		vo.setMovieId(movieId);

		List<ShowVo> resultList = showService.selectBookList(vo);
		
		model.addAttribute("resultList",resultList);
		
		return "user/booking/showTimetableList";
	}
	
	@RequestMapping(value = "/user/booking/timeTalbleTheater.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object selectTheaterList(@RequestParam HashMap<String,String> req,ModelMap model){
		
		String movieNm = (String)req.get("movieNm");
		String theaterNm = "";
		
		ShowVo vo = new ShowVo();
		vo.setMovieNm(movieNm);
		vo.setTheaterNm(theaterNm);

		List<ShowVo> theaterList = showService.selectTheatersList(vo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();   
	    resultMap.put("theaterList", theaterList);
		
		
		
		return resultMap;
		
	}
	
	@RequestMapping(value = "/user/booking/timeTalbleDate.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object selectDateList(@RequestParam HashMap<String,String> req,ModelMap model){
		
		String movieNm = (String)req.get("movie");
		String theaterNm = (String)req.get("theater");
		String date ="";
		
		
		ShowVo vo = new ShowVo();
		vo.setMovieNm(movieNm);
		vo.setTheaterNm(theaterNm);
		vo.setShowDate(date);
		
		List<ShowVo> dateList = showService.selectDateList(vo);
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		resultMap.put("dateList", dateList);
		
		return resultMap;
	}

	
	@RequestMapping(value = "/user/booking/timeTableTime.do",produces = "application/json; charset=utf8")
	@ResponseBody
	public Object selectTimeList(@RequestParam HashMap<String,String> req,ModelMap model){
		
		String movieNm = (String)req.get("movie");
		String theaterNm = (String)req.get("theater");
		String date =(String)req.get("date");
		String time = "";
		
		ShowVo vo = new ShowVo();
		vo.setMovieNm(movieNm);
		vo.setTheaterNm(theaterNm);
		vo.setShowDate(date);
		vo.setStartTime(time);
		
		List<ShowVo> timeList = showService.selectTimeList(vo);
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		resultMap.put("timeList", timeList);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/user/booking/timeTableShowId.do",produces = "application/json; charset=utf8")
	@ResponseBody
	public Object timeTableShowId(@RequestParam HashMap<String,String> req,ModelMap model){
		
		String movieNm = (String)req.get("movie");
		String theaterNm = (String)req.get("theater");
		String date =(String)req.get("date");
		String cinemaNm = (String)req.get("cinema");
		String time = (String)req.get("time");
		
		ShowVo vo = new ShowVo();
		vo.setMovieNm(movieNm);
		vo.setTheaterNm(theaterNm);
		vo.setShowDate(date);
		vo.setStartTime(time);
		vo.setCinemaNm(cinemaNm);
		
		ShowVo showVo = showService.selectShowId(vo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		resultMap.put("showVo", showVo);
		
		return resultMap;
	}
	
	@RequestMapping(value="/user/booking/selectSeat.do")
	public String selectSeat(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String showId = req.get("showId");
		model.addAttribute("showId",showId);
		
		return "/user/booking/seatInfo";
	}
	
	@RequestMapping(value = "/user/booking/selectedSeats.do",produces = "application/json; charset=utf8")
	@ResponseBody
	public Object selectedSeats(@RequestParam HashMap<String, String> req, ModelMap model){

		String showId = req.get("showId");
		
		BookingVo vo = new BookingVo();
		vo.setShowId(showId);
		
		List<BookingVo> selectedSeats = bookingService.selectedSeat(vo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("selectedSeats", selectedSeats);
		
		return resultMap;
	}
		
}
