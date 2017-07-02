package com.class601.user.theaters.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.persistence.TheaterDao;
import com.class601.user.theaters.service.TheatersService;
import com.class601.vo.TheaterVo;


@Service("theatersService")
public class TheatersServiceImpl implements TheatersService {
	
	@Resource(name = "theaterDao")
	TheaterDao theaterDao;
	
	public int selectTheaterListCount(TheaterVo vo) {
		return theaterDao.selectTheaterListCount(vo);
	}

	@Override
	public List<TheaterVo> theatersList(TheaterVo vo) {
		return theaterDao.theatersList(vo);
	}

	@Override
	public List<TheaterVo> theatersAreaView(TheaterVo vo) {
		return theaterDao.theatersAreaView(vo);
	}

	@Override
	public TheaterVo theatersDetail(TheaterVo vo) {
		return theaterDao.theatersDetail(vo);
	}

}
