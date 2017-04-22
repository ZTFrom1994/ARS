$(function(){
	$('#table_account_assessor').DataTable({
	      "paging": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": true,
	      "language": {
	            "url": "json/datatables_chinese.json"
	        }
	});
	$("#btn_add_assessor").click(function(){
		$("#addAssessorModal").modal("show");
	});
	$("#input_assessor_id").blur(function(){
		$.ajax({
			url:'accountAction!assessorIdCheck',
			type:"post",
			data:{
				assessorId:$("#input_assessor_id").val()
			},
			success:function(data){
				if(data == 1){
					$("#assessor_id_tips").addClass("hide");
				}else{
					$("#assessor_id_tips").removeClass("hide");
				}
			}
		});
	});
	//封号
	$(".a-assessor-handle").click(function(){
		if($(this).attr("name") == 0){
			if(confirm("确定要禁封账户："+$(this).attr("title")+"吗？")){
				$.ajax({
					url:"accountAction!disableAssessor",
					type:"post",
					data:{
						assessorId:$(this).attr("title")
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
					url:"accountAction!enableAssessor",
					type:"post",
					data:{
						assessorId:$(this).attr("title")
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
	$("#btn_add_assessor_submit").click(function(){
		$.ajax({
			url:'accountAction!addAssessor',
			type:"post",
			data:{
				assessorId:$("#input_assessor_id").val(),
				assessorName:$("#input_assessor_name").val(),
				assessorDepartment:$("#input_assessor_department").val(),
				assessorPosition:$("#input_assessor_position").val(),
				sex:$("#select_assessor_sex").val(),
			},
			success:function(data){
				if(data == 1){
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

