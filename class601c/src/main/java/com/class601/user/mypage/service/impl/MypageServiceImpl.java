package com.class601.user.mypage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.persistence.MypageDao;
import com.class601.user.mypage.service.MypageService;
import com.class601.vo.BookVo;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Resource(name = "mypageDao")
	MypageDao mypageDao;

	@Override
	public List<BookVo> bookingInfo(String id) {
		BookVo vo = new BookVo();
		vo.setUserId(id);
		List<BookVo> resultList = mypageDao.bookingInfo(vo);
		
		return resultList;
	}

	public List<BookVo> bookedInfo(String id) {
		BookVo vo = new BookVo();
		vo.setUserId(id);
		return mypageDao.bookedInfo(vo);
	}

	public BookVo bookMovieInfo(BookVo vo) {
		return mypageDao.bookMovieInfo(vo);
	}

}
