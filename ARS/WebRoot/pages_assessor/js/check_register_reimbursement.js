$(function() {
	$(".check-ok-text").click(function(){
		$(this).addClass("check-ok-text-click");
		$(this).addClass("crr-selected");
		$(this).next().removeClass("check-no-text-click");
		$(this).next().removeClass("crr-selected");
		$("#btn_r_check_register_submit").removeAttr("disabled");
	});
	$(".check-no-text").click(function(){
		$(this).addClass("check-no-text-click");
		$(this).addClass("crr-selected");
		$(this).prev().removeClass("check-ok-text-click");
		$(this).prev().removeClass("crr-selected");
		$("#btn_r_check_register_submit").removeAttr("disabled");
	});
	$('#table_reservated_reimbursement').DataTable( {
		"paging" : true,
		"searching" : true,
		"ordering" : true,
		"info" : true,
		"autoWidth" : true,
		"language" : {
			"url" : "json/datatables_chinese.json"
		}
	});
	
	$("#btn_r_check_register_submit").click(function(){
		if($(".invoice_options").find(".crr-selected").size() == $(".invoice_options").parent().next().find(".crr-selected").size()){
			if($(".crr-selected").size() == 0){
				alert("请选择至少一项！");
			}else{
				var size = $(".crr-selected").size()/2;
				var str = "";
				for ( var int = 0; int < size; int++) { 
					var message = $("tbody").find(".crr-selected").eq(int*2+1).parent().parent().next().find("textarea").val();
					str += $("tbody").find(".crr-selected").eq(int*2).attr("title")+
					$("tbody").find(".crr-selected").eq(int*2+1).attr("title")+
					"-"+( message == ""?"无":message)
					+";";
				}
				$.ajax({
					url:"checkAndRegisterAction!checkReimbursement",
					type:"post",
					data:{
						order:str	
					},
					success:function(data){
						if (data == 1) {
							$("#tipModalTitle").text("操作成功");
							$("#tipModal").modal("show");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
							setTimeout("$('#tipModal').modal('hide');$('#tipModal').modal('hide');location.href='./pages_assessor/main.jsp';", 2000);
						} else{
							$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
							$("#tipModalTitle").text("操作失败！请重试"); 
							$("#tipModal").modal("show");
							setTimeout("$('#tipModal').modal('hide');", 2000);
						} 
					}
				})
				
			}
		}else{
			alert("发票审核与审核结果需要同时提交！");
		}
		
	});
});