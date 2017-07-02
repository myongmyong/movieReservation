package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.EmpVo;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("empDao")
public class EmpDao extends EgovAbstractMapper {

	public List<EmpVo> selectEmpList(EmpVo vo) {

		return  selectList("selectEmpList", vo);

	}
	
	public int selectEmpListCount(EmpVo vo){
		return  selectOne("selectEmpListCount",vo);
	}

	public EmpVo selectEmp(EmpVo vo) {

		return  selectOne("selectEmp", vo);
	}

	public int addEmp(EmpVo vo) {

		return insert("addEmp", vo);
	}

	public int updateEmp(EmpVo vo) {

		return update("updateEmp", vo);
	}

	public int deleteEmp(EmpVo vo) {

		return delete("deleteEmp", vo);
	}

	public String getEmpPkMax() {

		return  selectOne("getEmpPkMax");
	}

	public int updatePkMax(String max) {

		return update("updatePkMax", max);
	}

}
