<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.BookVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.util.Utils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
	List<BookVo> bookingList = (List<BookVo>) request.getAttribute("bookingList");
	List<BookVo> bookedList = (List<BookVo>) request.getAttribute("bookedList");
	String userId = (String) request.getSession().getAttribute("userId");
	String id = Utils.getId(session, "userId");	
%>

<head>
<meta charset="UTF-8">
<title>movies</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=1040" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-panels.min.js"></script>
<script src="js/init.js"></script>

<link rel="stylesheet" href="<%=contextPath%>/css/test/skel-noscript.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/test/style.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/test/style-desktop.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">

</head>
<body class="homepage">
<div id="wrapper">
<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/navi_header_user.jsp">
		<jsp:param name="curMenu" value="navi" />
</jsp:include>
	<div id="header">
		<div class="container">
			<div id="logo">
				<h1><a href="<%=contextPath%>/user/main.do">MOVIE</a></h1>
				<span>Made by class601c</span>
			</div>
		</div>
	</div>
	<div class="container">
		<nav id="nav">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header_user.jsp">
				<jsp:param name="curMenuUser" value="" />
			</jsp:include>
		</nav>
	</div>
	
	<div class="container">
	    <div id="main">
	    	<div id="bodyDiv">
	    		<form action="<%=contextPath %>" method="post" name="bookingForm" id="bookingForm">
		    		<table style="margin-left:5em;">
		    			<% 
		    			for(BookVo vo : bookingList){
		    			%>  
		    			<tr>
		    				<th style="font-weight: bold;">예매내역</th>
		    				<td style="padding-left:4em;">예매번호<br><a href="<%=contextPath%>/user/mypage/bookingValid.do?bookingId=<%=vo.getBookingId()%>&userId=<%=userId%>"><%=vo.getBookingId()%></a></td>
		    				<td style="vertical-align:middle;"><img class="image" src="/class601c/images/<%=vo.getMovieId()%>.jpg" style="width: auto; height: auto; max-width: 100px; max-height: 100px;"/></td>
		    				<td style="padding-left:4em;">영화제목 <%=vo.getMovieNm()%><br>
		    				관람극장 <%=vo.getTheaterNm() %><br>
		    				상영관 <%=vo.getCinemaNm() %><br>
		    				좌석번호 <%=vo.getBookingSeat() %></td>
		    				<td style="padding-left:6em;"><input class="button" type="button" id="" value="예매 취소" /></td>
		    			</tr>
		    			<%
		    			}
		    			for(BookVo vo : bookedList){
		    			%>
		    			<tr>
		    				<th style="font-weight: bold;">내가본영화</th>
		    				<td style="padding-left:4em;">예매번호<br><a href="<%=contextPath%>/user/mypage/bookingValid.do?bookingId=<%=vo.getBookingId()%>&userId=<%=userId%>"><%=vo.getBookingId()%></a></td>
		    				<td style="vertical-align:middle;"><img class="image" src="/class601c/images/<%=vo.getMovieId() %>.jpg" style="width: auto; height: auto; max-width: 100px; max-height: 100px;"/></td>
		    				<td style="padding-left:4em;">영화제목 <%=vo.getMovieNm() %><br>
		    				관람극장 <%=vo.getTheaterNm() %><br>
		    				상영관 <%=vo.getCinemaNm() %><br>
		    				좌석번호 <%=vo.getBookingSeat() %></td>
		    				<td></td>		    			
		    			</tr>
		    			<%
		    			}
		    			%>
		    			<tr>
		    				<td></td>
		    				<td></td>
		    				<td></td>
		    				<td></td>
		    				<td><input class="button" type="button" id="memberInfoDetail" value="회원정보 변경"/></td>
		    			</tr>
		    		</table>
				</form>
            </div>
	        
	    </div>
			
	</div>
	<div class="footer"></div>
	<footer></footer>
</div>

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>

$(function(){
    $('#memberInfoDetail').click(memberInfoDetailClick);
    $('#myPage').on('click',goLogin);
});
function memberInfoDetailClick() {
	document.bookingForm.action = '<%=contextPath%>/user/mypage/memberInfoDetail.do?userId=<%=userId%>';
    document.bookingForm.submit();
}
function goLogin(){
	var id = '<%=id%>';
	
	if(id == ''){
		alert('로그인이 필요합니다.');
		document.location.href = '<%=contextPath%>/login/userLoginView.do';
	}else{
		document.location.href = '<%=contextPath%>/user/mypage/bookingInfo.do?userId=<%=id%>';
	}
}


</script>