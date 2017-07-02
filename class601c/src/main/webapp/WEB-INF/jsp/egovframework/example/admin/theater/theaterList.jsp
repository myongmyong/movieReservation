<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.TheaterVo"%>
<%
	String contextPath = request.getContextPath();
	List<TheaterVo> list = (List<TheaterVo>) request.getAttribute("resultList");
	String theaterId = (String) request.getAttribute("theaterId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div>
<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header.jsp">
		<jsp:param name="curMenu" value="theaterInfo" />
</jsp:include>
</div>
<div class="w3-container w3-margin">
	<h2>극장 목록</h2> 
	<form action="<%=contextPath%>/admin/theater/theaterList.do" method="post" name="searchForm">
		<input type="hidden" name="pageNo" value="${paging.pageNo}">
	</form>
	<div  class="w3-container  w3-right-align  w3-margin">
		<a href="<%=contextPath%>/admin/theater/theaterInsertView.do?theaterId=<%=""%>" class="w3-btn w3-light-blue">극장 등록</a>
	</div>
	
	<div>
		<table class="w3-table w3-bordered w3-striped w3-border test">
			<tr style="background-color:#FFA500">
				<th>극장ID</th>
				<th>극장명</th>
				<th>(구)주소</th>
				<th>새주소</th>
				<th>전화번호</th>
				<th>상영관수</th>
				<th>총 좌석</th>
				<th>지역</th>
			</tr>
			<%
			for (TheaterVo vo : list) {
			%>
			<tr>
				<td class="w3-center"><a href="<%=contextPath%>/admin/theater/theaterDetailView.do?theaterId=<%=vo.getTheaterId()%>"><%=vo.getTheaterId()%></a></td>
				<td class="w3-center"><%=vo.getTheaterNm()%></td>
				<td class="w3-center"><%=vo.getTheaterOldAddress()%></td>
				<td class="w3-center"><%=vo.getTheaterNewAddress()%></td>
				<td class="w3-center"><%=vo.getTheaterTel()%></td>
				<td class="w3-center"><%=vo.getTheaterCinemaNum()%></td>
				<td class="w3-center"><%=vo.getTheaterSeatNum()%></td>
				<td class="w3-center"><%=vo.getTheaterArea()%></td>
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