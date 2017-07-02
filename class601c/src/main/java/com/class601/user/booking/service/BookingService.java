package com.class601.user.booking.service;

import java.util.List;

import com.class601.vo.BookingVo;

public interface BookingService {
	public int insertBookingInfo(BookingVo vo);
	public int insertPayInfo(BookingVo vo);
	public BookingVo selectPay(BookingVo vo);
	public BookingVo noSelectPay(BookingVo vo);
	public List<BookingVo> selectedSeat(BookingVo vo);

	public int totalBooking();	
	public int movieBooking(BookingVo vo);	
}
