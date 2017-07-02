package com.class601.emp.service;

import java.util.List;

import com.class601.vo.EmpVo;

public interface EmpService {
	public List<EmpVo> selectEmpList(EmpVo vo);
	public EmpVo selectEmp(EmpVo vo);
	public int addEmp(EmpVo vo);
	public int updateEmp(EmpVo vo);
	public int deleteEmp(EmpVo vo);
	
	public int selectEmpListCount(EmpVo vo);
}
