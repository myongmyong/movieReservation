<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.GuestBookVo" %>
<%@ page import="com.class601.util.Utils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
	GuestBookVo vo = (GuestBookVo) request.getAttribute("resultVo");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<div id="moviewrap">
	<a href="<%=contextPath%>">내 페이지</a>
	<a href="<%=contextPath%>/login/userLoginView.do">로그인</a>
	<a href="<%=contextPath%>/user/user_info/user_InfoView.do">회원가입</a>
	<div id="header">
		<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header_user.jsp">
			<jsp:param name="curMenuUser" value="" />
		</jsp:include>
	</div>
	<div id="container">
	    <div class="loginBody">
	    	<div>
				<input type="button" id="userLogin" value="로그인"/>
	    	</div>
	    	<div>
	            <input type="button" id="guestLogin" value="비회원 로그인"/>
	    	</div>

            <div>
				<h2>비회원 예매 확인/취소</h2>
				<form action="<%=contextPath %>" method="post" name="guestLoginForm" id="guestLoginForm">
					<div>
				
					  <div>
					  이름 
					  </div>
					  <div>
					  <%=vo.getNoUNm()%>
					  </div>
					  <div>
					  영화제목 
					  </div>
					  <div>
					  <%=vo.getMovieNm()%>  
					  </div>
					  <div>
					  상영관
					  </div>
					  <div>
					  <%=vo.getCinemaNm()%>  
					  </div>
					  <div>
					  상영시간
					  </div>
					  <div>
					  상영날짜 <%=vo.getShowDate()%> 상영시간 <%=vo.getStartTime()%>
					  </div>
					  <div>
					  좌석번호 
					  </div>
					  <div>
					  <%=vo.getBookingSeat()%> 
					  </div>
					</div>
				
					<div>
						<input type="button" id="cancleBook" value="예매 취소"/>
						<input type="button" id="returnMenu" value="메인으로 돌아가기"/>
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
    $('#cancleBook').click(cancleBookClick);
    $('#returnMenu').click(returnMenuClick);
});



function userLoginClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/userLoginView.do';
    document.guestLoginForm.submit();
}

function guestLoginClick() {
    document.guestLoginForm.action = '<%=contextPath%>/login/guestLoginView.do';
    document.guestLoginForm.submit();
}

function cancleBookClick() {

}

function returnMenuClick() {
    document.guestLoginForm.action = '<%=contextPath%>/user/main.do';  // 메뉴화면url넣어야함
    document.guestLoginForm.submit();
}

</script>

</body>
</html>