<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.TheaterVo" %>
<%@ page import="com.class601.util.Utils" %>
<%
	String contextPath = request.getContextPath();
	String id = Utils.getId(session, "userId");	
	TheaterVo vo = (TheaterVo)request.getAttribute("theater");
	List<TheaterVo> list = (List<TheaterVo>) request.getAttribute("resultList");
	String theaterId = (String) request.getAttribute("theaterId");
%>
<!DOCTYPE html>
<html>
<head>
	<style>
		p.normal{
			font-weight: normal;
		}	
		p.thick{
			font-weight: bold;
		}
		.center {
			text-align: center;
			border: 3px solid green;
		}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">

<title>Insert title here</title>
</head>
<body>
<div class="w3-container w3-margin">
	<h2>극장상세</h2> 
	
	
	<form class="w3-container">
		<label class="w3-label">극장 이름</label>
		<input class="w3-input" type="text" size="5" name="theaterNm" value="<%=vo.getTheaterNm()%>" readonly>
	</form>

	
	
		<div  class="w3-container  w3-right-align  w3-margin">
		<a href="<%=contextPath%>/admin/theater/theaterInsertView.do?theaterId=<%=""%>" class="w3-btn w3-light-blue">예매하러 가기</a>
	</div>

<br>
<br>

	
		
		<div id="theater">
			<img src="/class601c/images/<%=vo.getTheaterId()%>.jpg" style="margin-left: auto; margin-right: auto; display: block;"/>
		</div>
	<br>
	<br>
	<br>
	
	<div class="center">
		<p class="normal">▶ 주소:</p>
			<p class="thick"><%=vo.getTheaterNewAddress() %><br></p>
		<p class="normal">▶ 상영관수 :</p> 
			<p class="thick"><%=vo.getTheaterCinemaNum() %> 개<br></p> 
		<p class="normal">▶ 총좌석: </p> 
			<p class="thick"><%=vo.getTheaterSeatNum() %> 석<br></p> 
		<p class="normal">▶ ☎ 전화번호 :</p> 
			<p class="thick"><%=vo.getTheaterTel() %><br></p> 
	<br>
	<br>
		<p class="normal"> 지도<br></p> 
				<img src = "/class601c/images/<%=vo.getTheaterNm() %>.jpg">
			
			
			
	<br>		
	<br>		
	<br>		
	</div>
	
		<table align="right">
		<tr>
			<td>
				<label for="pwHint">
				다른 극장으로 가기
				</label>
			</td>
			<td>
				
			
				<select name="pwHint" id="pwHint" style="width:200px;">
					<%
					for (TheaterVo vo2 : list) {
					%>
					
					<option value="theater"><a href ="<%=contextPath%>/user/theaters/theatersDetailView.do?theaterId=<%=vo2.getTheaterId()%>"><%=vo2.getTheaterNm()%></a></option>						
					
					<%
					}
					%>
				</select>
			</td>
		</tr>
		
	</table>
	
	<br>
	<br>
	<br>
	<br>


		

</div>	
</body>
</html>