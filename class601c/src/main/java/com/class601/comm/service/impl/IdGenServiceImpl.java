package com.class601.comm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.comm.service.IdGenService;
import com.class601.persistence.IdGenDao;

@Service("idGenService")
public class IdGenServiceImpl implements IdGenService {

	@Resource(name = "idGenDao")
	IdGenDao idGenDao;

	public String getNextId(String tableName) {

		String nextId = idGenDao.getNextId(tableName);

		idGenDao.updateNextId(tableName);

		return nextId;
	}

}