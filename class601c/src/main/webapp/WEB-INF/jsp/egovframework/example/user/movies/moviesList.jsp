<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.class601.vo.MovieVo"%>
<%@ page import="com.class601.util.Utils" %>  
<%
	String contextPath = request.getContextPath();
	String id = Utils.getId(session, "userId");	
	String movieId = (String) request.getAttribute("movieId");
	List<MovieVo> list = (List<MovieVo>) request.getAttribute("resultList");
	List rate = (List) request.getAttribute("bookingRate");	
%>
<!DOCTYPE html>
<html>
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
		<nav id="nav" class="active">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header_user.jsp">
				<jsp:param name="curMenuUser" value="" />
			</jsp:include>
		</nav>
	</div>
	<div class="container">
	    <div id="main">
			<!-- 여기부터 내용 -->
				<form action="<%=contextPath%>/user/movies/moviesList.do" method="post" name="searchForm">
					<input type="hidden" name="pageNo" value="${paging.pageNo}">
				</form>
				<div  class="w3-container  w3-right-align  w3-margin">
					<a href="<%=contextPath%>/user/main.do" class="w3-btn w3-red">메인으로 돌아가기</a>
				</div>
				<div style="display:inline-block;">
					<ol>
						<%
						int size = list.size();
						for (int i=0;i<size;i++) {
						%>
						<li style="float:left;">
							<div class="w3-container  w3-right-align  w3-margin">
								<a href="<%=contextPath%>/user/movies/moviesDetailView.do?movieId=<%=list.get(i).getMovieId()%>">
								<img src="/class601c/images/<%=list.get(i).getMovieId()%>.jpg" style="margin-left: auto; margin-right: auto; display: block; width:202px; height:289px;"/>
								</a>
							</div>
							<div class="w3-container  w3-right-align  w3-margin">
								<p><a href="<%=contextPath%>/user/movies/moviesDetailView.do?movieId=<%=list.get(i).getMovieId()%>"><%=list.get(i).getMovieNm()%></a></p>
								<p>예매율 <%=rate.get(i).toString()%>%</p>
								<p><%=list.get(i).getMovieReleaseDate()%> 개봉</p>
							</div>
						</li>
						<%
						}
						%>
					</ol>
				</div>
				<div class="w3-center">				
				<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/paging.jsp">
					<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
				    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
				    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
				    <jsp:param name="pageNo" value="${paging.pageNo}" />
				    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
				    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
				    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
				</jsp:include>
				</div>
			</div>
							
	    </div>
	</div>

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
$(function(){
    $('#myPage').on('click',goLogin);
});
	
	function goPage(pageNo){
		document.searchForm.pageNo.value = pageNo;
		document.searchForm.submit();
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
</body>
</html>