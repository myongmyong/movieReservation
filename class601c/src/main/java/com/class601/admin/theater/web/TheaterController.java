package com.class601.admin.theater.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.theater.service.TheaterService;
import com.class601.comm.service.CodeService;
import com.class601.comm.service.IdGenService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.CodeVo;
import com.class601.vo.MovieVo;
import com.class601.vo.TheaterVo;

@Controller
public class TheaterController {
	private final static Logger LOGGER = Logger.getLogger(TheaterController.class);
	
	public static final String TABLE_NAME = "THEATER";
	public static final String MAIN_CODE = "THEATER_AREA";
	
	@Resource(name="theaterService")
	TheaterService theaterService;

	@Resource(name="idGenService")
	IdGenService idGenService;
	
	@Resource(name="codeService")
	CodeService codeService;
	
	@RequestMapping(value="/admin/theater/theaterList.do")
	public String selectTheaterList(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String theaterId = Utils.toEmptySpace(req.get("theaterId"));
		String pageNo = (req.get("pageNo") == null ? "1" : req.get("pageNo"));
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<TheaterVo> resultList = theaterService.selectTheaterList(vo);
		int totalCnt = theaterService.selectTheaterListCount(vo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		
		model.addAttribute("theaterId", theaterId);
		
		return "admin/theater/theaterList";
	}
	

	
	@RequestMapping(value="/admin/theater/theaterList_PopUp.do")
	public String selectTheaterListPopUp(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String theaterId = Utils.toEmptySpace(req.get("theaterId"));
		String pageNo = (req.get("pageNo") == null ? "1" : req.get("pageNo"));
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<TheaterVo> resultList = theaterService.selectTheaterList(vo);
		int totalCnt = theaterService.selectTheaterListCount(vo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		
		model.addAttribute("theaterId", theaterId);
		
		return "admin/theater/theaterList_PopUp";
	}
	
	
	@RequestMapping(value="/admin/theater/theaterDetailView.do")
	public String theaterDetail(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String theaterId = req.get("theaterId");
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		
		TheaterVo resultVo = theaterService.theaterDetail(vo);
		model.addAttribute("theater", resultVo);
		
		List<CodeVo> areaList = codeService.getCode(MAIN_CODE);
		model.addAttribute("areaList",areaList);
		
		return "admin/theater/theaterDetailView";
	}
	
	@RequestMapping(value="/admin/theater/theaterInsertView.do")
	public String theaterInsertView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String num = idGenService.getNextId(TABLE_NAME);
		String nextNum = Utils.makeId(num);
		String nextId = "THEATER"+nextNum;

		model.addAttribute("nextId", nextId);
		
		List<CodeVo> areaList = codeService.getCode(MAIN_CODE);
		model.addAttribute("areaList",areaList);
		
		return "admin/theater/theaterInsertView";
	}
	
	@RequestMapping(value="/admin/theater/theaterInsert.do")
	public String theaterInsert(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String theaterId = req.get("theaterId");
		String theaterNm = req.get("theaterNm");
		String theaterOldAddress = req.get("theaterOldAddress");
		String theaterNewAddress = req.get("theaterNewAddress");
		String theaterTel = req.get("theaterTel");
		String theaterCinemaNum = req.get("theaterCinemaNum");
		String theaterSeatNum = req.get("theaterSeatNum");
		String theaterArea = req.get("theaterArea");
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		vo.setTheaterNm(theaterNm);
		vo.setTheaterOldAddress(theaterOldAddress);
		vo.setTheaterNewAddress(theaterNewAddress);
		vo.setTheaterTel(theaterTel);
		vo.setTheaterCinemaNum(theaterCinemaNum);
		vo.setTheaterSeatNum(theaterSeatNum);
		vo.setTheaterArea(theaterArea);
		
		theaterService.theaterInsert(vo);
		
		return "redirect:/admin/theater/theaterList.do";
	}
	
	
	
	
	@RequestMapping(value="/admin/theater/theaterModify.do")
	public String theaterModify(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String theaterId = req.get("theaterId");
		String theaterNm = req.get("theaterNm");
		String theaterOldAddress = req.get("theaterOldAddress");
		String theaterNewAddress = req.get("theaterNewAddress");
		String theaterTel = req.get("theaterTel");
		String theaterCinemaNum = req.get("theaterCinemaNum");
		String theaterSeatNum = req.get("theaterSeatNum");
		String theaterArea = req.get("theaterArea");
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		vo.setTheaterNm(theaterNm);
		vo.setTheaterOldAddress(theaterOldAddress);
		vo.setTheaterNewAddress(theaterNewAddress);
		vo.setTheaterTel(theaterTel);
		vo.setTheaterCinemaNum(theaterCinemaNum);
		vo.setTheaterSeatNum(theaterSeatNum);
		vo.setTheaterArea(theaterArea);
		
		theaterService.theaterModify(vo);
		
		return "redirect:/admin/theater/theaterList.do";
	}
	
	
	@RequestMapping(value="/admin/theater/theaterDelete.do")
	public String theaterDelete(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String theaterId = req.get("theaterId");
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		
		theaterService.theaterDelete(vo);
		
		return "redirect:/admin/theater/theaterList.do";
	}
	
	
	
	
}
