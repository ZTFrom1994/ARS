<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<base href="<%=basePath%>">
	   
	<title>全部借款单</title>
	   
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
		          <small class="pull-right">日期: 1/2/2016</small>
		        </h2>
		      </div>
		      <!-- /.col -->
		    </div>
		    <!-- info row -->
		    <div class="row invoice-info">
		      <div class="col-sm-4 invoice-col">
		        <b>编号： #007612</b><br>
		        <br>
		        <b>姓　　名:　</b> 张涛<br>
		        <b>项目名称:　</b> 校园卡购入<br>
		        <b>借款金额:　</b> ¥30000<br>
		        <b>结　　果:　</b> 借款已发放<br>
		      </div>
		      <!-- /.col -->
		      <div class="col-sm-4 invoice-col">
		        <br>
		        <br>
		        <b>申请时间:　</b> 2/22/2014<br>
		        <b>审　　核:　</b> 通过<br>
		        <b>审核人员:　</b>#007612 张琪
		        <b>应还日期:　</b>2/22/2014
		      </div>
		      <!-- /.col -->
		      <div class="col-sm-4 invoice-col">
		      </div>
		      <!-- /.col -->
		    </div>
		    <!-- /.row -->
		
		    <!-- Table row -->
		    <div class="row">
		      <div class="col-xs-12 table-responsive">
		      <br/>
		        <table class="table table-striped">
		          <thead>
		          <tr>
		            <th>序号</th>
		            <th>名称</th>
		            <th>数量</th>
		            <th>单价</th>
		            <th>描述</th>
		            <th>总价</th>
		          </tr>
		          </thead>
		          <tbody>
		          <tr>
		            <td>1</td>
		            <td>校园卡</td>
		            <td>35000</td>
		            <td>2</td>
		            <td>校园一卡通</td>
		            <td>70000</td>
		          </tr>
		          </tbody>
		        </table>
		      </div>
		      <!-- /.col -->
		    </div>
		    <!-- /.row -->
		    <div class="row">
		      <!-- accepted payments column -->
		      <div class="col-xs-6">
		        <p class="lead">支付方式：网上银行转账</p>
	        	<p>借款摘要：</p>
		        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
		         	 由于资金紧缺，现在需要借款一笔
		        </p>
		      </div>
		      <!-- /.col -->
		      <div class="col-xs-6">
		        <p class="lead">支付时间  2/22/2014</p>
		
		        <div class="table-responsive">
		          <table class="table">
		            <tr>
		              <th style="width:50%">应付金额:</th>
		              <td>¥70000</td>
		            </tr>
		            <tr>
		              <th>其他扣除</th>
		              <td>0</td>
		            </tr>
		            <tr><th>实付金额：</th>
		              <td>¥70000</td>
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
