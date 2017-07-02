<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.class601.vo.ShowVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String contextPath = request.getContextPath();
	ShowVo vo = (ShowVo) request.getAttribute("show");
	String chkShowInfo = (String) request.getAttribute("chkShowInfo");
%>
<body>
<div class="w3-container w3-margin">
	<h2>상영정보 / 수정  </h2> 

	
	<div class="w3-card-4">
	
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/show/showDelete.do?showId=<%=vo.getShowId()%>" class="w3-btn w3-light-blue">삭제</a>
		</div>
	
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/show/showList.do" class="w3-btn w3-light-blue">취소</a>
		</div>
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/show/showList.do" class="w3-btn w3-light-blue">목록</a>
		</div>
	
	<div class="w3-container w3-green">
	  	
</div>
	
<div>
		<form class="w3-container" name="insertForm" id="insertForm" action="<%=contextPath%>/admin/show/showModify.do" method="post">

				<table>
					<tr>
						<td><label for="showId">상영ID</label></td>
						<td><input class="w3-input" style="width: 500px;" type="text" name="showId" id="showId" readonly value="<%=vo.getShowId()%>" readonly /></td>
					</tr>

					<tr>
						<td><label for="movieId"> 영화ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="movieNm" id="movieNm" value="<%=vo.getMovieId()%>" readonly>
							<input type="hidden" name="movieId" id="movieId" value="<%=vo.getMovieId() %>" />
						</td>
						<td><input type="button" id="movieList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="theaterId"> 극장ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="theaterNm" id="theaterNm" value="<%=vo.getTheaterNm()%>" readonly/>
							<input type="hidden" name="theaterId" id="theaterId" value="<%=vo.getTheaterId() %>" />
						</td>
						<td><input type="button" id="theaterList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="cinemaId"> 상영관ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="cinemaNm" id="cinemaNm" value="<%=vo.getCinemaNm() %>" readonly />
							<input type="hidden" name="cinemaId" id="cinemaId" value="<%=vo.getCinemaId() %>" />	
						</td>
						<td><input type="button" id="cinemaList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="cinemaId"> 상영관 종류ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="cinemaTypeNm" id="cinemaTypeNm" value="<%=vo.getCinemaTypeNm() %>" readonly />
							<input type="hidden" name="cinemaTypeId" id="cinemaTypeId" value="<%=vo.getCinemaTypeId() %>" />	
						</td>
					</tr>

					<tr>
						<td><label for="theaterCinemaNum"> 시간대ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="timeTypeNm" id="timeTypeNm" value="<%=vo.getTimeTypeNm() %>" readonly />
							<input type="hidden" name="timeTypeId" id="timeTypeId" value="<%=vo.getTimeTypeNm() %>" />	
						</td>
						<td><input type="button" id="timeList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="startTime"> 시작시간 </label></td>
						<td><input class="w3-input" style="width: 500px;" type="text" name="startTime" id="startTime" value="<%=vo.getStartTime()%>"/></td>
					</tr>

					<tr>
						<td><label for="showDate"> 상영날짜 </label></td>
						<td><input type="Date" class="w3-input" name="showDate" id="showDate" value="<%=vo.getShowDate()%>"></td>
					</tr>

				</table>
				<div class="w3-container w3-right w3-margin">
					<input type="submit" class="w3-btn w3-indigo w3-round-xxlarge w3-margin" value="저장">
				</div>
			</form>
</div>	
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
	$(function(){
		if('<%=chkShowInfo%>'=='1'){
			alert('이미 존재합니다.');
		};
		$('#movieList').click(movieList);
		$('#theaterList').click(theaterList);
		$('#cinemaList').click(cinemaList);
		$('#timeList').click(timeList);
	});
	
	//함수 부분
	function movieList(){
		window.open("<%=contextPath%>/admin/movie/movieList_PopUp.do","movieList","width=1500, height=800");
	}
	function theaterList(){
		window.open("<%=contextPath%>/admin/theater/theaterList_PopUp.do","theaterList","width=1500, height=800");
	}
	function cinemaList(){
		window.open("<%=contextPath%>/admin/cinema/cinemaList_PopUp.do?theaterId="+$('#theaterId').val(),"cinemaList","width=1500, height=800");
	}
	function timeList(){
		window.open("<%=contextPath%>/admin/time/timeList_PopUp.do","timeTypeList","width=1500, height=800");
	}
</script>		
</body>
</html>