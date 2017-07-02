<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.util.Utils" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
	String id = Utils.getId(session, "userId");
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
		    	 	<li class="tab active" ><a id="" href="<%=contextPath %>/login/userLoginView.do">로그인</a></li>
  					<li class="tab" ><a id="" href="<%=contextPath %>/login/guestLoginView.do">비회원 로그인</a></li>
		    	</ul>
		    	<p></p>
	    	</div>
			<div id="bodyDiv">
				<form action="<%=contextPath %>/login/userLogin.do" method="post" name="userLoginForm" id="userLoginForm" >
					<table>
						<tr>
							<td><label for="userId" style="font-weight: bold;">아이디</label></td>
							<td><input type="text" name="userId" id="userId" required/></td>
							<td rowspan="2" style="vertical-align:middle;"><input type="button" id="login" value="로그인" class="button"/></td>
						</tr>
						<tr>
							<td><label for="userPassword" style="font-weight: bold;">비밀번호</label></td>
							<td><input type="password" name="userPassword" id="userPassword" required/></td>
						</tr>
						<tr>
							<td colspan="3" align=center valign=middle>
								<a href="<%=contextPath%>/login/idFindView.do" style="text-decoration:none; font-size:0.8em;font-weight: bold;" >아이디 찾기</a>
								<a href="<%=contextPath%>/login/passFindView.do" style="text-decoration:none; margin-left:3em; font-size:0.8em;font-weight: bold;" >비밀번호 찾기</a>
								<a href="<%=contextPath%>/user/user_info/user_InfoView.do" style="text-decoration:none; margin-left:3em; font-size:0.8em;font-weight: bold;" >회원가입</a>
							</td>
						</tr>
						
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
    $('#login').click(btnClick);
    $('#userLogin').click(userLoginClick);
    $('#guestLogin').click(guestLoginClick);
    $('#guestBook').click(guestBookClick);
    $('#guestBookCon').click(guestBookConClick);
    $('#myPage').on('click',goLogin);
});

function guestBookClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/guestBookView.do';
    document.guestLoginForm.submit();
}

function guestBookConClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/guestBookConView.do';
    document.guestLoginForm.submit();
} 

function btnClick(){
	
	var userId = $('#userId').val();
	var userPassword = $('#userPassword').val();
	
	$.ajax({
		url: '<%=contextPath%>/login/chkUserId.do',
		type : 'post',
		datatype : 'json',
		data : {
				"userId" : userId
				,"userPassword" : userPassword
			},
		success : function(data) {
				if (data.result == "1") {
					document.userLoginForm.submit();
				} else {
					alert('아이디 혹은 비밀번호가 일치하지 않습니다.');
					window.location.reload(true);
				}
			},
		error : function(req, status, error) {
				alert('서버 에러입니다. 관리자에게 문의해주세요.');
				window.location.reload(true);
			}
		});
	}

function userLoginClick() {
    document.userLoginForm.action = '<%=contextPath%>/login/userLoginView.do';
    document.userLoginForm.submit();
}

function guestLoginClick() {
    document.userLoginForm.action = '<%=contextPath%>/login/guestLoginView.do';
    document.userLoginForm.submit();
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