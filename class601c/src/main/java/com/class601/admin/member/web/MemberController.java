package com.class601.admin.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.member.service.MemberService;
import com.class601.util.Paging;
import com.class601.vo.MemberVo;

@Controller
public class MemberController {
	
	
	@Resource(name="memberService")
	MemberService memberService;
	
	
	@RequestMapping(value="/admin/member/memberList.do")
	public String memberList(@RequestParam HashMap<String, String> req, ModelMap model) {
		String pageNo = (req.get("pageNo") == null ? "1" : req.get("pageNo"));
		
		Map<String, Object> resultMap = memberService.memberList(pageNo);
		
		List<MemberVo> resultList = (List<MemberVo>) resultMap.get("list");
		Paging paging = (Paging) resultMap.get("paging");
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		
		return "admin/member/memberList";
	}
	
	@RequestMapping(value="/admin/member/memberDetailView.do")
	public String memberDetailView(@RequestParam HashMap<String, String> req, ModelMap model) {
		String userId = req.get("userId");
		MemberVo vo = new MemberVo();
		vo.setUserId(userId);
		
		MemberVo resultVo = memberService.memberDetailView(vo);
		
		model.addAttribute("resultVo", resultVo);
		
		return "admin/member/memberDetailView";
	}
	
	@RequestMapping(value="/admin/member/memberModify.do")
	public String memberModify(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		MemberVo vo = new MemberVo();
		vo.setUserId(req.get("userId"));
		vo.setUserRating(req.get("userRating"));
		
		memberService.memberModify(vo);
		
		return "redirect:/admin/member/memberList.do";
	}
	
	@RequestMapping(value="/admin/member/memberDelete.do")
	public String memberDelete(@RequestParam HashMap<String, String> req, ModelMap model) {
		String userId = req.get("userId");
		MemberVo vo = new MemberVo();
		vo.setUserId(userId);

		
		memberService.memberDelete(vo);
		
		return "redirect:/admin/member/memberList.do";
	}

	
}
