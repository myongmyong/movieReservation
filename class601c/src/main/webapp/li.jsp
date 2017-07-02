<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		ul li { 
		display:inline; 
		border: 1px solid black; 
		}
	</style>
</head>
<%
	String[] fruitList = {"apple","banana","coconut"};
%>
<body>

	<ul>
		<c:forEach var="i" begin="1" end="10" step="1">
			<li>${i}</li>			
		</c:forEach>	
	</ul>
	
	<h1>choose when otherwise</h1>
	
	<c:choose>
		<c:when test="${78 > 90}">
			A학점<br>
		</c:when>
		<c:when test="${78 > 80}">
			B학점<br>
		</c:when>
		<c:otherwise>
			C학점<br>				
		</c:otherwise>
	</c:choose>

</body>
</html>