<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String showId = (String) request.getAttribute("showId");
	String userId = (String) request.getAttribute("userId");
	String noUId = (String) request.getAttribute("noUId");
	String seatInfo = (String) request.getAttribute("seatInfo");
	String totalPrice = (String) request.getAttribute("totalPrice");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<form action="" method="post" id="payForm" name="payForm">
		<input type="hidden" name="showId" value="<%=showId%>">
		<input type="hidden" name="userId" value="<%=userId%>">
		<input type="hidden" name="noUId" value="<%=noUId%>">
		<input type="hidden" name="seatInfo" value="<%=seatInfo%>">
		<input type="hidden" name="totalPrice" value="<%=totalPrice%>">
	</form>

	<div>
		<span>결제 금액 : <%=totalPrice%> 원</span>
	</div>
	<br>
	<div>
		<label class="w3-label">카드종류</label>
		<select>
			<option>신한카드</option>
			<option>국민카드</option>
			<option>우리카드</option>
			<option>현대카드</option>
			<option>농협카드</option>
		</select>
		<br>		
		<label class="w3-label">카드번호</label>
		<input class="w3-input" style="width:50px" type="text">
		-<input class="w3-input" style="width:50px" type="password">
		-<input class="w3-input" style="width:50px" type="password">
		-<input class="w3-input" style="width:50px" type="text">
		<br>		
		<label class="w3-label">비밀번호</label>
		<input class="w3-input" style="width:50px" type="password">**	
		<br>	
		<label class="w3-label">유효기간</label>
		<input class="w3-input" style="width:50px" type="text">월	
		<input class="w3-input" style="width:50px" type="text">년	
		<br>	
		<label class="w3-label">법정생년월일</label>
		<input class="w3-input" type="text">		
	</div>
	<br>
	<div>
		<input type="button" id="pay" name="pay" value="결제하기">
	</div>
	
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
$(function(){
	$('#pay').on('click',pay);
});

	function pay(){
		opener.window.name = 'paySuccess';
		document.payForm.target = 'paySuccess';
		document.payForm.action = '<%=contextPath%>/user/booking/pay.do';
		document.payForm.submit();
		window.close();
	}
</script>
</body>
</html>