package com.class601.persistence;

import org.springframework.stereotype.Repository;

import com.class601.vo.GuestVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("guestLoginDao")
public class GuestLoginDao extends EgovAbstractMapper{
	public int guestRegist(GuestVo vo) {
		return insert("guestRegist", vo);
	}
	
	public GuestVo guestLogin(GuestVo vo) {
		return selectOne("guestLogin", vo);
	}
}
