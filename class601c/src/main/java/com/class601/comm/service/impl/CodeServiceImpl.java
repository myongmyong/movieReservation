package com.class601.comm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.comm.service.CodeService;
import com.class601.persistence.CodeDao;
import com.class601.vo.CodeVo;

@Service("codeService")
public class CodeServiceImpl implements CodeService {
	
	@Resource(name="codeDao")
	CodeDao codeDao;
	
	public List<CodeVo> getCode(String mainCd){
		
		return codeDao.getCode(mainCd);
	}

}
