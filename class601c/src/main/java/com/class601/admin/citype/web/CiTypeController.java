package com.class601.admin.citype.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.citype.service.CiTypeService;
import com.class601.comm.service.IdGenService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.CiTypeVo;

@Controller
public class CiTypeController {
	
	public static final String TABLE_NAME = "CINEMA_TYPE";
	
	@Resource(name="ciTypeService")
	CiTypeService ciTypeService;
	
	@Resource(name="idGenService")
	IdGenService idGenService;
	
	@RequestMapping(value="/admin/ci_type/ci_typeList.do")
	public String ci_typeList(@RequestParam HashMap<String, String> req, ModelMap model) {
		String pageNo = (req.get("pageNo") == null ? "1" : req.get("pageNo"));
		
		Map<String, Object> resultMap = ciTypeService.ci_typeList(pageNo);
		
		List<CiTypeVo> resultList = (List<CiTypeVo>) resultMap.get("list");
		Paging paging = (Paging) resultMap.get("paging");
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		
		return "admin/ci_type/ci_typeList";
	}
	
	@RequestMapping(value="/admin/ci_type/ci_typeInsertView.do")
	public String ci_typeInsertView(@RequestParam HashMap<String, String> req, ModelMap model) {
		String num = idGenService.getNextId(TABLE_NAME);
		String nextNum = Utils.makeId(num);
		String nextId = "CI_TYPE" + nextNum;
		
		model.addAttribute("nextId", nextId);
		
		return "admin/ci_type/ci_typeInsertView";
	}
	
	@RequestMapping(value="/admin/ci_type/ci_typeInsert.do")
	public String ci_typeInsert(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		CiTypeVo vo = new CiTypeVo();
		vo.setCinemaTypeId(req.get("cinemaTypeId"));
		vo.setCinemaTypeNm(req.get("cinemaTypeNm"));
		vo.setCinemaTypePrice(req.get("cinemaTypePrice"));
		
		ciTypeService.ci_typeInsert(vo);
		
		return "redirect:/admin/ci_type/ci_typeList.do";
	}
	
	@RequestMapping(value="/admin/ci_type/ci_typeDetailView.do")
	public String ci_typeDetailView(@RequestParam HashMap<String, String> req, ModelMap model) {
		String cinemaTypeId = req.get("cinemaTypeId");
		CiTypeVo vo = new CiTypeVo();
		vo.setCinemaTypeId(cinemaTypeId);
		
		CiTypeVo resultVo = ciTypeService.ci_typeDetailView(vo);
		
		model.addAttribute("resultVo", resultVo);
		
		return "admin/ci_type/ci_typeDetailView";
	}
	
	@RequestMapping(value="/admin/ci_type/ci_typeModify.do")
	public String ci_typeModify(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		CiTypeVo vo = new CiTypeVo();
		vo.setCinemaTypeId(req.get("cinemaTypeId"));
		vo.setCinemaTypeNm(req.get("cinemaTypeNm"));
		vo.setCinemaTypePrice(req.get("cinemaTypePrice"));
		
		ciTypeService.ci_typeModify(vo);
		
		return "redirect:/admin/ci_type/ci_typeList.do";
	}
	
	@RequestMapping(value="/admin/ci_type/ci_typeDelete.do")
	public String ci_typeDelete(@RequestParam HashMap<String, String> req, ModelMap model) {
		String cinemaTypeId = req.get("cinemaTypeId");
		CiTypeVo vo = new CiTypeVo();
		vo.setCinemaTypeId(cinemaTypeId);

		
		ciTypeService.ci_typeDelete(vo);
		
		return "redirect:/admin/ci_type/ci_typeList.do";
	}

	
}
