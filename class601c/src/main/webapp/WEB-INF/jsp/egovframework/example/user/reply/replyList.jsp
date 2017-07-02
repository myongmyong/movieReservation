<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.ReplyVo"%>
<%
	String contextPath = request.getContextPath();
	List<ReplyVo> list = (List<ReplyVo>) request.getAttribute("resultList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평점 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div class="w3-container w3-margin">
	<h2>평점 목록</h2>
	
	<form action="<%=contextPath%>/user/reply/replyList.do" method="post" name="searchForm">
		<input type="hidden" name="pageNo" value="${paging.pageNo}">
	</form>
	

	<div>
		<table class="w3-table w3-bordered w3-striped w3-border test">
			<tr style="background-color:#FFA500">
				<th>회원id</th>
				<th>영화명</th>
				<th>평점</th>
				<th>평점내용</th>
			</tr>
			<%
			for (ReplyVo vo : list) {
			%>
			<tr>
				<td class="w3-center"><%=vo.getUserId()%></td>
				<td class="w3-center"><%=vo.getMovieNm() %></td>
				<td class="w3-center"><%=vo.getReplyGrade()%></td>
				<td class="w3-center"><%=vo.getReplyContent()%></td>
			</tr>
			<%
			}
			%>
		</table>
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

	<script type="text/javascript">
		function goPage(pageNo){
			document.searchForm.pageNo.value = pageNo;
			document.searchForm.submit();
		}
	</script>


</body>
</html>