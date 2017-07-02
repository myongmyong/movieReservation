package com.class601.persistence;

import org.springframework.stereotype.Repository;

import com.class601.vo.AdminLoginVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("loginDao")
public class LoginDao extends EgovAbstractMapper{
	public int login(AdminLoginVo vo) {
		return selectOne("login", vo);
	}
}
