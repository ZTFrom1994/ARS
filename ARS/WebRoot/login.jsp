<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>报账管理系统</title>
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	  <link rel="icon" href="images/logo.ico" type="image/x-icon" />
	  <link rel="shortcut icon" href="images/logo.ico">
	  <link rel="Bookmark" href="images/logo.ico">
	  <link rel="stylesheet" href="adminlte/bootstrap/css/bootstrap.min.css">
	  <link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.min.css">
 		<link rel="stylesheet" href="./ionicons-2.0.1/css/ionicons.min.css">
	  <link rel="stylesheet" href="adminlte/dist/css/AdminLTE.min.css">
	  <link rel="stylesheet" href="adminlte/plugins/iCheck/square/blue.css">
	  <link href="adminlte/plugins/iCheck/flat/green.css" rel="stylesheet">
	  <link rel="stylesheet" href="login/css/style.css">
</head>

<body class="hold-transition " background="./login/images/bg.jpg">
	<div class="logo" > 
			<img alt="" src="login/images/top-logo.png">
	</div>
	<div class="login-box overlay-box hide" style="position:relative;border:1px solid #DDDDDD;">
		  <div class="login-box-body">
		    	<p class="login-box-msgs">登录</p>
		      	<div class="form-group has-feedback">
			        <input type="text" id="login-username" class="form-control" placeholder="输入账号">
			        <span class="glyphicon glyphicon-user form-control-feedback"></span>
		      	</div> 
			    <div class="form-group has-feedback"> 
			        <input type="password" id="login-password" class="form-control" placeholder="输入密码">
			        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			    </div>
                <!-- radio -->
              <div class="form-group">
               		 请选择身份：
                <label> 
                  <input type="radio" name="select_type" class="flat-red" checked value="0"><span>&nbsp教职工</span>
                </label>
                <label>
                  <input type="radio" name="select_type" class="flat-red" value="1"><span>&nbsp审核员</span>
                </label>
                <label>
                  <input type="radio" name="select_type" class="flat-red" value="2"><span>&nbsp管理员</span>
                </label>
              </div>
		       <div class="row">
		        <div class="col-xs-8">
		          <div class="checkbox icheck">
		            <label>
		              <input type="checkbox"><span>&nbsp记住我</span>
		            </label>
		          </div>
		        </div>
		        <div class="col-xs-4">
		          <button id="login-btn" class="btn btn-info btn-block btn-flat">登录</button>
		        </div>
		       </div>
		    <div class="social-auth-links text-center">
		      <p>- 或 -</p>
		      <a href="#" class="btn btn-block btn-social btn-vk btn-flat"><i class="fa  fa-mobile-phone"></i>
		       		使用手机账号登录</a>
		      <a href="#" class="btn btn-block btn-social  btn-twitter btn-flat" style="background:#3EBB2B"><i class="fa  fa-wechat"></i> 
		        	 使用微信账号登录</a>
		    </div>
		    <a id="a-changepsd" class="box-bottom-msg">密码泄露？点此修改密码</a><br>
		    <a class="box-bottom-msg">注册账号</a>
		  </div>
		  <div class="overlay hide" id="login-overlay" style="height:100%;width:100%;left:0;top:0">
		        <i class="fa fa-refresh fa-spin"></i>
          </div>
	</div>
<!-- /.login-box -->

	<div class=" changepsd-box overlay-box hide" style="position:relative;border:1px solid #DDDDDD;">
		  <div class="changepsd-box-body" >
				<p class="login-box-msgs">修改密码</p>
				<div class="form-group has-feedback">
				  <input type="text" id="cpsd-username" class="form-control" placeholder="请输入用户名">
				  <span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
		        <div class="form-group has-feedback">
			        <input type="password" id="cpsd-old-password" class="form-control" placeholder="请输入旧密码">
			        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		        </div>
		      	<div class="form-group has-feedback">
		       	 	<input type="password" id="cpsd-new-password"class="form-control" placeholder="请输入新密码">
		        	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		     	 </div>
		      <div class="form-group has-feedback">
			        <input type="password" id="cpsd-check-password"  class="form-control" placeholder="再次输入新密码 ">
			        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		      </div>
		      <div class="form-group">
               		 请选择身份：
                <label> 
                  <input type="radio" name="cpsd_user_type" class="flat-red" checked value="0"><span>&nbsp教职工</span>
                </label>
                <label>
                  <input type="radio" name="cpsd_user_type" class="flat-red" value="1"><span>&nbsp审核员</span>
                </label>
                <label>
                  <input type="radio" name="cpsd_user_type" class="flat-red" value="2"><span>&nbsp管理员</span>
                </label>
              </div>
		      <div class="row">
			        <div class="col-xs-8">
			          <div class="checkbox icheck">
			          </div>
			        </div>
			        <!-- /.col -->
			        <div class="col-xs-4">
			          <button id="changepsd-btn" class="btn btn-danger btn-block btn-flat">确定修改</button>
			        </div>
		        <!-- /.col -->
		      </div>
		    <div class="social-auth-links text-center">
		       <p>- 或 -</p>
		      <a href="#" class="btn btn-block btn-social btn-vk btn-flat"><i class="fa  fa-mobile-phone"></i>
		       		使用手机账号登录</a>
		      <a href="#" class="btn btn-block btn-social  btn-twitter btn-flat" style="background:#3EBB2B"><i class="fa  fa-wechat"></i> 
		        	 使用微信账号登录</a>
		    </div>
		    <a id="a-backto-login" class="box-bottom-msg">返回登录</a>
		  </div>
		  <div class="overlay hide" id="changepsd-overlay" style="height:100%;width:100%;left:0;top:0">
		        <i class="fa fa-refresh fa-spin"></i>
          </div>
	</div>
		<!-- /.register-box -->
	  <footer class="footer">
	  		<div>西安建筑科技大学本科生毕业设计</div>
	  		<img src="login/images/footer-bg.png"/>
	  </footer>
	  
        <!-- 模态框（Modal） -->
		<div class="modal fade"  id="tip-modal" tabindex="-1" role="dialog"  aria-hidden="true">
		    <div class="modal-dialog" style="margin-top:100px;">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">系统提示</h4>
		            </div>
		            <div class="modal-body">修改密码成功！</div>
			          <!-- /.box -->
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
	<!-- jQuery 2.2.3 -->
	<script src="adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="adminlte/bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="adminlte/plugins/iCheck/icheck.min.js"></script>
	<script src="login/js/login.js"></script>
</body>
</html>