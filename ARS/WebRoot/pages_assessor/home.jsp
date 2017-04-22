<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" href="./pages_assessor/css/home.css">
	  <!-- Date Picker -->
  	<link rel="stylesheet" href="./adminlte/plugins/datepicker/datepicker3.css">
  	 <!-- Daterange picker -->
  	<link rel="stylesheet" href="./adminlte/plugins/daterangepicker/daterangepicker.css">
  </head>
  
  <body>
    	<div class="row">
    		<div class="col-md-7">
    			<div class="row" >
    				<div class="col-md-12" style="height:94px;">
    					<div class="box box-solid">
    						<div class="box-body">
    							<div class="row">
    								<div class="col-md-3"><span><label>姓名：</label>${currentUser.name}</span></div>
    								<div class="col-md-3"><span><label>职工编号：</label>${currentUser.id}</span></div>
    								<div class="col-md-3"><span><label>职位：</label>${currentUser.department}-${currentUser.positionName}</span></div>
    								<div class="col-md-3"><span><label>账号状态：</label>${currentUser.state}</span></div>
    							</div>
    							<div class="row">
    								<div class="col-md-12" >
    									<label>可操作项目：</label>
	    								<span class="label label-primary">预约审核</span>
										<span class="label label-success">报销审核</span>
										<span class="label label-info">借款审核</span>
										<span class="label label-warning">冲借款审核</span>
										<span class="label label-danger">违信管理</span>
    								</div>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="row">
    				<div class="col-md-6"> 
    					<div class="info-box">
				            <span class="info-box-icon bg-teal">预</span>
				            <div class="info-box-content">
				              <div class="myinfo-box-number">${assessorHomeData.reservationNumber}&nbsp<small>项</small></div>
				              <div class="myinfo-box-text">待通过</div>
				            </div>
				         </div>
    				</div>
    				<div class="col-md-6">
    					<div class="info-box">
				            <span class="info-box-icon bg-purple">账</span>
				            <div class="info-box-content">
				              <div class="myinfo-box-number">${assessorHomeData.reimCheckNumber}&nbsp<small>项</small></div>
				              <div class="myinfo-box-text">待审批</div>
				            </div>
				         </div>
    				</div>
    			</div>
    			<div class="row" >
    				<div class="col-md-6">
    					<div class="info-box">
				            <span class="info-box-icon bg-green">借</span>
				            <div class="info-box-content">
				              <div class="myinfo-box-number">${assessorHomeData.borrowCheckNumber}&nbsp<small>项</small></div>
				              <div class="myinfo-box-text">待审批</div>
				            </div>
				         </div>
    				</div>
    				<div class="col-md-6">
    					<div class="info-box">
				            <span class="info-box-icon bg-red">违</span>
				            <div class="info-box-content">
				              <div class="myinfo-box-number">10&nbsp<small>项</small></div>
				              <div class="myinfo-box-text"><a href="#">查看</a></div>
				            </div>
				         </div>
    				</div>
    			</div>
    		
    		</div>
    		<div class="col-md-5"> 
    			<div class="box box-solid ">
		            <div class="box-header">
		              <i class="fa fa-calendar"></i>
		              <h3 class="box-title">日历</h3>
		              <div class="pull-right"><a href="./pages_assessor/reservation.jsp" target="_blank">查看预约日历</a></div>
		            </div>
		            <div class="box-body no-padding">
		              <!--The calendar -->
		              <div id="calendar" style="width: 100%"></div>
		            </div>
          		</div>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col-md-12">
    			<div class="box box-solid">
    				<div class="box-header with-border">
    					<h3 class="box-title">最近操作：</h3>
    				</div>
    				<div class="box-body" >
    							<div class="form-group">
										<table id="recent_operation_datatable" class="table table-bordered table-striped">
					               		 <thead>
							                	<tr>
							                 			<th>操作记录号</th>
														<th>操作人</th>
														<th>申请类型</th>
														<th>审核类别</th>
														<th>操作时间</th>
														<th>操作结果</th>
							               		</tr>
					                	</thead>
					                	<tbody>
						                		<c:forEach var="record" items="${assessorHomeData.operationRecords}">
						                			<tr>
										                  <td>#OR${record.id}</td>
										                  <td>${record.assessor.name}</td>
										                  <td>${record.applicationType}</td>
										                  <td>${record.checkType}</td>
										                  <td><fmt:formatDate value="${record.operationTime}" pattern="yyyy-MM-dd"/></td>
										                  <td>${record.operationResult}</td>
						            				</tr>
						                		</c:forEach>
				                		</tbody>
				              	  	</table>
		              	  	</div>
					</div>	
    			</div>
    		</div>
    	</div>
		<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="./adminlte/plugins/daterangepicker/moment.min.js"></script>
		<script src="./pages_assessor/js/home.js"></script>
		
  </body>
</html>
