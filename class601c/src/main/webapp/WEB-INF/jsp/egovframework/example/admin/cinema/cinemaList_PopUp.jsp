<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.CinemaVo"%>
<%@ page import="com.class601.vo.TheaterVo"%>
<%
	String contextPath = request.getContextPath();
	List<CinemaVo> list = (List<CinemaVo>) request.getAttribute("resultList");
	TheaterVo tVo = (TheaterVo) request.getAttribute("resultVo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 목록 조회 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
	<div class="w3-container w3-margin">
		<h2><%=tVo.getTheaterNm() %>의 상영관 목록</h2>
		
		<div>
			<form action="<%=contextPath%>/admin/cinema/cinemaList_PopUp.do?theaterId=<%=tVo.getTheaterId()%>" method="post" name="searchForm">
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
			</form>
		</div>
		<div>
			<table class="w3-table w3-bordered w3-striped w3-border test">
				<tr class="w3-red">
					<th></th>
					<th>상영관id</th>
					<th>극장명</th>
					<th>상영관명</th>
					<th>상영관종류id</th>
					<th>상영관 종류명</th>
					<th>총좌석수</th>
					<th>층수</th>
				</tr>

				<%
					for(CinemaVo vo : list){
				%>
				<tr class="chk">
					<td class="w3-center"><input type="checkbox" name="chk" value="<%=vo.getCinemaId()%>" /></td>
					<td class="w3-center"><%=vo.getCinemaId()%></td>
					<td class="w3-center"><%=tVo.getTheaterNm() %></td>
					<td class="w3-center"><%=vo.getCinemaNm()%></td>
					<td class="w3-center"><%=vo.getCinemaTypeId()%></td>
					<td class="w3-center"><%=vo.getCinemaTypeNm()%></td>
					<td class="w3-center"><%=vo.getCinemaSeatNum()%></td>
					<td class="w3-center"><%=vo.getCinemaFloorNo()%></td>
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
	<div  class="w3-container  w3-right-align  w3-margin">
		<input type="hidden" id="selectId" value="">
		<input type="hidden" id="selectNm" value="">		
		<input type="hidden" id="selectTypeId" value="">
		<input type="hidden" id="selectTypeNm" value="">		
    	<input type="button" id="insert" value="등록" />	  
	</div>	
<div  class="w3-container  w3-right-align  w3-margin">
<a href="<%=contextPath%>/login/logout.do" class="w3-btn w3-light-blue">로그아웃</a>
</div>
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
	$(function(){
		$('#insert').click(act);
		$('.chk').click(selectAttr);
	});
	
	
	function selectAttr(){
		var arrMovie = $(this).find('td');	
		
		$('#selectId').val($(arrMovie[1]).text().trim());
		$('#selectNm').val($(arrMovie[3]).text().trim());
		$('#selectTypeId').val($(arrMovie[4]).text().trim());
		$('#selectTypeNm').val($(arrMovie[5]).text().trim());
	}
	
	function act(){
		window.opener.insertForm.cinemaId.value = $('#selectId').val();
		window.opener.insertForm.cinemaNm.value = $('#selectNm').val();
		window.opener.insertForm.cinemaTypeId.value = $('#selectTypeId').val();
		window.opener.insertForm.cinemaTypeNm.value = $('#selectTypeNm').val();
		window.close();
	}
	
	function goPage(pageNo){
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