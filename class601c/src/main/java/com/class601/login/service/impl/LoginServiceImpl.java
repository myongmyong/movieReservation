package com.class601.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.login.service.LoginService;
import com.class601.persistence.LoginDao;
import com.class601.vo.AdminLoginVo;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Resource(name="loginDao")
	LoginDao loginDao;

	@Override
	public int login(String id, String password) {
		AdminLoginVo vo = new AdminLoginVo();
		vo.setAdminId(id);
		vo.setAdminPassword(password);
		
		int resultCnt = loginDao.login(vo);
		
		return resultCnt;
	}
	
	
}
