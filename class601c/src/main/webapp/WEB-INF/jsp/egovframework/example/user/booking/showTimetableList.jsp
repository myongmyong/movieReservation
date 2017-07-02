<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.class601.vo.ShowVo"%>
<%@ page import="com.class601.util.Utils"%>
<%
	String contextPath = request.getContextPath();
	List<ShowVo> list = (List<ShowVo>) request.getAttribute("resultList");
	String id = Utils.getId(session, "userId");	
	String nid = Utils.getId(session, "noUId");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화상영시간표</title>
<meta charset="UTF-8">
<title>movies</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=1040" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-panels.min.js"></script>
<script src="js/init.js"></script>
<link rel="stylesheet" href="<%=contextPath%>/css/test/skel-noscript.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/test/style.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/test/style-desktop.css" />
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">
</head>
<body class="homepage">
<div id="wrapper">
	<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/navi_header_user.jsp">
		<jsp:param name="curMenu" value="navi" />
	</jsp:include>
	<div id="header">
		<div class="container">
			<div id="logo">
				<h1><a href="<%=contextPath%>/user/main.do">MOVIE</a></h1>
				<span>Made by class601c</span>
			</div>
		</div>
	</div>
	<div class="container">
		<nav id="nav">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/inc/menu_header_user.jsp">
				<jsp:param name="curMenuUser" value="" />
			</jsp:include>
		</nav>
	</div>
	
	<div class="container">
	    <div id="main">
				<div class="w3-container w3-margin">
				<h1> 상영 시간표  </h1> 
				<div  class="w3-container  w3-right-align  w3-margin">
					<input type="button" id="bookReload" class="w3-btn w3-light-gray" value="예매 다시하기"/>
				</div>
				
			<form action="" method="post" id="bookForm" name="bookForm">
				<div>
					<input type="hidden" id="showId" name="showId" value="" />
					<input type="hidden" id="userId" name="userId" value="<%=id %>" />
				</div>	
				<div style="border: 3px solid gray; float: left; width: 25%; overflow:auto; height:30em; padding:10px;">
					<table class="w3-table w3-bordered w3-striped w3-border test">
						<tr style="background-color:#FFA500">
							<th>영화명</th>
						</tr>
						<%
						for (ShowVo vo : list) {
						%>
						<tr>
							<td id="tdMovieNm" class="tdMovieNm"><a href ="javascript:;" class ="movieNm" movieRating="<%=vo.getMovieRating()%>"><%=vo.getMovieNm()%></a></td>						
						</tr>
						<%
						}
						%>
					</table>
				</div>
				
				<div style="border: 3px solid gray; float: left; width: 25%; overflow:auto; height:30em; padding:10px;">
				<table  class="w3-table w3-bordered w3-striped w3-border test">
					<thead>
						<tr style="background-color:#FFA500">
							<th>극장</th>
						</tr>
					</thead>
					<tbody id = "theater">
					</tbody>
				</table>
				</div>
				
				<div style="border: 3px solid gray; float: left; width: 20%; overflow:auto; height:30em; padding:10px;">
				<table class="w3-table w3-bordered w3-striped w3-border test">
					<thead>
						<tr style="background-color:#FFA500">
							<th>날짜</th>
						</tr>
					</thead>
					<tbody id = "date">
					</tbody>
				</table>
				</div>
				
				<div style="border: 3px solid gray; float: left; width: 25%; overflow:auto; height:30em; padding:10px;">
				<table class="w3-table w3-bordered w3-striped w3-border test">
					<thead>
						<tr style="background-color:#FFA500">
							<th colspan="2">시간</th>
						</tr>
					</thead>
					<tbody id = "time">
			
					</tbody>
				</table>
				</div>
			</form>
			
			<div style="border: 3px solid gray; width: 40%; margin-top: 500px; padding:10px;">
				<table class="w3-table w3-bordered w3-striped w3-border test">
					<thead>
						<tr style="background-color:#FFA500">
							<th colspan="3"><br></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>영화</td>
							<td id="selectedMovie"></td>
						</tr>
						<tr>
							<td>극장</td>
							<td id="selectedTheater"></td>
						</tr>
						<tr>
							<td>일시</td>
							<td id="selectedDate"></td>
						</tr>
						<tr>
							<td>상영관</td>
							<td id="selectedCinema"></td>
						</tr>
					</tbody>
				</table>
				<div  class="w3-container  w3-right-align  w3-margin">
					<input type="button" id="booking" class="w3-btn w3-light-gray" value="예매하기"/>
				</div>
				</div>	
		    </div>
		</div> 	
	</div>
</div>

	

<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>


$(function(){
	$('a.movieNm').on('click',selectShow);
	$('#bookReload').on('click',bookReload);
	$('#booking').on('click',booking);
	$('#myPage').on('click',goLogin);
	
	$('.tdMovieNm').click(function() {
	    if($(this).attr('style')){
	    	$(this).removeAttr('style');
	    }else{
	    	$('.tdMovieNm').removeAttr('style');
	    	$(this).css('background', '#bbb');
	    }
	});
});
	
	function selectShow(){
		var thisLevel = $(this).attr('class');
		var value = $(this).text();
		var movieRating = $(this).attr('movieRating')

		if(thisLevel  == 'movieNm'){
			document.bookForm.showId.value = '';	
			
			$.ajax({
				url :'<%=contextPath%>/user/booking/timeTalbleTheater.do',
				type :'post',
				datatype : 'json',
				data : {"movieNm": value},
				success:
					function(data){
					var list = data.theaterList;
					$('#theater').html('');
					$('#date').html('');
					$('#time').html('');
					for(var i=0;i<list.length;i++){
						$('#theater').append('<tr><td class="tdTheaterNm" ><a href="javascript:;" class="theaterNm" movienm="'+value+'">'+list[i].theaterNm+'</a></td></tr>');
					}
					$('a.theaterNm').on('click',selectShow);
				    $('.tdTheaterNm').click(function() {
					    if($(this).attr('style')){
					    	$(this).removeAttr('style');
					    }else{
					    	$('.tdTheaterNm').removeAttr('style');
					    	$(this).css('background', '#bbb');
					    }
					});
					$('#selectedMovie').text(value +' '+ movieRating);
					$('#selectedTheater').text('');
					$('#selectedDate').text('');
					$('#selectedCinema').text('');
				},
				error:
					function(req,status,error){
					alert('서버 에러입니다. 관리자에게 문의해주세요');
					document.locatrion.reload(true);
				}
			});
			
		}else if(thisLevel =='theaterNm'){
			document.bookForm.showId.value = '';
			
			var movie = $(this).attr('movienm');
			
			$.ajax({
				url: '<%=contextPath%>/user/booking/timeTalbleDate.do',
	               type: 'post',
	               datatype: 'json',
	               data: 
	                  {
	                     "movie":movie
	                     ,"theater":value
	                  },
	               success:
	                  function(data){
	                     var list = data.dateList;
	                     $('#date').html('');
	                     $('#time').html('');
	                     for(var i=0;i<list.length;i++){
	                        $('#date').append('<tr><td class="tdDate" ><a href="javascript:;" class="date" movienm="'+movie+'" theater ="'+value+'">'+list[i].showDate+'</a></td></tr>');               
	                     }
	 				     $('.tdDate').click(function() {
						    if($(this).attr('style')){
						    	$(this).removeAttr('style');
						    }else{
						    	$('.tdDate').removeAttr('style');
						    	$(this).css('background', '#bbb');
						    }
						 });
	                     $('a.date').on('click',selectShow);
	                     $('#selectedTheater').text(value);
	                     $('#selectedDate').text('');
	 					 $('#selectedCinema').text('');
	                  },
	               error: 
	                  function(req, status, error){
	                     alert('서버 에러입니다. 관리자에게 문의해주세요.');
	                     document.location.reload(true);
	                  }
				
				
				
			});
		}else if(thisLevel =='date'){
			document.bookForm.showId.value = '';
			
			var movie =$(this).attr('movienm');
			var theater =$(this).attr('theater');
			
			$.ajax({
				url: '<%=contextPath%>/user/booking/timeTableTime.do',
	               type: 'post',
	               datatype: 'json',
	               data: 
	                  {
	                     "movie":movie
	                     ,"theater":theater
	                     ,"date":value
	                  },
	               success:
	                  function(data){
	                     var list = data.timeList;
	                     $('#time').html('');
	                     for(var i=0;i<list.length;i++){
	                    	
	                        $('#time').append('<tr><td class="tdTime" ><a href="javascript:;" class="time" movienm="'+movie+'" theater="'+theater+'" date="'+value+'" cinema="'+list[i].cinemaNm+'">'+list[i].startTime+'</a></td><td>['+list[i].cinemaNm+']</td></tr>');               
	                     }
	 				     $('.tdTime').click(function() {
							    if($(this).attr('style')){
							    	$(this).removeAttr('style');
							    }else{
							    	$('.tdTime').removeAttr('style');
							    	$(this).css('background', '#bbb');
							    }
						 });
	                     $('a.time').on('click',selectShow);
	                     $('#selectedDate').text(value);
	                     $('#selectedCinema').text('');
	                  },
	               error: 
	                  function(req, status, error){
	                     alert('서버 에러입니다. 관리자에게 문의해주세요.');
	                     document.location.reload(true);
	                  }
			});
			
		}else if(thisLevel == 'time'){
			var movie =$(this).attr('movienm');
			var theater =$(this).attr('theater');
			var date =$(this).attr('date');
			var cinema = $(this).attr('cinema');

			$.ajax({
				url: '<%=contextPath%>/user/booking/timeTableShowId.do',
	               type: 'post',
	               datatype: 'json',
	               data: 
	                  {
	                     "movie":movie
	                     ,"theater":theater
	                     ,"date":date
	                     ,"cinema":cinema
	                     ,"time":value
	                  },
	               success:
	                  function(data){
	                     var showVo = data.showVo;         
	                     document.bookForm.showId.value = showVo.showId;	                     
	                     $('#selectedDate').text('');
	                     $('#selectedDate').text(date + ' ' + value);
	                     $('#selectedCinema').text(cinema);
	                  },
	               error: 
	                  function(req, status, error){
	                     alert('서버 에러입니다. 관리자에게 문의해주세요.');
	                     document.location.reload(true);
	                  }
			});			
		}
		
	} 
	
	function bookReload(){
		document.location.reload();
	}

	function booking(){
		var id = '<%=id%>';
		var nid = '<%=nid%>';
		
		if(!$('#showId').val()){
			alert('상영 정보를 선택해주십시오.');
			document.event.preventDefault();
		}else if(id == '' && nid == ''){
			alert('로그인이 필요합니다.');
			document.location.href = '<%=contextPath%>/login/userLoginView.do';
		}else{
		var cw=screen.availWidth;     	//화면 넓이
		var ch=screen.availHeight;    	//화면 높이
        var sw=500;    					//띄울 창의 넓이
		var sh=500;    					//띄울 창의 높이
		var ml=(cw-sw)/2;        		//가운데 띄우기위한 창의 x위치
		var mt=(ch-sh)/2;         		//가운데 띄우기위한 창의 y위치	
			
		var newWin = window.open('about:blank','selectSeat','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
		var frm = document.bookForm;
		
		frm.action = '<%=contextPath %>/user/booking/selectSeat.do';
		frm.target = 'selectSeat';
		frm.method = 'post';
		frm.submit();
		}
	}
	
	function goLogin(){
		var id = '<%=id%>';
		
		if(id == ''){
			alert('로그인이 필요합니다.');
			document.location.href = '<%=contextPath%>/login/userLoginView.do';
		}else{
			document.location.href = '<%=contextPath%>/user/mypage/bookingInfo.do?userId=<%=id%>';
		}
	}
</script>
</body>
</html>