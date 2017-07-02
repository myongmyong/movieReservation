package com.class601.admin.movie.service;

import java.util.List;

import com.class601.vo.MovieVo;


public interface MovieService {
	public List<MovieVo> selectMovieList(MovieVo vo);
	public MovieVo movieDetailView(MovieVo vo);
	public int movieInsert(MovieVo vo);
	public int movieModify(MovieVo vo);
	public int movieDelete(MovieVo vo);
	
	public int selectMovieListCount(MovieVo vo);

}
