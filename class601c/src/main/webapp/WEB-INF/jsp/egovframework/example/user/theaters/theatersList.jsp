<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.TheaterVo"%>
<%@ page import="com.class601.vo.CodeVo"%>
<%@ page import="com.class601.util.Utils" %> 
<%
	String contextPath = request.getContextPath();
	List<TheaterVo> basicArea = (List<TheaterVo>) request.getAttribute("basicArea");
	TheaterVo bVo = (TheaterVo) request.getAttribute("basicTheaterNm");
	List<CodeVo> areaCode = (List<CodeVo>) request.getAttribute("areaCode");
	String theaterId = (String) request.getAttribute("theaterId");
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
			<div id="div">
		    	<ul>
			    	<%
			    	for(CodeVo vo : areaCode){
			    	%>
		    	 	<li class="tabTheater" ><a class="area" href="javascript:;"><font size="2"><%=vo.getSubCdNm()%></font></a></li>
		    	 	<%
			    	}
		    	 	%>
		    	</ul>
	    	</div>
	    	<div id="bodyDiv">
				<table>
					<tbody>
						<tr id="theaterArea">
						<% 
						for(TheaterVo vo : basicArea){
						%>
							<td><a class="theaterNm" href="javascript:;"><%=vo.getTheaterNm()%></a></td>
						<%
						}
						%>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div id="bodyDiv">
				<table>
					<tbody id="theaterInfo">
						<tr>
							<td rowspan="4" style="vertical-align:middle;"><img src="<%=contextPath %>/images/THEATER00001.jpg" style="width:600px; height:300px;"></td>
							<td><%=bVo.getTheaterOldAddress() %></td>
						</tr>
						<tr>
							<td><%=bVo.getTheaterNewAddress() %></td>
						</tr>
						<tr>
							<td><%=bVo.getTheaterTel() %></td>
						</tr>
						<tr>
							<td><%=bVo.getTheaterCinemaNum() %>관/총 <%=bVo.getTheaterSeatNum()%>석</td>
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
    $('a.area').on('click',selectTheaters);
});

	function selectTheaters(){
		var thisLevel = $(this).attr('class');
		var value = $(this).text();

		if(thisLevel  == 'area'){	

			$.ajax({
				url :'<%=contextPath%>/user/theaters/selectTheaters.do',
				type :'post',
				datatype : 'json',
				data : {
					
					"theaterArea": value
					
				},
				success:
					function(data){
					var areaList = data.areaList;
					$('#theaterArea').html('');
					for(var i=0;i < areaList.length;i++){						
						$('#theaterArea').append('<td><a class="theaterNm" href="javascript:;">' + areaList[i].theaterNm + '</a></td>');	
					}
					$('a.theaterNm').on('click',selectTheaters);
				},
				error:
					function(req,status,error){
					alert('서버 에러입니다. 관리자에게 문의해주세요');
					document.locatrion.reload(true);
				}
				
			});
			
		}else if(thisLevel == 'theaterNm'){

			$.ajax({
				url :'<%=contextPath%>/user/theaters/theatersDetail.do',
				type :'post',
				datatype : 'json',
				data : {
					
					"theaterNm": value
					
				},
				success:
					function(data){
					$('#theaterInfo').html('');
					var vo = data.theatersDetail;
					$('#theaterInfo').append('<tr><td rowspan="4" style="vertical-align:middle;"><img src="/class601c/images/THEATER00001.jpg" style="width:600px; height:300px;"></td><td>'+ vo.theaterOldAddress +'</td></tr><tr><td>'+ vo.theaterNewAddress +'</td></tr><tr><td>'+ vo.theaterTel +'</td></tr><tr><td>'+ vo.theaterCinemaNum + '관/총 ' + vo.theaterSeatNum +'석</td></tr>');
				},
				error:
					function(req,status,error){
					alert('서버 에러입니다. 관리자에게 문의해주세요');
					document.locatrion.reload(true);
				}
				
			});
		}
	}	

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