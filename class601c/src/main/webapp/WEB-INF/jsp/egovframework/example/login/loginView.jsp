<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
</head>
<body>
<div id="moviewrap">
	<h2>회원/영화 관리 시스템</h2>
	<div id="container">
		<form action="<%=contextPath %>/login/login.do" method="post" name="adminLoginForm" id="adminLoginForm" >
			<table>
				<tr>
					<td><label for="adminId">ID</label></td>
					<td><input type="text" name="adminId" id="adminId" value=""/></td>
					<td rowspan="2" align=center valign=middle>
						<input type="button" id="adminLogin" name="adminLogin" title="LOG IN" value="LOG IN"/>
					</td>
				</tr>
				<tr>
					<td><label for="adminPassword">PASSWORD</label></td>
					<td><input type="password" name="adminPassword" id="adminPassword" value=""/></td>
				</tr>	
			</table>
		</form>
	</div>
	<div id="footer"></div>
</div>

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>

<script>
$(function(){
	$('#adminLogin').click(adminLoginClick);
});


function adminLoginClick(){
	
	var adminId = $('#adminId').val();
	var adminPassword = $('#adminPassword').val();
	
	$.ajax({
		url: '<%=contextPath%>/login/chkAdminId.do',
		type : 'post',
		datatype : 'json',
		data : {
				"adminId" : adminId
				,"adminPassword" : adminPassword
			},
		success : function(data) {
				if (data.result == "1") {
					document.adminLoginForm.submit();
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

</script>

</body>
</html>