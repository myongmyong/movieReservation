<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.MovieVo" %>
<%@ page import="com.class601.vo.CodeVo" %>
<%@ page import="com.class601.util.Utils" %>

<%
	String contextPath = request.getContextPath();
	MovieVo vo = (MovieVo)request.getAttribute("movie");
 	List<CodeVo> movieShowingList = (List<CodeVo>) request.getAttribute("movieShowingList");
	List<CodeVo> movieRatingList = (List<CodeVo>) request.getAttribute("movieRatingList");
	List<CodeVo> movieNationList = (List<CodeVo>) request.getAttribute("movieNationList");
	List<CodeVo> movieGenreList = (List<CodeVo>) request.getAttribute("movieGenreList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
	<div class="w3-container w3-margin">
	<h2>상영정보 / 수정  </h2> 

	
	<div class="w3-card-4">
	
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/movie/movieDelete.do?movieId=<%=vo.getMovieId()%>" class="w3-btn w3-light-blue">삭제</a>
		</div>
	
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/movie/movieList.do" class="w3-btn w3-light-blue">취소</a>
		</div>
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/movie/movieList.do" class="w3-btn w3-light-blue">목록</a>
		</div>
	
	<div class="w3-container w3-green">
	  	
	</div>
	
	
	<form class="w3-container" action="<%=contextPath %>/admin/movie/movieModify.do" method="post">
	
		<label class="w3-label">영화Id</label>
		<input class="w3-input" type="text" name="movieId" value="<%=vo.getMovieId()%>" READONLY>
		
		<label class="w3-label">영화명</label>
		<input class="w3-input" type="text" name="movieNm" value="<%=vo.getMovieNm()%>">

		
		<label class="w3-label">배우</label>
		<input class="w3-input" type="text" name="movieActor" value ="<%=vo.getMovieActor()%>" >

		<label class="w3-label">감독</label>
		<input class="w3-input" type="text" name="movieDirector" value ="<%=vo.getMovieDirector()%>" >


		<label class="w3-label">장르</label>
		<select class="w3-input" name="movieGenre1">
    			<option value="<%=Utils.toEmptySpace(vo.getMovieGenre1())%>"><%=Utils.toEmptySpace(vo.getMovieGenre1()) %></option>
    		<%
				for(CodeVo cVo : movieGenreList){
			%>
				<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
			<% 
				}
			%>
      	</select>
		<select class="w3-input" name="movieGenre2">
				<option value="<%=Utils.toEmptySpace(vo.getMovieGenre2())%>"><%=Utils.toEmptySpace(vo.getMovieGenre2())%></option>
    		<%
				for(CodeVo cVo : movieGenreList){
			%>
				<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
			<% 
				}
			%>
      	</select>
		<select class="w3-input" name="movieGenre3">
				<option value="<%=Utils.toEmptySpace(vo.getMovieGenre3())%>"><%=Utils.toEmptySpace(vo.getMovieGenre3())%></option>
    		<%
				for(CodeVo cVo : movieGenreList){
			%>
				<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
			<% 
				}
			%>
      	</select>
	
		<label class="w3-label">개봉일</label>
		<input class="w3-input" type="Date" name="movieReleaseDate" value ="<%=vo.getMovieReleaseDate()%>" >

		<label class="w3-label">상영여부</label>
		<select class="w3-input" name="movieShowingYn">
				<option value="<%=vo.getMovieShowingYn()%>"><%=vo.getMovieShowingYn()%></option>
			<%
				for(CodeVo cVo : movieShowingList){
			%>
				<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
			<% 
				}
			%>
        </select>
		
		<label class="w3-label">관람등급</label>
		<select class ="w3-input" name ="movieRating">
			<option value="<%=vo.getMovieRating()%>"><%=vo.getMovieRating()%></option>
		<%
			for(CodeVo cVo : movieRatingList){
							
		%>
			<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
		<%
			}
		%>	
		</select>
		
		<label class="w3-label">상영시간(분)</label>
		<input class="w3-input" type="text" name="movieShowingTime" value ="<%=vo.getMovieShowingTime()%>" >
		
		<label class="w3-label">제작국가</label>
		<select class="w3-input" name="movieNation">
			<option value="<%=vo.getMovieNation()%>"><%=vo.getMovieNation()%></option>
		<%
			for(CodeVo cVo : movieNationList){
							
		%>
			<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
		<%
			}
		%>
		</select>	
		
		<label class="w3-label">소개</label>
		<textarea rows="10" cols="198" class="w3-input" name="movieIntro"><%=vo.getMovieIntro()%></textarea>

		<input type="submit" class="w3-container w3-right w3-margin" value="저장">
	
	</form>
	
	</div>
	
</div>
</body>
</html>