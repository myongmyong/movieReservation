package com.class601.comm.web;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommController {
	
	@RequestMapping(value="/user/main.do")
	public String userMain(@RequestParam HashMap<String,String> req, ModelMap model){
				
		return "/user/userMain";
	}
	
}
