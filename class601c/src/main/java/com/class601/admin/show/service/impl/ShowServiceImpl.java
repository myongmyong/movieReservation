package com.class601.admin.show.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.admin.show.service.ShowService;
import com.class601.persistence.ShowDao;
import com.class601.vo.ShowVo;

@Service("showService")
public class ShowServiceImpl implements ShowService {
	
	@Resource(name="showDao")
	ShowDao showDao;


	public List<ShowVo> selectShowList(ShowVo vo) {
		return showDao.selectShowList(vo);
	}

	public int selectShowListCount(ShowVo vo) {
		return showDao.selectShowListCount(vo);
	}


	public ShowVo showDetail(ShowVo vo) {
		return showDao.showDetail(vo);
	}


	public int showInsert(ShowVo vo) {
		return showDao.showInsert(vo);
	}


	public int showModify(ShowVo vo) {
		return showDao.showModify(vo);
	}

	public int showDelete(ShowVo vo) {
		return showDao.showDelete(vo);
	}

	public int chkShowInfo(ShowVo vo) {
		return showDao.chkShowInfo(vo);
	}

	public List<ShowVo> selectBookList(ShowVo vo) {
		return showDao.selectBookList(vo);
	
	}

	public List<ShowVo> selectTheatersList(ShowVo vo) {
		return showDao.selectTheatersList(vo);
	}

	public List<ShowVo> selectDateList(ShowVo vo) {
		return showDao.selectDateList(vo);
	}

	public List<ShowVo> selectTimeList(ShowVo vo) {
		return showDao.selectTimeList(vo);
	}

	public ShowVo selectShowId(ShowVo vo) {
		return showDao.selectShowId(vo);
	}

	public ShowVo selectPayInfo(ShowVo vo) {
		return showDao.selectPayInfo(vo);
	}
	
	
	
}
