$(function() {
	$(".td-pass").click(function(){
		$(this).addClass("pass-click");
		$(this).addClass("borrow-selected");
		$(this).next().removeClass("no-pass-click");
		$(this).next().removeClass("borrow-selected");
		$("#btn_borrow_submit").removeAttr("disabled");
	});
	$(".td-no-pass").click(function(){
		$(this).addClass("no-pass-click");
		$(this).addClass("borrow-selected");
		$(this).prev().removeClass("pass-click");
		$(this).prev().removeClass("borrow-selected");
		$("#btn_borrow_submit").removeAttr("disabled");
	});
	$('#table_audit_borrow_reimbursement').DataTable( {
		"paging" : true,
		"searching" : true,
		"ordering" : true,
		"info" : true,
		"autoWidth" : true,
		"language" : {
			"url" : "json/datatables_chinese.json"
		},
	});
	$("#btn_borrow_submit").click(function(){
		var str = "";
		for ( var int = 0; int < $(".borrow-selected").size(); int++) {
			str += $(".borrow-selected").eq(int).attr("title")+",";
		}
		if (str != "") {
			str = str.substring(0, str.length - 1);
		}
		$.ajax({
			url:"reservationProcessAction!borrowProcess",
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