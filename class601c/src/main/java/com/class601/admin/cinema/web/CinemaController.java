package com.class601.admin.cinema.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.cinema.service.CinemaService;
import com.class601.admin.citype.service.CiTypeService;
import com.class601.admin.theater.service.TheaterService;
import com.class601.comm.service.IdGenService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.CiTypeVo;
import com.class601.vo.CinemaVo;
import com.class601.vo.TheaterVo;

@Controller
public class CinemaController {
	
	public static final String TABLE_NAME = "CINEMA";
	@Resource(name = "cinemaService")
	CinemaService cinemaService;
	
	@Resource(name="theaterService")
	TheaterService theaterService;
	
	@Resource(name="ciTypeService")
	CiTypeService ciTypeService;

	@Resource(name = "idGenService")
	IdGenService idGenService;
	
	@RequestMapping(value = "/admin/cinema/cinemaList.do")
	public String cinemaList(@RequestParam HashMap<String, String> req, ModelMap model) {

		String theaterId = Utils.toEmptySpace(req.get("theaterId"));
		String pageNo = Utils.toPaging(req.get("pageNo"));
				
		CinemaVo vo = new CinemaVo();
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		vo.setTheaterId(theaterId);

		List<CinemaVo> resultList = cinemaService.cinemaList(vo);
		int totalCnt = cinemaService.cinemaListCount(vo);

		TheaterVo tVo = new TheaterVo();
		tVo.setTheaterId(theaterId);
		
		TheaterVo resultVo = theaterService.theaterDetail(tVo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);

		model.addAttribute("resultList", resultList);
		model.addAttribute("resultVo",resultVo);
		model.addAttribute("paging", paging);

		return "/admin/cinema/cinemaList";
	}
	
	@RequestMapping(value = "/admin/cinema/cinemaList_PopUp.do")
	public String cinemaListPopUp(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		String theaterId = Utils.toEmptySpace(req.get("theaterId"));
		String pageNo = Utils.toPaging(req.get("pageNo"));
		
		CinemaVo vo = new CinemaVo();
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		vo.setTheaterId(theaterId);
		
		List<CinemaVo> resultList = cinemaService.cinemaList(vo);
		int totalCnt = cinemaService.cinemaListCount(vo);
		
		TheaterVo tVo = new TheaterVo();
		tVo.setTheaterId(theaterId);
		
		TheaterVo resultVo = theaterService.theaterDetail(tVo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("resultVo",resultVo);
		model.addAttribute("paging", paging);
		
		return "/admin/cinema/cinemaList_PopUp";
	}

	
	
	@RequestMapping(value="/admin/cinema/cinemaInsertView.do")
	public String cinemaInsertView(@RequestParam HashMap<String, String> req, ModelMap model){
			    
		String next = idGenService.getNextId(TABLE_NAME);
		String nextNum = Utils.makeId(next);
		String cinema = "CINEMA";
		String nextId = cinema + nextNum;
				
		String theaterId = Utils.toEmptySpace(req.get("theaterId"));
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		
		TheaterVo resultTheater = theaterService.theaterDetail(vo);
		
		
		String cinemaTypeId ="";
		CiTypeVo vo1 = new CiTypeVo();
		vo1.setCinemaTypeId(cinemaTypeId);
		
		List<CiTypeVo> resultCiTypeId = ciTypeService.allTypeList(vo1);
		
		
		model.addAttribute("nextId", nextId);
		model.addAttribute("resultTheater", resultTheater);
		model.addAttribute("resultCiTypeId",resultCiTypeId);
		
		
		return "/admin/cinema/cinemaInsertView";
	}
	

	@RequestMapping(value = "/admin/cinema/cinemaInsert.do")
	public String cinemaInsert(@RequestParam HashMap<String, String> req, ModelMap model) {

		String cinemaId = req.get("cinemaId");
		String theaterId = req.get("theaterId");
		String cinemaNm = req.get("cinemaNm");
		String cinemaTypeId = req.get("cinemaTypeId");
		String cinemaSeatNum = req.get("cinemaSeatNum");
		String cinemaFloorNo = req.get("cinemaFloorNo");
			    	
		CinemaVo vo = new CinemaVo();
		vo.setCinemaId(cinemaId);
		vo.setTheaterId(theaterId);
		vo.setCinemaNm(cinemaNm);
		vo.setCinemaTypeId(cinemaTypeId);
		vo.setCinemaSeatNum(cinemaSeatNum);
		vo.setCinemaFloorNo(cinemaFloorNo);
		
		cinemaService.cinemaInsert(vo);
		
		int allCinema = cinemaService.countAllCinema(theaterId);
		int allSeatNum = cinemaService.countAllSeatNum(theaterId);
		
		TheaterVo vo1 = new TheaterVo();
		vo1.setTheaterId(theaterId);
		vo1.setTheaterCinemaNum(String.valueOf(allCinema));
		vo1.setTheaterSeatNum(String.valueOf(allSeatNum));
		
		theaterService.theaterModify(vo1);


		return "redirect:/admin/cinema/cinemaList.do?theaterId="+theaterId;
	}

	@RequestMapping(value = "/admin/cinema/cinemaDetailView.do")
	public String cinemaDetailView(@RequestParam HashMap<String, String> req, 
			ModelMap model) {

		String theaterId = req.get("theaterId");
		TheaterVo vo = new TheaterVo();
		vo.setTheaterId(theaterId);
		
		TheaterVo resultTheater = theaterService.theaterDetail(vo);
		
		
		String cinemaTypeId ="";
		CiTypeVo vo1 = new CiTypeVo();
		vo1.setCinemaTypeId(cinemaTypeId);
		
		List<CiTypeVo> resultCiTypeId = ciTypeService.allTypeList(vo1);
		
		
		String cinemaId = req.get("cinemaId");
	
		CinemaVo vo2 = new CinemaVo();
		vo2.setCinemaId(cinemaId);
		CinemaVo resultVo = cinemaService.cinemaDetailView(vo2);
		
		model.addAttribute("cinema", resultVo);
		model.addAttribute("resultTheater", resultTheater);
		model.addAttribute("resultCiTypeId",resultCiTypeId);
		

		return "/admin/cinema/cinemaDetailView";
	}

	@RequestMapping(value = "/admin/cinema/cinemaModify.do")
	public String cinemaModify(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		
		String cinemaId = req.get("cinemaId");
		String theaterId = req.get("theaterId");
		String cinemaNm = req.get("cinemaNm");
		String cinemaTypeId = req.get("cinemaTypeId");
		String cinemaSeatNum = req.get("cinemaSeatNum");
		String cinemaFloorNo = req.get("cinemaFloorNo");
			    	
		CinemaVo vo = new CinemaVo();
		vo.setCinemaId(cinemaId);
		vo.setTheaterId(theaterId);
		vo.setCinemaNm(cinemaNm);
		vo.setCinemaTypeId(cinemaTypeId);
		vo.setCinemaSeatNum(cinemaSeatNum);
		vo.setCinemaFloorNo(cinemaFloorNo);


		cinemaService.cinemaModify(vo);
		
		int allSeatNum = cinemaService.countAllSeatNum(theaterId);
		
		TheaterVo vo1 = new TheaterVo();
		vo1.setTheaterId(theaterId);
		vo1.setTheaterSeatNum(String.valueOf(allSeatNum));
		
		theaterService.theaterModify(vo1);
		
		return "redirect:/admin/cinema/cinemaList.do?theaterId="+theaterId;
	}

	@RequestMapping(value = "/admin/cinema/cinemaDelete.do")
	public String cinemaDelete(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		
		String cinemaId = req.get("cinemaId");
		String theaterId = req.get("theaterId");

		CinemaVo vo = new CinemaVo();
		vo.setCinemaId(cinemaId);
	
		cinemaService.cinemaDelete(vo);
		
		int allCinema = cinemaService.countAllCinema(theaterId);
		int allSeatNum = cinemaService.countAllSeatNum(theaterId);
		
		TheaterVo vo1 = new TheaterVo();
		vo1.setTheaterId(theaterId);
		vo1.setTheaterCinemaNum(String.valueOf(allCinema));
		vo1.setTheaterSeatNum(String.valueOf(allSeatNum));
		
		theaterService.theaterModify(vo1);

		return "redirect:/admin/cinema/cinemaList.do?theaterId="+theaterId;
	}

}
