<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class601.util.Utils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.class601.vo.BookingVo" %>
<%
	String contextPath = request.getContextPath();
	String showId = (String) request.getAttribute("showId");
	String userId = (String) request.getSession().getAttribute("userId");
	String noUId = (String) request.getSession().getAttribute("noUId");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/css/w3.css">

<style>
	.selectedSeat { background-color:#ff0000;}
	.selectSeat { background-color:#ffff80;}
	.table_style { float: left; width:auto; position:relative; padding:1em; }
	
	.table_style ul {
		clear: left;
		margin: 0;
		padding :0;
		list-style-type: none;
	}
	
	.table_style ul li {
		float: left;
		margin: 0;
		padding: 2px 1px;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
		border-left: 1px solid #ccc;
		text-align: center;
	}
	
	.table_style ul .ini {
		width: 2em;
		border-right: 1px solid #ccc;
	}
	
	.table_style ul .col {
		width: 2em;
		border-right: 1px solid #ccc;
	}
	
	.table_style ul .col:hover {
		background-color:#ffff80;
	}
	
</style>
</head>
<body>
<div style="margin:0 auto; width:1000px; height:300px;">
	<div>
		<div style="border:1px solid black; width:500px; height:50px;"><p align="center">SCREEN</p></div>
	</div>
	
<form action="<%=contextPath%>/user/booking/payView.do" method="post" id="selectedSeat" name="selectedSeat">
	<div>
		<input type="hidden" name="showId" id="showId" value="<%=showId%>">
		<input type="hidden" name="userId" id="userId" value="<%=Utils.toEmptySpace(userId)%>">
		<input type="hidden" name="noUId" id="noUId" value="<%=Utils.toEmptySpace(noUId)%>">
		<input type="hidden" name="seatInfo" id="seatInfo" value="">
	</div>
	<div class="table_style">
		<ul>
			<li class="ini">A</li>
		</ul>
		<ul>
			<li class="ini">B</li>
		</ul>
		<ul>
			<li class="ini">C</li>
		</ul>
		<ul>
			<li class="ini">D</li>
		</ul>
		<ul>
			<li class="ini">E</li>
		</ul>
	</div> 
	<div class="table_style">
		<ul>
			<li class="col" id="A1"><span id="A1">1</span></li>
			<li class="col" id="A2"><span id="A2">2</span></li>
		</ul>               
		<ul>                
			<li class="col"id="B1"><span id="B1">1</span></li>
			<li class="col"id="B2"><span id="B2">2</span></li>
		</ul>               
		<ul>                
			<li class="col" id="C1"><span id="C1">1</span></li>
			<li class="col" id="C2"><span id="C2">2</span></li>
		</ul>               
		<ul>                
			<li class="col"id="D1"><span id="D1">1</span></li>
			<li class="col"id="D2"><span id="D2">2</span></li>
		</ul>               
		<ul>                
			<li class="col" id="E1"><span id="E1">1</span></li>
			<li class="col" id="E2"><span id="E2">2</span></li>
		</ul>		
	</div>
	<div class="table_style">
		<ul>
			<li class="col" id="A3"><span id="A3">3</span></li>
			<li class="col" id="A4"><span id="A4">4</span></li>
			<li class="col" id="A5"><span id="A5">5</span></li>
			<li class="col" id="A6"><span id="A6">6</span></li>
			<li class="col" id="A7"><span id="A7">7</span></li>
			<li class="col" id="A8"><span id="A8">8</span></li>
			<li class="col" id="A9"><span id="A9">9</span></li>
		</ul>
		<ul>
			<li class="col" id="B3"><span id="B3">3</span></li>
			<li class="col" id="B4"><span id="B4">4</span></li>
			<li class="col" id="B5"><span id="B5">5</span></li>
			<li class="col" id="B6"><span id="B6">6</span></li>
			<li class="col" id="B7"><span id="B7">7</span></li>
			<li class="col" id="B8"><span id="B8">8</span></li>
			<li class="col" id="B9"><span id="B9">9</span></li>
		</ul>
		<ul>
			<li class="col" id="C3"><span id="C3">3</span></li>
			<li class="col" id="C4"><span id="C4">4</span></li>
			<li class="col" id="C5"><span id="C5">5</span></li>
			<li class="col" id="C6"><span id="C6">6</span></li>
			<li class="col" id="C7"><span id="C7">7</span></li>
			<li class="col" id="C8"><span id="C8">8</span></li>
			<li class="col" id="C9"><span id="C9">9</span></li>
		</ul>
				<ul>
			<li class="col" id="D3"><span id="D3">3</span></li>
			<li class="col" id="D4"><span id="D4">4</span></li>
			<li class="col" id="D5"><span id="D5">5</span></li>
			<li class="col" id="D6"><span id="D6">6</span></li>
			<li class="col" id="D7"><span id="D7">7</span></li>
			<li class="col" id="D8"><span id="D8">8</span></li>
			<li class="col" id="D9"><span id="D9">9</span></li>
		</ul>
		<ul>
			<li class="col" id="E3"><span id="E3">3</span></li>
			<li class="col" id="E4"><span id="E4">4</span></li>
			<li class="col" id="E5"><span id="E5">5</span></li>
			<li class="col" id="E6"><span id="E6">6</span></li>
			<li class="col" id="E7"><span id="E7">7</span></li>
			<li class="col" id="E8"><span id="E8">8</span></li>
			<li class="col" id="E9"><span id="E9">9</span></li>
		</ul>
	</div>
	<div class="table_style">
		<ul>
			<li class="col" id="A10"><span id="A10">10</span></li>
			<li class="col" id="A11"><span id="A11">11</span></li>
		</ul>
		<ul>
			<li class="col" id="B10"><span id="B10">10</span></li>
			<li class="col" id="B11"><span id="B11">11</span></li>
		</ul>
		<ul>
			<li class="col" id="C10"><span id="C10">10</span></li>
			<li class="col" id="C11"><span id="C11">11</span></li>
		</ul>
		<ul>
			<li class="col" id="D10"><span id="D10">10</span></li>
			<li class="col" id="D11"><span id="D11">11</span></li>
		</ul>
		<ul>
			<li class="col" id="E10"><span id="E10">10</span></li>
			<li class="col" id="E11"><span id="E11">11</span></li>
		</ul>		
	</div>
</form>
</div>

<div style="margin-left:13.5em;">
	<input type="button" id="pay" name="pay" value="결제하기" class="w3-btn w3-light-gray">
</div>


<script src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script>
$(function(){
	selectedSeats();
	$('.col').on('click',selectSeat);
	$('#pay').on('click',pay);
});



function selectedSeats(){
	
	var showId = '<%=showId%>';
	
	$.ajax({
		url: '<%=contextPath%>/user/booking/selectedSeats.do',
		type : 'post',
		datatype : 'json',
		data : {
			"showId" : showId
		},
		success : function(data) {
			var list = data.selectedSeats;

			for(var i=0; i < list.length; i++) {
				 $('#'+list[i].bookingSeat).addClass('selectedSeat');
			}
		},
		error : function(req, status, error) {
				alert('서버 에러입니다. 관리자에게 문의해주세요.');
				window.location.reload(true);
		}
	});
	
}

	function selectSeat(){
		if($(this).attr('class').indexOf('selectedSeat') != -1) {
			alert('이미 예매된 좌석입니다. 다시 선택하세요.');
		} else if($(this).attr('class').indexOf('.selectSeat') != -1){
	    	$(this).removeClass('selectSeat');
	    	document.selectedSeat.seatInfo.value = '';
		} else{
	    	$('.col').removeClass('selectSeat');
	    	$(this).addClass('selectSeat');
			document.selectedSeat.seatInfo.value = $(this).attr('id');
	    }
	}
	
	function pay(){
		if($('#seatInfo').val() == ''){
			alert('좌석을 선택하세요.');
			document.event.preventDefault();
		} else {
			document.selectedSeat.submit();
		}
	}
</script>
</body>
</html>