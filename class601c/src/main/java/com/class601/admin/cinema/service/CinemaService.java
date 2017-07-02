package com.class601.admin.cinema.service;

import java.util.List;
import java.util.Map;

import com.class601.vo.CinemaVo;
import com.class601.vo.TheaterVo;

public interface CinemaService {

	public int cinemaInsert(CinemaVo vo);

	public int cinemaModify(CinemaVo vo);

	public int cinemaDelete(CinemaVo vo);

	public int cinemaListCount(CinemaVo vo);

	

	public CinemaVo cinemaDetailView(CinemaVo vo);

	public List<CinemaVo> cinemaList(CinemaVo vo);
	
	//특정 극장의 전체 상영관수 계산하는 서비스
	public int countAllCinema(String theaterId);
	//특정 극장의 총 좌석수 계산하는 서비스
	public int countAllSeatNum(String theaterId);
}
