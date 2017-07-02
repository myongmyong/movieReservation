<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.CiTypeVo" %>
<%
	String contextPath = request.getContextPath();
	CiTypeVo vo = (CiTypeVo)request.getAttribute("resultVo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상영관 종류 조회/수정</title>
</head>
<body>
<div>

	<p>상영관 종류 조회/수정</p>
	<div>
			<a href="<%=contextPath%>/admin/ci_type/ci_typeDelete.do?cinemaTypeId=<%=vo.getCinemaTypeId()%>">삭제</a>
			<a href="<%=contextPath%>/admin/ci_type/ci_typeList.do">취소</a>
			<a href="<%=contextPath%>/admin/ci_type/ci_typeList.do">목록</a>	
	</div>
	<div>
		<form action="<%=contextPath %>/admin/ci_type/ci_typeModify.do" method="post">
	
			<input type="submit" value="저장">
		
			<label>상영관 종류ID</label>
			<input type="text" name="cinemaTypeId" value="<%=vo.getCinemaTypeId()%>" READONLY>
			
			<label>상영관 종류명</label>
			<input type="text" name="cinemaTypeNm" value="<%=vo.getCinemaTypeNm()%>">
	
			<label>상영관 종류별 가격</label>
			<input type="text" name="cinemaTypePrice" value="<%=vo.getCinemaTypePrice()%>">
	
		</form>
	
	</div>
	
</div>
</body>
</html>