package com.class601.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class601.login.service.UserLoginService;
import com.class601.vo.UserVo;

@Controller
public class UserLoginController {

	@Resource(name="userLoginService")
	UserLoginService userLoginService;
	
	@RequestMapping("/login/userLoginView.do")
	public String loginView(@RequestParam HashMap<String, String> req, ModelMap model) {
		
		return "/login/userLoginView";
	}
	
	
	@RequestMapping("/login/userLogin.do")
	public String login(HttpServletRequest request, ModelMap model){
	   
		String userId = request.getParameter("userId");
	    request.getSession().setAttribute("userId", userId);
	        
	    return "redirect:/user/main.do"; // 메인페이지 생성해야함...
	}
	
	@RequestMapping(value = "/login/chkUserId.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkAdminId(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		String userId = req.get("userId");
	    String userPassword = req.get("userPassword");
		
		int resultCnt = userLoginService.userLogin(userId, userPassword);

		Map<String, String> resultMap = new HashMap<String, String>();	
		resultMap.put("result", String.valueOf(resultCnt));
		resultMap.put("userId", userId);
		
		return resultMap;
	}
	
	
	@RequestMapping("/login/userLogout.do")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
        return "redirect:/user/main.do"; // 메인화면 주소로 리턴할 것
	}
	
	@RequestMapping("/login/idFindView.do")
	public String idFindView(@RequestParam HashMap<String, String> req, ModelMap model) {
		return "/login/idFindView";
	}
	
	@RequestMapping("/login/idFind.do")
	public String idFind(@RequestParam HashMap<String, String> req, ModelMap model) {
    	return "redirect:/login/userLoginView.do";
	}
	
	@RequestMapping(value = "/login/chkIdFind.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkIdFind(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		String userNm = req.get("userNm");
		String userEmail = req.get("userEmail");
		String userCellphone = req.get("userCellphone");

		
		UserVo vo = new UserVo();
		vo.setUserNm(userNm);
		vo.setUserEmail(userEmail);
		vo.setUserCellphone(userCellphone);
		
		UserVo resultVo = userLoginService.idFind(vo);
		String userId = resultVo.getUserId();

		Map<String, String> resultMap = new HashMap<String, String>();	
		resultMap.put("userNm", userNm);
		resultMap.put("userId", userId);
		
		return resultMap;
	}
	
	@RequestMapping("/login/passFindView.do")
	public String passFindView(@RequestParam HashMap<String, String> req, ModelMap model) {
		String resultPass = req.get("resultPass");
		model.addAttribute("resultPass",resultPass);
		
		return "/login/passFindView";
	}

	@RequestMapping("/login/passFind.do")
	public String passFind(HttpServletRequest request, ModelMap model) {

		String userId = request.getParameter("userId");
	    request.getSession().setAttribute("userId", userId);
	    
	    return "redirect:/login/passModifyView.do";
	}
	
	@RequestMapping(value = "/login/chkPassFindId.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkPassFindId(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		String userId = req.get("userId");

		UserVo vo = new UserVo();
		vo.setUserId(userId);
		
		int result = userLoginService.regId(vo);

		Map<String, String> resultMap = new HashMap<String, String>();	
		resultMap.put("result", String.valueOf(result));
		
		return resultMap;
	}
	
	@RequestMapping(value = "/login/chkPassFind.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public Object chkPassFind(@RequestParam HashMap<String, String> req,
			ModelMap model) {
		String userNm = req.get("userNm");
		String userId = req.get("userId");
		String userPasswordHint = req.get("userPasswordHint");
		String userPasswordAnswer = req.get("userPasswordAnswer");
				
		UserVo vo = new UserVo();
		vo.setUserNm(userNm);
		vo.setUserId(userId);
		vo.setUserPasswordHint(userPasswordHint);
		vo.setUserPasswordAnswer(userPasswordAnswer);
		
		int resultCnt = userLoginService.passFind(vo);

		Map<String, String> resultMap = new HashMap<String, String>();	
		resultMap.put("resultCnt", String.valueOf(resultCnt));
		
		return resultMap;
	}
	
	@RequestMapping("/login/passModifyView.do")
	public String passModifyView(HttpServletRequest request, @RequestParam HashMap<String, String> req, ModelMap model) {
		String userId = (String) request.getSession().getAttribute("userId");
		return "/login/passModifyView";
	}
	
	@RequestMapping("/login/passModify.do")
	public String passModify(HttpServletRequest request, @RequestParam HashMap<String, String> req, ModelMap model) {
		String userId = (String) request.getSession().getAttribute("userId");
		String userPassword = req.get("userPassword");
		UserVo vo = new UserVo();
		vo.setUserId(userId);
		vo.setUserPassword(userPassword);
		
		userLoginService.modifyPass(vo);
				
		return "redirect:/login/userLoginView.do";
	}
	
}
