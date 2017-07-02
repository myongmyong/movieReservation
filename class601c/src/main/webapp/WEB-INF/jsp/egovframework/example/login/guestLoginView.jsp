<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.util.Utils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
	String userId = (String) session.getAttribute("userId");
	String resultCnt = (String)request.getAttribute("resultCnt");
	String id = Utils.getId(session, "userId");
%>

<head>
<title>비회원 로그인</title>
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
				<h1><a href="<%=contextPath%>">MOVIE</a></h1>
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
		    	 	<li class="tab" ><a id="" href="<%=contextPath %>/login/userLoginView.do">로그인</a></li>
  					<li class="tab active" ><a id="" href="<%=contextPath %>/login/guestLoginView.do">비회원 로그인</a></li>
		    	</ul>
		    	<p></p>
	    	</div>
		  	<div id="bodyDiv">
	            <form action="<%=contextPath %>" method="post" name="guestLoginForm" id="guestLoginForm">
					<table>
						<tr>
							<td align=right>이용하실 서비스를 선택하세요.</td>
							<td>
								<input class="button" type="button" id="guestBook" value="비회원예매" class="w3-btn w3-section w3-teal w3-ripple"/>							</td>
							<td>
			            		<input class="button" type="button" id="guestBookCon" value="비회원예매 확인/취소" class="w3-btn w3-section w3-teal w3-ripple"/></td>
						</tr>
					</table>
	            </form>
		    </div>
		    <br>
		    <div id="bodyDiv">
		    	<table id="table">
		    		<tr>
		    			<td align=right style="font-weight: bold;">비회원 로그인<br>
		    			이용안내</td>
		    			<td>
		    			이용해 주셔서 감사합니다.<br>
		    			<hr class="dot" />
		    			비회원 비밀번호 분실시, 당사에서 책임지지 않습니다.<br>
		    			<hr class="dot" />
		    			오로지 홈페이지를 이용하여 입력하신 로그인 정보로 취소 처리 하실 수 있습니다.
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		</div>	
	</div>
	<div id="footer"></div>
</div>

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>

<script>
$(function(){
    $('#userLogin').click(userLoginClick);
    $('#guestLogin').click(guestLoginClick);
    $('#guestBook').click(guestBookClick);
    $('#guestBookCon').click(guestBookConClick);
    $('#myPage').on('click',goLogin);
});
  


function userLoginClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/userLoginView.do';
    document.guestLoginForm.submit();
}

function guestLoginClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/guestLoginView.do';
    document.guestLoginForm.submit();
}

function guestBookClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/guestBookView.do';
    document.guestLoginForm.submit();
}

function guestBookConClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/guestBookConView.do';
    document.guestLoginForm.submit();
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