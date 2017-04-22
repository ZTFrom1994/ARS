$(function(){
		$('#table_account_staff').DataTable({
			"paging": true,
			"searching": true,
			"ordering": true,
			"info": true,
			"autoWidth": true,
			"language": {
			"url": "json/datatables_chinese.json"
		}
		});
	$("#btn_add_staff").click(function(){
		$("#addStaffModal").modal("show");
	});
	//封号
	$(".a-staff-handle").click(function(){
		if($(this).attr("name") == 0){
			if(confirm("确定要禁封账户："+$(this).attr("title")+"吗？")){
				$.ajax({
					url:"accountAction!disableStaff",
					type:"post",
					data:{
						staffId:$(this).attr("title")
					},
					success:function(data){
						if(data  == 1){
							$("#tipModalTitle").text("操作成功");
							$("#tipModal").modal("show");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
							setTimeout("$('#tipModal').modal('hide');$('#loginModal').modal('hide');location.reload();", 2000);
						}else{
							alert("操作异常，请稍后重试！");
						}
					}
				});
			}
		}else{
			if(confirm("确定要解封账户："+$(this).attr("title")+"吗？")){
				$.ajax({
					url:"accountAction!enableStaff",
					type:"post",
					data:{
						staffId:$(this).attr("title")
					},
					success:function(data){
						if(data  == 1){
							$("#tipModalTitle").text("操作成功");
							$("#tipModal").modal("show");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
							setTimeout("$('#tipModal').modal('hide');$('#tipModal').modal('hide');location.reload();", 2000);
						}else{
							alert("操作异常，请稍后重试！");
						}
					}
				});
			}
		}
		
	});
	
	//提示id是否合法
	$("#input_staff_id").blur(function(){
		$.ajax({
			url:'accountAction!staffIdCheck',
			type:"post",
			data:{
				staffId:$("#input_staff_id").val()
			},
			success:function(data){
				if(data == 1){
					$("#staff_id_tips").addClass("hide");
				}else{
					$("#staff_id_tips").removeClass("hide");
				}
			}
		});
	});
	//添加用户
	$("#btn_add_staff_submit").click(function(){
		$.ajax({
			url:'accountAction!addStaff',
			type:"post",
			data:{
				staffId:$("#input_staff_id").val(),
				staffName:$("#input_staff_name").val(),
				staffDepartment:$("#input_staff_department").val(),
				staffPosition:$("#input_staff_position").val(),
				sex:$("#select_staff_sex").val(),
			},
			success:function(data){
				if(data == 1){
					$("#addstaffModal").modal("hide");
					$("#tipModalTitle").text("账户添加成功");
					$("#tipModal").modal("show");
					$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
					setTimeout("$('#tipModal').modal('hide');$('#loginModal').modal('hide');location.reload();", 2000);
				}else{
					$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
					$("#tipModalTitle").text("添加账户失败，请重试"); 
					$("#tipModal").modal("show");
					setTimeout("$('#tipModal').modal('hide');", 2000);
				}
			}
		});
	});
	
})