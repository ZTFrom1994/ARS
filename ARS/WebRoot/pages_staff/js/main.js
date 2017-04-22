$(function(){
	$.ajax({
		url:"loginAction!loadStaffData",
		type:"post",
		success: function(data) {
			
		}
	});
	$(".a-no-read-message,#a_watch_all_messages").click(function(){
		$.ajax({
			url:"messageAction!clearStaffNoReadMessage",
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
	$("#a-logout").click(function(){
		$.ajax({
			url:"loginAction!logout",
			type:"post",
			success:function(){
				location.href="login.jsp"
			}
		});
	});
	
	$("#btn_progress_search").click(function(){
		var id = $("#search_reim_id").val();
		var type = $("#search_select_type").val();
		$.ajax({
			url:"searchAction!searchProgress",
			type:"post",
			data:{
				searchType:type,
				searchProgress:$("#search_select_progress").val(),
				searchId:id == "" ? 0:id
			},
			success:function(data){
				if($("#search_select_type").val() == 0){
					if(data == 1){
						//面包屑导航2,3级显示
						$("#li_second_breadcrumb").addClass("hide");
						$("#li_third_breadcrumb").removeClass("hide");
						$("#li_second_breadcrumb").removeClass("active");
						$("#li_third_breadcrumb").addClass("active");
						//设置2,3级文字
						$("#li_third_breadcrumb").html("申请进度查询");
						$(".sidebar-menu  li").removeClass("active");
						$(this).parent().addClass("active"); 
						$(".div-pages").addClass("hide");
						$("#label_header_h1").html("日常报销进度查询");
						$("#label_header_small").html("在此浏览您申请过的业务");
						$("#frame_search_daily_page").removeClass("hide"); 
						$('#frame_search_daily_page').attr('src', $('#frame_search_daily_page').attr('src'));
					}else{
						alert("查询出错！");
					}
				}else if($("#search_select_type").val() == 1){
					if(data == 1){
						//面包屑导航2,3级显示
						$("#li_second_breadcrumb").addClass("hide");
						$("#li_third_breadcrumb").removeClass("hide");
						$("#li_second_breadcrumb").removeClass("active");
						$("#li_third_breadcrumb").addClass("active");
						//设置2,3级文字
						$("#li_third_breadcrumb").html("申请进度查询");
						$(".sidebar-menu  li").removeClass("active");
						$(this).parent().addClass("active"); 
						$(".div-pages").addClass("hide");
						$("#frame_search_travel_page").removeClass("hide"); 
						$("#label_header_h1").html("差旅费报销进度查询");
						$("#label_header_small").html("在此浏览您申请过的业务");
						$('#frame_search_travel_page').attr('src', $('#frame_search_travel_page').attr('src'));
					}else{
						alert("查询出错！");
					}
				}else if($("#search_select_type").val() == 2){
					if(data == 1){
						//面包屑导航2,3级显示
						$("#li_second_breadcrumb").addClass("hide");
						$("#li_third_breadcrumb").removeClass("hide");
						$("#li_second_breadcrumb").removeClass("active");
						$("#li_third_breadcrumb").addClass("active");
						//设置2,3级文字
						$("#li_third_breadcrumb").html("申请进度查询");
						$(".sidebar-menu  li").removeClass("active");
						$(this).parent().addClass("active"); 
						$(".div-pages").addClass("hide");
						$("#frame_search_borrow_page").removeClass("hide"); 
						$("#label_header_h1").html("借款进度查询");
						$("#label_header_small").html("在此浏览您申请过的业务");
						$('#frame_search_borrow_page').attr('src', $('#frame_search_borrow_page').attr('src'));
					}else{
						alert("查询出错！");
					}
				}else{
					alert("查询出错");
				}
			}
		});
	});
});
function borrowOnload(){
	var tHeight = $("#frame_search_borrow_page").contents().find("body").height()+70;
	$('#frame_search_borrow_page').height(tHeight);
}
function dailyOnload(){
	var dHeight = $("#frame_search_daily_page").contents().find("body").height()+70;
	$('#frame_search_daily_page').height(dHeight);
}
function travelOnload(){
	var tHeight = $("#frame_search_travel_page").contents().find("body").height()+70;
	$('#frame_search_travel_page').height(tHeight);
}
