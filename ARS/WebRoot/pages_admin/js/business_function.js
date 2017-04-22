$(function(){
	$("#btn_function_submit").click(function(){
		$.ajax({
			url:"systemSettingAction!updateFunctions",
			type:"post",
			data:{
				dailyFunction:$("input[name='daily_function_radio']:checked").val(),
				travelFunction:$("input[name='travel_function_radio']:checked").val(),
				offsetFunction:$("input[name='offset_function_radio']:checked").val(),
				borrowFunction:$("input[name='borrow_function_radio']:checked").val()
			},
			success:function(data){
				if (data == 1) {
					$("#tipModalTitle").text("保存成功");
					$("#tipModal").modal("show");
					$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
					setTimeout("$('#tipModal').modal('hide');$('#tipModal').modal('hide');location.reload();", 2000);
				} else if(data == -1){
					$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
					$("#tipModalTitle").text("保存失败"); 
					$("#tipModal").modal("show");
					setTimeout("$('#tipModal').modal('hide');", 2000);
				} else {
					$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
					$("#tipModalTitle").text("未知错误"); 
					$("#tipModal").modal("show");
					setTimeout("$('#tipModal').modal('hide');", 2000);
				}
			}
		})
	});
})