package com.class601.user.theaters.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class601.comm.service.CodeService;
import com.class601.comm.service.IdGenService;
import com.class601.user.theaters.service.TheatersService;
import com.class601.vo.CodeVo;
import com.class601.vo.TheaterVo;

@Controller
public class TheatersController {
	private final static Logger LOGGER = Logger.getLogger(TheatersController.class);
	
	public static final String TABLE_NAME = "THEATER";
	public static final String MAIN_CODE = "THEATER_AREA";
	
	@Resource(name="theatersService")
	TheatersService theatersService;

	@Resource(name="idGenService")
	IdGenService idGenService;
	
	@Resource(name="codeService")
	CodeService codeService;
	
	@RequestMapping (value ="/user/theaters/theatersList.do")
	public String selectTheatersList(@RequestParam HashMap<String, String> req, ModelMap model){
		String defaultArea = "서울";
		String defalutTheaterNm = "홍대CGV";
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterArea(defaultArea);
		vo.setTheaterNm(defalutTheaterNm);
		
		List<TheaterVo> basicArea = theatersService.theatersAreaView(vo);
		TheaterVo basicTheaterNm = theatersService.theatersDetail(vo);
		
		List<CodeVo> areaCode = codeService.getCode(MAIN_CODE);		

		model.addAttribute("areaCode",areaCode);
		model.addAttribute("basicArea",basicArea);
		model.addAttribute("basicTheaterNm",basicTheaterNm);

		
		return "user/theaters/theatersList";
	}
	
	@RequestMapping(value = "/user/theaters/selectTheaters.do",produces = "application/json; charset=utf8")
	@ResponseBody
	public Object timeTableShowId(@RequestParam HashMap<String,String> req, ModelMap model){
		
		String theaterArea = req.get("theaterArea");
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterArea(theaterArea);
		
		List<TheaterVo> areaList = theatersService.theatersAreaView(vo);
	
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		resultMap.put("areaList", areaList);
		
		return resultMap;
	}

	@RequestMapping(value = "/user/theaters/theatersDetail.do",produces = "application/json; charset=utf8")
	@ResponseBody
	public Object theatersDetail(@RequestParam HashMap<String,String> req, ModelMap model){
		
		String theaterNm = req.get("theaterNm");
		
		TheaterVo vo = new TheaterVo();
		vo.setTheaterNm(theaterNm);
		
		TheaterVo theatersDetail = theatersService.theatersDetail(vo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		resultMap.put("theatersDetail", theatersDetail);
		
		return resultMap;
	}
	
	
}




























