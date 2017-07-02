<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.CiTypeVo"%>
<%@ page import="java.util.List"%>
<%
	String contextPath = request.getContextPath();
	List<CiTypeVo> list = (List<CiTypeVo>)request.getAttribute("resultList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath %>/css/w3.css">
</head>
<body>
<div class="w3-container w3-margin">
	<h2>상영관 종류 목록</h2> 
	<div >
		<form action="<%=contextPath %>/admin/ci_type/ci_typeList.do" method="post" name="searchForm">
				<input type="hidden" name="chkList" value="" /> 
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
		</form>
	</div>
	<div  class="w3-container  w3-right-align  w3-margin">
		<input type="button" id="btnAdd" class="w3-btn w3-light-blue" value="상영관 종류 등록" />
	</div>
	<div>
		<table class="w3-table w3-bordered w3-striped w3-border test">
			<tr class="w3-green">
				<th class="w3-center"></th>
				<th class="w3-center">상영관 종류 ID</th>
				<th class="w3-center">상영관 종류명</th>
				<th class="w3-center">상영관 종류별 가격</th>
			</tr>				
			<%
				for (CiTypeVo vo : list) {
			%>
			<tr>
				<td class="w3-center"><input type="checkbox" name="chk" value="<%=vo.getCinemaTypeId()%>" /></td>
				<td class="w3-center"><a href="<%=contextPath %>/admin/ci_type/ci_typeDetailView.do?cinemaTypeId=<%=vo.getCinemaTypeId()%>"> <%=vo.getCinemaTypeId()%> </a></td>
				<td class="w3-center"><%=vo.getCinemaTypeNm()%></td>
				<td class="w3-center"><%=vo.getCinemaTypePrice()%></td>
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
	<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
	<script>
		function goPage(pageNo) {
			document.searchForm.pageNo.value = pageNo;
			document.searchForm.submit();
		}
	
		$(function(){
			$('#btnAdd').click(btnAddClick);
			$('#btnRtn').click(btnRtnClick);
	
		});
		
		function btnAddClick() {
			document.searchForm.action = '<%=contextPath%>/admin/ci_type/ci_typeInsertView.do';
		    document.searchForm.submit();
		}
		
		function btnRtnClick() {
			//돌아갈 페이지 루트 받을 것
		}
	
		function checkedList() {
			var arrChk = [];
			$('input[name="chk"]:checked').each(function() {
				arrChk.push($(this).val());
			});
			return arrChk;
		}

		$(document).ready(function() {
		    $('input[type="checkbox"][name="chk"]').click(function(){
		        if ($(this).prop('checked')) {
		            $('input[type="checkbox"][name="chk"]').prop('checked', false);
		            $(this).prop('checked', true);
		        }
		    });
		});		
	</script>
</body>
</html>