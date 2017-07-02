package com.class601.admin.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.admin.member.service.MemberService;
import com.class601.persistence.MemberDao;
import com.class601.util.Paging;
import com.class601.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name="memberDao")
	MemberDao memberDao;

	@Override
	public Map<String, Object> memberList(String pageNo) {
		MemberVo vo = new MemberVo();
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<MemberVo> resultList = memberDao.memberList(vo);
		int totalCnt = memberDao.memberListCount(vo);
		
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
	public MemberVo memberDetailView(MemberVo vo) {
		return memberDao.memberDetailView(vo);
	}

	@Override
	public int memberModify(MemberVo vo) {
		return memberDao.memberModify(vo);
	}

	@Override
	public int memberDelete(MemberVo vo) {
		return memberDao.memberDelete(vo);
	}

}
