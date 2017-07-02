package com.class601.user.reply.service;

import java.util.List;

import com.class601.vo.ReplyVo;

public interface ReplyService {

	public List<ReplyVo> selectReplyList(ReplyVo vo);
	public int selectReplyListCount(ReplyVo vo);
	public int replyInsert(ReplyVo vo);
	public List<ReplyVo> replyGrade(ReplyVo vo);
}
