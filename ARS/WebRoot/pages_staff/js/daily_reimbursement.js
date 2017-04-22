$(function() {
	$('#daily_project_datatable').DataTable({
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
	$('#daily_counteract_datatable').DataTable( {
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
	$("#daily_select_counteract").change(function(){
			
	      if($("#daily_select_counteract").val()=="0"){
	    	  $("#daily_counteract_selections").removeClass("hide");
	      }else{
	    	  $("#daily_counteract_selections").addClass("hide");
	      }

	});
	var calendarOptions ={
			customButtons: {
					init: {
				     	text: '展开日程表',
				     	click: function() {
							$('#daily_reimbursement_calendar').fullCalendar('destroy');
							$('#daily_reimbursement_calendar').fullCalendar(calendarOptions);
				 		}
					},
					refresh: {
			     		text: '刷新',
			     		click: function() {
							$('#daily_reimbursement_calendar').fullCalendar('destroy');
							$('#daily_reimbursement_calendar').fullCalendar(calendarOptions);
			     		}
			     	},
			        myCustomButton: {
			            text: '重新选择',
			            click: function() {
							$('#daily_reimbursement_calendar').fullCalendar('destroy');
							$('#daily_reimbursement_calendar').fullCalendar(calendarOptions);
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
			unselectAuto:false,
			selectHelper:true,
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
				var startTime = moment(start).format("YYYY-MM-DD HH:mm:00");
				var endTime = moment(end).format("YYYY-MM-DD HH:mm:00");
				$("#d_has_selected_time").html(startTime+"至"+endTime);
		    },
		    selectOverlap:false,
			events: "eventAction!getAllEventJson", 
		};
	$('#daily_reimbursement_calendar').fullCalendar(calendarOptions);
	
	$("#btn_daily_submit").click(function(){
		var selectedTime = $("#d_has_selected_time").html();
		var  str = "";
		if($("#daily_select_counteract").val()=="1"){
			if($("input[name='daily_reimbursement_project_radio']:checked").val() == undefined){
				alert("请选择报销项目");
			}else{
				if($("#daily_reimbursement_message").val() == ""){
					alert("请填写报销事由");
				}else{
					if(selectedTime == "暂无"){
						alert("请选择预约时间");
					}else{
						for ( var i = 0; i < 8; i++) {
							if(i == 1 || i == 2){
								var largeClass = "办公用品";
								var smallClass = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
								var description = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(4).html();
							}else{
								var largeClass = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
								var smallClass = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(1).html();
								var description = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(5).html();
							}
							
							
							var details = $("#table_daily_reimbursement").find("tr").eq(i+1).find("input").eq(0).val();
							var number = $("#table_daily_reimbursement").find("tr").eq(i+1).find("input").eq(1).val();
							var amount = $("#table_daily_reimbursement").find("tr").eq(i+1).find("input").eq(2).val();
							if(details != "" && number != "" && amount != ""){
								str += largeClass+"-"+smallClass+"-"+details+"-"+number+"-"+amount+"-"+description+"</br>"; 
							} 
						}
						var start = selectedTime.split("至")[0];
						var end = selectedTime.split("至")[1];
						//不冲借款
						$.ajax({
							url:"dailyReimbursementAction!addSingleApplication",
							type:"post",
							data:{
								items:str,
								counteractFlag:1,
								projectId:$("input[name='daily_reimbursement_project_radio']:checked").attr("title"),
								message:$("#daily_reimbursement_message").val(),
								paymentType:0,
								startTime:start,
								endTime:end,
								totalMoney:$(".daily_reimbursement_total_money").html(),
								totalNumber:$(".daily_reimbursement_total_number").html()
						    },
							dataType:"text",
						    success:function(data){
								if (data == 1) {
									$("#tipModalTitle").text("预约报销申请已提交");
									$("#tipModal").modal("show");
									$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
									setTimeout("$('#tipModal').modal('hide');$('#tipModal').modal('hide');location.reload();", 2000);
								} else if(data == -1){
									$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
									$("#tipModalTitle").text("预约时间出错，请重新选择"); 
									$("#tipModal").modal("show");
									setTimeout("$('#tipModal').modal('hide');", 2000);
								} else {
									$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
									$("#tipModalTitle").text("未知错误！"); 
									$("#tipModal").modal("show");
									setTimeout("$('#tipModal').modal('hide');", 2000);
								}
								
							}
						});
					}
				}
			}
		}else{
			if($("#daily_counteract_number").val() == ""){
				alert("请输入冲款金额");
			}else{
				if($("input[name='daily_reimbursement_borrowing_radio']:checked").val() == undefined){
					alert("请选择借款项目");
				}else{
					if($("input[name='daily_reimbursement_project_radio']:checked").val() == undefined){
						alert("请选择报销项目");
					}else{
						if($("#daily_reimbursement_message").val() == ""){
							alert("请填写报销事由");
						}else{
							if(selectedTime == "暂无"){
								alert("请选择预约时间");
							}else{
								for ( var i = 0; i < 8; i++) {
									if(i == 1 || i == 2){
										var largeClass = "办公用品";
										var smallClass = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
										var description = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(4).html();
									}else{
										var largeClass = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
										var smallClass = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(1).html();
										var description = $("#table_daily_reimbursement").find("tr").eq(i+1).find("td").eq(5).html();
									}
									
									
									var details = $("#table_daily_reimbursement").find("tr").eq(i+1).find("input").eq(0).val();
									var number = $("#table_daily_reimbursement").find("tr").eq(i+1).find("input").eq(1).val();
									var amount = $("#table_daily_reimbursement").find("tr").eq(i+1).find("input").eq(2).val();
									if(details != "" && number != "" && amount != ""){
										str += largeClass+"-"+smallClass+"-"+details+"-"+number+"-"+amount+"-"+description+"</br>"; 
									} 
								}
								var start = selectedTime.split("至")[0];
								var end = selectedTime.split("至")[1];
								//不冲借款
								$.ajax({
									url:"dailyReimbursementAction!addSingleApplication",
									type:"post",
									data:{
										items:str,
										counteractFlag:0,
										borrowRecordId:$("input[name='daily_reimbursement_borrowing_radio']:checked").attr("title"),
										counteractNumber:$("#daily_counteract_number").val(),
										projectId:$("input[name='daily_reimbursement_project_radio']:checked").attr("title"),
										message:$("#daily_reimbursement_message").val(),
										paymentType:0,
										startTime:start,
										endTime:end,
										totalMoney:$(".daily_reimbursement_total_money").html(),
										totalNumber:$(".daily_reimbursement_total_number").html()
								    },
									dataType:"text",
								    success:function(data){
										if (data == 1) {
											$("#tipModalTitle").text("预约报销申请已提交");
											$("#tipModal").modal("show");
											$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
											setTimeout("$('#tipModal').modal('hide');$('#tipModal').modal('hide');location.reload();", 2000);
										} else if(data == -1){
											$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
											$("#tipModalTitle").text("预约时间出错，请重新选择"); 
											$("#tipModal").modal("show");
											setTimeout("$('#tipModal').modal('hide');", 2000);
										} else {
											$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
											$("#tipModalTitle").text("未知错误！"); 
											$("#tipModal").modal("show");
											setTimeout("$('#tipModal').modal('hide');", 2000);
										}
										
									}
								});
							}
						}
					}
				}
			}
			
		}
		
	});
});