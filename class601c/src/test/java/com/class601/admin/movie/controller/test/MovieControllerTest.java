package com.class601.admin.movie.controller.test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.mockito.Matchers.anyObject;
import static org.mockito.Mockito.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.class601.admin.movie.service.MovieService;
import com.class601.admin.movie.web.MovieController;
import com.class601.comm.service.IdGenService;
import com.class601.vo.MovieVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:**/applicationContext.xml")
@WebAppConfiguration
public class MovieControllerTest {
	
	private MockMvc mockMvc;
	
	@InjectMocks
	private MovieController movieController = new MovieController();
	
	@Mock
	private MovieService movieService;
	@Mock
	private IdGenService idService;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(movieController).build();
	}
	
	@Test
	public void selectMovieListTest() throws Exception {
		mockMvc.perform(get("/admin/movie/movieList.do"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("resultList"))
		.andExpect(model().attributeExists("paging"))
		.andExpect(model().attributeExists("movieId"));
	}
	
	@Test
	public void movieDetailViewTest() throws Exception {
		when(movieService.movieDetailView((MovieVo) anyObject())).thenReturn(new MovieVo());
		
		mockMvc.perform(get("/admin/movie/movieDetailView.do"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("movie"));
	}
	
	@Test
	public void movieInsertViewTest() throws Exception {
		mockMvc.perform(get("/admin/movie/movieInsertView.do"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("nextId"));
	}
	
	@Test
	public void movieInsertTest() throws Exception {
		mockMvc.perform(get("/admin/movie/movieInsert.do"))
		.andExpect(status().is3xxRedirection());
	}
	
	@Test
	public void movieModifyTest() throws Exception {
		mockMvc.perform(get("/admin/movie/movieModify.do"))
		.andExpect(status().is3xxRedirection());
	}

	@Test
	public void movieDeleteTest() throws Exception {
		mockMvc.perform(get("/admin/movie/movieDelete.do"))
		.andExpect(status().is3xxRedirection());
	}

}










































