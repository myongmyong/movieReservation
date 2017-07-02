package com.class601.persistence;

import org.springframework.stereotype.Repository;

import com.class601.vo.UserVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("userLoginDao")
public class UserLoginDao extends EgovAbstractMapper{
	public int userLogin(UserVo vo) {
		return selectOne("userLogin", vo);
	}
	
	public UserVo idFind(UserVo vo) {
		return selectOne("idFind", vo);
	}
	
	public int passFind(UserVo vo) {
		return selectOne("passFind", vo);
	}
	
	public int regId(UserVo vo) {
		return selectOne("regId", vo);
	}
	
	public int modifyPass(UserVo vo) {
		return update("modifyPass", vo);
	}
}
