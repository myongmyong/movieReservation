package com.class601.persistence;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("idGenDao")
public class IdGenDao extends EgovAbstractMapper {

	public String getNextId(String tableName) {

		return  selectOne("getNextId", tableName);
		
	}

	public int updateNextId(String tableName) {
		
		String queryId = "updateNextId";
		
		return update(queryId, tableName);
	}

}
