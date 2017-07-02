package com.class601.user.theaters.service;

import java.util.List;

import com.class601.vo.TheaterVo;

public interface TheatersService {

	public int selectTheaterListCount(TheaterVo vo);
	
	public List<TheaterVo> theatersList(TheaterVo vo);	
	public List<TheaterVo> theatersAreaView(TheaterVo vo);
	
	public TheaterVo theatersDetail(TheaterVo vo);
}
			