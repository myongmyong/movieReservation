<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.CinemaVo"%>
<%@ page import="com.class601.util.Utils"%>
<%@ page import="com.class601.vo.TheaterVo"%>
<%@ page import="com.class601.vo.CiTypeVo"%>
<%
	String contextPath = request.getContextPath();
	CinemaVo vo = (CinemaVo) request.getAttribute("cinema");
	TheaterVo tVo = (TheaterVo) request.getAttribute("resultTheater");
	List<CiTypeVo> allTypeList = (List<CiTypeVo>) request.getAttribute("resultCiTypeId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상영관 정보 조회/수정</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
	<div class="w3-container w3-margin">
		<h2><%=tVo.getTheaterNm() %>의 상영관 정보 조회/수정</h2>

		<div class="w3-card-4">
			<a href="<%=contextPath%>/admin/cinema/cinemaList.do?theaterId=<%=vo.getTheaterId()%>" class="w3-btn w3-light-blue">목록</a> 
			<a href="<%=contextPath%>/admin/cinema/cinemaDelete.do?cinemaId=<%=vo.getCinemaId()%>&theaterId=<%=vo.getTheaterId() %>" class="w3-btn w3-light-blue">삭제</a>
		</div>

		<form class="w3-container" action="<%=contextPath%>/admin/cinema/cinemaModify.do" method="post">



			<label class="w3-label">상영관Id</label> 
			<input class="w3-input" type="text" name="cinemaId" value="<%=Utils.makeNbsp(vo.getCinemaId())%>" readonly> 
			
			<label class="w3-label">상영관명</label> 
			<input class="w3-input" type="text" name="cinemaNm" value="<%=Utils.makeNbsp(vo.getCinemaNm())%>">


			<label class="w3-label">상영관종류</label> 
			<select class="w3-input" name="cinemaTypeId">
					<option value="<%=vo.getCinemaTypeId()%>"><%=vo.getCinemaTypeNm()%></option>
				<%
					for (CiTypeVo vo1 : allTypeList) {
				%>
					<option value="<%=vo1.getCinemaTypeId()%>"><%=vo1.getCinemaTypeNm()%></option>
				<%
					}
				%>
			</select> 
			
			<label class="w3-label">총좌석수</label> 
			<input class="w3-input" type="text" name="cinemaSeatNum" value="<%=Utils.makeNbsp(vo.getCinemaSeatNum())%>"> 
			
			<label class="w3-label">층수</label> 
			<input class="w3-input" type="text" name="cinemaFloorNo" value="<%=Utils.makeNbsp(vo.getCinemaFloorNo())%>"> 
			
			<label class="w3-label">극장명</label> 
			<input class="w3-input" type="text" name="theaterNm" value="<%=Utils.makeNbsp(tVo.getTheaterNm())%>" readonly>
			<input type="hidden" name="theaterId" value="<%=tVo.getTheaterId()%>"> 


			<div>
				<input type="submit" class="w3-btn w3-blue" value="수정">
			</div>
		</form>
</body>
</html>