package com.class601.admin.citype.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.admin.citype.service.CiTypeService;
import com.class601.persistence.CiTypeDao;
import com.class601.util.Paging;
import com.class601.vo.CiTypeVo;

@Service("ciTypeService")
public class CiTypeServiceImpl implements CiTypeService{
	
	@Resource(name="ciTypeDao")
	CiTypeDao ciTypeDao;

	@Override
	public Map<String, Object> ci_typeList(String pageNo) {
		CiTypeVo vo = new CiTypeVo();
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<CiTypeVo> resultList = ciTypeDao.ci_typeList(vo);
		int totalCnt = ciTypeDao.ci_typeListCount(vo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", resultList);
		resultMap.put("paging", paging);
		
		return resultMap;
	}

	@Override
	public int ci_typeInsert(CiTypeVo vo) {
		return ciTypeDao.ci_typeInsert(vo);
	}

	@Override
	public CiTypeVo ci_typeDetailView(CiTypeVo vo) {
		return ciTypeDao.ci_typeDetailView(vo);
	}

	@Override
	public int ci_typeModify(CiTypeVo vo) {
		return ciTypeDao.ci_typeModify(vo);
	}

	@Override
	public int ci_typeDelete(CiTypeVo vo) {
		return ciTypeDao.ci_typeDelete(vo);
	}

	//페이징 없이 전체 상영관 종류 목록을 조회하는 서비스
	@Override
	public List<CiTypeVo> allTypeList(CiTypeVo vo) {
		return ciTypeDao.allTypeList(vo);
	}


}
