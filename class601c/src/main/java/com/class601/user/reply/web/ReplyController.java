package com.class601.user.reply.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.admin.movie.service.MovieService;
import com.class601.comm.service.IdGenService;
import com.class601.user.reply.service.ReplyService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.MovieVo;
import com.class601.vo.ReplyVo;
import com.class601.vo.TheaterVo;

@Controller
public class ReplyController {
	
	public static final String TABLE_NAME = "REPLY";
	
	@Resource(name="replyService")
	ReplyService replyService;
	
	@Resource(name="idGenService")
	IdGenService idGenService;

	@Resource(name="movieService")
	MovieService movieService;	
	
	@RequestMapping(value="/user/reply/replyInsertView.do")
	public String replyInsertView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String movieId = req.get("movieId");
		
		String num = idGenService.getNextId(TABLE_NAME);
		String nextNum = Utils.makeId(num);
		String nextId = "REPLY"+nextNum;
				
		MovieVo vo = new MovieVo();
		vo.setMovieId(movieId);
		
		MovieVo resultVo = movieService.movieDetailView(vo);
		
		model.addAttribute("nextId", nextId);
		model.addAttribute("resultVo",resultVo);
				
		return "user/reply/replyInsertView";
	}
	
	@RequestMapping(value="/user/reply/replyInsert.do")
	public String replyInsert(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String replyId = req.get("replyId");
		String replyGrade = req.get("replyGrade");
		String replyContent = req.get("replyContent");
		String userId = req.get("userId");
		String movieId = req.get("movieId");
		
		ReplyVo vo = new ReplyVo();
		vo.setReplyId(replyId);
		vo.setReplyGrade(replyGrade);
		vo.setReplyContent(replyContent);
		vo.setUserId(userId);
		vo.setMovieId(movieId);

		replyService.replyInsert(vo);
		
		return "redirect:/user/movies/moviesDetailView.do";
	}
	
}
