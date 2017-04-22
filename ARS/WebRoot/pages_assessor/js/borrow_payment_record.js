$(function() {
	$('#table_borrow').DataTable( {
		"paging" : true,
		"searching" : true,
		"ordering" : true,
		"info" : true,
		"autoWidth" : false,
		"language" : {
			"url" : "json/datatables_chinese.json"
		}
	});
	$('#table_borrow').on( 'draw.dt', function () {
		var h = $('#frame_borrow_payment_record_page',window.parent.document).contents().find("body").height()+70;
		$('#frame_borrow_payment_record_page',window.parent.document).height(h);
	} );
	$(".money-format").keyup(function () {
        var reg = $(this).val().match(/\d+\.?\d{0,2}/);
        var txt = '';
        if (reg != null) {
            txt = reg[0];
        }
        $(this).val(txt);
    }).change(function () {
        $(this).keypress();
        var v = $(this).val();
        if (/\.$/.test(v))
        {
            $(this).val(v.substr(0, v.length - 1));
        }
    });
	$(".a_clearing").click(function(){
		$("#span_clearing_borrow_id").html($(this).parent().parent().find("td").eq(0).html());
		$("#span_borrow_date").html($(this).parent().parent().find("td").eq(3).html());
		$("#span_borrower_name").html($(this).parent().parent().find("td").eq(5).html());
		$("#span_borrow_amount").html($(this).parent().parent().find("td").eq(6).html());
		$("#span_have_paid").html($(this).parent().parent().find("td").eq(7).html());
		$("#span_need_to_pay").html($(this).parent().parent().find("td").eq(8).html());
		$("#myModal").modal('show');
	});
	$("#btn_clearing_borrow").click(function(){
		if($("#input_pay").val() == ""){
			alert("请输入本次还款金额");
		}else{
			var id = $("#span_clearing_borrow_id").html();
			id = id.substring(3);
			$.ajax({
				url:"borrowAction!clearingBorrow",
				type:"post",
				data:{
					clearingBorrowSheetId:id,
					clearingNumber:$("#input_pay").val()
				},
				success:function(data){
					if (data == 1) {
						$("#myModal").modal('hide');
						$("#tipModalTitle").text("操作成功");
						$("#tipModal").modal("show");
						$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
						setTimeout("$('#tipModal').modal('hide');$('#tipModal').modal('hide');$('#frame_borrow_payment_record_page',window.parent.document).attr('src', $('#frame_borrow_payment_record_page',window.parent.document).attr('src'));", 2000);
					} else{
						$("#myModal").modal('hide');
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

