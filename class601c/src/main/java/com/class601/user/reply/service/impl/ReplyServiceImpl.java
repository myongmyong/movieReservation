package com.class601.user.reply.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.persistence.ReplyDao;
import com.class601.user.reply.service.ReplyService;
import com.class601.vo.ReplyVo;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Resource(name="replyDao")
	ReplyDao replyDao;


	public List<ReplyVo> selectReplyList(ReplyVo vo) {
		return replyDao.selectReplyList(vo);
	}
	

	public int replyInsert(ReplyVo vo) {
		return replyDao.replyInsert(vo);
	}


	public int selectReplyListCount(ReplyVo vo) {
		return replyDao.selectReplyListCount(vo);		
	}
	
	public List<ReplyVo> replyGrade(ReplyVo vo) {
		return replyDao.replyGrade(vo);
	}
}
