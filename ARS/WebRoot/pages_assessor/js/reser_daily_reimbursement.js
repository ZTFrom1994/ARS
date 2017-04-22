$(function() {
	$(".td-pass").click(function(){
		$(this).addClass("pass-click");
		$(this).addClass("selected");
		$(this).next().removeClass("no-pass-click");
		$(this).next().removeClass("selected");
		$("#btn_daily_submit").removeAttr("disabled");
	});
	$(".td-no-pass").click(function(){
		$(this).addClass("no-pass-click");
		$(this).addClass("selected");
		$(this).prev().removeClass("pass-click");
		$(this).prev().removeClass("selected");
		$("#btn_daily_submit").removeAttr("disabled");
	});
	$('#table_audit_daily_reimbursement').DataTable( {
		"paging" : true,
		"searching" : true,
		"ordering" : true,
		"info" : true,
		"autoWidth" : true,
		"language" : {
			"url" : "json/datatables_chinese.json"
		},
	});
	$("#btn_daily_submit").click(function(){
		var str = "";
		for ( var int = 0; int < $(".selected").size(); int++) {
			str += $(".selected").eq(int).attr("title")+",";
		}
		if (str != "") {
			str = str.substring(0, str.length - 1);
		}
		$.ajax({
			url:"reservationProcessAction!dailyProcess",
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
		});
	});
});