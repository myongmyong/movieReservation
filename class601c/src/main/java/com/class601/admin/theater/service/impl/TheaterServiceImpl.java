package com.class601.admin.theater.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.admin.theater.service.TheaterService;
import com.class601.persistence.TheaterDao;
import com.class601.vo.TheaterVo;


@Service("theaterService")
public class TheaterServiceImpl implements TheaterService {
	
	@Resource(name = "theaterDao")
	TheaterDao theaterDao;
	

	public List<TheaterVo> selectTheaterList(TheaterVo vo) {
		return theaterDao.selectTheaterList(vo);
	}

	public int selectTheaterListCount(TheaterVo vo) {
		return theaterDao.selectTheaterListCount(vo);
	}

	public TheaterVo theaterDetail(TheaterVo vo) {
		return theaterDao.theaterDetail(vo);
	}

	public int theaterInsert(TheaterVo vo) {
		return theaterDao.theaterInsert(vo);
	}

	public int theaterModify(TheaterVo vo) {
		return theaterDao.theaterModify(vo);
	}

	public int theaterDelete(TheaterVo vo) {
		return theaterDao.theaterDelete(vo);
	}

	@Override
	public List<TheaterVo> TheaterList(TheaterVo vo) {
		return theaterDao.theaterList(vo);
	}

}
