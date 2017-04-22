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
	   
	<title>报账单</title>
	   
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
<div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i class="fa fa-globe"></i> 西安建筑科技大学-报账单
          <small class="pull-right">日期: <fmt:formatDate value="${printSheet.date}" pattern="yyyy/MM/dd" /></small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
      <div class="col-sm-3 invoice-col">
        <b>编　　号： #</b>BX${printSheet.id}<br>
        <br>
        <b>姓　　名:　</b> ${printSheet.travelReimbursement.proposer.id}<br>
        <b>项目名称:　</b> ${printSheet.travelReimbursement.project.projectName}<br>
        <b>类　　别:　</b> 差旅费报销<br>
        
      </div>
      <!-- /.col -->
      <div class="col-sm-3 invoice-col">
        <br>
        <br>
        <b>出差人数:　</b> ${printSheet.travelReimbursement.peopleNumber}<br/>
        <b>出差时间:　</b> <fmt:formatDate value="${printSheet.travelReimbursement.travelTime}" pattern="yyyy-MM-dd" /><br/>
        <b>出差地点:　</b> ${printSheet.travelReimbursement.place}<br/>
      </div>
      <div class="col-sm-3 invoice-col">
        <br>
        <br>
        <b>申请时间:　</b> <fmt:formatDate value="${printSheet.travelReimbursement.applyDate}" pattern="yyyy-MM-dd HH:mm" /><br>
        <b>预约时间:　</b> <fmt:formatDate value="${printSheet.travelReimbursement.event.startTime}" pattern="yyyy-MM-dd HH:mm" />至<fmt:formatDate value="${printSheet.travelReimbursement.event.endTime}" pattern="HH:mm" /><br>
        <b>状　　态:　</b> ${printSheet.travelReimbursement.state}<br>
      </div>
      <!-- /.col -->
      <div class="col-sm-3 invoice-col">
        <br>
        <br>
        <c:choose>
        	<c:when test="${ not empty printSheet.travelReimbursement.offsetBorrowing}">
	        	<b>是否冲借款:　</b> 是<br>
		        <b>冲借款金额:　</b> ${printSheet.travelReimbursement.offsetBorrowing.amount} <br>
		        <b>借款记录号:　</b> #BR${printSheet.travelReimbursement.offsetBorrowing.borrowRecord.id}<br>
        	</c:when>
        	<c:otherwise>
        		<b>是否冲借款:　</b> 否<br>
		        <b>冲借款金额:　</b> <br>
		        <b>借款记录号:　</b> <br>
        	</c:otherwise>
        </c:choose>
        
        <b>　　　</b>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
      <div class="col-xs-12 table-responsive">
      <br/>
        <table class="table table-bordered">
          <thead>
          <tr >
            <th>序号</th>
            <th>项目</th>
            <th>子项目</th>
            <th>人数</th>
            <th>单价</th>
            <th>票据张数</th>
            <th width="40%">描述</th>
          </tr>
          </thead>
          <tbody style="text-align:center">
          	<c:forEach items="${printSheet.travelReimbursement.itemList}" varStatus="status" var="option">
	          <tr>
	            <td>${status.index + 1}</td>
	            <td>${option.largeClass}</td>
	            <td>${option.largeClass}</td>
	            <td>${option.peopleNumber}</td>
	            <td>${option.singlePrice}</td>
	            <td>${option.sheetNumber}</td>
	            <td style="text-align:left">${option.description}</td>
	          </tr>
	          </c:forEach>
          </tbody>
        </table>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
      <!-- accepted payments column -->
      <div class="col-xs-6">
        <p class="lead">支付方式：${printSheet.travelReimbursement.paymentType}</p>
        <p>其他信息：</p>
		        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
		        	${printSheet.travelReimbursement.remarks}
		 </p>
      </div>
      <!-- /.col -->
      <div class="col-xs-6">
        <p class="lead">支付信息</p>
        <div class="table-responsive">
          <table class="table">
            <tr>
              <th style="width:50%">应付金额:</th>
              <td>${printSheet.travelReimbursement.totalMoney}</td>
            </tr>
            <tr>
              <th>冲借款:</th>
              <c:choose>
	        	<c:when test="${printSheet.travelReimbursement.offsetBorrowing != null}">
	        		<td>${printSheet.travelReimbursement.offsetBorrowing.amount}</td>
	        	</c:when>
	        	<c:otherwise>
	        		<td>0.00</td>
	        	</c:otherwise>
        	</c:choose>
            </tr>
            <tr>
              <th>其他扣除:</th>
              <td>0</td>
            </tr>
            <tr><th>实付金额:</th>
              <td>${printSheet.travelReimbursement.totalMoney - printSheet.travelReimbursement.offsetBorrowing.amount}</td>
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
<!-- ./wrapper -->
</body>
</html>
