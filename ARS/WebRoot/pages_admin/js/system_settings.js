$(function(){
	$(' input[type="radio"].square-black').iCheck({
        radioClass: 'iradio_square' 
      });
	$("#btn_system_open").click(function(){
		var msg_val = $("input[name='system_on_off']:checked").val();
		$.ajax({
			url:"systemSettingAction!updateOpening",
			type:"post",
			data:{
				openFlag:msg_val
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