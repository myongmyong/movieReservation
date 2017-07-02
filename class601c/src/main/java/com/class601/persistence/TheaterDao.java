package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.TheaterVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("theaterDao")
public class TheaterDao extends EgovAbstractMapper {
	
	public List<TheaterVo> selectTheaterList(TheaterVo vo) {
		return  selectList("selectTheaterList", vo);
	}
	
	public int selectTheaterListCount(TheaterVo vo){
		return  selectOne("selectTheaterListCount",vo);
	}

	public TheaterVo theaterDetail(TheaterVo vo) {
		return  selectOne("theaterDetail", vo);
	}

	public int theaterInsert(TheaterVo vo) {

		return insert("theaterInsert", vo);
	}

	public int theaterModify(TheaterVo vo) {

		return update("theaterModify", vo);
	}

	public int theaterDelete(TheaterVo vo) {

		return delete("theaterDelete", vo);
	}
	
	//페이징 없이 전체 극장 목록을 조회하는 기능
	public List<TheaterVo> theaterList(TheaterVo vo) {
		return selectList("theaterList", vo);
	}

	public List<TheaterVo> theatersList(TheaterVo vo) {
		return selectList("theatersList", vo);
	}

	public List<TheaterVo> theatersAreaView(TheaterVo vo) {
		return selectList("theatersAreaView", vo);
	}

	public TheaterVo theatersDetail(TheaterVo vo){
		return selectOne("theatersDetail", vo);
	}
}
