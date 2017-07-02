<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
	String userId = (String) session.getAttribute("userId");
	String resultCnt = (String)request.getAttribute("resultCnt");
%>

<head>
<title>[예매] 비회원 로그인</title>
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
		    	 	<li class="tab" ><a id="" href="<%=contextPath %>/login/userLoginView.do">로그인</a></li>
  					<li class="tab active" ><a id="" href="<%=contextPath %>/login/guestLoginView.do">비회원 로그인</a></li>
		    	</ul>
		    	<p></p>
	    	</div>

            <div id="bodyDiv">
				<h2 style="padding:2em;">[예매] 비회원 로그인</h2>
				<form action="<%=contextPath %>/login/guestRegist.do" method="post" name="guestLoginForm" id="guestLoginForm">
					<table>
						<tr>
							<td><label for="noUNm">이름</label></td>
							<td><input type="text" name="noUNm" id="noUNm" placeholder="이름"/></td>
							<td></td>
						</tr>
						<tr>
							<td><label for="noUBirth">생년월일(8자리)</label></td>
							<td><input type="text" name="noUBirth" id="noUBirth" placeholder="예)19901103" maxlength="8"  onkeydown="return inputNumber(event)"/></td>
							<td></td>
						</tr>
						<tr>
							<td><label for="noUMobileCarrier">휴대폰번호</label></td>
							<td><select name="cellphoneInit" id="cellphoneInit">
									<option value="select">---선택하세요---</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								- <input type="text" name="cellphoneMiddle" id="cellphoneMiddle" maxlength="4" onkeydown="return inputNumber(event)">
								- <input type="text" name="cellphoneEnd" id="cellphoneEnd" maxlength="4" onkeydown="return inputNumber(event)">
								<select name="noUMobileCarrier" id="noUMobileCarrier">
									<option value="select">---통신사---</option>
									<option value="skt">SKT</option>
									<option value="kt">KT</option>
									<option value="lg">LG</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="noUPassword">비밀번호(4자리)</label></td>
							<td><input type="password" name="noUPassword" id="noUPassword" maxlength="4" placeholder="숫자만4자리입력"  onkeydown="return inputNumber(event)"/></td>
						</tr>
						<tr>
							<td><label for="noUPasswordCon">비밀번호확인</label></td>
							<td><input type="password" name="noUPasswordCon" id="noUPasswordCon" maxlength="4"  onkeydown="return inputNumber(event)"/>
								<font name="check" size="2" color="red"></font></td>
						</tr>
					
					</table>

					<div>
						<input class="button" type="button" id="noULogin" value="비회원 로그인"/>
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
    $('#userLogin').click(userLoginClick);
    $('#guestLogin').click(guestLoginClick);
    $('#noULogin').click(noULoginClick);
});

function noULoginClick() {
	
	function chkPwd(str) {
		var reg_pwd = /^.*(?=.{8,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		if (!reg_pwd.test(str)) {
			return false;
		}
		return true;
	}
	
	if($('#noUNm').val()==null) {
		alert('이름을 입력하세요.');
	} else if($('#noUBirth').val().length != 8) {
		alert('생년월일은 8자리로 입력해주세요. 예)19901103');
	} else if($('noUMobileCarrier').val() == 'select') {
		alert('통신사를 선택해 주세요.')
	} else if( $('#cellphoneMiddle').val().length < 3 || $('#cellphoneEnd').val().length < 4 || $('cellphoneInit').val() == 'select') {
		alert('휴대폰 번호를 정확히 입력해 주세요.');
		window.location.reload(true);
	} else if($.trim($('#userPassword').val())) {
		alert('비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)');
		$('#noUPassword').val('');
		$('#noUPasswordCon').val('');
		$('#noUPassword').focus();
	} else {
		document.guestLoginForm.submit();
	}
}
 
$('#noUPasswordCon').keyup(function(){
	if ($('#noUPassword').val() != $('#noUPasswordCon').val()) {
		$('font[name=check]').text('');
		$('font[name=check]').html("비밀번호틀림");
	} else {
		$('font[name=check]').text('');
		$('font[name=check]').html("비밀번호일치");
	}
});

function userLoginClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/userLoginView.do';
    document.guestLoginForm.submit();
}

function guestLoginClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/guestLoginView.do';
    document.guestLoginForm.submit();
}

function inputNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
	{
		return;
	}
	else
	{
		return false;
	}
}

</script>

</body>
</html>