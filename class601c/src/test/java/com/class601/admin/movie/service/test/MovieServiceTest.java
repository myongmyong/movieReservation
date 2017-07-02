package com.class601.admin.movie.service.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import static org.mockito.Matchers.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import com.class601.admin.movie.service.MovieService;
import com.class601.admin.movie.service.impl.MovieServiceImpl;
import com.class601.persistence.MovieDao;
import com.class601.vo.MovieVo;

@RunWith(MockitoJUnitRunner.class)
public class MovieServiceTest {
	
	@InjectMocks
	private MovieService service = new MovieServiceImpl();
	
	@Mock
	MovieDao dao;
	
	@Test
	public void selectMovieListTest() {
		MovieVo vo = new MovieVo();
		vo.setMovieId("");
		vo.setPageNo(1);
		vo.setPageSize(10);
		
		List<MovieVo> returnList = new ArrayList();
		for(int i=0;i<4;i++){
			vo.setMovieId(String.valueOf(i));
			returnList.add(vo);
		}
		
		when(dao.selectMovieList(vo)).thenReturn(returnList);
		
		List<MovieVo> resultList = service.selectMovieList(vo);
		
		assertThat(resultList.size(), is(4));
		
	}
	
	@Test
	public void selectMovieTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("MOVIE00001");
		
		MovieVo returnVo = new MovieVo();
		returnVo.setMovieId("MOVIE00001");
		returnVo.setMovieNm("인터스텔라");
		returnVo.setMovieGenre1("SF");

		
		when(dao.movieDetailView(vo)).thenReturn(returnVo);
		
		MovieVo resultVo = service.movieDetailView(vo);
		
		assertThat(resultVo.getMovieNm(), is("인터스텔라"));
		assertThat(resultVo.getMovieGenre1(), is("SF"));
	}
	
	@Test
	public void cntTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("");
		when(dao.selectMovieListCount(vo)).thenReturn(4);
		
		int resultCnt = service.selectMovieListCount(vo);
		
		assertThat(resultCnt, is(4));
	}
	
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
		
		when(dao.movieInsert(vo)).thenReturn(1);
		
		int resultCnt = service.movieInsert(vo);
		
		assertThat(resultCnt, is(1));
		
	}
	
	@Test
	public void updateTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("MOVIE00001");
		vo.setMovieGenre1("로맨스");
		
		when(dao.movieModify(vo)).thenReturn(1);
		
		int resultCnt = service.movieModify(vo);
		
		assertThat(resultCnt, is(1));
	}
	
	@Test
	public void deleteTest(){
		MovieVo vo = new MovieVo();
		vo.setMovieId("MOVIE00001");
		
		when(dao.movieDelete(vo)).thenReturn(1);
		
		int resultCnt = service.movieDelete(vo);
		
		assertThat(resultCnt, is(1));
	}

}


































