package com.class601.admin.movie.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.admin.movie.service.MovieService;
import com.class601.persistence.MovieDao;
import com.class601.vo.MovieVo;

@Service("movieService")
public class MovieServiceImpl implements MovieService{

	@Resource(name = "movieDao")
	MovieDao movieDao;
	
	public List<MovieVo> selectMovieList(MovieVo vo) {
		
		return movieDao.selectMovieList(vo);
	}


	public MovieVo movieDetailView(MovieVo vo) {
		
		return movieDao.movieDetailView(vo);
	}

	
	public int movieInsert(MovieVo vo) {
		
		return movieDao.movieInsert(vo);
	}

	
	public int movieModify(MovieVo vo) {
		
		return movieDao.movieModify(vo);
	}


	public int movieDelete(MovieVo vo) {
		
		return movieDao.movieDelete(vo);
	}

	
	public int selectMovieListCount(MovieVo vo) {
		
		return movieDao.selectMovieListCount(vo);
	}




}
