package com.class601.login.service;

import com.class601.vo.UserVo;



public interface UserLoginService {
	public int userLogin(String id, String password);
	public UserVo idFind(UserVo vo);
	public int passFind(UserVo vo);
	public int regId(UserVo vo);
	public int modifyPass(UserVo vo);
}
