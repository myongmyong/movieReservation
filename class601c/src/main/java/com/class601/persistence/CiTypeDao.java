package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.CiTypeVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("ciTypeDao")
public class CiTypeDao extends EgovAbstractMapper{
	public List<CiTypeVo> ci_typeList(CiTypeVo vo) {
		return  selectList("ci_typeList", vo);
	}
	
	public int ci_typeListCount(CiTypeVo vo){
		return  selectOne("ci_typeListCount",vo);
	}

	public CiTypeVo ci_typeDetailView(CiTypeVo vo) {

		return  selectOne("ci_typeDetailView", vo);
	}

	public int ci_typeInsert(CiTypeVo vo) {

		return insert("ci_typeInsert", vo);
	}

	public int ci_typeModify(CiTypeVo vo) {

		return update("ci_typeModify", vo);
	}

	public int ci_typeDelete(CiTypeVo vo) {

		return delete("ci_typeDelete", vo);
	}
	
	//페이징 없이 전체 상영관 종류 목록을 조회하는 서비스
	public List<CiTypeVo> allTypeList(CiTypeVo vo){
		
		return selectList("allTypeList",vo); 
	}
}
