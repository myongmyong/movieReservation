<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.EmpVo" %>

<%@ page import="com.class601.util.Utils" %>
<%
	String contextPath = request.getContextPath();
	EmpVo vo = (EmpVo)request.getAttribute("resultVo");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div class="w3-container w3-margin">
	<h2>Modify</h2> 
	<p>수정 페이지입니다 .</p>
	
	
	<div class="w3-card-4">
		<div class="w3-container w3-right w3-margin" >
			<a href="<%=contextPath %>/emp/empList.do" class="w3-btn w3-light-blue">목록</a>
		</div>
	<div class="w3-container w3-green">
	  	
	</div>
	
	<form class="w3-container"  action="<%=contextPath %>/emp/empModify.do" method="post">
	
		<label class="w3-label">사번</label>
		<input class="w3-input" type="text" name="empno" value="<%=Utils.toEmptySpace(vo.getEmpNo()) %>" READONLY>
		
		<label class="w3-label">이름</label>
		<input class="w3-input" type="text" name="ename" value="<%=Utils.toEmptySpace(vo.geteName()) %>">

		<label class="w3-label">수행업무</label>
		<input class="w3-input" type="text" name="job" value="<%=Utils.toEmptySpace(vo.getJob()) %>">

		<label class="w3-label">매니저사번</label>
		<input class="w3-input" type="text" name="mgr" value="<%=Utils.toEmptySpace(vo.getMgr()) %>">

		<label class="w3-label">고용일</label>
		<input class="w3-input" type="text" name="hiredate" value="<%=Utils.toEmptySpace(vo.getHireDate())%>">

		<label class="w3-label">연봉</label>
		<input class="w3-input" type="text" name="sal" value="<%=Utils.toEmptySpace(vo.getSal()) %>">

		<label class="w3-label">인센티브</label>
		<input class="w3-input" type="text" name="comm" value="<%=Utils.toEmptySpace(vo.getComm()) %>">

		<label class="w3-label">부서</label>
		
		<select class="w3-input" name="deptno">
			
		</select>
		<!-- 
		<input class="w3-input" type="text" name="" value="40">
		 -->
		<input type="submit" class="w3-btn w3-indigo w3-round-xxlarge w3-margin"
				value="수정">
	</form>
	
	</div>
	
	
	
	
</div>
</body>
</html>