$(function(){
	var calendarOptions ={
			header: {
			        right: 'none',
			        center: 'title',
			        left: 'prev,next today ' 
	    	},
			defaultView:'agendaWeek',
			defaultDate:moment().add("1","days"),
			weekends:false, 
			editable: true,
			slotEventOverlap:false,
			allDaySlot:false,
			timeFormat:"H:mm",
			selectMaxDistance:30, 
			snapDuration:"00:20:00",
			slotDuration:"00:10:00",
			minTime:"8:00:00",
			maxTime:"16:00:00",
			selectable: false,
			events: "eventAction!getAllEventJson", 
		};
	$('#assessor_calender').fullCalendar(calendarOptions);
	
})