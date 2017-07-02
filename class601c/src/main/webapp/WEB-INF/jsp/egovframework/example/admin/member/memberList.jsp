<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.MemberVo"%>
<%@ page import="java.util.List"%>
<%
	String contextPath = request.getContextPath();
	List<MemberVo> list = (List<MemberVo>)request.getAttribute("resultList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
<title>회원정보 목록</title>
</head>
<body>
<div>
<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header.jsp">
		<jsp:param name="curMenu" value="theaterInfo" />
</jsp:include>
</div>
	<div class="w3-container w3-margin">
		<h2>회원정보 목록</h2>
		<br/>
		<div>
			<form action="" method="post" name="frm" id="frm">
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
					<table class="w3-table w3-bordered w3-striped w3-border test">
						<tr  class="w3-purple">
							<th>ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>생년월일</th>
							<th>휴대폰 번호</th>
							<th>통신사</th>
							<th>등급</th>
							<th>실적</th>
						</tr>
	
						<%
							for (MemberVo vo : list) {
						%>
						<tr>
							<td class="w3-left-align"><a href="<%=contextPath %>/admin/member/memberDetailView.do?userId=<%=vo.getUserId()%>"> <%=vo.getUserId()%> </a></td>
							<td class="w3-left-align"><%=vo.getUserNm()%></td>
							<td class="w3-left-align"><%=vo.getUserEmail()%></td>
							<td class="w3-left-align"><%=vo.getUserBirthDate()%></td>
							<td class="w3-left-align"><%=vo.getUserCellphone()%></td>
							<td class="w3-left-align"><%=vo.getUserMobileCarrier()%></td>
							<td class="w3-left-align"><%=vo.getUserRating()%></td>
							<td class="w3-left-align"><%=vo.getUserPerformance()%></td>
						</tr>
						<%
							}
						%>
	
					</table>
			</form>
		</div>

		<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/paging.jsp">
			<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			<jsp:param name="startPageNo" value="${paging.startPageNo}" />
			<jsp:param name="pageNo" value="${paging.pageNo}" />
			<jsp:param name="endPageNo" value="${paging.endPageNo}" />
			<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
	</div>
	
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>

	$(function(){
		$('#btnAdd').click(btnAddClick);
		$('#btnLogOut').click(btnLogOutClick);

	});
	
	function btnAddClick() {
		document.frm.action = '<%=contextPath%>/admin/member/memberInsertView.do';
	    document.frm.submit();
	}
	
	function btnLogOutClick() {
		document.frm.action = '<%=contextPath%>/admin/login/loginView.do';
	    document.frm.submit();
	}

	function goPage(pageNo) {
		document.searchForm.pageNo.value = pageNo;
		document.searchForm.submit();
	}
	
</script>
</body>
</html>