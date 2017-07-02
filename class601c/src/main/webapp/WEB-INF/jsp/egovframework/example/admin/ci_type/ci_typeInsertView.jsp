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
<title>상영관 종류 등록</title>
</head>
<body>
	<p>상영관 종류 등록</p>
	<div>
	<form action="<%=contextPath %>/admin/ci_type/ci_typeInsert.do" method="post">
		<input type="submit" value="저장">
		<a href="<%=contextPath%>/admin/ci_type/ci_typeList.do">취소</a>
		<a href="<%=contextPath%>/admin/ci_type/ci_typeList.do">목록</a>
		
		<label>상영관 종류ID</label>
		<input type="text" name="cinemaTypeId" readonly value="<%=nextId%>">
		
		<label>상영관 종류명</label>
		<input type="text" name="cinemaTypeNm" >

		<label>상영관 종류별 가격</label>
		<input type="text" name="cinemaTypePrice" >
		
	</form>
	
	</div>
</body>

</html>