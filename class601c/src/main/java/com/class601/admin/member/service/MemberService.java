package com.class601.admin.member.service;

import java.util.List;
import java.util.Map;

import com.class601.vo.MemberVo;

public interface MemberService {
	public Map<String, Object> memberList(String pageNo);
	public MemberVo memberDetailView(MemberVo vo);
	public int memberModify(MemberVo vo);
	public int memberDelete(MemberVo vo);

}
