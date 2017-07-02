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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록</title>
</head>
<body>
	<div>
		<p>상영관 종류 목록</p>
		<div>
			<input type="button" id="btnAdd" value="상영관 종류 등록" />
		</div>


		<div>
			<form action="" method="post" name="frm" id="frm">
				<input type="hidden" name="chkList" value="" /> 
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
					<table>
						<tr>
							<th></th>
							<th>상영관종류ID</th>
							<th>상영관 종류명</th>
							<th>상영관 종류별 가격</th>
						</tr>
	
						<%
							for (CiTypeVo vo : list) {
						%>
						<tr>
							<td><input type="checkbox" name="chk" value="<%=vo.getCinemaTypeId()%>" /></td>
							<td><a href="<%=contextPath %>/admin/ci_type/ci_typeDetailView.do?cinemaTypeId=<%=vo.getCinemaTypeId()%>"> <%=vo.getCinemaTypeId()%> </a></td>
							<td><%=vo.getCinemaTypeNm()%></td>
							<td><%=vo.getCinemaTypePrice()%></td>
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
		<input type="button" id="btnRtn" value="등록" />
	</div>
	<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
	<script>
	
		$(function(){
			$('#btnAdd').click(btnAddClick);
			$('#btnRtn').click(btnRtnClick);
	
		});
		
		function btnAddClick() {
			document.frm.action = '<%=contextPath%>/admin/ci_type/ci_typeInsertView.do';
		    document.frm.submit();
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
		
		
		function goPage(pageNo) {
			document.searchForm.pageNo.value = pageNo;
			document.searchForm.submit();
		}
		
	</script>
</body>
</html>