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
    
    <title>借款申请审核</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="./pages_assessor/css/check_register_borrow.css">
  </head>
  
  <body>
     <div class="box box-solid">
        	<div class="box-header with-border">
              <h3 class="box-title">待审核列表</h3>
            </div>
            <div class="box-body">
              <table id="table_audit_borrow" class="table table-bordered ">
                <thead>
                	<tr>
                 			<th>借款单编号</th>
							<th>借款金额</th>
							<th>借款天数</th>
							<th>借款摘要</th>
							<th>申请时间</th>
							<th>用途</th>
							<th>支付方式</th>
							<th>借款项目详细</th>
							<th>申请人</th>
							<th>操作</th>
							<th>附加信息</th>
               		</tr>
                </thead>
                <tbody>
                	<c:forEach items="${checkAndRegisterList}" var="item">
                		<c:choose>
                			<c:when test="${not empty item.borrowApplication}">
                				<tr>
				                  <td>BX${item.id}</td>
				                  <td>${item.borrowApplication.amount}</td>
				                  <td>${item.borrowApplication.paymentDaysLimit}天</td>
				                  <td>${item.borrowApplication.remarks}</td>
				                  <td><fmt:formatDate value="${item.borrowApplication.applyDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				                  <td>${item.borrowApplication.use}</td>
				                  <td>${item.borrowApplication.paymentType}</td>
				                  <td style="text-align:left">
				                  		项目编号：#${item.borrowApplication.project.id}<br/>
				                  		部门名称：${item.borrowApplication.project.department}<br/>
				                  		报销限额：${item.borrowApplication.project.reimburseLimit}<br/>
				                  		项目状态：${item.borrowApplication.project.state}<br/>
				                  		项目余额：${item.borrowApplication.project.balance}<br/>
				                  </td>
				                  <td style="text-align:left">
				                  		姓名：${item.borrowApplication.borrower.name}<br/>
			                  			职位：${item.borrowApplication.borrower.department}-${item.borrowApplication.borrower.positionName}<br/>
			                  			信用分：${item.borrowApplication.borrower.creditIntegral}<br/>
				                  </td>
				                  <td>
										<div class="row invoice_options">
												<p class="check-ok-text check-text" title="${item.id}-1">已借款</p>
												<p class="check-no-text check-text" title="${item.id}-0">已拒绝</p>
										</div>
									</td>
				                  <td>
				                	<textarea   rows="6" id="" placeholder="借款未通过原因等"></textarea>  
								</td>
            					</tr>
                			</c:when>
                		</c:choose>
                		
                	</c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer ">
					<button id="btn_b_check_register_submit" type="submit" class="btn btn-primary pull-right" style="margin-right:40px" disabled>
						提交
					</button>
			  </div>
          </div>
          <!-- /.box -->
		
		<!-- datatable --> 
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="./pages_assessor/js/check_register_borrow.js"></script>
  </body>
</html>
