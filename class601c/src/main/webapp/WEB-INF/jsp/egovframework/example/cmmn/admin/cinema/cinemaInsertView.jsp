<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.CinemaVo"%>
<%@ page import="com.class601.vo.TheaterVo"%>
<%@ page import="com.class601.vo.CiTypeVo"%>
<%
	String contextPath = request.getContextPath();
	String nextId = (String) request.getAttribute("nextId");
	TheaterVo tVo = (TheaterVo) request.getAttribute("resultTheater");
	List<CiTypeVo> allTypeList = (List<CiTypeVo>) request.getAttribute("resultCiTypeId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
<title>상영관 정보 등록</title>
</head>
<body>
	<p>[해당극장ID]의 상영관 정보 등록</p>

	<div class="w3-card-4">
		<div class="w3-container w3-right w3-margin">
			<a href="<%=contextPath%>/admin/cinema/cinemaList.do?theaterId=<%=tVo.getTheaterId() %>" class="w3-btn w3-light-blue">목록</a> <a
				href="<%=contextPath%>/admin/cinema/cinemaList.do?theaterId=<%=tVo.getTheaterId() %>" class="w3-btn w3-light-blue">취소</a> 
		</div>
		<div class="w3-container w3-green"></div>

		<form class="w3-container" action="<%=contextPath%>/admin/cinema/cinemaInsert.do" method="post">

			<label class="w3-label">상영관id</label> 
			<input class="w3-input" type="text" name="cinemaId" value="<%=nextId%>" readonly>

			<label class="w3-label">상영관명</label> 
			<input class="w3-input" type="text" name="cinemaNm"> 
			
			<label class="w3-label">상영관종류id</label>
			<select class="w3-input" name="cinemaTypeId">

				<%
					for (CiTypeVo vo : allTypeList) {
				%>
				<option value="<%=vo.getCinemaTypeId()%>"><%=vo.getCinemaTypeNm()%></option>
				<%
					}
				%>
			</select> 
			
			<label class="w3-label">총좌석수</label> 
			<input class="w3-input" type="text" name="cinemaSeatNum"> 
			
			<label class="w3-label">층수</label>
			<input class="w3-input" type="text" name="cinemaFloorNo"> 
			
			<label class="w3-label">극장id</label> 
			<input class="w3-input" type="text" name="theaterNm" value="<%=tVo.getTheaterNm()%>" readonly>
			<input type="hidden" name="theaterId" value="<%=tVo.getTheaterId()%>">

			<div>
				<input type="submit" class="w3-btn w3-blue" value="저장">
			</div>

		</form>



	</div>
<div  class="w3-container  w3-right-align  w3-margin">
<a href="<%=contextPath%>/login/logout.do" class="w3-btn w3-light-blue">로그아웃</a>
</div>

</body>
</html>