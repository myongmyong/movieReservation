package com.class601.guest.book.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.guest.book.service.GuestBookConOrCnlService;
import com.class601.persistence.GuestBookingDao;
import com.class601.vo.GuestBookVo;

@Service("guestBookConOrCnlService")
public class GuestBookConOrCnlServiceImpl implements GuestBookConOrCnlService {
	@Resource(name="guestBookingDao")
	GuestBookingDao guestBookingDao;
	
	@Override
	public GuestBookVo guestBookCon(GuestBookVo vo) {
		return guestBookingDao.guestBookCon(vo);
	}

	
}
