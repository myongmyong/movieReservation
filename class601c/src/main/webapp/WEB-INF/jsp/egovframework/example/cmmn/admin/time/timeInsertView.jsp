<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String nextId = (String)request.getAttribute("nextId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시간대 등록</title>
</head>
<body>
	<p>시간대 등록</p>
	<div>
	<form action="<%=contextPath %>/admin/time/timeInsert.do" method="post">
		<input type="submit" value="저장">
		<a href="<%=contextPath%>/admin/time/timeList.do">취소</a>
		<a href="<%=contextPath%>/admin/time/timeList.do">목록</a>
		
		<label>시간대ID</label>
		<input type="text" name="timeTypeId" readonly value="<%=nextId%>">
		
		<label>시간대명</label>
		<input type="text" name="timeTypeNm" >

		<label>시간대별 가격</label>
		<input type="text" name="timeTypePrice" >
		
	</form>
	
	</div>
</body>

</html>