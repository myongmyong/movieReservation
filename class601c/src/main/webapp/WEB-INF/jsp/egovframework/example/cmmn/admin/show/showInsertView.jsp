<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.ShowVo"%>
<%
	String contextPath = request.getContextPath();
	String nextId = (String) request.getAttribute("nextId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 정보 등록</title>
<style>
tr, td {
	border: 1px solid black;
	background-color: Orange;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
	<div class="w3-container w3-margin">
		<h2>Add</h2>
		<p>상영 정보 등록</p>

		<div class="w3-card-4">
			<div class="w3-container w3-right w3-margin">
				<a href="<%=contextPath%>/admin/show/showList.do" class="w3-btn w3-indigo w3-round-xxlarge w3-margin">목록</a>
			</div>


			<form class="w3-container" name="insertForm" id="insertForm" action="<%=contextPath%>/admin/show/showInsert.do" method="post">

				<table>
					<tr>
						<td><label for="showId">상영ID</label></td>
						<td><input class="w3-input" style="width: 500px;" type="text" name="showId" id="showId" readonly value="<%=nextId%>" /></td>
					</tr>

					<tr>
						<td><label for="movieId"> 영화ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="movieNm" id="movieNm"/ readonly>
							<input type="hidden" name="movieId" id="movieId" value="" />
						</td>
						<td><input type="button" id="movieList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="theaterId"> 극장ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="theaterNm" id="theaterNm" readonly/>
							<input type="hidden" name="theaterId" id="theaterId" value="" />
						</td>
						<td><input type="button" id="theaterList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="cinemaId"> 상영관ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="cinemaNm" id="cinemaNm" readonly/>
							<input type="hidden" name="cinemaId" id="cinemaId" value="" />	
						</td>
						<td><input type="button" id="cinemaList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="cinemaId"> 상영관 종류ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="cinemaTypeNm" id="cinemaTypeNm" readonly/>
							<input type="hidden" name="cinemaTypeId" id="cinemaTypeId" value="" />	
						</td>
					</tr>

					<tr>
						<td><label for="theaterCinemaNum"> 시간대ID </label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="timeTypeNm" id="timeTypeNm" readonly/>
							<input type="hidden" name="timeTypeId" id="timeTypeId" value="" />	
						</td>
						<td><input type="button" id="timeList" value="조회"></td>
					</tr>

					<tr>
						<td><label for="startTime"> 시작시간 </label></td>
						<td><input class="w3-input" style="width: 500px;" type="text" name="startTime" id="startTime"/></td>
					</tr>

					<tr>
						<td><label for="showDate"> 상영날짜 </label></td>
						<td><input type="date" class="w3-input" name="showDate" id="showDate"></td>
					</tr>

				</table>
				<div class="w3-container w3-right w3-margin">
					<input type="button" id="insertShow" class="w3-btn w3-indigo w3-round-xxlarge w3-margin" value="저장">
				</div>
			</form>
		</div>
	</div>
	
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
	$(function(){
		$('#movieList').click(movieList);
		$('#theaterList').click(theaterList);
		$('#cinemaList').click(cinemaList);
		$('#timeList').click(timeList);
		
		$('#insertShow').click(chkShowInfo);
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