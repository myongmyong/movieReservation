<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.TimeVo" %>
<%
	String contextPath = request.getContextPath();
	TimeVo vo = (TimeVo)request.getAttribute("resultVo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시간대 조회/수정</title>
</head>
<body>
<div>

	<p>시간대 조회/수정</p>
	<div>
		<form action="<%=contextPath %>/admin/time/timeModify.do" method="post">
	
			<input type="submit" value="저장">
			<a href="<%=contextPath%>/admin/time/timeDelete.do?timeTypeId=<%=vo.getTimeTypeId()%>">삭제</a>
			<a href="<%=contextPath%>/admin/time/timeList.do">취소</a>
			<a href="<%=contextPath%>/admin/time/timeList.do">목록</a>
		
			<label>시간대ID</label>
			<input type="text" name="timeTypeId" value="<%=vo.getTimeTypeId()%>" READONLY>
			
			<label>시간대명</label>
			<input type="text" name="timeTypeNm" value="<%=vo.getTimeTypeNm()%>">
	
			<label>시간대별 가격</label>
			<input type="text" name="timeTypePrice" value="<%=vo.getTimeTypePrice()%>">
	
		</form>
	
	</div>
	
</div>
</body>
</html>