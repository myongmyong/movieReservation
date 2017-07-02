package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.ReplyVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("replyDao")
public class ReplyDao extends EgovAbstractMapper {
	
	public List<ReplyVo> selectReplyList(ReplyVo vo) {
		return selectList("selectReplyList", vo);
	}
	
	public int replyInsert(ReplyVo vo) {
		return insert("replyInsert", vo);
	}

	public int selectReplyListCount(ReplyVo vo) {
		return selectOne("selectReplyListCount", vo);
	}

	public List<ReplyVo> replyGrade(ReplyVo vo) {
		return selectList("replyGrade", vo);
	}

}
