package com.class601.user.user_info.web;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class601.admin.cinema.service.CinemaService;
import com.class601.user.user_info.service.UserInfoService;
import com.class601.vo.UserVo;

@Controller
public class User_InfoController {
	@Resource(name = "userInfoService")
	UserInfoService userInfoService;

	@RequestMapping(value = "/user/user_info/user_InfoView.do")
	public String userInfoView(@RequestParam HashMap<String, String> req,
			ModelMap model) {

		return "/user/user_info/user_Info";
	}

	@RequestMapping(value = "/user/user_info/user_InfoInsert.do")
	public String userInfoInsert(@RequestParam HashMap<String, String> req,
			ModelMap model) {

		String userId = req.get("userId");
		String userPassword = req.get("userPassword");
		String userPasswordHint = req.get("userPasswordHint");
		String userPasswordAnswer = req.get("userPasswordAnswer");
		String userNm = req.get("userNm");
		String userEmail = req.get("userEmail") +"@" +req.get("email");
		String userBirthDate = req.get("userBirthDate");
		String userGender = req.get("userGender");
		String userMobileCarrier = req.get("userMobileCarrier");
		String userCellphone = req.get("userCellphone") +req.get("tele2")+req.get("tele3");
		String userRating = req.get("userRating");
		String userPerformance = req.get("userPerformance");

		UserVo vo = new UserVo();

		vo.setUserId(userId);
		vo.setUserPassword(userPassword);
		vo.setUserPasswordHint(userPasswordHint);
		vo.setUserPasswordAnswer(userPasswordAnswer);
		vo.setUserNm(userNm);
		vo.setUserEmail(userEmail);
		vo.setUserBirthDate(userBirthDate);
		vo.setUserGender(userGender);
		vo.setUserMobileCarrier(userMobileCarrier);
		vo.setUserCellphone(userCellphone);
		vo.setUserRating(userRating);
		vo.setUserPerformance(userPerformance);

		userInfoService.userInsert(vo);

		return "redirect:/login/userLoginView.do";
	}
	
	@RequestMapping(value = "/user/user_info/chkId.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkId(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		String chkId = (String)req.get("chkId");

		UserVo vo = new UserVo();
		vo.setUserId(chkId);

		int resultId = userInfoService.chkId(vo);

		Map<String, String> resultMap = new HashMap<String, String>();
		
		resultMap.put("result", String.valueOf(resultId));
		resultMap.put("chkId", chkId);
		


		
		return resultMap;
	}

	@RequestMapping(value = "/user/user_info/chkPw.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkPw(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		String userPassword = (String)req.get("userPassword");
		String chkPw = (String)req.get("chkPw");
		UserVo vo = new UserVo();
		vo.setUserPassword(userPassword);
	  


		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", true);
  	    resultMap.put("chkPw", userPassword);
		


		
		return resultMap;
	}

	


	
}
