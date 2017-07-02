package com.class601.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.login.service.GuestLoginService;
import com.class601.login.service.GuestLoginService;
import com.class601.persistence.GuestLoginDao;
import com.class601.vo.GuestVo;

@Service("guestLoginService")
public class GuestLoginServiceImpl implements GuestLoginService {
	@Resource(name="guestLoginDao")
	GuestLoginDao guestLoginDao;
	
	@Override
	public int guestRegist(String id, String password, String birth, String name, String mobileCarrier, String cellphone) {
		GuestVo vo = new GuestVo();
		vo.setNoUId(id);
		vo.setNoUPw(password);
		vo.setNoUBirth(birth);
		vo.setNoUNm(name);
		vo.setNoUMobileCarrier(mobileCarrier);
		vo.setNoUHp(cellphone);
		
		int resultCnt = guestLoginDao.guestRegist(vo);
		
		return resultCnt;
	}

	@Override
	public GuestVo guestLogin(String password, String birth, String name, String mobileCarrier, String cellphone) {
		GuestVo vo = new GuestVo();
		vo.setNoUPw(password);
		vo.setNoUBirth(birth);
		vo.setNoUNm(name);
		vo.setNoUMobileCarrier(mobileCarrier);
		vo.setNoUHp(cellphone);
		
		GuestVo resultVo = guestLoginDao.guestLogin(vo);
		
		return resultVo;
	}
	
	
}
