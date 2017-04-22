$(function(){
	$.ajax({
		url:"loginAction!loadAdminData",
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
	$("#a_watch_all_messages,.a-no-read-message").click(function(){
		$.ajax({
			url:"messageAction!clearAdminNoReadMessage",
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
})