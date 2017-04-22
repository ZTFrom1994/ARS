$(function(){
	
	$.ajax({
		url:"loginAction!loadAssessorData",
		type:"post",
		success: function(data) {
		
		}
	});
	$("#a-logout").click(function(){
		$.ajax({
			url:"loginAction!logout",
			type:"post",
			success:function(){
				location.href="login.jsp"
			}
		});
	});
	$(".a-no-read-message,#a_watch_all_messages").click(function(){
		$.ajax({
			url:"messageAction!clearAssessorNoReadMessage",
			type:"post",
			success:function(){
			
			}
		});
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		$("#li_second_breadcrumb").html("我的消息");
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		$(".div-pages").addClass("hide");
		$("#div_my_messages_page").removeClass("hide"); 
		$("#label_header_h1").html("我的消息");
		$("#label_header_small").html("");
		
	});
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
	
	$("#btn_operation_search").click(function(){
		$.ajax({
			url:"searchAction!searchOperation",
			type:"post",
			data:{
				applicationType:$("#search_select_application_type").val(),
				checkType:$("#search_select_check_type").val(),
				selectResult:$("#search_select_result").val(),
			},
			success:function(data){
					if(data == 1){
						//面包屑导航2,3级显示
						$("#li_second_breadcrumb").addClass("hide");
						$("#li_third_breadcrumb").removeClass("hide");
						$("#li_second_breadcrumb").removeClass("active");
						$("#li_third_breadcrumb").addClass("active");
						//设置2,3级文字
						$("#li_third_breadcrumb").html("我的操作记录");
						$(".sidebar-menu  li").removeClass("active");
						$(this).parent().addClass("active"); 
						$(".div-pages").addClass("hide");
						$("#label_header_h1").html("我的操作记录");
						$("#label_header_small").html("在此浏览我的操作记录");
						$("#frame_search_operation_page").removeClass("hide"); 
						$('#frame_search_operation_page').attr('src', $('#frame_search_operation_page').attr('src'));
					}else{
						alert("查询出错！");
					}
				
			}
		});
	});
});
function searchOnload(){
	var tHeight = $("#frame_search_operation_page").contents().find("body").height()+70;
	$('#frame_search_operation_page').height(tHeight);
}

function borrowOnload(){
	var tHeight = $("#frame_borrow_payment_record_page").contents().find(".box").height()+70;
	$('#frame_borrow_payment_record_page').height(tHeight);
}
