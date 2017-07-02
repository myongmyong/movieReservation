package com.class601.admin.time.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.admin.citype.service.CiTypeService;
import com.class601.admin.time.service.TimeService;
import com.class601.persistence.CiTypeDao;
import com.class601.persistence.TimeDao;
import com.class601.util.Paging;
import com.class601.vo.CiTypeVo;
import com.class601.vo.TimeVo;

@Service("timeService")
public class TimeServiceImpl implements TimeService{
	
	@Resource(name="timeDao")
	TimeDao timeDao;

	@Override
	public Map<String, Object> timeList(String pageNo) {
		TimeVo vo = new TimeVo();
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<TimeVo> resultList = timeDao.timeList(vo);
		int totalCnt = timeDao.timeListCount(vo);
		
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
	public int timeInsert(TimeVo vo) {
		return timeDao.timeInsert(vo);
	}

	@Override
	public TimeVo timeDetailView(TimeVo vo) {
		return timeDao.timeDetailView(vo);
	}

	@Override
	public int timeModify(TimeVo vo) {
		return timeDao.timeModify(vo);
	}

	@Override
	public int timeDelete(TimeVo vo) {
		return timeDao.timeDelete(vo);
	}

	@Override
	public List<CiTypeVo> timeAllList(TimeVo vo) {
		return timeDao.timeAllList(vo);
	}


}
