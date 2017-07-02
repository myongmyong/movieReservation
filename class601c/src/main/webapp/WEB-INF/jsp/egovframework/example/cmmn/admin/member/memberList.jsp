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
<title>회원정보 목록</title>
</head>
<body>
	<div>
		<p>회원정보 목록</p>

		<div>
			<form action="" method="post" name="frm" id="frm">
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
					<table>
						<tr>
							<th>ID</th>
							<th>패스워드</th>
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
							<td><a href="<%=contextPath %>/admin/member/memberDetailView.do?userId=<%=vo.getUserId()%>"> <%=vo.getUserId()%> </a></td>
							<td><%=vo.getUserPassword()%></td>
							<td><%=vo.getUserNm()%></td>
							<td><%=vo.getUserEmail()%></td>
							<td><%=vo.getUserBirthDate()%></td>
							<td><%=vo.getUserCellphone()%></td>
							<td><%=vo.getUserMobileCarrier()%></td>
							<td><%=vo.getUserRating()%></td>
							<td><%=vo.getUserPerformance()%></td>
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

	<div>
	<a href="<%=contextPath%>/login/logout.do">로그아웃</a>
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