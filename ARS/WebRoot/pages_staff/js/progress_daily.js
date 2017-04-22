$(function(){
	$('#table_daily_progress').DataTable({
	      "paging": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": true,
	      "language": {
	            "url": "json/datatables_chinese.json"
	        }
	 });
	$('#table_daily_progress').on( 'draw.dt', function () {
		var h = $('#frame_search_daily_page',window.parent.document).contents().find("body").height()+70;
		$('#frame_search_daily_page',window.parent.document).height(h);
	} );
	$("input[name='daily_print_radio']").click(function(){
		$("#btn_print_daily_sheet").removeAttr("disabled");
	});
	
	$("#btn_print_daily_sheet").click(function(){
		if($("input[name='daily_print_radio']:checked").val() != undefined){
			$.ajax({
				url:"printAction!dailyReimbursementPrint",
				type:"post",
				data:{
					id:$("input[name='daily_print_radio']:checked").val()
				},
				success:function(data){
					if(data == 1){
						window.open("./pages_staff/sheet_daily_reimbursement.jsp");
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
 