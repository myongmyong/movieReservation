<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.BookVo" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
	BookVo vo = (BookVo) request.getAttribute("resultVo");
%>

<head>
<title>로그인</title>
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

</head>
<body class="homepage">
<div id="wrapper">
	<div id="service">
		<ul class="container">
			<li>
			<a href="<%=contextPath%>/user/mypage/bookingInfo.do"" class="mypage">내 페이지</a>
			</li>
			<li>
			<a href="<%=contextPath%>/login/userLoginView.do" class="login">로그인</a>
			</li>
			<li>
			<a href="<%=contextPath%>/user/user_info/user_InfoView.do" class="join">회원가입</a>
			</li>
		</ul>
	</div>
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
		    		<table>
		    			<tr>
		    				<th>예매내역</th>
		    				<td>예매번호<br><%=vo.getBookingId() %></td>
		    				<td><img class="image" src="/class601c/images/<%=vo.getMovieId() %>.jpg" style="width: auto; height: auto; max-width: 100px; max-height: 100px;"/></td>
		    				<td>영화제목 <%=vo.getMovieNm() %><br>
		    				관람극장 <%=vo.getTheaterNm() %><br>
		    				상영관 <%=vo.getCinemaNm() %><br>
		    				좌석번호 <%=vo.getBookingSeat() %></td>
		    			</tr>		    		
		    		</table>
				</form>
            </div>
            <br>
            <div id="bodyDiv">
	    	

            </div>
	        
	    </div>
			
	</div>
	<div class="footer"></div>
	<footer></footer>
</div>

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>



</script>