package com.class601.admin.citype.service;

import java.util.List;
import java.util.Map;

import com.class601.vo.CiTypeVo;

public interface CiTypeService {
	public Map<String, Object> ci_typeList(String pageNo);
	public int ci_typeInsert(CiTypeVo vo);
	public CiTypeVo ci_typeDetailView(CiTypeVo vo);
	public int ci_typeModify(CiTypeVo vo);
	public int ci_typeDelete(CiTypeVo vo);
	
	//페이징 없이 전체 상영관 종류 목록을 조회하는 서비스
	public List<CiTypeVo> allTypeList(CiTypeVo vo);
}
