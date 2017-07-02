package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.ShowVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("showDao")
public class ShowDao extends EgovAbstractMapper{

	public List<ShowVo> selectShowList(ShowVo vo) {
		return selectList("selectShowList", vo);
	}

	public int selectShowListCount(ShowVo vo) {
		return selectOne("selectShowListCount", vo);
	}

	public ShowVo showDetail(ShowVo vo) {
		return selectOne("showDetail", vo);
	}

	public int showInsert(ShowVo vo) {
		return insert("showInsert", vo);
	}

	public int showModify(ShowVo vo) {
		return update("showModify", vo);
	}

	public int showDelete(ShowVo vo) {
		return delete("showDelete", vo);
	}
	
	public int chkShowInfo(ShowVo vo){
		return selectOne("chkShowInfo", vo);
	}
	
	public List<ShowVo> selectBookList(ShowVo vo){
		return selectList("selectBookList",vo);
		}
	
	public List<ShowVo> selectTheatersList(ShowVo vo){
		return selectList("selectTheatersList",vo);
	}
	
	public List<ShowVo> selectDateList(ShowVo vo){
		return selectList("selectDateList",vo);
	}

	public List<ShowVo> selectTimeList(ShowVo vo){
		return selectList("selectTimeList",vo);
	}
	
	public ShowVo selectShowId(ShowVo vo){
		return selectOne("selectShowId",vo);
	}

	public ShowVo selectPayInfo(ShowVo vo){
		return selectOne("selectPayInfo",vo);
	}

}
