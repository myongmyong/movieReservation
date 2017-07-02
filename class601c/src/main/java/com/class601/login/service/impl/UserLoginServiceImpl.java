package com.class601.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.login.service.UserLoginService;
import com.class601.persistence.UserLoginDao;
import com.class601.vo.UserVo;

@Service("userLoginService")
public class UserLoginServiceImpl implements UserLoginService {
	@Resource(name="userLoginDao")
	UserLoginDao userLoginDao;

	@Override
	public int userLogin(String id, String password) {
		UserVo vo = new UserVo();
		vo.setUserId(id);
		vo.setUserPassword(password);
		
		int resultCnt = userLoginDao.userLogin(vo);
		
		return resultCnt;
	}

	@Override
	public UserVo idFind(UserVo vo) {

		return userLoginDao.idFind(vo);
	}

	@Override
	public int passFind(UserVo vo) {
		
		return userLoginDao.passFind(vo);
	}

	@Override
	public int regId(UserVo vo) {
		return userLoginDao.regId(vo);
	}

	@Override
	public int modifyPass(UserVo vo) {
		return userLoginDao.modifyPass(vo);
	}
	
	
}
