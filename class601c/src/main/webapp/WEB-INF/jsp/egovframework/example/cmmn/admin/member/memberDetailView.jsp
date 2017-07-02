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
<title>회원정보 조회/수정</title>
</head>
<body>
<div>

	<p>회원정보 조회/수정</p>
	<div>
		<form action="<%=contextPath %>/admin/member/memberModify.do" method="post">
	
			<input type="submit" value="저장">
			<a href="<%=contextPath%>/admin/member/memberDelete.do?userId=<%=vo.getUserId()%>">삭제</a>
			<a href="<%=contextPath%>/admin/member/memberList.do">취소</a>
			<a href="<%=contextPath%>/admin/member/memberList.do">목록</a>
		
			<label>ID</label>
			<input type="text" name="userId" value="<%=vo.getUserId()%>" READONLY>
			
			<label>패스워드</label>
			<input type="text" name="userPassword" value="<%=vo.getUserPassword()%>" READONLY>
	
			<label>이름</label>
			<input type="text" name="userNm" value="<%=vo.getUserNm()%>" READONLY>
			
			<label>이메일</label>
			<input type="text" name="userEmail" value="<%=vo.getUserEmail()%>" READONLY>
			
			<label>생년월일</label>
			<input type="text" name="userBirthDate" value="<%=vo.getUserBirthDate()%>" READONLY>
			
			<label>휴대폰 번호</label>
			<input type="text" name="userCellphone" value="<%=vo.getUserCellphone()%>" READONLY>
			
			<label>통신사</label>
			<input type="text" name="userMobileCarrier" value="<%=vo.getUserMobileCarrier()%>" READONLY>
			
			<label>등급</label>
			<input type="text" name="userRating" value="<%=vo.getUserRating()%>">
			
			<label>실적</label>
			<input type="text" name="userPerformance" value="<%=vo.getUserPerformance()%>" READONLY>
	
		</form>
	
	</div>
	<div>
	<a href="<%=contextPath%>/login/logout.do">로그아웃</a>
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