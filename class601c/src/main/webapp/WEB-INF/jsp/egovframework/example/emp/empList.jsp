<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.EmpVo"%>
<%
	String contextPath = request.getContextPath();
	List<EmpVo> list = (List<EmpVo>) request.getAttribute("resultList");
	String empno = (String) request.getAttribute("empno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
<div class="w3-container w3-margin">
	<h2>List</h2> 
	<p>목록 조회 페이지입니다.</p>
	<div >
		<form action="<%=contextPath%>/emp/empList.do" method="post" name="searchForm">
			사번조회 : <input type="text" class="w3-input  w3-border w3-round-large "
				name="empno" value="<%=empno %>" style="width:30%;display:inline">	 
				<input type="submit" class="w3-btn w3-indigo w3-round-xxlarge" value="검색">
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
		</form>
	</div>
	
	<div  class="w3-container  w3-right-align  w3-margin">
		<a href="<%=contextPath%>" class="w3-btn w3-light-blue">처음으로</a>
	</div>
	
	<div  class="w3-container  w3-right-align  w3-margin">
		<a href="<%=contextPath%>/emp/empList.do" class="w3-btn w3-light-blue">목록</a>
	</div>
	
	<div  class="w3-container  w3-right-align  w3-margin">
		<a href="<%=contextPath%>/emp/empAddView.do?deptno=<%=""%>" class="w3-btn w3-light-blue">사원추가</a>
	</div>
	
	<div>
		<table class="w3-table w3-bordered w3-striped w3-border test">
			<tr class="w3-red">
				<th>사번</th>
				<th>이름</th>
				<th>수행업무</th>
				<th>매니저사번</th>
				<th>고용일</th>
				<th>연봉</th>
				<th>인센티브</th>
				<th>부서번호</th>
				<th>갱신</th>
				<th>삭제</th>
			</tr>
			<%
			for (EmpVo vo : list) {
			%>
			<tr>
				<td class="w3-center"><a href="<%=contextPath%>/emp/empView.do?empno=<%=vo.getEmpNo()%>"><%=vo.getEmpNo()%></a></td>
				<td class="w3-center"><%=vo.geteName()%></td>
				<td class="w3-center"><%=vo.getJob()%></td>
				<td class="w3-center"><%=vo.getMgr()%></td>
				<td class="w3-center"><%=vo.getHireDate()%></td>
				<td class="w3-right-align"><%=vo.getSal()%></td>
				<td class="w3-right-align"><%=vo.getComm()%></td>
				<td class="w3-center"><%=vo.getDeptNo()%></td>
				<td class="w3-center"><a href="<%=contextPath%>/emp/empModifyView.do?empno=<%=vo.getEmpNo()%>&deptno=<%=""%>">갱신</a></td>
				<td class="w3-center"><a href="<%=contextPath%>/emp/empDelete.do?empno=<%=vo.getEmpNo() %>">삭제</a></td>
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



















