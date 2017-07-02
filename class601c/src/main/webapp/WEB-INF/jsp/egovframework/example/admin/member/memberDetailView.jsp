<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.MemberVo" %>
<%
	String contextPath = request.getContextPath();
	MemberVo vo = (MemberVo)request.getAttribute("resultVo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
<title>회원정보 조회/수정</title>
</head>
<body>
<div class="w3-container w3-margin">
	<h2>회원정보 조회/수정</h2>
	<div class="w3-card-4">
		<div class="w3-container w3-right w3-margin" >	
			<a href="<%=contextPath%>/admin/member/memberList.do" class="w3-btn w3-light-blue">취소</a>
			<a href="<%=contextPath%>/admin/member/memberList.do" class="w3-btn w3-light-blue">목록</a>
		</div>
		<div class="w3-container w3-green">
	  	
		</div>
		<form class="w3-container" action="<%=contextPath %>/admin/member/memberModify.do" method="post">
			
			<label class="w3-label">ID</label>
			<input  class="w3-input" type="text" name="userId" value="<%=vo.getUserId()%>" READONLY>
	
			<label class="w3-label">이름</label>
			<input class="w3-input"  type="text" name="userNm" value="<%=vo.getUserNm()%>" READONLY>
			
			<label class="w3-label">이메일</label>
			<input class="w3-input"  type="text" name="userEmail" value="<%=vo.getUserEmail()%>" READONLY>
			
			<label class="w3-label">생년월일</label>
			<input class="w3-input"  type="text" name="userBirthDate" value="<%=vo.getUserBirthDate()%>" READONLY>
			
			<label class="w3-label">휴대폰 번호</label>
			<input class="w3-input"  type="text" name="userCellphone" value="<%=vo.getUserCellphone()%>" READONLY>
			
			<label class="w3-label">통신사</label>
			<input class="w3-input"  type="text" name="userMobileCarrier" value="<%=vo.getUserMobileCarrier()%>" READONLY>
			
			<label class="w3-label">등급</label>
			<input class="w3-input"  type="text" name="userRating" value="<%=vo.getUserRating()%>">
			
			<label class="w3-label">실적</label>
			<input class="w3-input"  type="text" name="userPerformance" value="<%=vo.getUserPerformance()%>" READONLY>
			
			<input type="submit" class="w3-btn w3-indigo w3-round-xxlarge w3-margin" value="저장">
		</form>
	
	</div>
	
</div>
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>

	$(function(){
		$('#btnLogOut').click(btnLogOutClick);

	});
	
	function btnLogOutClick() {
		document.frm.action = '<%=contextPath%>/admin/login/loginView.do';
	    document.frm.submit();
	}

</script>
</body>
</html>