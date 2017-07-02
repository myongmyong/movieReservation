<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.TheaterVo" %>
<%@ page import="com.class601.vo.CodeVo" %>
<%
	String contextPath = request.getContextPath();
	String nextId = (String)request.getAttribute("nextId");
	List<CodeVo> areaList = (List<CodeVo>) request.getAttribute("areaList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 정보 등록</title>
	<style>
			tr, td {
				border: 1px solid black;
				background-color:Orange;
			}
	</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div class="w3-container w3-margin" >
	<h2>Add</h2> 
	<p>극장 정보 등록</p>
		
	<div class="w3-card-4">
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/admin/theater/theaterList.do" class="w3-btn w3-indigo w3-round-xxlarge w3-margin">목록</a>
		</div>
	
	
	<form class="w3-container" name="insertForm" action="<%=contextPath %>/admin/theater/theaterInsert.do" method="get" >

		<table>
			<tr>
				<td>
					<label for="theaterId">
					극장ID
					</label>
				</td>
				<td>
					<input class="w3-input" style="width:500px;" type="text" name="theaterId" id="theaterId" readonly value="<%= nextId%>"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="theaterNm">
					극장 명
					</label>
				</td>
				<td><input class="w3-input" style="width:500px;" type="text" name="theaterNm" id="theaterNm" /></td>
			</tr>
		
			<tr>
				<td>
					<label for="theaterOldAddress">
					(구)주소
					</label>
				</td>
				<td><input class="w3-input" style="width:500px;"  type="text" name="theaterOldAddress" id="theaterOldAddress" /></td>
			</tr>
		
			<tr>
				<td>
					<label for="theaterNewAddress">
					새주소
					</label>
				</td>
				<td><input class="w3-input" style="width:500px;"  type="text" name="theaterNewAddress" id="theaterNewAddress" /></td>
			</tr>
		
			<tr>
				<td>
					<label for="theaterTel">
					전화번호
					</label>
				</td>
				<td><input class="w3-input" style="width:500px;"  type="text" name="theaterTel" id="theaterTel" /></td>
			</tr>
			
			<tr>
				<td>
					<label for="theaterCinemaNum">
					상영관 수
					</label>
				</td>
				<td><input class="w3-input" style="width:500px;"  type="text" name="theaterCinemaNum" id="theaterCinemaNum" / value="0"></td>
			</tr>
			
			<tr>
				<td>
					<label for="theaterSeatNum">
					총 좌석
					</label>
				</td>
				<td><input class="w3-input" style="width:500px;"  type="text" name="theaterSeatNum" id="theaterSeatNum" value="0" /></td>
			</tr>
			
			<tr>
				<td>
					<label for="theaterArea">
					지역
					</label>
				</td>
				<td>
				<select class="w3-input" name="theaterArea" id="theaterArea">
					<%
						for(CodeVo cVo : areaList){
					%>
						<option value="<%=cVo.getSubCdNm()%>"><%=cVo.getSubCdNm() %></option>
					<% 
						}
					%>
				</select>
				</td>
			</tr>
		
		

	</table>
	<br>

		<!-- 
		<input class="w3-input" type="text" name="" value="40">
		 -->
		<div class="w3-container w3-right w3-margin" >
			<input type="submit" class="w3-btn w3-indigo w3-round-xxlarge w3-margin"
				value="저장">
		</div>
	</form>
	</div>
	<div  class="w3-container  w3-right-align  w3-margin">
	<a href="<%=contextPath%>/login/logout.do" class="w3-btn w3-light-blue">로그아웃</a>
	</div>
	
	</div>

	
	
	
</body>
</html>