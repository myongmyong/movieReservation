<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.class601.vo.BookingVo" %>
<%@ page import="com.class601.util.Utils"%>
<%
	BookingVo vo = (BookingVo) request.getAttribute("payInfo");
	String contextPath = request.getContextPath();
	String id = Utils.getId(session, "userId");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>영화상영시간표</title>
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
			<h1 align="center">결제 성공</h1>
			<div>
			<table class="w3-table w3-bordered w3-striped w3-border test" style="width:50%; margin-left:25%;">
				<thead>
					<tr text-align="center">
						<th colspan="2" style="text-align: center;"><h3>결제내역</h3></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>결제번호</td>
						<td><%=vo.getPayId() %></td>
					</tr>
					<tr>
						<td>결제금액</td>
						<td><%=vo.getPayAmnt() %></td>
					</tr>
					<tr>
						<td>결제일자</td>
						<td><%=vo.getPayDate() %></td>
					</tr>
					<tr>
						<td>이름</td>
						<%
						if(vo.getNoUNm() == null){ 
						%>
						<td><%=vo.getUserNm() %></td>
						<%
						}else{
						%>
						<td><%=vo.getNoUNm() %></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>핸드폰</td>
						<%
						if(vo.getNoUHp() == null){
						%>
						<td><%=vo.getUserCellphone() %></td>
						<%
						}else{
						%>
						<td><%=vo.getNoUHp() %></td>
						<%
						}
						%>				
					</tr>
					<tr>
						<td>영화명</td>
						<td><%=vo.getMovieNm() %></td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
	</div>
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
$(function(){
	$('#myPage').on('click',goLogin);
});

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
</body>
</html>