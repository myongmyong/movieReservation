package com.class601.admin.theater.service;

import java.util.List;

import com.class601.vo.TheaterVo;

public interface TheaterService {

	public List<TheaterVo> selectTheaterList(TheaterVo vo);
	public List<TheaterVo> TheaterList(TheaterVo vo);	
	public int selectTheaterListCount(TheaterVo vo);
	public TheaterVo theaterDetail(TheaterVo vo);
	public int theaterInsert(TheaterVo vo);
	public int theaterModify(TheaterVo vo);
	public int theaterDelete(TheaterVo vo);

}
			