package com.class601.user.user_info.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.persistence.UserInfoDao;
import com.class601.user.user_info.service.UserInfoService;
import com.class601.vo.UserVo;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

	@Resource(name = "userInfoDao")
	UserInfoDao userInfoDao;
	
	@Override
	public int userInsert(UserVo vo) {
		int resultCnt = userInfoDao.userInsert(vo);
		return resultCnt;
	}

	@Override
	public int chkId(UserVo vo) {
		int resultCnt = userInfoDao.chkId(vo);
		return resultCnt;
	}

	@Override
	public int chkPw(UserVo vo) {
		int resultCnt = userInfoDao.chkPw(vo);
		return  resultCnt;
	}

	
}
