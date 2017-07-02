<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.class601.vo.ShowVo" %>
<%
	String contextPath = request.getContextPath();
	ShowVo vo = (ShowVo) request.getAttribute("show");
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
	<h2>상영정보 조회/수정  </h2> 
		
	<div class="w3-card-4">
	</div>
	
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
	
	<form class="w3-container" name="insertForm" id="insertForm" action="<%=contextPath%>/admin/show/showModify.do" method="post">
		<div>
		<label for="showId" class="w3-label">상영Id</label>
		<input class="w3-input" style="width: 500px;" type="text" name="showId" id="showId" value="<%=vo.getShowId()%>" readonly />
		</div>
		
		<div>
		<label for="movieNm" class="w3-label">영화명</label>
		<input class="w3-input" style="width: 500px;" type="text" name="movieNm" id="movieNm" value="<%=vo.getMovieNm()%>" readonly>
		<input type="hidden" name="movieId" id="movieId" value="<%=vo.getMovieId()%>" />
		<input type="button" id="movieList" value="조회">
		</div>
		
		<label for="theaterNm" class="w3-label">극장명</label>
		<input class="w3-input" style="width: 500px;" type="text" name="theaterNm" id="theaterNm" value="<%=vo.getTheaterNm()%>" readonly>
		<input type="hidden" name="theaterId" id="theaterId" value="<%=vo.getTheaterId()%>" />
		<input type="button" id="theaterList" value="조회">

		<label for="cinemaNm" class="w3-label">상영관명</label>
		<input class="w3-input" style="width: 500px;" type="text" name="cinemaNm" id="cinemaNm" value="<%=vo.getCinemaNm()%>" readonly>
		<input type="hidden" name="cinemaId" id="cinemaId" value="<%=vo.getCinemaId()%>" />
		<input type="button" id="cinemaList" value="조회">

		<label for="cinemaTypeNm" class="w3-label">상영관종류명</label>
		<input class="w3-input" style="width: 500px;" type="text" name="cinemaTypeNm" id="cinemaTypeNm" value="<%=vo.getCinemaTypeId()%>" readonly>
		<input type="hidden" name="cinemaTypeId" id="cinemaTypeId" value="<%=vo.getCinemaTypeId()%>" />

		<label for="timeTypeNm" class="w3-label">시간대명</label>
		<input class="w3-input" style="width: 500px;" type="text" name="timeTypeNm" id="timeTypeNm" value="<%=vo.getTimeTypeNm()%>" readonly>
		<input type="hidden" name="timeTypeId" id="timeTypeId" value="<%=vo.getTimeTypeId()%>" />
		<input type="button" id="timeList" value="조회">
	
		<label for="startTime" class="w3-label">상영시간</label>
		<input class="w3-input" type="text" name="startTime" id="startTime" value ="<%=vo.getStartTime()%>" >

		<label for="showDate" class="w3-label">상영날짜</label>
		<input class="w3-input" type="Date" name="showDate" id= "showDate" value ="<%=vo.getShowDate()%>" >

		<input type="button" id="modifyShow" class="w3-container w3-right w3-margin" value="저장">
	
	</form>
</div>	
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
	$(function(){
		$('#movieList').click(movieList);
		$('#theaterList').click(theaterList);
		$('#cinemaList').click(cinemaList);
		$('#timeList').click(timeList);
		
		$('#modifyShow').click(chkShowInfo);
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
	
	function chkShowInfo(){
		
		var movieId		= $('#movieId').val();
		var theaterId	= $('#theaterId').val();
		var cinemaId 	= $('#cinemaId').val();
		var startTime 	= $('#startTime').val();
		var showDate 	= $('#showDate').val();
		
		$.ajax({
			url: '<%=contextPath%>/admin/show/chkShowInfo.do',
			type: 'post',
			datatype: 'json',
			data: 
				{
					"theaterId":theaterId
					,"cinemaId":cinemaId
					,"startTime":startTime
					,"showDate":showDate
				},
			success:
				function(data){
					if(data.result == "1"){
						alert('이미 존재하는 상영 정보입니다');
						document.location.reload(true);
					}else{
						document.insertForm.submit();
					}
				},
			error: 
				function(req, status, error){
					alert('서버 에러입니다. 관리자에게 문의해주세요.');
					document.location.reload(true);
				}
		});
	}
</script>		
</body>
</html>