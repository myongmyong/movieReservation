package com.class601.persistence;

import org.springframework.stereotype.Repository;

import com.class601.vo.UserVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("userInfoDao")
public class UserInfoDao extends EgovAbstractMapper{

	public int userInsert(UserVo vo) {
		// TODO Auto-generated method stub
		return insert("userInsert", vo);
	}

	public int chkId(UserVo vo) {
		// TODO Auto-generated method stub
		return selectOne("chkId",vo);
	}

	public int chkPw(UserVo vo) {
		// TODO Auto-generated method stub
		return  selectOne("chkPw",vo);
	}





}
