$(function(){
	$('#table_borrow_progress').DataTable({
		"paging": true,
		"searching": true,
		"ordering": true,
		"info": true,
		"autoWidth": true,
		"language": {
		"url": "json/datatables_chinese.json"
	}
	});
	$('#table_borrow_progress').on( 'draw.dt', function () {
		var h = $('#frame_search_borrow_page',window.parent.document).contents().find("body").height()+70;
		$('#frame_search_borrow_page',window.parent.document).height(h);
	} );
	$("input[name='borrow_print_radio']").click(function(){
		$("#btn_print_borrow_sheet").removeAttr("disabled");
	});
	$("#btn_print_borrow_sheet").click(function(){
		if($("input[name='borrow_print_radio']:checked").val() != undefined){
			$.ajax({
				url:"printAction!borrowApplicationPrint",
				type:"post",
				data:{
					id:$("input[name='borrow_print_radio']:checked").val()
				},
				success:function(data){
					if(data == 1){
						window.open("./pages_staff/sheet_borrow_application.jsp");
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
 