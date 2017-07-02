package com.class601.user.movies.service;

import java.util.List;

import com.class601.vo.MovieVo;
import com.class601.vo.ReplyVo;


public interface MoviesService {
	public int selectMovieListCount(MovieVo vo);
	public List<MovieVo> moviesList(MovieVo vo);
	public MovieVo moviesDetailView(MovieVo vo);
}
