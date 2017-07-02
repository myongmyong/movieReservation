<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.ReplyVo"%>
<%@ page import="com.class601.vo.MovieVo"%>
<%@ page import="com.class601.util.Utils" %>
<%
	String contextPath = request.getContextPath();
	String nextId = (String) request.getAttribute("nextId");
	MovieVo movieVo = (MovieVo) request.getAttribute("resultVo");
	ReplyVo vo = (ReplyVo)request.getAttribute("reply");
	String id = Utils.getId(session, "userId");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평점 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body>
	<div class="w3-container w3-margin">
		<h2>Add</h2>
		<p>평점 등록</p>

		<div class="w3-card-4">
			
		<form class="w3-container" name="insertForm" id="insertForm" action="" method="post">
				
				<input type="hidden" name="userId" value="<%=id%>">
				
				<table>
					<tr>
						<td><label for="replyId">ID</label></td>
						<td><input class="w3-input" style="width: 500px;" type="text" name="replyId" id="replyId" readonly value="<%=nextId%>" /></td>
					</tr>

					<tr>
						<td><label for="movieNm">영화제목</label></td>
						<td>
							<input class="w3-input" style="width: 500px;" type="text" name="movieNm" id="movieNm" value="<%=movieVo.getMovieNm() %>">
							<input type="hidden" id="movieId" name="movieId" value="<%=movieVo.getMovieId()%>">
						</td>
					</tr>
					
					<tr>
						<td><label for="replyGrade">평점</label></td>
						<td>
							<div id="star" ></div>
						    <div style="padding-top:20px;">
						      	<input type="hidden" id="replyGrade" name="replyGrade" value="3"/>
						    </div>
						</td>
					</tr>
					
					<tr>
						<td><label for="replyContent">감상평</label></td>
						<td><input class="w3-input" style="width: 500px;" type="text" name="replyContent" id="replyContent"/></td>
					</tr>
					
				</table>
				
				<div class="w3-container w3-right w3-margin" >
					<input type="button" id="replyReg" class="w3-btn w3-indigo w3-round-xxlarge w3-margin" value="등록">
				</div>
			</form>
			
		</div>
	</div>
<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
$(function(){
	$('#replyReg').on('click',reply);
});

	function reply(){
		opener.window.name = 'movieDetail';
		document.insertForm.target = 'movieDetail';
		document.insertForm.action = '<%=contextPath%>/user/reply/replyInsert.do';
		document.insertForm.submit();
		window.close();
	}
</script>
<script src="<%=contextPath%>/js/jquery.raty.js"></script>
<script>

$(function() {
    $('div#star').raty({
        score: 3
        ,path : "<%=contextPath%>/images"
        ,width : 200
        ,click: function(score, evt) {
            $("#replyGrade").val(score);
        }
    });
});

</script>
</body>
</html>