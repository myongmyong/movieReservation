<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.MovieVo" %>
<%@ page import="com.class601.vo.CodeVo" %>


<%
	String contextPath = request.getContextPath();
	String nextId = (String)request.getAttribute("nextId");
 	List<CodeVo> movieShowingList = (List<CodeVo>) request.getAttribute("movieShowingList");
	List<CodeVo> movieRatingList = (List<CodeVo>) request.getAttribute("movieRatingList");
	List<CodeVo> movieNationList = (List<CodeVo>) request.getAttribute("movieNationList");
	List<CodeVo> movieGenreList = (List<CodeVo>) request.getAttribute("movieGenreList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div class="w3-container w3-margin">
	<h2>영화 정보 등록</h2> 
	
	<div class="w3-card-4">
	
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/movie/movieList.do" class="w3-btn w3-light-blue">목록</a>
		</div>
	
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/movie/movieList.do" class="w3-btn w3-light-blue">취소</a>
		</div>
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/movie/movieList.do" class="w3-btn w3-light-blue">저장</a>
		</div>
	
	<div class="w3-container w3-green">
	  	
	</div>
	
	
	<form class="w3-container" action="<%=contextPath %>/admin/movie/movieInsert.do" method="post">
		
		<label class="w3-label">영화Id</label>
		<input class="w3-input" type="text" name="movieId" readonly value="<%= nextId%>" >
		
		<label class="w3-label">영화명</label>
		<input class="w3-input" type="text" name="movieNm" >

		
		<label class="w3-label">배우</label>
		<input class="w3-input" type="text" name="movieActor" >

		<label class="w3-label">감독</label>
		<input class="w3-input" type="text" name="movieDirector" >
		
		<label for="Genre" class="w3-label">장르</label>
		<select class="w3-input" name="movieGenre1">
				<option value=""></option>
    		<%
				for(CodeVo vo : movieGenreList){
			%>
				<option value="<%=vo.getSubCdNm()%>"><%=vo.getSubCdNm() %></option>
			<% 
				}
			%>
      	</select>
		<select class="w3-input" name="movieGenre2" >
				<option value=""></option>
         	<%
				for(CodeVo vo : movieGenreList){
			%>
				<option value="<%=vo.getSubCdNm()%>"><%=vo.getSubCdNm() %></option>
			<% 
				}
			%>
      	</select>
      	<select class="w3-input" name="movieGenre3" >
      			<option value=""></option>
          	<%
				for(CodeVo vo : movieGenreList){
			%>
				<option value="<%=vo.getSubCdNm()%>"><%=vo.getSubCdNm() %></option>
			<% 
				}
			%>
      	</select>
	
		<label class="w3-label">개봉일</label>
		<input class="w3-input" type="date" name="movieReleaseDate" >
	
            
		<label class="w3-label">상영여부</label>		
		<select class="w3-input" name="movieShowingYn">
			<%
				for(CodeVo vo : movieShowingList){
			%>
				<option value="<%=vo.getSubCdNm()%>"><%=vo.getSubCdNm() %></option>
			<% 
				}
			%>
        </select>
        
		<label class="w3-label">관람등급</label>
		<select class ="w3-input" name ="movieRating" >
		<%
			for(CodeVo vo : movieRatingList){
							
		%>
			<option value="<%=vo.getSubCdNm()%>"><%=vo.getSubCdNm() %></option>
		<%
			}
		%>	
		</select>
		
		<label class="w3-label">상영시간(분)</label>
		<input class="w3-input" type="text" name="movieShowingTime" >
		
		<label class="w3-label">제작국가</label>
		<select class="w3-input" name="movieNation">
		<%
			for(CodeVo vo : movieNationList){
							
		%>
			<option value="<%=vo.getSubCdNm()%>"><%=vo.getSubCdNm() %></option>
		<%
			}
		%>	
	         
	         
      </select>
		
		<label class="w3-label">소개</label>
		<textarea rows="10" cols="198" class="w3-input" name="movieIntro" ></textarea>
		
	
	
		<!-- 
		<input class="w3-input" type="text" name="" value="40">
		 -->
	<input type="submit" class="w3-container w3-right w3-margin" value="저장">
	</form>
	
	</div>
	
		
</div>
</body>
</html>