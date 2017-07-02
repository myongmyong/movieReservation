package com.class601.user.movies.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.class601.persistence.MovieDao;
import com.class601.user.movies.service.MoviesService;
import com.class601.vo.MovieVo;
import com.class601.vo.ReplyVo;

@Service("moviesService")
public class MoviesServiceImpl implements MoviesService{

	@Resource(name = "movieDao")
	MovieDao movieDao;
	
	public int selectMovieListCount(MovieVo vo) {
		return movieDao.selectMovieListCount(vo);
	}

	public List<MovieVo> moviesList(MovieVo vo) {
		return movieDao.moviesList(vo);
	}


	public MovieVo moviesDetailView(MovieVo vo) {
		return movieDao.moviesDetailView(vo);
	}




}
