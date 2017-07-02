<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class601.util.Utils" %>
<%
	String contextPath = request.getContextPath();
	String id = Utils.getId(session, "userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up Page</title>
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
	    	<div id="bodyDiv">
				<form action="<%=contextPath%>/user/user_info/user_InfoInsert.do" id="signUpForm" name="signUpForm" method="post" >
				<h2 class="w3-center">회원가입</h2>
					<table>
					<tr>
						<td><label for="userId" >회원아이디</label></td>
						<td><input type="text" name="userId" id="userId" maxlength="10" placeholder="아이디 입력"/>
							<input type="button" value="중복아이디체크" name="chkId" id="chkId" /></td>
					</tr>
					<tr>
						<td><label for="Nm">이름</label></td>
						<td><input type="text" name="userNm" id="userNm" placeholder="이름 입력"/></td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호</label></td>
						<td><input type="password" name="userPassword" id="userPassword" maxlength="12" placeholder="비밀번호 입력"/></td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호확인</label></td>
						<td><input type="password" name="chkPw" id="chkPw" maxlength="12"  placeholder="비밀번호확인 입력"/> <font name="check" size="2" color="red"></font></td>
					</tr>
					<tr>
						<td><label for="pwHint">비밀번호힌트</label></td>
						<td><select name="userPasswordHint" id="userPasswordHint">
								<option value="hint1">태어난 곳은?</option>
								<option value="hint2">졸업한 초등학교는?</option>
								<option value="hint3">좋아하는 노래는?</option>
								<option value="hint4">좋아하는 음식은?</option>
							</select></td>
					</tr>
					<tr>
						<td><label for="pwAnsr">비밀번호정답</label></td>
						<td><input type="text" name="userPasswordAnswer" id="userPasswordAnswer"  placeholder="비밀번호정답 입력"/></td>
					</tr>
					<tr>
						<td><label for="email">이메일</label></td>
						<td><input type=text size=12 name="userEmail" id="userEmail" >
							@<input type="text" id="email" name="email"  readonly >
							<select name="selectEmail" id="selectEmail" onChange="selectEvent();"  >
								<option value=''>::선택::</option>
								<option value='naver.com'>naver.com</option>
								<option value='hanmail.com'>hanmail.com</option>
								<option value="write">직접입력</option>
							</select></td>
					</tr>
					<tr>
						<td><label for="birth">생년월일</label></td>
						<td><input type="date" name="userBirthDate" id="userBirthDate" placeholder="생년월일"/></td>
					</tr>
					<tr>
						<td><label for="gender"> 성별  </label></td>
						<td><input type="radio" name="userGender" value="man"  >남자
							<input type="radio" name="userGender" value="woman" > 여자</td>
					</tr>
					<tr>
						<td><label for="userCellphone"> 핸드폰 번호 </label></td>
						
						<td><select name="userCellphone" id="userCellphone">
								<option value="">--선택--</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
					    	<input name="tele2" id="tele2" type="text" maxlength="4">
					    	<input name="tele3" id="tele3" type="text" maxlength="4">
					    	
					    	<select name="userMobileCarrier" id="userMobileCarrier" >
								<option value="select">--통신사--</option>
								<option value="skt">SKT</option>
								<option value="kt">KT</option>
								<option value="lg">LG</option>
							</select> <input type="hidden" name="userRating" id="userRating" value="1" />
							<input type="hidden" name="userPerformance" id="userPerformance" value="0" />
						</td>
					</tr>
					
					</table>
					<div>
						<input type="submit" id="signUp" value="등록"  class="button"/> 
						<input type="button" id="cancel" value="취소"  class="button"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


	<script>
     $(function(){

	 $('#chkId').click(chkId);
	 $('#chkPw').keyup(chkPw);
	 $('#selectEmail').click(selectEvent);
	 $('#myPage').on('click',goLogin);	
	
	 $('form').submit(function(event){
		var userPassword = $('#userPassword').val();
		var chkPw = $('#chkPw').val();
		var userId = $('#userId').val();
		var userNm = $('#userNm').val();
		var eId = $('#userEmail').val();
		var eDomain = $('#email').val();
		var userEmail = eId + '@' + eDomain;	
		var tele1 = $('#userCellphone').val();
		var tele2 = $('#tele2').val();
		var tele3 = $('#tele3').val();
		var userCellphone = tele1 + tele2 + tele3;
		var userMobileCarrier = $('#userMobileCarrier').val();
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		var rgEx = /(01[016789])(\d{4}|\d{3})\d{4}$/g; 
		
	 		if(!regex.test(userEmail)){
	      		alert('잘못된 이메일 형식입니다');
	      		event.preventDefault();
	 		}else if(!rgEx.test(userCellphone)){
	 			alert('잘못된 핸드폰번호 형식입니다');
	      		event.preventDefault();
	 		}else if(!chkPwd($.trim(userPassword))){
				alert('비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)');
				$('#userPassword').val('');
				$('#userPassword').focus();
				event.preventDefault();
	  		}else if(chkPw != userPassword){
				alert('패스워드가 다릅니다.');
				event.preventDefault();
	     	}else if(eId.length<6 ||eId.length>12){
	      		alert('이메일아이디는 6~12자리로 구성되어야 합니다');
	      		event.preventDefault();
	      	}else if(userNm.length<1){
	      		alert('이름은 한글자 이상으로 구성되어야 합니다');
	      		event.preventDefault();
	      	}else if(userMobileCarrier == 'select'){
	      		alert('통신사를 선택하세요');
	      		event.preventDefault();
	      	}
		});

     });
	
    function chkId(){

    var userId = $('#userId').val();	
	$.ajax({ //중복아이디 체크 
		url: '<%=contextPath%>/user/user_info/chkId.do',
				type : 'post',
				datatype : 'json',
				data : {
					"chkId" : userId
				},
				success : function(data) {

					if(userId.length<6 || userId.length>12){
					    alert('아이디는 6~12자리로 구성되어야 합니다.');
						event.preventDefault();			
					}else if (data.result == "1") {
						alert(data.chkId + '는 중복되는 아이디가 있습니다.');
					}else {
						alert(data.chkId + '는 사용가능한 아이디입니다.');
					        $('#userId').attr('readonly', 'readonly');
				     }
					
	          },
				error : function(req, status, error) {
					alert('서버 에러입니다. 관리자에게 문의해주세요.');
					
				}

			});
		}

		function chkPwd(str) {

			var reg_pwd = /^.*(?=.{8,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

			if (!reg_pwd.test(str)) {
				return false;
			}
			return true;
		}

		function chkPw() {
			if ($('#userPassword').val() != $('#chkPw').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호틀림");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호일치");
			}
		}

		function selectEvent() {
			if(document.signUpForm.selectEmail.value=="write") {
				document.signUpForm.email.readOnly = false;
				document.signUpForm.email.value='';
				document.signUpForm.email.focus();
			} else {
				document.signUpForm.email.readOnly = true;
				document.signUpForm.email.value = signUpForm.selectEmail.value;
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