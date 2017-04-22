$(function(){
	$('#table_travel_progress').DataTable({
		"paging": true,
		"searching": true,
		"ordering": true,
		"info": true,
		"autoWidth": true,
		"language": {
		"url": "json/datatables_chinese.json"
	}
	});
	$('#table_travel_progress').on( 'draw.dt', function () {
		var h = $('#frame_search_travel_page',window.parent.document).contents().find("body").height()+70;
		$('#frame_search_travel_page',window.parent.document).height(h);
	} );
	$("input[name='travel_print_radio']").click(function(){
		$("#btn_print_travel_sheet").removeAttr("disabled");
	});
	$("#btn_print_travel_sheet").click(function(){
		if($("input[name='travel_print_radio']:checked").val() != undefined){
			$.ajax({
				url:"printAction!travelReimbursementPrint",
				type:"post",
				data:{
					id:$("input[name='travel_print_radio']:checked").val()
				},
				success:function(data){
					if(data == 1){
						window.open("./pages_staff/sheet_travel_reimbursement.jsp");
					}else{
						alert("打印信息出错！");
					}
				}
			});
		}else{
			alert("请选择打印项目");
		}
	});
});
 