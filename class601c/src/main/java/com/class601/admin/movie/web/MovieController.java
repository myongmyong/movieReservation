package com.class601.admin.movie.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.movie.service.MovieService;
import com.class601.comm.service.CodeService;
import com.class601.comm.service.IdGenService;
import com.class601.user.booking.service.BookingService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.CodeVo;
import com.class601.vo.MovieVo;


@Controller
public class MovieController {

	public static final String TABLE_NAME = "MOVIE";
	public static final String SHOWING = "MOVIE_SHOWING_YN";
	public static final String GENRE = "MOVIE_GENRE";
	public static final String RATING = "MOVIE_RATING";
	public static final String NATION = "MOVIE_NATION";
	
	@Resource(name ="movieService")
	MovieService movieService;
	
	@Resource(name = "idGenService")
	IdGenService idGenService;
	
	@Resource(name= "codeService")
	CodeService codeService;

	@Resource(name= "bookingService")
	BookingService bookingService;
	
	
	
	@RequestMapping (value ="/admin/movie/movieList.do")
	public String selectMovieList(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String movieId = Utils.toEmptySpace(req.get("movieId"));
		String pageNo = Utils.toPaging(req.get("pageNo"));
		
		MovieVo vo = new MovieVo();
		vo.setMovieId(movieId);
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<MovieVo> resultList = movieService.selectMovieList(vo);
		int totalCnt = movieService.selectMovieListCount(vo);
				
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);

		model.addAttribute("paging", paging);
		model.addAttribute("movieId", movieId);
		model.addAttribute("resultList", resultList);
	
		return "admin/movie/movieList";
	}
	
		
	
	@RequestMapping (value ="/admin/movie/movieList_PopUp.do")
	public String selectMovieList_PopUp(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String movieId = Utils.toEmptySpace(req.get("movieId"));
		String pageNo = Utils.toPaging(req.get("pageNo"));
		
		MovieVo vo = new MovieVo();
		vo.setMovieId(movieId);
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<MovieVo> resultList = movieService.selectMovieList(vo);
		int totalCnt = movieService.selectMovieListCount(vo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);		
		model.addAttribute("movieId", movieId);
		
		return "admin/movie/movieList_PopUp";
	}
	
	@RequestMapping (value ="/admin/movie/movieDetailView.do")
	public String movieDetailView(@RequestParam HashMap<String, String> req, ModelMap model){
		String movieId = req.get("movieId");
		
		MovieVo vo = new MovieVo();
		vo.setMovieId(movieId);
		
		MovieVo resultVo = movieService.movieDetailView(vo);
		model.addAttribute("movie",resultVo);
		
		String mainCd = SHOWING;
		List<CodeVo> movieShowingList = codeService.getCode(mainCd);
		model.addAttribute("movieShowingList",movieShowingList);
		
		
		String mainCd2 = RATING;
		List<CodeVo>movieRatingList = codeService.getCode(mainCd2);
		model.addAttribute("movieRatingList",movieRatingList);
		
		
		String mainCd3 = NATION;
		List<CodeVo>movieNationList = codeService.getCode(mainCd3);
		model.addAttribute("movieNationList",movieNationList);
		
		String mainCd4 = GENRE;
		List<CodeVo>movieGenreList = codeService.getCode(mainCd4);
		model.addAttribute("movieGenreList",movieGenreList);
		
		return "admin/movie/movieDetailView";
	}
	
	@RequestMapping (value ="/admin/movie/movieInsertView.do")
	public String  movieInsertView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String num = idGenService.getNextId(TABLE_NAME);
		String nextNum = Utils.makeId(num);
		String nextId = "MOVIE"+nextNum;
			
		model.addAttribute("nextId",nextId);
		
		
		String mainCd = SHOWING;
		List<CodeVo> movieShowingList = codeService.getCode(mainCd);
		model.addAttribute("movieShowingList",movieShowingList);
		
		
		String mainCd2 = RATING;
		List<CodeVo>movieRatingList = codeService.getCode(mainCd2);
		model.addAttribute("movieRatingList",movieRatingList);
		
		
		String mainCd3 = NATION;
		List<CodeVo>movieNationList = codeService.getCode(mainCd3);
		model.addAttribute("movieNationList",movieNationList);
		
		String mainCd4 = GENRE;
		List<CodeVo>movieGenreList = codeService.getCode(mainCd4);
		model.addAttribute("movieGenreList",movieGenreList);
	
		
		return "admin/movie/movieInsertView";
	}
	
	@RequestMapping (value ="/admin/movie/movieInsert.do")
	public String  movieInsert(@RequestParam HashMap<String, String> req, ModelMap model){
		
		 String movieId =  req.get("movieId");
		 String movieNm =  req.get("movieNm");
	     String movieIntro =  req.get("movieIntro") ;
		 String movieActor =  req.get("movieActor") ;
		 String movieDirector =  req.get("movieDirector");
		 String movieGenre1 =  req.get("movieGenre1") ;
		 String movieGenre2 =  req.get("movieGenre2") ;
		 String movieGenre3 =  req.get("movieGenre3") ;
		 String movieReleaseDate =  req.get("movieReleaseDate") ;
		 String movieShowingYn =  req.get("movieShowingYn") ;
		 String movieRating =  req.get("movieRating") ;
		 String movieShowingTime =  req.get("movieShowingTime") ;
		 String movieNation =  req.get("movieNation") ;
		
		 MovieVo vo  = new MovieVo();
		 
		vo.setMovieId(movieId);
		vo.setMovieNm(movieNm); 
		vo.setMovieIntro(movieIntro);
		vo.setMovieActor(movieActor);
		vo.setMovieDirector(movieDirector);
		vo.setMovieGenre1(movieGenre1);
		vo.setMovieGenre2(movieGenre2);
		vo.setMovieGenre3(movieGenre3);
		vo.setMovieReleaseDate(movieReleaseDate);
		vo.setMovieShowingYn(movieShowingYn);
		vo.setMovieRating(movieRating);	
		vo.setMovieShowingTime(movieShowingTime);
		vo.setMovieNation(movieNation);
		
		movieService.movieInsert(vo);
		
		return "redirect:/admin/movie/movieList.do";
	}
	
	

	@RequestMapping (value ="/admin/movie/movieModify.do")
	public String  movieModify(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String movieId =  req.get("movieId");
		 String movieNm =  req.get("movieNm");
	     String movieIntro =  req.get("movieIntro") ;
		 String movieActor =  req.get("movieActor") ;
		 String movieDirector =  req.get("movieDirector");
		 String movieGenre1 =  req.get("movieGenre1") ; 
		 String movieGenre2 =  req.get("movieGenre2") ; 
		 String movieGenre3 =  req.get("movieGenre3") ; 
		 String movieReleaseDate =  req.get("movieReleaseDate") ;
		 String movieShowingYn =  req.get("movieShowingYn") ;
		 String movieRating =  req.get("movieRating") ;
		 String movieShowingTime =  req.get("movieShowingTime") ;
		 String movieNation =  req.get("movieNation") ;
		
		 MovieVo vo  = new MovieVo();
		 
		vo.setMovieId(movieId);
		vo.setMovieNm(movieNm); 
		vo.setMovieIntro(movieIntro);
		vo.setMovieActor(movieActor);
		vo.setMovieDirector(movieDirector);
		vo.setMovieGenre1(movieGenre1);
		vo.setMovieGenre2(movieGenre2);
		vo.setMovieGenre3(movieGenre3);
		vo.setMovieReleaseDate(movieReleaseDate);
		vo.setMovieShowingYn(movieShowingYn);
		vo.setMovieRating(movieRating);	
		vo.setMovieShowingTime(movieShowingTime);
		vo.setMovieNation(movieNation);
		
		movieService.movieModify(vo);
		
		return "redirect:/admin/movie/movieList.do";
	}
	
	
	@RequestMapping (value ="/admin/movie/movieDelete.do")
	public String movieDelete(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String movieId = req.get("movieId");
		
		MovieVo vo = new MovieVo();
		vo.setMovieId(movieId);
		
		movieService.movieDelete(vo);
		
		return "redirect:/admin/movie/movieList.do";
		
	}
	
	
	
	
	
}
