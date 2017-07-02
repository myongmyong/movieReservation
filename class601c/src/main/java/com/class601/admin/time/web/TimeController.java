package com.class601.admin.time.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.time.service.TimeService;
import com.class601.comm.service.IdGenService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.TimeVo;

@Controller
public class TimeController {
	
	public static final String TABLE_NAME = "TIME_TYPE";
	
	@Resource(name="timeService")
	TimeService timeService;
	
	@Resource(name="idGenService")
	IdGenService idGenService;
	
	@RequestMapping(value="/admin/time/timeList.do")
	public String timeList(@RequestParam HashMap<String, String> req, ModelMap model) {
		String pageNo = (req.get("pageNo") == null ? "1" : req.get("pageNo"));
		
		Map<String, Object> resultMap = timeService.timeList(pageNo);
		
		List<TimeVo> resultList = (List<TimeVo>) resultMap.get("list");
		Paging paging = (Paging) resultMap.get("paging");
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		
		return "admin/time/timeList";
	}

	@RequestMapping(value="/admin/time/timeList_PopUp.do")
	public String timeList_PopUp(@RequestParam HashMap<String, String> req, ModelMap model) {
		String pageNo = (req.get("pageNo") == null ? "1" : req.get("pageNo"));
		
		Map<String, Object> resultMap = timeService.timeList(pageNo);
		
		List<TimeVo> resultList = (List<TimeVo>) resultMap.get("list");
		Paging paging = (Paging) resultMap.get("paging");
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		
		return "admin/time/timeList_PopUp";
	}
	
	@RequestMapping(value="/admin/time/timeInsertView.do")
	public String timeInsertView(@RequestParam HashMap<String, String> req, ModelMap model) {
		String num = idGenService.getNextId(TABLE_NAME);
		String nextNum = Utils.makeId(num);
		String nextId = "TIME" + nextNum;
		
		model.addAttribute("nextId", nextId);
		return "admin/time/timeInsertView";
	}
	
	@RequestMapping(value="/admin/time/timeInsert.do")
	public String timeInsert(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		TimeVo vo = new TimeVo();
		vo.setTimeTypeId(req.get("timeTypeId"));
		vo.setTimeTypeNm(req.get("timeTypeNm"));
		vo.setTimeTypePrice(req.get("timeTypePrice"));
		
		timeService.timeInsert(vo);
		
		return "redirect:/admin/time/timeList.do";
	}
	
	@RequestMapping(value="/admin/time/timeDetailView.do")
	public String timeDetailView(@RequestParam HashMap<String, String> req, ModelMap model) {
		String timeTypeId = req.get("timeTypeId");
		TimeVo vo = new TimeVo();
		vo.setTimeTypeId(timeTypeId);
		
		TimeVo resultVo = timeService.timeDetailView(vo);
		
		model.addAttribute("resultVo", resultVo);
		
		return "admin/time/timeDetailView";
	}
	
	@RequestMapping(value="/admin/time/timeModify.do")
	public String timeModify(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		TimeVo vo = new TimeVo();
		vo.setTimeTypeId(req.get("timeTypeId"));
		vo.setTimeTypeNm(req.get("timeTypeNm"));
		vo.setTimeTypePrice(req.get("timeTypePrice"));
		
		timeService.timeModify(vo);
		
		return "redirect:/admin/time/timeList.do";
	}
	
	@RequestMapping(value="/admin/time/timeDelete.do")
	public String timeDelete(@RequestParam HashMap<String, String> req, ModelMap model) {
		String timeTypeId = req.get("timeTypeId");
		TimeVo vo = new TimeVo();
		vo.setTimeTypeId(timeTypeId);

		
		timeService.timeDelete(vo);
		
		return "redirect:/admin/time/timeList.do";
	}
	
	
}
