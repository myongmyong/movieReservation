package com.class601.admin.time.service;

import java.util.List;
import java.util.Map;

import com.class601.vo.CiTypeVo;
import com.class601.vo.TimeVo;

public interface TimeService {
	public Map<String, Object> timeList(String pageNo);
	public int timeInsert(TimeVo vo);
	public TimeVo timeDetailView(TimeVo vo);
	public int timeModify(TimeVo vo);
	public int timeDelete(TimeVo vo);
	public List<CiTypeVo> timeAllList(TimeVo vo);

}
