package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.CinemaVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("cinemaDao")
public class CinemaDao extends EgovAbstractMapper {

	public List<CinemaVo> cinemaList(CinemaVo vo) {

		return selectList("cinemaList", vo);
	}

	public int cinemaInsert(CinemaVo vo) {

		return insert("cinemaInsert", vo);
	}

	public int cinemaModify(CinemaVo vo) {

		return update("cinemaModify", vo);
	}

	public int cinemaDelete(CinemaVo vo) {

		return delete("cinemaDelete", vo);
	}

	public int cinemaListCount(CinemaVo vo) {

		return selectOne("cinemaListCount", vo);
	}


	public CinemaVo cinemaDetailView(CinemaVo vo) {
		
		return selectOne("cinemaDetailView", vo);
	}
	
	//특정 극장의 전체 상영관수 계산하는 서비스
	public int countAllCinema(String theaterId){
		
		return selectOne("countAllCinema", theaterId);
	}
	
	public int countAllSeatNum(String theaterId){
		
		return selectOne("countAllSeatNum",theaterId);
	}
	
}