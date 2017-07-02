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
<title>아이디 찾기</title>
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
		    	 	<li class="tab active" ><a id="" href="<%=contextPath %>/login/idFindView.do">아이디 찾기</a></li>
  					<li class="tab" ><a id="" href="<%=contextPath %>/login/passFindView.do">비밀번호 찾기</a></li>
		    	</ul>
		    	<p></p>
	    	</div>
	    	<div id="bodyDiv">
	    	
				<form action="<%=contextPath %>/login/idFind.do" method="post" name="userLoginForm" id="userLoginForm" >
					<table>
				    	<tr>
				    		<td><label for="userNm">이름</label></td>
				    		<td><input type="text" name="userNm" id="userNm" placeholder="이름" /></td>
				    	</tr>
				    	<tr>
				    		<td><label for="userEmail">이메일 주소</label></td>
				    		<td><input type="text" name="userEmailId" id="userEmailId" placeholder="이메일"/> @
							<input type="text" name="userEmailDomain" id="userEmailDomain" placeholder="이메일을 선택해주세요" value="" readonly/>
							<select class="selUserEmailDomain" id="selUserEmailDomain" name="selUserEmailDomain" onChange="selectEvent();" >
								<option value="">선택하세요</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="write">직접입력</option>
							</select></td>
				    	</tr>
				    	<tr>
		    				<td><label class="test-input" for="userCellphone">휴대폰 번호</label></td>
		    				<td><select class="userCellphone" name="userCellphoneInit" id="userCellphoneInit">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>
							- <input type="text" name="userCellphoneMiddle" id="userCellphoneMiddle" maxlength="4" onkeydown="return inputNumber(event)">
							- <input type="text" name="userCellphoneEnd" id="userCellphoneEnd" maxlength="4" onkeydown="return inputNumber(event)"></td>
				    	</tr>
				    	
				    	</table>
					<div>
						<input class="button" type="button" id="userSubmit" title="LOG IN" value="확인"/>
					</div>
				</form>
            </div>
	        
	    </div>
			
	</div>
	<div class="footer"></div>
	<footer></footer>
</div>

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
$(function(){
    $('#userSubmit').click(userSubmitClick);
    $('#myPage').on('click',goLogin);
});
  
function userSubmitClick() {	
	var userNm = $('#userNm').val();
	var userEmail = $('#userEmailId').val()+ "@" +$('#userEmailDomain').val();
	var userCellphone = $('#userCellphoneInit').val()+$('#userCellphoneMiddle').val()+$('#userCellphoneEnd').val();	
	var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	$.ajax({
		url: '<%=contextPath%>/login/chkIdFind.do',
		type : 'post',
		datatype : 'json',
		data : {
				"userNm" : userNm
				,"userEmail" : userEmail
				,"userCellphone" : userCellphone
		},
		success : function(data) {
				if (data.userId != null) {
					alert(data.userNm + '님의 아이디는' + data.userId + ' 입니다.');
					document.userLoginForm.submit();
			} else {
					alert('입력하신 정보에 해당하는 아이디가 없습니다.');
					window.location.reload(true);
			}
		},
		error : function(req, status, error) {
				alert('서버 에러입니다. 관리자에게 문의해주세요.');
				window.location.reload(true);
		}
	});
	if( $('#userCellphoneMiddle').val().length < 3 || $('#userCellphoneEnd').val().length < 4) {
		alert('휴대폰 번호를 정확히 입력해 주세요.');
		window.location.reload(true);
	} else if (userLoginForm.userEmailDomain.value == null) {
		alert('이메일을 정확히 입력해 주세요.')
	} else if (reg_email.test(userEmail) == false) {
		alert('이메일을 형식에 맞게 입력해 주세요.')
	}
}
	

function selectEvent() {
	if(document.userLoginForm.selUserEmailDomain.value=="write") {
		document.userLoginForm.userEmailDomain.readOnly = false;
		document.userLoginForm.userEmailDomain.value='';
		document.userLoginForm.userEmailDomain.focus();
	} else {
		document.userLoginForm.userEmailDomain.readOnly = true;
		document.userLoginForm.userEmailDomain.value = userLoginForm.selUserEmailDomain.value;
	}
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