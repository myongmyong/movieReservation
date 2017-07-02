package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.CiTypeVo;
import com.class601.vo.TimeVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("timeDao")
public class TimeDao extends EgovAbstractMapper{
	public List<TimeVo> timeList(TimeVo vo) {
		return  selectList("timeList", vo);
	}
	
	public int timeListCount(TimeVo vo){
		return  selectOne("timeListCount",vo);
	}

	public TimeVo timeDetailView(TimeVo vo) {

		return  selectOne("timeDetailView", vo);
	}

	public int timeInsert(TimeVo vo) {

		return insert("timeInsert", vo);
	}

	public int timeModify(TimeVo vo) {

		return update("timeModify", vo);
	}

	public int timeDelete(TimeVo vo) {

		return delete("timeDelete", vo);
	}
	
	//페이징 없이 전체 시간대 목록을 조회하는 서비스
	public List<CiTypeVo> timeAllList(TimeVo vo){
		
		return selectList("timeAllList",vo); 
	}
}
