$(function(){
		$('#borrow_application_datatable').DataTable({
			"paging" : true,
			"searching" : true,
			"ordering" : true,
			"info" : true,
			"autoWidth" : true,
			// "lengthMenu": [6,-1],
			"language" : {
				"url" : "json/datatables_chinese.json"
			}
		});
		
		var calendarOptions ={
				customButtons: {
						init: {
					         	text: '展开日程表',
					         	click: function() {
									$('#borrow_application_calendar').fullCalendar('destroy');
									$('#borrow_application_calendar').fullCalendar(calendarOptions);
				         		}
				     	},
				     	refresh: {
				     		text: '刷新数据',
				     		click: function() {
				     		$('#borrow_application_calendar').fullCalendar( 'refetchEvents' );
				     		}
				     	},
		 				myCustomButton: {
				            text: '重新选择',
				            click: function() {
								$('#borrow_application_calendar').fullCalendar('destroy');
								$('#borrow_application_calendar').fullCalendar(calendarOptions);
								$("#input_selected_time").val("暂无");
				            }
				        }
				    },
				header: {
				        right: 'none',
				        center: 'title',
				        left: 'init refresh prev,next today myCustomButton' 
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
				selectable: true,
				selectHelper:true,
				unselectAuto:false,
				selectAllow:function(selectInfo){
					var a = moment(selectInfo.start).format("YYYY-MM-DD HH:mm");
					var b = moment(selectInfo.end).format("YYYY-MM-DD HH:mm");
					if(moment(b).diff(moment(a), 'minutes') > 60){ 
						return false;
					}else{
						return true;
					}
				},
			    select: function (start, end, jsEvent, view) {
					var startTime = moment(start).format("YYYY-MM-DD HH:mm");
					var endTime = moment(end).format("YYYY-MM-DD HH:mm");
					$("#b_has_selected_time").html(startTime+"至"+endTime);
			    },
			    selectOverlap:false,
				events: "eventAction!getAllEventJson" 
			};
		$('#borrow_application_calendar').fullCalendar(calendarOptions);
		
		$("#btn_borrow_submit").click(function(){
			if($(".user-borrow-limit").eq(0).html() == "0"){
				alert("您当前不被允许进行借款");
			}else{
				var selectedTime = $("#b_has_selected_time").html();
				var ex = /^\d+$/;
				if($("input[name='borrow_application_project_radio']:checked").val() == undefined){
					alert("请选择借款项目");
				}else if($("#input_borrow_number").val() == ""){
					alert("请输入借款金额");
				}else if(($("#input_borrow_number").val()+1-1) > ($(".user-borrow-limit").eq(0).html()+1-1)){
					alert("您输入的借款金额大于上限");
				}else if(!ex.test($("#input_borrow_number").val())){
					alert("您输入的借款金额有误");
				}else if(selectedTime == "暂无"){
					alert("请选择预约时间");
				}else{
					var start = selectedTime.split("至")[0];
					var end = selectedTime.split("至")[1];
					$.ajax({
						url:"borrowAction!addBorrowApplication",
						type:"post",
						data:{
							projectId:$("input[name='borrow_application_project_radio']:checked").parent().parent().find("td").eq(0).html(),
							borrowNumber:$("#input_borrow_number").val(),
							remarks:$("#borrow_application_remarks").val(),
							startTime:start,
							endTime:end,
							use:$("#borrow_select_use").val()=="0"?"预支":"其他",
							paymentDays:$(".input_payment_days").val()
					    },
						dataType:"text",
					    success:function(data){
							if (data>0) {
								$("#tipModalTitle").text("预约申请已提交");
								$("#tipModal").modal("show");
								$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
								setTimeout("$('#tipModal').modal('hide');$('#loginModal').modal('hide');location.reload();", 2000);
							} else {
								$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
								$("#tipModalTitle").text("预约时间出错，请重新选择"); 
								$("#tipModal").modal("show");
								setTimeout("$('#tipModal').modal('hide');", 2000);
							}
						}
					});
				}
			}
			
		});
})