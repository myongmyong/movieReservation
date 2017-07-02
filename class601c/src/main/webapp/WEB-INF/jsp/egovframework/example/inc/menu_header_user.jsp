<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath = request.getContextPath();
	String curMenu = request.getParameter("curMenuUser");
%>
<ul>
  <li><a id="" href="<%=contextPath %>/user/movies/moviesList.do">영화</a></li>
  <li><a id="" href="<%=contextPath %>/user/booking/showtimetable.do">예매</a></li>
  <li><a id="" href="<%=contextPath %>/user/theaters/theatersList.do">극장</a></li>
</ul>