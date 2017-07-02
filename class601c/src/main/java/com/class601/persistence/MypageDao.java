package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.BookVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("mypageDao")
public class MypageDao extends EgovAbstractMapper{
	public List<BookVo> bookingInfo(BookVo vo) {
		return selectList("bookingInfo",vo);
	}

	public List<BookVo> bookedInfo(BookVo vo) {
		return selectList("bookedInfo",vo);
	}

	public BookVo bookMovieInfo(BookVo vo) {
		return selectOne("bookMovieInfo",vo);
	}
}
