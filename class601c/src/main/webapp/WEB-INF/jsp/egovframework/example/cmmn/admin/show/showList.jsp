<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.ShowVo"%>
<%
	String contextPath = request.getContextPath();
	List<ShowVo> list = (List<ShowVo>) request.getAttribute("resultList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 정보 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div>
<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header.jsp">
		<jsp:param name="curMenu" value="showInfo" />
</jsp:include>
</div>
<div class="w3-container w3-margin">
	<h2>List</h2> 
	<p>상영 정보 목록</p>
	
	<form action="<%=contextPath%>/admin/show/showList.do" method="post" name="searchForm">
		<input type="hidden" name="pageNo" value="${paging.pageNo}">
	</form>
	
	<div  class="w3-container  w3-right-align  w3-margin">
		<a href="<%=contextPath%>/admin/show/showInsertView.do" class="w3-btn w3-light-blue">상영 정보 등록</a>
	</div>
<div>
		<table class="w3-table w3-bordered w3-striped w3-border test">
			<tr style="background-color:#FFA500">
				<th>상영ID</th>
				<th>영화명</th>
				<th>극장명</th>
				<th>상영관명</th>
				<th>상영관종류명</th>
				<th>시간대</th>
				<th>시작시간</th>
				<th>상영날짜</th>
			</tr>
			<%
			for (ShowVo vo : list) {
			%>
			<tr>
				<td class="w3-center"><a href="<%=contextPath%>/admin/show/showDetailView.do?showId=<%=vo.getShowId()%>"><%=vo.getShowId()%></a></td>
				<td class="w3-center"><%=vo.getMovieNm()%></td>
				<td class="w3-center"><%=vo.getTheaterNm()%></td>
				<td class="w3-center"><%=vo.getCinemaNm()%></td>
				<td class="w3-center"><%=vo.getCinemaTypeNm()%></td>
				<td class="w3-center"><%=vo.getTimeTypeNm()%></td>
				<td class="w3-center"><%=vo.getStartTime()%></td>
				<td class="w3-center"><%=vo.getShowDate()%></td>
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