<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="./pages_admin/css/home.css"> 
		<script type="text/javascript" src="echarts/js/echarts.min.js"></script>
</head>
<body >
   <div class="row">
  			<div class="col-md-8">
  				<div class="row">
  					<div class="col-md-4">
  						<div class="info-box">
				            <span class="info-box-icon bg-green"><i class="ion ion-person-stalker"></i></span>
				            <div class="info-box-content">
				              <span class="info-box-text">教职工用户</span>
				              <span class="info-box-number">${adminHomeData.staffNumber}<small>位</small></span>
				            </div>
				         </div>
  					</div>
  					<div class="col-md-4">
  						<div class="info-box">
				            <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people"></i></span>
				            <div class="info-box-content">
				              <span class="info-box-text">审计员用户</span>
				              <span class="info-box-number">${adminHomeData.assessorNumber}<small>位</small></span>
				            </div>
				         </div>
  					</div>
  					<div class="col-md-4">
  						<div class="info-box">
				            <span class="info-box-icon bg-purple"><i class="ion ion-android-contact"></i></span>
				            <div class="info-box-content">
				              <span class="info-box-text">管理员用户</span>
				              <span class="info-box-number">${adminHomeData.adminNumber}<small>位</small></span>
				            </div>
				         </div>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-4">
  						<div class="info-box">
				            <span class="info-box-icon bg-red"><i class="ion ion-android-cancel"></i></span>
				            <div class="info-box-content">
				              <span class="info-box-text">禁封用户</span>
				              <span class="info-box-number">${adminHomeData.disabledTotal}<small>位</small></span>
				            </div>
				         </div>
  					</div>
  					<div class="col-md-4"> 
  						<div class="info-box">
				            <span class="info-box-icon bg-aqua"><i class="ion ion-ios-paper-outline"></i></span>
				            <div class="info-box-content">
				              <span class="info-box-text">空余位</span>
				              <span class="info-box-number">0<small>个</small></span>
				            </div>
				         </div>
  					</div>
  					<div class="col-md-4">
  						<div class="info-box">
				            <span class="info-box-icon bg-teal"><i class="ion ion-android-textsms"></i></span>
				            <div class="info-box-content">
				              <span class="info-box-text">推送消息</span>
				              <span class="info-box-number">${adminHomeData.messageNumber}<small>条</small></span>
				            </div>
				         </div>
  					</div>
  				</div>
  				<div class="row">
	  				<div class="col-md-12">
	  					 <div class="box box-solid">
				            <div class="box-header with-border">
				              <i class="fa fa-bar-chart-o"></i>
				              <h3 class="box-title">近期报销与借款</h3>
				              <div class="box-tools pull-right">
					                	<button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
				              </div>
				            </div>
				            <div class="box-body">
				              	<div id="my_echarts" style="width: 100%;height:340px;"></div>
				            </div>
				            <!-- /.box-body-->
				          </div>
	  				</div> 
  				</div>
  			</div>
  			<div class="col-md-4" >
  					<div class="row" >
  						<div class="col-md-12" >
  							<div class="box box-info" >
					            <div class="box-header">
					              <i class="fa fa-envelope"></i>
					              <h3 class="box-title">快速消息推送</h3>
					            </div>
					            <div class="box-body">
					                <div class="form-group">
					                  <select class="form-control" id="select_message_object">
					                  	<option value="0">全部人</option>
					                  	<option value="1">审计员</option>
					                  	<option value="2">教职工</option>
					                  	<option value="3">管理员</option>
					                  </select>
					                </div>
					                <div>
					                  <textarea id="text_message_content"class="textarea" placeholder="Message" style="width: 100%; height: 410px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
					                </div>
					                <div class="pull-right" >
					                	<label>日期：</label>2017.2.20
					                </div>
					            </div>
					            <div class="box-footer clearfix">
					              <button type="button" class="pull-right btn btn-default" id="btn_send_message" >发送
					                <i class="fa fa-arrow-circle-right"></i>
					                </button>
					            </div>
					          </div>
  						</div>
  					</div>
  			</div>
  		</div>
  		
	<!-- FLOT CHARTS -->
	<script src="./adminlte/plugins/flot/jquery.flot.js"></script>
	<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
	<script src="./adminlte/plugins/flot/jquery.flot.resize.min.js"></script>
	<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
	<script src="./adminlte/plugins/flot/jquery.flot.pie.min.js"></script>
	<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts --> 
	<script src="./adminlte/plugins/flot/jquery.flot.categories.min.js"></script>
	
	<!-- ChartJS 1.0.1 -->
	<script src="./adminlte/plugins/chartjs/Chart.min.js"></script>
	<script type="text/javascript" src="./pages_admin/js/home.js"></script>
</body>
</html>
