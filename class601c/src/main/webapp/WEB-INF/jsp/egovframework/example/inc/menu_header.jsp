<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath = request.getContextPath();
	String curMenu = request.getParameter("curMenu");
%>
<ul class="w3-navbar w3-border w3-light-grey">
	<li><a id="movieInfo" href="<%=contextPath %>/admin/movie/movieList.do">영화관리</a></li>
	<li><a id="theaterInfo" href="<%=contextPath %>/admin/theater/theaterList.do">극장관리</a></li>
	<li><a id="showInfo" href="<%=contextPath %>/admin/show/showList.do">상영정보관리</a></li>
	<li><a id="userInfo" href="<%=contextPath %>/admin/member/memberList.do">회원관리</a></li>
 	<li><a href="<%=contextPath%>/login/logout.do" class="w3-right-align">로그아웃</a></li> 
</ul>
<script>
	$(function(){
		$('#<%=curMenu%>').addClass('w3-green');
	});
</script>