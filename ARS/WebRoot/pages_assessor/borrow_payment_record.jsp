<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>还款登记</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome --> 
	<link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.min.css">
	<!-- Ionicons --> 
	<link rel="stylesheet" href="./ionicons-2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="./adminlte/dist/css/AdminLTE.min.css"> 
	<link rel="stylesheet" href="./adminlte/dist/css/skins/skin-green-light.min.css">
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="./pages_assessor/css/clearing_borrow.css"/>
    <!-- jQuery 2.2.3 -->
	<script src="./adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./adminlte/dist/js/app.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
    <script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
   	<script src="./pages_assessor/js/borrow_payment_record.js"></script>
  </head>
  
  <body >	
        <div class="box box-solid">
            <div class="box-body">
	            	<table id="table_borrow"  class="table table-bordered" >
		                <thead>
		                	<th>借款单编号</th>
							<th>借款摘要</th>
							<th>借款项目名称</th>
							<th>借款时间</th>
							<th>用途</th>
							<th>借款人</th>
							<th>借款金额</th>
							<th>已还金额</th>
							<th>需还金额</th>
							<th>还款截止日</th>
							<th>状态</th>
							<th>操作</th>
		                </thead>
		                <tbody> 
		              			<c:forEach var="record" varStatus="var" items="${clearingBorrow}">
		                			<tr>
						                  	<td>#JK${record.id}</td>
					                		<td>${record.borrowRecord.remarks}</td>
					                		<td>${record.borrowRecord.project.projectName}</td>
					                		<td><fmt:formatDate value="${record.borrowRecord.recordDate}" pattern="yyyy-MM-dd"/></td>
					                		<td>${record.borrowRecord.use}</td>
					                		<td>${record.borrowRecord.borrower.name}</td>
					                		<td>${record.borrowRecord.amount}</td>
					                		<td>${record.borrowRecord.paidMoney}</td>
					                		<td><fmt:formatNumber value="${record.borrowRecord.amount - record.borrowRecord.paidMoney}" pattern="#0.00"/></td>
					                		<td><fmt:formatDate value="${record.borrowRecord.paymentTime}" pattern="yyyy-MM-dd"/></td>
					                		<td>
					                				<c:set var="nowDate">  
					    									<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd " type="date"/>  
														</c:set> 
														<c:set var="createDate">  
					 										<fmt:formatDate value="${record.borrowRecord.paymentTime}" pattern="yyyy-MM-dd " type="date"/>  
														</c:set> 
					                				<c:choose>
					                					<c:when test="${createDate > nowDate}">
					                						<span class="label label-primary">还款中</span>
					                					</c:when>
					                					<c:otherwise>
					                						<span class="label label-danger ">逾期</span>
					                					</c:otherwise>
					                				</c:choose>
					                		</td>
					                		<td>
												<a class="a_clearing" >还款登记</a>
											</td>
		            				</tr>
		                		</c:forEach>
		               	</tbody>
            		</table>
            </div>
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
		<div class="modal " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">还款登记</h4>
		            </div>
		            <div class="modal-body">
							<div class="row">
								<div class="col-md-4">借款单编号：<span id="span_clearing_borrow_id"></span></div>
								<div class="col-md-4">借款日期：<span id="span_borrow_date"></span></div>
								<div class="col-md-4">借款人：<span id="span_borrower_name"></span></div>
							</div>
							<div class="row">
								<div class="col-md-4">借款金额：<span id="span_borrow_amount"></span></div>
								<div class="col-md-4">已还金额：<span id="span_have_paid"></span></div>
								<div class="col-md-4">需还金额：<span id="span_need_to_pay"></span></div>
							</div>
							<div class="row" style="margin-top:15px;">
								<div class="col-md-6">操作人：${currentUser.name}</div>
								<div class="col-md-6">
									<div class="input-group input-group-sm">
							            <span class="input-group-addon">本次还款金额</span>
							            <input type="text" class="form-control money-format" id="input_pay" placeholder="0.00">
        							</div>
								</div>
							</div>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" class="btn btn-primary" id="btn_clearing_borrow">提交</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		
  </body>
</html>
