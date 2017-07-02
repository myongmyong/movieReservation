package com.class601.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.class601.vo.MovieVo;
import com.class601.vo.ReplyVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("movieDao")
public class MovieDao extends EgovAbstractMapper{
	
	public List<MovieVo> selectMovieList(MovieVo vo) {
		return  selectList("selectMovieList", vo);
	}

	public int selectMovieListCount(MovieVo vo){
		return  selectOne("selectMovieListCount",vo);
	}

	public MovieVo movieDetailView(MovieVo vo) {
		return  selectOne("movieDetailView", vo);
	}

	public int movieInsert(MovieVo vo) {
		return insert("movieInsert", vo);
	}

	public int movieModify(MovieVo vo) {
		return update("movieModify", vo);
	}

	public int movieDelete(MovieVo vo) {
		return delete("movieDelete", vo);
	}

	
	
	public List<MovieVo> moviesList(MovieVo vo) {
		return selectList("selectMovieList", vo);
	}
	
	public MovieVo moviesDetailView(MovieVo vo) {
		return  selectOne("moviesDetailView", vo);
	}



}
