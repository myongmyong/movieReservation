package com.class601.persistence;

import org.springframework.stereotype.Repository;

import com.class601.vo.GuestBookVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("guestBookingDao")
public class GuestBookingDao extends EgovAbstractMapper {
	public GuestBookVo guestBookCon(GuestBookVo vo) {
		return selectOne("guestBookCon", vo);
	}
}
