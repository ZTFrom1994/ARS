$(function(){
	$('#travel_project_datatable').DataTable( {
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
	$('#travel_counteract_datatable').DataTable( {
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
	
	$("#travel_select_counteract").change(function(){
		
	      if($("#travel_select_counteract").val()=="0"){
	    	  $("#travel_counteract_selections").removeClass("hide");
	      }else{
	    	  $("#travel_counteract_selections").addClass("hide");
	      }

	});
	
	 $('#traveling_datepicker').datepicker({
	      autoclose: true,
	      format:'yyyy-mm-dd'
	});
	 var calendarOptions ={
				customButtons: {
						init: {
					         	text: '展开日程表',
					         	click: function() {
									$('#travel_reimbursement_calendar').fullCalendar('destroy');
									$('#travel_reimbursement_calendar').fullCalendar(calendarOptions);
				         		}
				     	},
				     	refresh: {
				     		text: '刷新数据',
				     		click: function() {
				     		$('#travel_reimbursement_calendar').fullCalendar( 'refetchEvents' );
				     		}
				     	},
		 				myCustomButton: {
				            text: '重新选择',
				            click: function() {
								$('#travel_reimbursement_calendar').fullCalendar('destroy');
								$('#travel_reimbursement_calendar').fullCalendar(calendarOptions);
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
					$("#t_has_selected_time").html(startTime+"至"+endTime);
			    },
			    selectOverlap:false,
				events: "eventAction!getAllEventJson" 
			};
		$('#travel_reimbursement_calendar').fullCalendar(calendarOptions);
		
		$("#btn_travel_submit").click(function(){
			var selectedTime = $("#t_has_selected_time").html();
			var  str = "";
			if($("#input_people_number").val() == ""){
				alert("请输入出差人数");
			}else if($("input_travel_place").val() == ""){
				alert("请输入出差地点");
			}else if($("#traveling_datepicker").datepicker("getDate") == "Invalid Date"){
				alert("请选择出差时间");
			}else if($("#travel_select_counteract").val()=="1"){
				//不冲借款
				if($("input[name='travel_reimbursement_project_radio']:checked").val() == undefined){
					alert("请选择报销项目");
				}else if(selectedTime == "暂无"){
					alert("请选择预约时间");
				}else{
					for ( var i = 0; i < 4; i++) {
						if(i == 0 || i == 3){
							var largeClass = $("#table_travel_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
							var smallClass = $("#table_travel_reimbursement").find("tr").eq(i+1).find("td").eq(1).html();
						}else{
							var largeClass = "交通费";
							var smallClass = $("#table_travel_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
						}
						
						var people = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(0).val();
						var singlePrice = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(1).val();
						var number = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(2).val();
						var description = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(3).val();
						if(people != "" && singlePrice!= "" && number!="" ){
							str += largeClass+"-"+smallClass+"-"+people+"-"+singlePrice+"-"+number+"-"+description+"</br>"; 
						} 
					}
					var start = selectedTime.split("至")[0];
					var end = selectedTime.split("至")[1];
					var date = $("#traveling_datepicker").datepicker("getDate");
					var s_date = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+" 00:00:00";
					$.ajax({
						url:"travelReimbursementAction!addSingleApplication",
						type:"post",
						data:{
							items:str,
							counteractFlag:1,
							projectId:$("input[name='travel_reimbursement_project_radio']:checked").attr("title"),
							remarks:$("#travel_reimbursement_message").val(),
							paymentType:0,
							startTime:start,
							endTime:end,
							peopleNumber:$("#input_people_number").val(),
							travelTime:s_date,
							place:$("#input_travel_place").val(),
							totalMoney:$(".travel_reimbursement_total_money").html(),
							totalSheets:$(".travel_reimbursement_total_sheets").html()
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
			}else{
				//冲借款
				if($("#travel_counteract_number").val() == ""){
					alert("请输入冲款金额");
				}else if($("input[name='travel_reimbursement_borrowing_radio']:checked").val() == undefined){
					alert("请选择借款项目");
				}else if($("input[name='travel_reimbursement_project_radio']:checked").val() == undefined){
					alert("请选择报销项目");
				}else if(selectedTime == "暂无"){
					alert("请选择预约时间");
				}else {
					for ( var i = 0; i < 4; i++) {
						if(i == 0 || i == 3){
							var largeClass = $("#table_travel_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
							var smallClass = $("#table_travel_reimbursement").find("tr").eq(i+1).find("td").eq(1).html();
						}else{
							var largeClass = "交通费";
							var smallClass = $("#table_travel_reimbursement").find("tr").eq(i+1).find("td").eq(0).html();
						}
						
						var people = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(0).val();
						var singlePrice = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(1).val();
						var number = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(2).val();
						var description = $("#table_travel_reimbursement").find("tr").eq(i+1).find("input").eq(3).val();
						if(people != "" && singlePrice!= "" && number!="" ){
							str += largeClass+"-"+smallClass+"-"+people+"-"+singlePrice+"-"+number+"-"+description+"</br>"; 
						} 
					}
					var start = selectedTime.split("至")[0];
					var end = selectedTime.split("至")[1];
					var date = $("#traveling_datepicker").datepicker("getDate");
					var s_date = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+" 00:00:00";
					$.ajax({
						url:"travelReimbursementAction!addSingleApplication",
						type:"post",
						data:{
							items:str,
							counteractFlag:0,
							projectId:$("input[name='travel_reimbursement_project_radio']:checked").attr("title"),
							remarks:$("#travel_reimbursement_message").val(),
							paymentType:0,
							startTime:start,
							endTime:end,
							peopleNumber:$("#input_people_number").val(),
							travelTime:s_date,
							place:$("#input_travel_place").val(),
							totalMoney:$(".travel_reimbursement_total_money").html(),
							totalSheets:$(".travel_reimbursement_total_sheets").html(),
							borrowRecordId:$("input[name='travel_reimbursement_borrowing_radio']:checked").attr("title"),
							counteractNumber:$("#travel_counteract_number").val()
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
		});
})