<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>일정관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/calendar/fullcalendar.css"/>
<link rel="stylesheet" type="text/css" href="/resources/calendar/fullcalendar.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/calendar/fullcalendar.min.js"/>
<link rel="stylesheet" type="text/css" href="/resources/calendar/fullcalendar.js"/>
<link rel="stylesheet" type="text/css" href="/resources/calendar/jquery-ui.min.js"/>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
$(function(){
	
	calendarEvent();
});
function calendarEvent(eventData){
	
	$("#calendar").html("");
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	var calendar = $('#calendar').fullCalendar({
		
		header:{
			center:"title",
			right:"today prev,next"
		},
		editable:true,
		titleFormat:{
			month: "yyyy년  MMMM",
			week: "[yyyy] MMM dd일 {[yyyy] MMM dd일}",
			day: "yyyy년 MMM d일 dddd"
		},
		allDayDefault : false,
		defaultView:"month",
		editable:false,
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort:["일","월","화","수","목","금","토"],
		buttomText:{
			today:"오늘",
			month:"월별",
			week: "주별",
			day: "일별",
		},
		events : eventData,
		timeFormat : "HH:mm",
			
		
		
	});
}
});


</script>




</head>
<body>

<div id="calendar"></div>



	
	
	
</body>
</html>
