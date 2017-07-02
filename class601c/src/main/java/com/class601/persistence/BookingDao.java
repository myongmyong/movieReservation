package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.BookingVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("bookingDao")
public class BookingDao extends EgovAbstractMapper {
	
	public int insertBookingInfo(BookingVo vo){
		return insert("insertBookingInfo", vo);
	}

	public int insertPayInfo(BookingVo vo){
		return insert("insertPayInfo", vo);
	}
	
	public BookingVo selectPay(BookingVo vo){
		return selectOne("selectPay", vo);
	}
	
	public BookingVo noSelectPay(BookingVo vo){
		return selectOne("noSelectPay", vo);
	}
	
	public List<BookingVo> selectedSeat(BookingVo vo){
		return selectList("selectedSeat", vo);
	}

	public int totalBooking(){
		return selectOne("totalBooking");
	}

	public int movieBooking(BookingVo vo){
		return selectOne("movieBooking", vo);
	}

}
