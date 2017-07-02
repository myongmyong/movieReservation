package com.class601.emp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.emp.service.EmpService;
import com.class601.persistence.EmpDao;
import com.class601.vo.EmpVo;

@Service("empService")
public class EmpServiceImpl implements EmpService {

	@Resource(name = "empDao")
	EmpDao empDao;

	public List<EmpVo> selectEmpList(EmpVo vo) {

		return empDao.selectEmpList(vo);
	}
	
	public int selectEmpListCount(EmpVo vo){
		return empDao.selectEmpListCount(vo);
	}


	public EmpVo selectEmp(EmpVo vo) {
		
		return empDao.selectEmp(vo);
	}


	public int addEmp(EmpVo vo) {

		return empDao.addEmp(vo);
	}


	public int updateEmp(EmpVo vo) {

		return empDao.updateEmp(vo);
	}


	public int deleteEmp(EmpVo vo) {

		return empDao.deleteEmp(vo);
	}
}
