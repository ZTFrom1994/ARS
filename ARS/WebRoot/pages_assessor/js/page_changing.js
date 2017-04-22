$(function(){
	$("#a-home").click(function(){
		//面包屑导航2,3级不显示
		$("#li_second_breadcrumb").addClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$(".sidebar-menu  li").removeClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_home_page").removeClass("hide"); 
		$("#label_header_h1").html("欢迎进入审计员系统");
		$("#label_header_small").html("&nbsp");
	}) 
	$("#a_reser_daily_reimbursement").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("预约审批");
		$("#li_third_breadcrumb").html("日常报销预约");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_reser_daily_page").removeClass("hide"); 
		$("#label_header_h1").html("日常报销预约");
		$("#label_header_small").html("在此进行审批操作");
	});
	$("#a_reser_travel_reimbursement").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("预约审批");
		$("#li_third_breadcrumb").html("差旅费报销预约");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_reser_travel_page").removeClass("hide"); 
		$("#label_header_h1").html("差旅费报销预约");
		$("#label_header_small").html("在此进行审批操作");
	});
	$("#a_reser_borrow").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("预约审批");
		$("#li_third_breadcrumb").html("借款预约");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_reser_borrow_page").removeClass("hide"); 
		$("#label_header_h1").html("借款预约");
		$("#label_header_small").html("在此进行审批操作");
	});
	
	
	$("#a_reimbursement_check_register").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("现场报账审核登记");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		 
		$(".div-pages").addClass("hide");
		$("#div_reimbursement_check_register").removeClass("hide"); 
		$("#label_header_h1").html("现场报账审核登记");
		$("#label_header_small").html("在此登记现场报账情况");
	});
	
	$("#a_audit_borrow").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("借款审批登记");
		//$("#li_third_breadcrumb").html("负责项目");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active");  
		
		$(".div-pages").addClass("hide");
		$("#div_borrow_page").removeClass("hide"); 
		$("#label_header_h1").html("借款审批登记 ");
		$("#label_header_small").html("在此登记借款业务审批情况");
	});
	$("#a_clearing_borrow").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("借款结算");
		//$("#li_third_breadcrumb").html("负责项目");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active");  
		$(".div-pages").addClass("hide");
		$("#frame_borrow_payment_record_page").removeClass("hide"); 
		$("#label_header_h1").html("借款结算");
		$("#label_header_small").html("在此结算借款业务");
		var h = $('#frame_borrow_payment_record_page').contents().find("body").height()+70;
		$('#frame_borrow_payment_record_page').height(h);
	});
	
	
	
	$("#a_contract_break").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("违约管理");
		//$("#li_third_breadcrumb").html("负责项目");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active");  
		
		$(".div-pages").addClass("hide");
		$("#div_contract_break_page").removeClass("hide"); 
		$("#label_header_h1").html("违约管理");
		$("#label_header_small").html("在此管理违约信息");
	});

})