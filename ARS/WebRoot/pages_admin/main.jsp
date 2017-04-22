<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>自助报账系统</title> 
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="icon" href="images/logo.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/logo.ico">
		<link rel="Bookmark" href="images/logo.ico">
		<link rel="stylesheet" type="text/css" href="./pages_admin/css/page_changing.css">
		<!-- Bootstrap 3.3.6 -->
		<link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap.min.css">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.min.css">
  		<!-- Ionicons -->
  		<link rel="stylesheet" href="./ionicons-2.0.1/css/ionicons.min.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="./adminlte/dist/css/AdminLTE.min.css"> 
		<link rel="stylesheet" href="./adminlte/dist/css/skins/skin-purple.min.css">
		<!-- jQuery 2.2.3 -->
		<script src="./adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
		<!-- AdminLTE App -->
		<script src="./adminlte/dist/js/app.min.js"></script>
		
	</head>
	
	<body class="hold-transition skin-purple sidebar-mini">
		<div class="wrapper">
			<header class="main-header">
			<a  class="logo" href="./pages_admin/main.jsp"> 
				<span class="logo-lg"><img src="./images/logo.png" style="width:100%;height:100%"/></span> 
			</a>
			<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a  class="sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> 
			</a>
			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- Messages: style can be found in dropdown.less-->
					<li class="dropdown messages-menu">
						<!-- Menu toggle button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-envelope-o"></i> 
							<c:choose>
								<c:when test="${fn:length(adminNoReadMessage) != 0}">
										<span class="label label-success">${fn:length(adminNoReadMessage)}</span>
								</c:when>
							</c:choose>
						</a>
						<ul class="dropdown-menu">
							<li class="header">您有${fn:length(adminNoReadMessage)}条未读消息</li>
							<li>
								<!-- inner menu: contains the messages -->
								<ul class="menu">
									<li>
										<!-- start message -->
										<c:choose>
												<c:when test="${fn:length(adminNoReadMessage) != 0}">
													<c:forEach var="noReadMessage" items="${adminNoReadMessage}">
														<a class="a-no-read-message">
															<div class="pull-left">
																<c:choose>
																	<c:when test="${noReadMessage.message.admin != null}">
																		<c:choose>
																			<c:when test="${noReadMessage.message.admin.sex == '男'}">
																				<img src="./adminlte/dist/img/avatar5.png" class="user-image" alt="User Image">
																			</c:when>
																			<c:otherwise>
																				<img src="./adminlte/dist/img/avatar2.png" class="user-image" alt="User Image">
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<img src="./adminlte/dist/img/avatar5.png" class="user-image" alt="User Image">
																	</c:otherwise>
																</c:choose>
															</div> <!-- Message title and timestamp -->
															<h4>
																<c:choose>
																	<c:when test="${noReadMessage.message.admin != null}">
																		管理员
																	</c:when>
																	<c:otherwise>
																		系统消息
																	</c:otherwise>
																</c:choose>
																<small>
																<i class="fa fa-clock-o"></i>
																		<fmt:formatDate value="${noReadMessage.message.date}" pattern="yyyy-MM-dd HH:mm"/> 
																</small>
															</h4> <!-- The message -->
															<p>
																${noReadMessage.message.content}
															</p> 
														</a>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<p style="text-align: center">暂无新消息</p>
												</c:otherwise>
											</c:choose>
									</li>
									<!-- end message -->
								</ul>
								<!-- /.menu -->
							</li>
							<li class="footer">
								<a id="a_watch_all_messages">查看所有消息</a>
							</li>
						</ul>
					</li>
					<!-- /.messages-menu -->
					<!-- User Account Menu -->
					<li class="dropdown user user-menu">
						<!-- Menu Toggle Button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<c:choose>
									<c:when test="${currentUser.sex == '男'}">
										<img src="./adminlte/dist/img/avatar5.png" class="user-image" alt="User Image">
									</c:when>
									<c:otherwise>
										<img src="./adminlte/dist/img/avatar2.png" class="user-image" alt="User Image">
									</c:otherwise>
							</c:choose> 
							<span class="hidden-xs">${currentUser.name}</span> </a>
					</li>
				</ul>
			</div>
			</nav>
			</header>
			<!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
				<section class="sidebar "> 
					<ul class="sidebar-menu">
						<li class="header">选项 </li>
						<li>
							<a id="a_business_function" ><i class="fa fa-link"></i><span>业务功能</span></a>
						</li>
						<li class="treeview ">
							<a href="#">
								<i class="fa fa-link"></i> 
								<span>账户管理</span> 
								<span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i> 
							    </span>  
							</a>
							<ul class="treeview-menu">
								<li>
									<a id="a_account_assessor"><i class="fa fa-circle-o"></i>审计员账户</a>
								</li>
								<li>
									<a id="a_account_staff"><i class="fa fa-circle-o"></i>教职工账户</a>
								</li>
							</ul> 
						</li>
						<!-- 
						<li>
								<a id="a_log_search"><i class="fa fa-link"></i><span>日志查询</span></a>
						</li>
						 -->
						<li>
							<a id="a_message"><i class="fa fa-link"></i> <span>历史推送</span> </a>
						</li>
						<li>
							<a id="a_system_settings"><i class="fa fa-link"></i> <span>系统设置</span> </a>
						</li>
					</ul>
				</section>
			</aside>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper"> 
				<!-- Content Header (Page header) --> 
				<section class="content-header" >    
				<h1><label id="label_header_h1" style="color:#676464" >欢迎进入管理员系统</label><small><label id="label_header_small"class="no-font-weight"> </label></small></h1>
				<ol class="breadcrumb"> 
					<li>
						<a id="a-home" ><i class="fa fa-dashboard"></i>首页</a>
					</li>
					<li  class="hide" id="li_second_breadcrumb"  >
						项目管理
					</li>
					<li class="active hide" id="li_third_breadcrumb" >
						负责项目
					</li>
				</ol>
				</section>

				<!-- Main content -->
				<section class="content" style="height:100%"> 
				<!-- Your Page Content Here --> 
				<!-- 隐藏不需要的页面，按点击显示需要的页面 （在js中写好了相应代码）-->
					<div class="div-pages " 	id="div_home_page" ><jsp:include page="home.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_account_assessor_page" ><jsp:include page="account_assessor_management.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_account_staff_page" ><jsp:include page="account_staff_management.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_business_function_page" ><jsp:include page="business_function.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_log_search_page" ><jsp:include page="log_search.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_system_settings_page" ><jsp:include page="system_settings.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_message_page" ><jsp:include page="message.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_my_messages_page" ><jsp:include page="my_messages.jsp"></jsp:include></div>
				</section> 
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->

			<!-- Main Footer -->
			<footer class="main-footer" >
			<!-- To the right -->
			<div class="pull-right hidden-xs">
				<a href="#" style="font-size:10px;"><u>查看管理员指南</u></a>
			</div>
			<!-- Default to the left --> 
			<strong>Copyright &copy; 2016 <a href="#" style="font-size:13px">西安建筑科技大学</a>.</strong> All
			rights reserved.
			</footer>
		</div>
		<div class="modal fade" id="tipModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog"
				style="width:400px;text-align:center;top:15px;">
				<div class="modal-content">
					<div class="modal-header" style="text-align:center;">
						<h4 class="modal-title" id="tipModalTitle"></h4>
					</div>
					<div class="modal-body" style="text-align:center;">
						<span id="tip-icon"
							style="text-align:center;font-size:240px;"
							class=" glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
		</div>
		<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_admin/js/page_changing.js"></script>
		<script src="./pages_admin/js/main.js"></script>
	</body>
</html>
