package com.class601.user.booking.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.persistence.BookingDao;
import com.class601.user.booking.service.BookingService;
import com.class601.vo.BookingVo;

@Service("bookingService")
public class BookingServiceImpl implements BookingService {
	
	@Resource(name="bookingDao")
	BookingDao bookingDao;
	
	public int insertBookingInfo(BookingVo vo) {
		return bookingDao.insertBookingInfo(vo);
	}

	public int insertPayInfo(BookingVo vo) {
		return bookingDao.insertPayInfo(vo);
	}

	public BookingVo selectPay(BookingVo vo) {
		return bookingDao.selectPay(vo);
	}

	public BookingVo noSelectPay(BookingVo vo) {
		return bookingDao.noSelectPay(vo);
	}

	public List<BookingVo> selectedSeat(BookingVo vo) {
		
		return bookingDao.selectedSeat(vo);
	}

	public int totalBooking() {
		return bookingDao.totalBooking();
	}

	public int movieBooking(BookingVo vo) {
		return bookingDao.movieBooking(vo);
	}

}
