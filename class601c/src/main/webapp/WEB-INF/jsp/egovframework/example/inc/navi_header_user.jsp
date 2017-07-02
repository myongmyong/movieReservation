<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.class601.util.Utils" %>
<%
	String contextPath = request.getContextPath();
	String curMenu = request.getParameter("curMenuUser");
	String id = Utils.getId(session, "userId");	
%>
<div id="service">
		<ul class="container">
			<li>
			<a href="#" id="myPage" name="myPage" class="myPage">내 페이지</a>
			</li>
			
			<%
				if(id == ""){ 
			%>
			<li>
				<a href="<%=contextPath%>/login/userLoginView.do" class="logIn">로그인</a>
			</li>
			<li>
			<a href="<%=contextPath%>/user/user_info/user_InfoView.do" class="join">회원가입</a>
			</li>
			<% 
				}else if(id != ""){
			%>
			<li>
				<a href="<%=contextPath%>/login/userLogout.do" class="logOut">로그아웃</a>
			</li>
			<% 
				}
			%>
			
		</ul>
</div>