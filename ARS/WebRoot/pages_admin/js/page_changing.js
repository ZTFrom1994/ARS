$(function(){
	$("#a-home").click(function(){
		//面包屑导航2,3级不显示
		$("#li_second_breadcrumb").addClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$(".sidebar-menu  li").removeClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_home_page").removeClass("hide"); 
		$("#label_header_h1").html("欢迎进入管理员系统");
		$("#label_header_small").html("&nbsp");
	}) 
	$("#a_business_function").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("业务管理");
		//$("#li_third_breadcrumb").html("负责项目");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		 
		$(".div-pages").addClass("hide");
		$("#div_business_function_page").removeClass("hide"); 
		$("#label_header_h1").html("业务管理");
		$("#label_header_small").html("在此管理本系统所提供的业务");
	});
	
	$("#a_account_assessor").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("账户管理");
		$("#li_third_breadcrumb").html("审计员账户");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active");
		
		$(".div-pages").addClass("hide");
		$("#div_account_assessor_page").removeClass("hide"); 
		$("#label_header_h1").html("账户管理");
		$("#label_header_small").html("在此管理所有审计员账户");
	});
	
	$("#a_account_staff").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").removeClass("hide");
		$("#li_second_breadcrumb").removeClass("active");
		$("#li_third_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("账户管理");
		$("#li_third_breadcrumb").html("教职工账户");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().parent().parent().addClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide");
		$("#div_account_staff_page").removeClass("hide"); 
		$("#label_header_h1").html("账户管理");
		$("#label_header_small").html("在此管理所有教职工账户");
	});
	
	
	
	$("#a_log_search").click(function(){
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("日志查询");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide");
		$("#div_log_search_page").removeClass("hide"); 
		$("#label_header_h1").html("日志查询");
		$("#label_header_small").html("在此查询系统日志信息");
	});
	
	$("#a_message").click(function(){
		//面包屑导航2,3级显示 
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("消息推送");
		//$("#li_third_breadcrumb").html("负责项目");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		
		$(".div-pages").addClass("hide");
		$("#div_message_page").removeClass("hide"); 
		$("#label_header_h1").html("消息推送");
		$("#label_header_small").html("在此查看历史推送消息");
	});
	$("#a_system_settings").click(function(){
		//面包屑导航2,3级显示
		$("#li_second_breadcrumb").removeClass("hide");
		$("#li_third_breadcrumb").addClass("hide");
		$("#li_second_breadcrumb").addClass("active");
		//设置2,3级文字
		$("#li_second_breadcrumb").html("系统设置");
		//$("#li_third_breadcrumb").html("负责项目");
		
		$(".sidebar-menu  li").removeClass("active");
		$(this).parent().addClass("active"); 
		 
		$(".div-pages").addClass("hide");
		$("#div_system_settings_page").removeClass("hide"); 
		$("#label_header_h1").html("系统设置");
		$("#label_header_small").html("在此设置本系统功能");
	});
	
})