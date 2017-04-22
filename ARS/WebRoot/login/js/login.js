$(function() {
	 //记住密码功能
    var str = getCookie("loginInfo");
    str = str.substring(1,str.length-1);
    var remFlag = str.split(",")[0];
    if(remFlag==1){
    	//自动填充用户名和密码
    	$("input[type='checkbox']").attr("checked","true");
    	var username = str.split(",")[1];
	    var password = str.split(",")[2];
	    $("#login-username").val(username);
	    $("#login-password").val(password);
	    var radio_value = str.split(",")[3];
	    $('input:radio').eq(radio_value).attr('checked', 'true');
    }else{
    	$("input[type='checkbox']").removeAttr("checked");
    }
    
  //获取cookie
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
        }
        return "";
    }
  //记住密码功能
    function remember(){
        var remFlag = $("input[type='checkbox']").is(':checked');
        if(remFlag==true){ //如果选中设置remFlag为1
            return 1;
        }else{ //如果没选中设置remFlag为""
            return 0;
        }
    }
    
	$('input[type="checkbox"]').iCheck( {
		checkboxClass : 'icheckbox_square-blue',
		radioClass : 'iradio_square-blue',
		increaseArea : '20%' // optional
	});
	
    $(' input[type="radio"].flat-red').iCheck({
        radioClass: 'iradio_flat-green' 
      });

	$(".login-box").removeClass("hide");
	$(".changepsd-box").addClass("hide");
	$("#a-changepsd").click(function() {
		$("input[type='text']").val("");
		$("input[type='password']").val("");
		$(".login-box").addClass("hide");
		$(".changepsd-box").removeClass("hide");
	})
	$("#a-backto-login").click(function() {
		$("input[type='text']").val("");
		$("input[type='password']").val("");
		$(".login-box").removeClass("hide");
		$(".changepsd-box").addClass("hide");
	})
	$("#login-btn").click(
			function() {
				var upattern = /^\d{8}$/;
				var ppattern = /^[a-zA-Z\d]\w{4,8}[a-zA-Z\d]$/;
				if (!upattern.test($("#login-username").val())) {
					$("#login-username").attr("data-toggle", "tooltip").attr(
							"data-placement", "auto").attr("title",
							"用户名格式不正确，必须由8位数字组成")
							.attr("data-trigger", "manual").tooltip("show");
				} else if (!ppattern.test($("#login-password").val())) {
					$("#login-password").attr("data-toggle", "tooltip").attr(
							"data-placement", "auto").attr("title",
							"密码格式不正确，由6-10位数字、字母组成").attr("data-trigger",
							"manual").tooltip("show");
					$("#login-username").tooltip("hide");
				} else {
					$("#login-username").tooltip("hide");
					$("#login-password").tooltip("hide");
					$("#login-overlay").removeClass("hide");
					$.ajax({
						url:"loginAction!loginCheck",
						type:"post",
						data:{ 
							remFlag:remember(),
							id:$("#login-username").val(),
							password:$("#login-password").val(),
							userType:$("input[name='select_type']:checked").val()
						},
						success:function(data){
								if(data == 0) {
									location.href="./pages_staff/main.jsp";
								}else if(data == 1){
									location.href="./pages_assessor/main.jsp";
								}else if(data == 2){
									location.href="./pages_admin/main.jsp";
								}else if(data == 10){
									$(".modal-body").html("您的账号已被封禁！");
									$('#tip-modal').modal('show');
									$("#login-overlay").addClass("hide");
								}else if(data == 11){
									$(".modal-body").html("系统已被管理员关闭！");
									$('#tip-modal').modal('show');
									$("#login-overlay").addClass("hide");
								}else{ 
									$(".modal-body").html("登录失败！用户名或密码错误！");
									$('#tip-modal').modal('show');
									$("#login-overlay").addClass("hide");
								}
							}
					});
				}
			});
	$("#changepsd-btn").click(
			function() {
				var upattern = /^\d{8}$/;
				var ppattern = /^[a-zA-Z\d]\w{4,8}[a-zA-Z\d]$/;
				if (!upattern.test($("#cpsd-username").val())) {
					$("#cpsd-username").attr("data-toggle", "tooltip").attr(
							"data-placement", "auto").attr("title",
							"用户名格式不正确，必须由8位数字组成").attr("data-trigger", "manual")
							.tooltip("show");
				} else if (!ppattern.test($("#cpsd-old-password").val())) {
					$("#cpsd-old-password").attr("data-toggle", "tooltip");
					$("#cpsd-old-password").attr("data-placement", "auto");
					$("#cpsd-old-password").attr("title",
							"密码格式不正确，由6-10位数字、字母组成").attr("data-trigger",
							"manual").tooltip("show");
					$("#cpsd-username").tooltip("hide");
				} else if (!ppattern.test($("#cpsd-new-password").val())) {
					$("#cpsd-new-password").attr("data-toggle", "tooltip")
							.attr("data-placement", "auto").attr("title",
									"密码格式不正确，由6-10位数字、字母组成").attr(
									"data-trigger", "manual").tooltip("show");
					$("#cpsd-old-password").tooltip("hide");
					$("#cpsd-username").tooltip("hide");
				}else if ($("#cpsd-new-password").val() == $(  
						"#cpsd-old-password").val()) { 
					$("#cpsd-new-password").tooltip("destroy");
					$("#cpsd-new-password").attr("data-toggle", "tooltip")
							.attr("data-placement", "auto").attr(
									"data-trigger", "manual").attr("title",
									"新密码与旧密码相同").tooltip("show");
					$("#cpsd-old-password").tooltip("hide"); 
					$("#cpsd-username").tooltip("hide");
				} else if ($("#cpsd-new-password").val() != $(
						"#cpsd-check-password").val()) {
					$("#cpsd-check-password").attr("data-toggle", "tooltip")
							.attr("data-placement", "auto").attr(
									"data-trigger", "manual").attr("title",
									"两次输入的密码不一致").tooltip("show");
					$("#cpsd-new-password").tooltip("hide");
					$("#cpsd-old-password").tooltip("hide");
					$("#cpsd-username").tooltip("hide");
				} else {
					$("#cpsd-new-password").tooltip("hide");
					$("#cpsd-old-password").tooltip("hide");
					$("#cpsd-username").tooltip("hide");
					$("#cpsd-check-password").tooltip("hide");
					$("#changepsd-overlay").removeClass("hide");
					$.ajax({
						url:"changePasswordAction!changePassword",
						type:"post",
						data:{
							id:$("#cpsd-username").val(),
							oldPassword:$("#cpsd-old-password").val(),
							newPassword:$("#cpsd-new-password").val(),
							userType:$("input[name='cpsd_user_type']:checked").val()
						},
						success:function(data){
							//1 修改成功
							//0原密码错误
							if(data == 1){
								$("#changepsd-overlay").addClass("hide");
								$(".modal-body").html("修改密码成功！");
								$("input[type='text']").val("");
								$("input[type='password']").val("");
							}else if(data == 0){
								$(".modal-body").html("修改密码失败，用户名或密码错误！");
								$("#cpsd-new-password").val("");
								$("#cpsd-old-password").val("");
								$("#cpsd-check-password").val("");
							}else{
								$(".modal-body").html("修改密码失败，未知错误！");
								$("input[type='text']").val("");
								$("input[type='password']").val("");
							}
							$('#tip-modal').modal('show');
							$("#changepsd-overlay").addClass("hide");
						}
					});
				}
			});
	// $('#tip-modal').modal('show');
})