package com.class601.user.movies.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.comm.service.CodeService;
import com.class601.comm.service.IdGenService;
import com.class601.user.booking.service.BookingService;
import com.class601.user.movies.service.MoviesService;
import com.class601.user.reply.service.ReplyService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.BookingVo;
import com.class601.vo.MovieVo;
import com.class601.vo.ReplyVo;


@Controller
public class MoviesController {

	public static final String TABLE_NAME = "MOVIE";
	public static final String SHOWING = "MOVIE_SHOWING_YN";
	public static final String GENRE = "MOVIE_GENRE";
	public static final String RATING = "MOVIE_RATING";
	public static final String NATION = "MOVIE_NATION";
	
	@Resource(name ="moviesService")
	MoviesService moviesService;
	
	@Resource(name = "idGenService")
	IdGenService idGenService;
	
	@Resource(name= "codeService")
	CodeService codeService;
	
	@Resource(name="replyService")
	ReplyService replyService;
	
	@Resource(name= "bookingService")
	BookingService bookingService;
	

	@RequestMapping (value ="/user/movies/moviesList.do")
	public String selectMoviesList(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String movieId = Utils.toEmptySpace(req.get("movieId"));
		String pageNo = Utils.toPaging(req.get("pageNo"));
		
		MovieVo vo = new MovieVo();
		vo.setMovieId(movieId);
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		List<MovieVo> resultList = moviesService.moviesList(vo);
		int totalCnt = moviesService.selectMovieListCount(vo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		List<String> bookingRate = new ArrayList<String>(); 
		double totalBooking = bookingService.totalBooking();
		for(int i=0;i<resultList.size();i++){
			BookingVo bVo = new BookingVo();
			bVo.setMovieId(resultList.get(i).getMovieId());
			
			double movieBooking = bookingService.movieBooking(bVo);
			double rating = (movieBooking/totalBooking) * 100;
			double rate = Double.parseDouble(String.format("%.1f",rating));
			bookingRate.add(String.valueOf(rate));
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		model.addAttribute("movieId", movieId);
		model.addAttribute("bookingRate", bookingRate);
		
		return "user/movies/moviesList";
	}
	
	@RequestMapping (value ="/user/movies/moviesDetailView.do")
	public String moviesDetailView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String movieId = req.get("movieId");
		
		int totalReplyGrade = 0;
		int cnt = 0;
		double replyGradeAvg = 0;
		
		MovieVo vo = new MovieVo();
		vo.setMovieId(movieId);
		
		ReplyVo vo2 = new ReplyVo();
		vo2.setMovieId(movieId);
		
		MovieVo resultVo = moviesService.moviesDetailView(vo);
		List<ReplyVo> rList = replyService.replyGrade(vo2);
		if(rList == null) {
			replyGradeAvg = -1;
		} else {
			for(ReplyVo rVo : rList) {
				totalReplyGrade = totalReplyGrade + Integer.parseInt(rVo.getReplyGrade());
				cnt++;
				replyGradeAvg = totalReplyGrade / cnt;
			}			
		}
		
		model.addAttribute("movie",resultVo);
		model.addAttribute("replyGradeAvg", replyGradeAvg);
		
		return "user/movies/moviesDetailView";
	}
	
	
	
}
