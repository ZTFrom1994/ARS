<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> 

<!DOCTYPE html>
<html  ng-app="main" ng-init="d11=0;d12=0;d21=0;d22=0;d31=0;d32=0;d41=0;d42=0;d51=0;d52=0;d61=0;d62=0;d71=0;d72=0;d81=0;d82=0; t11=0;t12=0;t13=0;t21=0;t22=0;t23=0;t31=0;t32=0;t33=0;t41=0;t42=0;t43=0;">
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
		<!-- Bootstrap 3.3.6 -->
		<link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap.min.css">
		<!-- Font Awesome --> 
  		<link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.min.css">
  		<!-- Ionicons --> 
  		<link rel="stylesheet" href="./ionicons-2.0.1/css/ionicons.min.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="./adminlte/dist/css/AdminLTE.min.css"> 
		<link rel="stylesheet" href="./adminlte/dist/css/skins/skin-green-light.min.css">
		
		<link rel="stylesheet" type="text/css" href="./pages_staff/css/page_changing.css">
		<link rel="stylesheet" type="text/css" href="./pages_staff/css/main.css">
		<!-- jQuery 2.2.3 -->
		<script src="./adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
		<!-- AngularJS -->
		<script src="./angular-1.2.29/angular.js"></script>
		<!-- AdminLTE App -->
		<script src="./adminlte/dist/js/app.min.js"></script>
		<!-- datatable --> 
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<!-- bootstrap datepicker -->  
		<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="./pages_staff/js/page_changing.js"></script>
		<script src="./pages_staff/js/main.js"></script>
	</head>
	
	<body class="hold-transition skin-green-light sidebar-mini" on>
		<div class="wrapper" >

			<!-- Main Header -->
			<header class="main-header">
			<!-- Logo -->
			<a  class="logo" href="./pages_staff/main.jsp" > 
				<span class="logo-lg"><img src="./images/logo.png" style="width:100%;height:100%"/></span> 
			</a>
			<!-- Header Navbar -->
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
								<c:when test="${fn:length(staffNoReadMessage) != 0}">
										<span class="label label-success">${fn:length(staffNoReadMessage)}</span>
								</c:when>
							</c:choose>
						</a>
						<ul class="dropdown-menu">
							<li class="header">您有${fn:length(staffNoReadMessage)}条未读消息</li>
							<li>
								<!-- inner menu: contains the messages -->
								<ul class="menu">
									<li>
										<!-- start message -->
										<c:choose>
												<c:when test="${fn:length(staffNoReadMessage) != 0}">
													<c:forEach var="noReadMessage" items="${staffNoReadMessage}">
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
						<ul class="dropdown-menu">
							<!-- The user image in the menu -->
							<li class="user-header">
								<c:choose>
									<c:when test="${currentUser.sex == '男'}">
										<img src="./adminlte/dist/img/avatar5.png" class="img-circle" alt="User Image" title="${currentUser.sex}">
									</c:when>
									<c:otherwise>
										<img src="./adminlte/dist/img/avatar2.png" class="img-circle" alt="User Image" title="${currentUser.sex}">
									</c:otherwise>
								</c:choose>
				                <p>
				                  	${currentUser.name} - ${currentUser.department} ${currentUser.positionName}
									<small>注册日期：<fmt:formatDate value="${currentUser.registerDate}" pattern="yyyy.MM.dd"/></small>
				                </p>
							</li>
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a id="a_profile" class="btn btn-default btn-flat">个人资料</a>
								</div>
								<div class="pull-right">
									<a id="a-logout" class="btn btn-default btn-flat">退出登录</a>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</nav>
			</header>
			<!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar" >
				<section class="sidebar">
						<div class="div-search-menu" > 
							<h4><div class="sidebar-form-msg" >申请进度查询</div> </h4>
							<div class="sidebar-form">
								<input id="search_reim_id" type="text"  class="form-control" placeholder="报销申请编号" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false">
							</div>
							<div class="sidebar-form" style="border:none">
			                  <select class="form-control" id="search_select_type">
			                    <option value="0" style="height:20px;">日常报销</option>
			                    <option value="1" style="height:20px;">差旅费报销</option>
			                    <option value="2" style="height:20px;">借款</option> 
			                  </select>
			                </div>
			                <div class="sidebar-form" style="border:none">
			                  <select class="form-control" id="search_select_progress">
			                    <option value="0">全部进度</option>
			                    <option value="1">预约中</option>
			                    <option value="2">预约失败</option>
			                    <option value="3">可提交现场审核</option>
			                    <option value="4">未通过审核</option>
			                    <option value="5">已完成</option>
			                  </select>
			                </div> 
							<div style="border:none;width:90%;margin-left:10px;margin-right:10px;">
									<button type="button" class="btn btn-primary btn-block" id="btn_progress_search">查询</button>
							</div>
						</div>
					<ul class="sidebar-menu">
						<li class="header">
							选项
						</li>
						<li>
							<a id="a_project_management"><i class="fa fa-link"></i><span>项目管理</span></a>
						</li>
						<li>
							<a id="a_traveling_reimbursement"><i class="fa fa-link"></i><span>差旅费报销</span></a>
						</li>
						<li>
							<a id="a_daily_reimbursement"><i class="fa fa-link"></i><span>日常报销</span></a>
						</li>
						<li class="treeview ">
							<a href="#">
								<i class="fa fa-link"></i> 
								<span>借款管理</span> 
								<span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i> 
							    </span>  
							</a>
							<ul class="treeview-menu">
								<li>
									<a id="a_borrowing"><i class="fa fa-circle-o"></i>我要借款</a>
								</li>
								<li>
									<a id="a_borrowing_info"><i class="fa fa-circle-o"></i>我的借款</a>
								</li>
								
							</ul>
						</li>
						<!-- 
						<li class="treeview">
							<a href="#">
								<i class="fa fa-link"></i> 
								<span>授权管理</span> 
								<span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i> 
							    </span>  
							</a>
							<ul class="treeview-menu">
								<li>
									<a id="a_project_authorization"><i class="fa fa-circle-o"></i>项目授权</a>
								</li>
								<li>
									<a id="a_authorization_log"><i class="fa fa-circle-o"></i>授权日志</a>
								</li>
							</ul>
						</li>
						 -->
					</ul>
				</section>
			</aside>

			<div class="content-wrapper" > 
				<!-- Content Header (Page header) --> 
				<section class="content-header" >    
				<h1><label id="label_header_h1" style="color:#676464">欢迎进入教职工系统</label><small><label id="label_header_small" class="no-font-weight"> </label></small></h1>
				<ol class="breadcrumb"> 
					<li>
						<a id="a-home" ><i class="fa fa-dashboard"></i>首页</a>
					</li>
					<li id="li_second_breadcrumb" class="hide">
						项目管理
					</li>
					<li class="active hide" id="li_third_breadcrumb" >
						负责项目
					</li>
				</ol>
				</section>

				<!-- Main content -->
				<section class="content"  > 
					<!-- 隐藏不需要的页面，按点击显示需要的页面 （在js中写好了相应代码）-->
					<div class="div-pages " id="div_home_page"><jsp:include page="home.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_daily_reimbursement_page"><jsp:include page="daily_reimbursement.jsp"></jsp:include></div> 
					<div class="div-pages hide" id="div_authorization_log_page"><jsp:include page="authorization_log.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_borrowing_info_page"><jsp:include page="borrowing_info.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_borrowing_page"><jsp:include page="borrow_application.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_project_authorization_page"><jsp:include page="project_authorization.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_project_management_page"><jsp:include page="project_management.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_traveling_reimbursement_page"><jsp:include page="traveling_reimbursement.jsp"></jsp:include></div>
					<div class="div-pages hide" id="div_my_messages_page" ><jsp:include page="my_messages.jsp"></jsp:include></div>
					<iframe class="div-pages hide"  onload='dailyOnload()' scrolling="no" id="frame_search_daily_page" style="border:none;width:100%;height:100%;min-height: 300px;" src="./pages_staff/progress_daily.jsp"></iframe>
					<iframe class="div-pages hide"  onload='travelOnload()' scrolling="no" id="frame_search_travel_page" style="border:none;width:100%;height:100%;min-height: 300px;" src="./pages_staff/progress_travel.jsp"  ></iframe>
					<iframe class="div-pages hide"  onload='borrowOnload()' scrolling="no" id="frame_search_borrow_page" style="border:none;width:100%;height:100%;min-height: 300px;" src="./pages_staff/progress_borrow.jsp"  ></iframe>
				</section>  
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->

			<!-- Main Footer -->
			<footer class="main-footer" >
			<!-- To the right -->
			<div class="pull-right hidden-xs">
				<a href="#" style="font-size:10px;"><u>查看报账系统指南</u></a>
			</div>
			<!-- Default to the left --> 
			<strong>Copyright &copy; 2016 <a href="#" style="font-size:13px">西安建筑科技大学</a>.</strong> All
			rights reserved.
			</footer>
		</div>
		<!-- 提示模态框 -->
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
		<script type="text/javascript">
			var a = angular.module("main",[]);
		</script>
	</body>
</html>
