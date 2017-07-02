package com.class601.user.mypage.service;

import java.util.List;

import com.class601.vo.BookVo;


public interface MypageService {
	public List<BookVo> bookingInfo(String id);
	public List<BookVo> bookedInfo(String id);
	public BookVo bookMovieInfo(BookVo vo);
}
