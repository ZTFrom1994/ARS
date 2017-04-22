$(function(){
	$("#a-home").click(function(){
		//面包屑导航2,3级不显示
		$("#li_second_breadcrumb").addClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$(".sidebar-menu  li").removeClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_home_page").removeClass("hide"); 
		$("#label_header_h1").html("欢迎进入教职工系统");
		$("#label_header_small").html("&nbsp");
	}) 
	$("#a_project_management").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").addClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_third_breadcrumb").html("项目管理");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide");
		$("#div_project_management_page").removeClass("hide"); 
		$("#label_header_h1").html("项目管理");
		$("#label_header_small").html("在此浏览您目前负责的项目");
	});
	
	$("#a_borrowing").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("借款管理");
		$("#li_third_breadcrumb").html("我要借款");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_borrowing_page").removeClass("hide"); 
		$("#label_header_h1").html("我要借款");
		$("#label_header_small").html("在此进行借款操作");
	});
	
	$("#a_borrowing_info").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("借款管理");
		$("#li_third_breadcrumb").html("借款信息");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide");
		$("#div_borrowing_info_page").removeClass("hide"); 
		$("#label_header_h1").html("借款信息");
		$("#label_header_small").html("在此查看您的借款信息");
	});
	
	
	
	$("#a_daily_reimbursement").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").addClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		//$("#li_second_breadcrumb").html("项目管理");
		$("#li_third_breadcrumb").html("日常报销");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide"); 
		$("#div_daily_reimbursement_page").removeClass("hide"); 
		$("#label_header_h1").html("日常报销");
		$("#label_header_small").html("在此进行日常报销操作");
		$("#daily_box input").val("");
	});
	$("#btn_reimbursement_progress").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").addClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		//$("#li_second_breadcrumb").html("项目管理");
		$("#li_third_breadcrumb").html("报销进度查询");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide"); 
		$("#div_reimbursement_progress").removeClass("hide"); 
		$("#label_header_h1").html("报销查询");
		$("#label_header_small").html("在此查询所有报销记录和报销进度");
	});
	
	$("#a_project_authorization").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("授权管理");
		$("#li_third_breadcrumb").html("项目授权");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide"); 
		$("#div_project_authorization_page").removeClass("hide"); 
		$("#label_header_h1").html("项目授权");
		$("#label_header_small").html("在此将您的项目对他人授权");
	});
	
	$("#a_authorization_log").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("授权管理");
		$("#li_third_breadcrumb").html("授权日志");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide"); 
		$("#div_authorization_log_page").removeClass("hide"); 
		$("#label_header_h1").html("授权日志");
		$("#label_header_small").html("在此查看您过往的授权记录");
	});
	
	$("#a_traveling_reimbursement").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").addClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		//设置2,3级文字
		$("#li_third_breadcrumb").html("差旅费报销");
		
		$(".div-pages").addClass("hide");  
		$("#div_traveling_reimbursement_page").removeClass("hide"); 
		$("#label_header_h1").html("差旅费报销");
		$("#label_header_small").html("在此进行差旅费报销操作");
		$("#travel_box input").val("");
	});
	
	
})