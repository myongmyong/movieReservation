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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시간대 목록</title>
</head>
<body>
	<div>
		<p>시간대 목록</p>
		<div>
			<input type="button" id="btnAdd" value="시간대 등록" />
		</div>


		<div>
			<form action="" method="post" name="frm" id="frm">
				<input type="hidden" name="chkList" value="" /> 
				<input type="hidden" name="pageNo" value="${paging.pageNo}">
					<table>
						<tr>
							<th></th>
							<th>시간대ID</th>
							<th>시간대명</th>
							<th>시간대별 가격</th>
						</tr>
	
						<%
							for (TimeVo vo : list) {
						%>
						<tr class="chk">
							<td><input type="checkbox" name="chk" value="<%=vo.getTimeTypeId()%>" /></td>
							<td><a href="<%=contextPath %>/admin/time/timeDetailView.do?timeTypeId=<%=vo.getTimeTypeId()%>"> <%=vo.getTimeTypeId()%> </a></td>
							<td><%=vo.getTimeTypeNm()%></td>
							<td><%=vo.getTimeTypePrice()%></td>
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
		<input type="hidden" id="selectNm" value="">		
    	<input type="button" id="insert" value="등록" />	  
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
				
		function selectAttr(){
			var arrMovie = $(this).find('td');	
			
			$('#selectId').val($(arrMovie[1]).text().trim());
			$('#selectNm').val($(arrMovie[2]).text().trim());
		}
		
		function act(){
			window.opener.insertForm.timeTypeId.value = $('#selectId').val();
			window.opener.insertForm.timeTypeNm.value = $('#selectNm').val();
			window.close();
		}		
	
		function goPage(pageNo) {
			document.searchForm.pageNo.value = pageNo;
			document.searchForm.submit();
		}
		
	</script>
</body>
</html>