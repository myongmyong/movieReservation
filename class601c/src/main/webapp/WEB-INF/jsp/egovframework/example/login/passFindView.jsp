<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.UserVo" %>
<%@ page import="com.class601.util.Utils" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
	String id = Utils.getId(session, "userId");
%>

<head>
<title>비밀번호 찾기</title>
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
		    	 	<li class="tab" ><a id="" href="<%=contextPath %>/login/idFindView.do">아이디 찾기</a></li>
  					<li class="tab active" ><a id="" href="<%=contextPath %>/login/passFindView.do">비밀번호 찾기</a></li>
		    	</ul>
		    	<p></p>
	    	</div>
	    	<div id="bodyDiv">
				<form action="<%=contextPath %>/login/passFind.do" method="post" name="userLoginForm" id="userLoginForm" >
					<table>
						<tr>
							<td><label for="userNm" >이름</label></td>
							<td><input type="text" name="userNm" id="userNm" placeholder="이름" /></td>
						</tr>
						<tr>
							<td><label for="userId">아이디</label></td>
							<td><input type="text" name="userId" id="userId" placeholder="아이디" />
								<input type="button" id="configueId" value="아이디 확인"/></td>
						</tr>
						<tr>
							<td><label for="userPasswordHint">비밀번호 힌트</label></td>
							<td><select name="userPasswordHint" id="userPasswordHint">
								<option value="">::선택하세요::</option>
								<option value="hint1">태어난 곳은?</option>
								<option value="hint2">졸업한 초등학교는?</option>
								<option value="hint3">좋아하는 노래는?</option>
								<option value="hint4">좋아하는 음식은?</option>
							</select></td>
						</tr>
						<tr>
							<td><label for="userPasswordAnswer" >비밀번호 답</label></td>
							<td><input type="text" name="userPasswordAnswer" id="userPasswordAnswer" placeholder="비밀번호 답" readonly/></td>
						</tr>
					</table>
					<div>
						<input class="button" type="button" id="userPassSubmit" title="LOG IN" value="확인"/>
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
	$('#configueId').click(configueIdClick);
    $('#userPassSubmit').click(userPassSubmitClick);
    $('#idFind').click(idFindClick);
    $('#passFind').click(passFindClick);
    $('#myPage').on('click',goLogin);
});

function configueIdClick() {
	var userId = $('#userId').val();
	$.ajax({
		url: '<%=contextPath%>/login/chkPassFindId.do',
		type : 'post',
		datatype : 'json',
		data : {
				"userId" : userId
		},
		success : function(data) {
			if (data.result == '0') {
				alert('입력하신 아이디가 없습니다.');
				$('#userId').val('');
				$('#userId').focus();
			} else {
				alert('해당하는 아이디가 있습니다.');	
				document.userLoginForm.userPasswordAnswer.readOnly = false;
			}
		},
		error : function(req, status, error) {
				alert('서버 에러입니다. 관리자에게 문의해주세요.');
				window.location.reload(true);
		}
	});
}

function userPassSubmitClick() {	
	var userNm = $('#userNm').val();
	var userId = $('#userId').val();
	var userPasswordHint = $('#userPasswordHint').val();	
	var userPasswordAnswer = $('#userPasswordAnswer').val();
	$.ajax({
		url: '<%=contextPath%>/login/chkPassFind.do',
		type : 'post',
		datatype : 'json',
		data : {
				"userNm" : userNm
				,"userId" : userId
				,"userPasswordHint" : userPasswordHint
				,"userPasswordAnswer" : userPasswordAnswer
		},
		success : function(data) {
			if (data.resultCnt == '0') {
					alert('입력하신 정보가 실제 저장된 값과 다릅니다. 다시 입력해 주세요.');
					window.location.reload(true);
			} else {
					document.userLoginForm.submit();
			}
		},
		error : function(req, status, error) {
				alert('서버 에러입니다. 관리자에게 문의해주세요.');
				window.location.reload(true);
		}
	});
	if( $('#userPasswordAnswer').val() == null) {
		alert('비밀번호 답을 입력해 주세요.');
		$('#userPasswordAnswer').val('');
		$('#userPasswordAnswer').focus();
	}
}

function idFindClick() {
    document.userLoginForm.action = '<%=contextPath%>/login/idFindView.do';
    document.userLoginForm.submit();
}

function passFindClick() {
    document.userLoginForm.action = '<%=contextPath%>/login/passFindView.do';
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