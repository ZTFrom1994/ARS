$(function() {
	$(".check-ok-text").click(function(){
		$(this).addClass("check-ok-text-click");
		$(this).addClass("crb-selected");
		$(this).next().removeClass("check-no-text-click");
		$(this).next().removeClass("crb-selected");
		$("#btn_b_check_register_submit").removeAttr("disabled");
	});
	$(".check-no-text").click(function(){
		$(this).addClass("check-no-text-click");
		$(this).addClass("crb-selected");
		$(this).prev().removeClass("check-ok-text-click");
		$(this).prev().removeClass("crb-selected");
		$("#btn_b_check_register_submit").removeAttr("disabled");
	});
	$('#table_audit_borrow').DataTable( {
		"paging" : true,
		"searching" : true,
		"ordering" : true,
		"info" : true,
		"autoWidth" : true,
		"language" : {
			"url" : "json/datatables_chinese.json"
		}
	});
	$("#btn_b_check_register_submit").click(function(){
		if($(".crb-selected").size() == 0){
			alert("请选择至少一项！");
		}else{
			var size = $(".crb-selected").size();
			var str = "";
			for ( var int = 0; int < size; int++) { 
				var message = $("tbody").find(".crb-selected").eq(int).parent().parent().next().find("textarea").val();
				str += $("tbody").find(".crb-selected").eq(int).attr("title")+
				"-"+( message == ""?"无":message)
				+";";
			}
			$.ajax({
				url:"checkAndRegisterAction!checkBorrow",
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
	});
});