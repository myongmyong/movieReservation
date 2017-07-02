<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.MovieVo"%>
<%@ page import="com.class601.util.Utils"%>
<%
	String contextPath = request.getContextPath();
	List<MovieVo> list = (List<MovieVo>) request.getAttribute("resultList");
	String movieId = (String) request.getAttribute("movieId");
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
<div>
<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header.jsp">
		<jsp:param name="curMenu" value="theaterInfo" />
</jsp:include>
</div>
<div class="w3-container w3-margin">
	<h2> 영화 목록 </h2> 

	<div>
		<form action="<%=contextPath%>/admin/movie/movieList.do" method="post" name="searchForm">
				
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
		</form>
	</div>
	 
	 <div  class="w3-container  w3-right-align  w3-margin">
      <a href="<%=contextPath%>/admin/movie/movieInsertView.do" class="w3-btn w3-light-blue">영화 등록</a>
   </div>
	
	
	
	
	
	<div>
		<table class="w3-table w3-bordered w3-striped w3-border test">
			<tr class="w3-red">
				<th>영화Id</th>
				<th>영화명</th>
				<th>배우</th>
				<th>감독</th>
				<th>장르1</th>
				<th>장르2</th>
				<th>장르3</th>
				<th>개봉일</th>
				<th>상영여부</th>
				<th>관람등급</th>
				<th>상영시간(분)</th>
				<th>제작국가</th>
			</tr>
			<%
			for (MovieVo vo : list) {
			%>
			<tr>
				<td class="w3-center"><a href="<%=contextPath%>/admin/movie/movieDetailView.do?movieId=<%=vo.getMovieId()%>"><%=vo.getMovieId()%></a></td>
				<td class="w3-center"><%=vo.getMovieNm()%></td>		
				<td class="w3-center"><%=vo.getMovieActor()%></td>
				<td class="w3-center"><%=vo.getMovieDirector()%></td>
				<td class="w3-right-align"><%=Utils.toEmptySpace(vo.getMovieGenre1())%></td>
				<td class="w3-right-align"><%=Utils.toEmptySpace(vo.getMovieGenre2())%></td>
				<td class="w3-right-align"><%=Utils.toEmptySpace(vo.getMovieGenre3())%></td>
				<td class="w3-right-align"><%=vo.getMovieReleaseDate()%></td>
				<td class="w3-center"><%=vo.getMovieShowingYn()%></td>
				<td class="w3-center"><%=vo.getMovieRating()%></td>
				<td class="w3-center"><%=vo.getMovieShowingTime()%></td>
				<td class="w3-center"><%=vo.getMovieNation()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/paging.jsp">
		<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
	    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
	    <jsp:param name="pageNo" value="${paging.pageNo}" />
	    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
	    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
	    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
	</jsp:include>
</div>
<script type="text/javascript">
	function goPage(pageNo){
		document.searchForm.pageNo.value = pageNo;
		document.searchForm.submit();
	}
</script>

</body>
</html>