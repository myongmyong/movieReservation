package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.MemberVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("memberDao")
public class MemberDao extends EgovAbstractMapper{
	public List<MemberVo> memberList(MemberVo vo) {
		return  selectList("memberList", vo);
	}
	
	public int memberListCount(MemberVo vo){
		return  selectOne("memberListCount",vo);
	}

	public MemberVo memberDetailView(MemberVo vo) {

		return  selectOne("memberDetailView", vo);
	}


	public int memberModify(MemberVo vo) {

		return update("memberModify", vo);
	}

	public int memberDelete(MemberVo vo) {

		return delete("memberDelete", vo);
	}
	

}
