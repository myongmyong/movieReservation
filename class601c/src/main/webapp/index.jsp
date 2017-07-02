<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>index</title>
</head>
<%
	String contextPath = request.getContextPath();
%>
<body>
	<a href="<%=contextPath %>/login/loginView.do">영화정보/회원관리시스템</a><br>
	<hr>
	<a href="<%=contextPath %>/user/main.do">영화예매시스템</a><br>	
</body>
</html>