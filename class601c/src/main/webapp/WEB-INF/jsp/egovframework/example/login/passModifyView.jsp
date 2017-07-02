<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
%>

<head>
<title>비밀번호 변경</title>
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
	<div id="service">
		<ul class="container">
			<li>
			<a href="<%=contextPath%>/user/mypage/bookingInfo.do" class="mypage">내 페이지</a>
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
		    	 	<li class="tab" ><a id="" href="<%=contextPath %>/login/idFindView.do">아이디 찾기</a></li>
  					<li class="tab active" ><a id="" href="<%=contextPath %>/login/passFindView.do">비밀번호 찾기</a></li>
		    	</ul>
		    	<p></p>
	    	</div>
	    	<div id="bodyDiv">

	    	<h2>비밀번호 변경</h2>
				<form action="<%=contextPath %>/login/passModify.do" method="post" name="userLoginForm" id="userLoginForm" >
					<div>
						<label for="userPassword">새 비밀번호</label><input type="password" name="userPassword" id="userPassword" maxlength="20"/>
						<label for="userPasswordCon">새 비밀번호 확인</label><input type="password" name="userPasswordCon" id="userPasswordCon" maxlength="20"/>
						<font name="check" size="2" color="red"></font>
					</div>
					<div>
						<input type="button" id="userSubmit" title="LOG IN" value="변경"/>
					</div>
				</form>
            </div>
	        
	    </div>
			
	</div>
	<div id="footer"></div>
</div>

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>

<script>
$(function(){
    $('#userSubmit').click(userSubmitClick);
    $('#userLogin').click(userLoginClick);
    $('#guestLogin').click(guestLoginClick);
});
  
function userSubmitClick() {
	function chkPwd(str) {
		var reg_pwd = /^.*(?=.{8,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		if (!reg_pwd.test(str)) {
			return false;
		}
		return true;
	}

	if (!chkPwd($.trim($('#userPassword').val()))) {
		alert('비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)');
		$('#userPassword').val('');
		$('#userPasswordCon').val('');
		$('#userPassword').focus();

	} else if( $('#userPassword').val() == $('#userPasswordCon').val() ) {
		alert('비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.');
		document.userLoginForm.submit();
	} else {
		alert('비밀번호가 다릅니다. 다시 입력해주세요.')
		window.location.reload(true);
	}
}
function userLoginClick() {
    document.userLoginForm.action = '<%=contextPath%>/login/userLoginView.do';
    document.userLoginForm.submit();
}

function guestLoginClick() {
    document.userLoginForm.action = '<%=contextPath%>/login/guestLoginView.do';
    document.userLoginForm.submit();
}

$('#userPasswordCon').keyup(function(){
	if ($('#userPassword').val() != $('#userPasswordCon').val()) {
		$('font[name=check]').text('');
		$('font[name=check]').html("비밀번호틀림");
	} else {
		$('font[name=check]').text('');
		$('font[name=check]').html("비밀번호일치");
	}
});

</script>

</body>
</html>