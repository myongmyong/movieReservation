<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class601.vo.TimeVo"%>
<%@ page import="java.util.List"%>
<%
	String contextPath = request.getContextPath();
	List<TimeVo> list = (List<TimeVo>)request.getAttribute("resultList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>시간대 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
	<div class="w3-container w3-margin">
		<h2>시간대 목록</h2>
		<div>
			<form action="<%=contextPath%>/admin/time/timeList_PopUp.do" method="post" name="searchForm">
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
			</form>
		</div>
		<div>
			<table class="w3-table w3-bordered w3-striped w3-border test">
				<tr style="background-color:#FFA500">
					<th class="w3-center"></th>
					<th class="w3-center">시간대ID</th>
					<th class="w3-center">시간대명</th>
					<th class="w3-center">시간대별 가격</th>
				</tr>
				<%
					for (TimeVo vo : list) {
				%>
				<tr class="chk">
					<td class="w3-center"><input type="checkbox" name="chk" value="<%=vo.getTimeTypeId()%>" /></td>
					<td class="w3-center"><%=vo.getTimeTypeId()%></a></td>
					<td class="w3-center"><%=vo.getTimeTypeNm()%></td>
					<td class="w3-center"><%=vo.getTimeTypePrice()%></td>
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
	<div class="w3-container  w3-right-align  w3-margin">
		<input type="hidden" id="selectId" value="">
		<input type="hidden" id="selectNm" value=""> <input type="button" id="insert" value="등록" />
	</div>
	
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
		$(function(){
			$('#btnAdd').click(btnAddClick);
			$('#insert').click(act);
			$('.chk').click(selectAttr);
	
		});
		
		function btnAddClick() {
			document.frm.action = '<%=contextPath%>/admin/time/timeInsertView.do';
			document.frm.submit();
		}

		function selectAttr() {
			var arrMovie = $(this).find('td');

			$('#selectId').val($(arrMovie[1]).text().trim());
			$('#selectNm').val($(arrMovie[2]).text().trim());
		}

		function act() {
			window.opener.insertForm.timeTypeId.value = $('#selectId').val();
			window.opener.insertForm.timeTypeNm.value = $('#selectNm').val();
			window.close();
		}

		function goPage(pageNo) {
			document.searchForm.pageNo.value = pageNo;
			document.searchForm.submit();
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