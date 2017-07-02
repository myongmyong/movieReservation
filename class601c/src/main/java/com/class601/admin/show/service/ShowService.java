package com.class601.admin.show.service;

import java.util.List;

import com.class601.vo.ShowVo;

public interface ShowService {
	public List<ShowVo> selectShowList(ShowVo vo);
	public int selectShowListCount(ShowVo vo);
	public ShowVo showDetail(ShowVo vo);
	public int showInsert(ShowVo vo);
	public int showModify(ShowVo vo);
	public int showDelete(ShowVo vo);
	
	public int chkShowInfo(ShowVo vo);
	
	public List<ShowVo> selectBookList(ShowVo vo);
	public List<ShowVo> selectTheatersList(ShowVo vo);
	public List<ShowVo> selectDateList(ShowVo vo);
	public List<ShowVo> selectTimeList(ShowVo vo);
	public ShowVo selectShowId(ShowVo vo);
	
	public ShowVo selectPayInfo(ShowVo vo);
}
