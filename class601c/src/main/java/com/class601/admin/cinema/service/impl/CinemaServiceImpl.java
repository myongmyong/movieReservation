package com.class601.admin.cinema.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.admin.cinema.service.CinemaService;
import com.class601.persistence.CinemaDao;
import com.class601.persistence.TheaterDao;
import com.class601.util.Paging;
import com.class601.vo.CinemaVo;
import com.class601.vo.TheaterVo;

@Service("cinemaService")
public class CinemaServiceImpl implements CinemaService {

	@Resource(name = "cinemaDao")
	CinemaDao cinemaDao;
	

	@Resource(name = "theaterDao")
	TheaterDao theaterDao;

	@Override
	public CinemaVo cinemaDetailView(CinemaVo vo) {
		CinemaVo resultvo = cinemaDao.cinemaDetailView(vo);
		return resultvo;
	}

	@Override
	public int cinemaInsert(CinemaVo vo) {
		int resultCnt = cinemaDao.cinemaInsert(vo);
		return resultCnt;
	}

	@Override
	public int cinemaModify(CinemaVo vo) {
		int resultCnt = cinemaDao.cinemaModify(vo);
		return resultCnt;
	}

	@Override
	public int cinemaDelete(CinemaVo vo) {
		int resultCnt = cinemaDao.cinemaDelete(vo);
		return resultCnt;
	}

	@Override
	public int cinemaListCount(CinemaVo vo) {
		int resultCnt = cinemaDao.cinemaListCount(vo);
		return resultCnt;
	}



	@Override
	public List<CinemaVo> cinemaList(CinemaVo vo) {
		List<CinemaVo> resultVo = cinemaDao.cinemaList(vo);
		return resultVo;
	}

	//특정 극장의 전체 상영관수 계산하는 서비스
	@Override
	public int countAllCinema(String theaterId) {
		return cinemaDao.countAllCinema(theaterId);
	}

	@Override
	public int countAllSeatNum(String theaterId) {
		return cinemaDao.countAllSeatNum(theaterId);
	}

}