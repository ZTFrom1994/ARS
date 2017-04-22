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
	   
	<title>借款单</title>
	   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="./adminlte/dist/css/AdminLTE.min.css">

  </head>
  
  <body>
	<div class="wrapper" style="margin-top:0px;margin-bottom:0px;">
		  <!-- Main content -->
		  <section class="invoice">
		    <!-- title row -->
		    <div class="row">
		      <div class="col-xs-12">
		        <h2 class="page-header">
		          <i class="fa fa-globe"></i> 西安建筑科技大学-借款单
		          <small class="pull-right">日期: <fmt:formatDate value="${printSheet.date}" pattern="yyyy/MM/dd" /></small>
		        </h2>
		      </div>
		      <!-- /.col -->
		    </div>
		    <!-- info row -->
		    <div class="row invoice-info">
		      <div class="col-sm-4 invoice-col">
		        <b>编号： #</b>JK${printSheet.id}<br>
		        <br>
		        <b>姓　　名:　</b> ${printSheet.borrowApplication.borrower.id}<br>
		        <b>项目名称:　</b> ${printSheet.borrowApplication.project.projectName}<br>
		        <b>用　　途:　</b> ${printSheet.borrowApplication.use}<br>
		      </div>
		      <div class="col-sm-4 invoice-col">
		       <br>
		        <br>
		      	<b>借款金额:　</b> ${printSheet.borrowApplication.amount}元<br>
		      	<b>借款天数:　</b> ${printSheet.borrowApplication.paymentDaysLimit}天<br>
		        <b>支付方式:　</b> ${printSheet.borrowApplication.paymentType}<br>
		      </div>
		      <div class="col-sm-4 invoice-col">
		        <br>
		        <br>
		        <b>申请时间:　</b><fmt:formatDate value="${printSheet.borrowApplication.applyDate}" pattern="yyyy-MM-dd HH:mm" /><br>
		        <b>预约时间:　</b> <fmt:formatDate value="${printSheet.borrowApplication.event.startTime}" pattern="yyyy-MM-dd HH:mm" />至<fmt:formatDate value="${printSheet.borrowApplication.event.endTime}" pattern="HH:mm" /><br>
		       	<b>状　　态:　</b> ${printSheet.borrowApplication.state}<br>
		      </div>
		      <!-- /.col -->
		    </div>
		    
		    <div class="row">
			      <div class="col-xs-12 table-responsive">
			      <label style="margin-top:14px;"><h4>借款项目信息</h4></label>
			      <br/>
			        <table class="table table-striped">
			          <thead>
				          <tr>
				            	<th>项目编号</th>
								<th>项目所属部门</th>
								<th>项目名称</th>
								<th>负责人姓名</th>
								<th>项目额度</th>
								<th>项目余额</th>
								<th>项目状态</th>
				          </tr>
			          </thead>
			          <tbody>
				          <tr style="text-align: center">
				            <td>#PR${printSheet.borrowApplication.project.id}</td>
				            <td>${printSheet.borrowApplication.project.department}</td>
				            <td>${printSheet.borrowApplication.project.projectName}</td>
				            <td>${printSheet.borrowApplication.project.principal.name}</td>
				            <td>${printSheet.borrowApplication.project.reimburseLimit}</td>
				            <td>${printSheet.borrowApplication.project.balance}</td>
				            <td>${printSheet.borrowApplication.project.state}</td>
				          </tr>
			          </tbody>
			        </table>
			      </div>
			      <!-- /.col -->
			    </div>
			    <!-- /.row -->
		    <!-- /.row -->
		    <div class="row">
		      <!-- accepted payments column -->
		      <div class="col-xs-6">
		        <p class="lead">支付方式：${printSheet.borrowApplication.paymentType}</p>
	        	<p>借款摘要：</p>
		        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
		         		${printSheet.borrowApplication.remarks}
		        </p>
		      </div>
		      <!-- /.col -->
		      <div class="col-xs-6">
		        <p class="lead">支付信息</p>
			        <div class="table-responsive">
			          <table class="table">
				            <tr>
				              <th style="width:50%">应付金额:</th>
				              <td>${printSheet.borrowApplication.amount}</td>
				            </tr>
				            <tr>
				              <th>其他扣除:</th>
				              <td>0</td>
				            </tr>
				            <tr><th>实付金额:</th>
				              <td>${printSheet.borrowApplication.amount}</td>
				            </tr>
				          </table>
			        </div>
		      </div>
		      <!-- /.col -->
		    </div>
		    <!-- /.row -->
		  </section>
		  <!-- /.content -->
		</div>
</body>
</html>
