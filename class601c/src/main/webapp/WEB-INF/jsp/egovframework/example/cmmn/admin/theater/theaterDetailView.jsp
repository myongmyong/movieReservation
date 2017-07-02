<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.TheaterVo" %>
<%@ page import="com.class601.vo.CodeVo" %>
<%@ page import="com.class601.util.Utils" %>
<%
	String contextPath = request.getContextPath();
	TheaterVo vo = (TheaterVo)request.getAttribute("theater");
	List<CodeVo> areaList = (List<CodeVo>) request.getAttribute("areaList");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 정보 조회/수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div class="w3-container w3-margin">
	<h2>Detail</h2> 
	<p>극장정보 조회/수정</p>

	<div class="w3-card-4">
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath%>/admin/cinema/cinemaList.do?theaterId=<%=vo.getTheaterId() %>" class="w3-btn w3-light-blue">상영관 목록</a>
			<a href="<%=contextPath%>/admin/theater/theaterDelete.do?theaterId=<%=vo.getTheaterId() %>" class="w3-btn w3-light-blue">삭제</a>
			<a href="<%=contextPath %>/admin/theater/theaterList.do" class="w3-btn w3-light-blue">취소</a>
			<a href="<%=contextPath %>/admin/theater/theaterList.do" class="w3-btn w3-light-blue">목록</a>
		</div>
	<div class="w3-container w3-green">
	  	
	</div>
	<form class="w3-container"  action="<%=contextPath %>/admin/theater/theaterModify.do" method="post">
		
		<label class="w3-label">극장Id</label>
		<input class="w3-input" type="text" name="theaterId" value="<%=Utils.toEmptySpace(vo.getTheaterId()) %>" READONLY>
		
		<label class="w3-label">극장 명</label>
		<input class="w3-input" type="text" name="theaterNm" value="<%=Utils.toEmptySpace(vo.getTheaterNm()) %>">

		<label class="w3-label">(구)주소</label>
		<input class="w3-input" type="text" name="theaterOldAddress" value="<%=Utils.toEmptySpace(vo.getTheaterOldAddress()) %>">

		<label class="w3-label">새주소</label>
		<input class="w3-input" type="text" name="theaterNewAddress" value="<%=Utils.toEmptySpace(vo.getTheaterNewAddress()) %>">

		<label class="w3-label">전화번호</label>
		<input class="w3-input" type="text" name="theaterTel" value="<%=Utils.toEmptySpace(vo.getTheaterTel())%>">

		<label class="w3-label">상영관 수</label>
		<input class="w3-input" type="text" name="theaterCinemaNum" value="<%=Utils.toEmptySpace(vo.getTheaterCinemaNum())%>" READONLY>

		<label class="w3-label">총 좌석</label>
		<input class="w3-input" type="text" name="theaterSeatNum" value="<%=Utils.toEmptySpace(vo.getTheaterSeatNum())%>" READONLY>

		<label for="theaterArea" class="w3-label">지역1</label>
		<select class="w3-input" name="theaterArea" id="theaterArea">
				<option value="<%=vo.getTheaterArea()%>"><%=vo.getTheaterArea()%></option>
			<%
				for(CodeVo cVo : areaList){
			%>
				<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
			<% 
				}
			%>
		</select>	


		<!-- 
		<input class="w3-input" type="text" name="" value="40">
		 -->
				
		<input type="submit" class="w3-btn w3-indigo w3-round-xxlarge w3-margin"
				value="수정">
	</form>
	
	</div>
	
	
	
	
</div>
</body>
</html>