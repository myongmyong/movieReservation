package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.CodeVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("codeDao")
public class CodeDao extends EgovAbstractMapper {
	
	public List<CodeVo> getCode(String mainCd){
		
		return selectList("getCode", mainCd);
	}

}
