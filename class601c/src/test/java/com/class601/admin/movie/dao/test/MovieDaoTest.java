package com.class601.admin.movie.dao.test;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.class601.persistence.MovieDao;
import com.class601.vo.MovieVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:**/applicationContext.xml")
@TransactionConfiguration(defaultRollback=false)
@Transactional
public class MovieDaoTest {
	
	@Resource(name="movieDao")
	MovieDao dao;
	
	@Test
	public void selectMovieListTest() {
		MovieVo vo = new MovieVo();
		vo.setMovieId("");
		vo.setPageNo(1);
		vo.setPageSize(10);
		
		List<MovieVo> resultList = dao.selectMovieList(vo);
		
		assertThat(resultList.size(), is(4));
	}
	
	@Test
	public void selectMovieTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("MOVIE00001");
		vo.setPageNo(1);
		vo.setPageSize(10);
		
		MovieVo resultVo = dao.movieDetailView(vo);
		
		assertThat(resultVo.getMovieId(), is("MOVIE00001"));
		assertThat(resultVo.getMovieNm(), is("럭키"));
		assertThat(resultVo.getMovieGenre1(), is("코믹"));
	}
	
	@Test
	public void cntTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("");
		
		int resultCnt = dao.selectMovieListCount(vo);
		
		assertThat(resultCnt, is(4));
	}
	
	@Rollback(true)
	@Test
	public void insertTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("MOVIE09999");
		vo.setMovieNm("인터스텔라");
		vo.setMovieIntro("재미있네!");
		vo.setMovieActor("anna");
		vo.setMovieDirector("jordan");
		vo.setMovieGenre1("SF");
		vo.setMovieGenre2("");
		vo.setMovieGenre3("");
		vo.setMovieReleaseDate("2016-11-25");
		vo.setMovieShowingYn("showing...");
		vo.setMovieRating("all seeing");
		vo.setMovieShowingTime("140");
		vo.setMovieNation("USA");
		
		assertThat(dao.movieInsert(vo), is(1));
	}
	
	@Rollback(true)
	@Test
	public void updateTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("MOVIE00001");
		vo.setMovieNm("인터스텔라");
		vo.setMovieIntro("재미있네!");
		vo.setMovieActor("anna");
		vo.setMovieDirector("jordan");
		vo.setMovieGenre1("SF");
		vo.setMovieGenre2("");
		vo.setMovieGenre3("");
		vo.setMovieReleaseDate("2016-11-25");
		vo.setMovieShowingYn("showing...");
		vo.setMovieRating("all seeing");
		vo.setMovieShowingTime("140");
		vo.setMovieNation("USA");
		
		assertThat(dao.movieModify(vo), is(1));
	}
	
	@Rollback(true)
	@Test
	public void deleteTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("MOVIE00001");
		
		assertThat(dao.movieDelete(vo),is(1));
	}

}














































