<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.class601.util.Utils" %>
<%
	String contextPath = request.getContextPath();
	String id = Utils.getId(session, "userId");	
%>
<!doctype html>
<html lang="en">
<head>
	<title>메인</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=1040" />
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="<%=contextPath %>/js/skel.min.js"></script>
	<script src="<%=contextPath %>/js/skel-panels.min.js"></script>
	<script src="<%=contextPath %>/js/init.js"></script>
	<script type="text/javascript" src="<%=contextPath %>/js/main.js"></script>
	
	<link rel="stylesheet" href="<%=contextPath%>/css/test/skel-noscript.css" />
	<link rel="stylesheet" href="<%=contextPath%>/css/test/style.css" />
	<link rel="stylesheet" href="<%=contextPath%>/css/test/style-desktop.css" />
	<link rel="stylesheet" href="<%=contextPath%>/css/test/main.css" />
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
	    	<!-- 여기부터 내용 -->
			<div class="slide">
				<ul class="slide_ul">
					<li><a href="#"><img src="<%=contextPath%>/images/MOVIE00001.jpg" alt="dane" style="width:500px; height:700px;"></a></li>
					<li><a href="#"><img src="<%=contextPath%>/images/MOVIE00002.jpg" alt="dane" style="width:500px; height:700px;"></a></li>
					<li><a href="#"><img src="<%=contextPath%>/images/MOVIE00004.jpg" alt="dane" style="width:500px; height:700px;"></a></li>
					<li><a href="#"><img src="<%=contextPath%>/images/MOVIE00005.jpg" alt="dane" style="width:500px; height:700px;"></a></li>
				</ul>
			</div>
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


































