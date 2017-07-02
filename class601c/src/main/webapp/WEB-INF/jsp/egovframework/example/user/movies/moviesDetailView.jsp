<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.MovieVo" %>
<%@ page import="com.class601.vo.ReplyVo" %>
<%@ page import="com.class601.util.Utils" %>

<%
	String contextPath = request.getContextPath();
	MovieVo vo = (MovieVo)request.getAttribute("movie");
	double replyGradeAvg = (double)request.getAttribute("replyGradeAvg");
	String id = Utils.getId(session, "userId");	
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-panels.min.js"></script>
<script src="js/init.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"></script>
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
				<div class="w3-container w3-margin">
				<h1>영화상세</h1> 
				<hr>
				</div>
				<div class="container" style="float:left; width:30%;">
					<img src="/class601c/images/<%=vo.getMovieId()%>.jpg" style="margin-left: auto; margin-right: auto; display: block;"/>
				</div>
				<div class="container" style="float:left; width:70%;">
					<p>감독 	: <%=vo.getMovieDirector() %></p>
					<p>배우 	: <%=vo.getMovieActor() %></p>
					<p>장르 	: <%=vo.getMovieGenre1() %> <%=Utils.toEmptySpace(vo.getMovieGenre2()) %> <%=Utils.toEmptySpace(vo.getMovieGenre3()) %></p>
					<p>관람등급 : <%=vo.getMovieRating() %></p>
					<p>개봉일 	: <%=vo.getMovieReleaseDate() %></p>					
					<p>상영시간 : <%=vo.getMovieShowingTime() %>분</p>
					<p>평점
						<div id="star" style=" float:left;"></div>
				 	    <div style="float:left;"><%=replyGradeAvg%></div>
					</p>
				</div>
				<hr>
				<div class="container" style="clear:both; margin-top: 30%; margin-left: 5%; width:80%;">
					<textarea rows="15" cols="200" class="w3-input" name="movieIntro" readonly><%=vo.getMovieIntro() %></textarea>
				</div>
				<div class="container" style="clear:both; width:100%;">
					<h1>평점</h1>
					<a href="javascript:;" id="replyInsert" class="w3-btn w3-red" style="float:right;">평점등록</a>
					<hr>
					<form action="<%=contextPath%>/user/movies/moviesDetailView.do" method="post" name="searchForm">
						<input type="hidden" name="pageNo" value="${paging.pageNo}">
					</form>
					<table class="w3-table w3-bordered w3-striped w3-border test">
						
					</table>
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
</div>	
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>

var id = '<%=id%>';

$(function(){
	$('#myPage').on('click',goLogin);
	$('#replyInsert').click(replyInsert);
});
	

	function replyInsert(){
		if(id == ''){
			alert('로그인이 필요합니다.');
			document.location.href = '<%=contextPath%>/login/userLoginView.do';
		}else{
			window.open("<%=contextPath%>/user/reply/replyInsertView.do?movieId=<%=vo.getMovieId()%>","replyInsert","width=700, height=600");			
		}
	}
	
	function goPage(pageNo){
		document.searchForm.pageNo.value = pageNo;
		document.searchForm.submit();
	}
	
	function goLogin(){
		if(id == ''){
			alert('로그인이 필요합니다.');
			document.location.href = '<%=contextPath%>/login/userLoginView.do';
		}else{
			document.location.href = '<%=contextPath%>/user/mypage/bookingInfo.do?userId=<%=id%>';
		}
	}
</script>
<script src="<%=contextPath%>/js/jquery.raty.js"></script>
<script>
    $(function() {
        $('div#star').raty({
            score: <%=replyGradeAvg%>
            ,path : "<%=contextPath%>/images"
            ,width : 120
        });
    });

</script>
</body>
</html>