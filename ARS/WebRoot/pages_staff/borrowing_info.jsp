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
    
    <title>借款信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
  </head>
  
  <body>
     <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">项目列表</h3>
            </div>
            <div class="box-body">
              <table id="borrow_info_datatable" class="table table-bordered">
                <thead>
                	<tr>
                 			<th>记录编号</th> 
                 			<th>借款时间</th> 
							<th>项目详细</th>
							<th>借款摘要</th>
							<th>借款用途</th>
							<th>借款金额</th>
							<th>已还金额</th>
							<th>需还金额</th>
							<th>还款截止日期</th>
							<th>状态</th>
               		</tr>
                </thead>
                <tbody> 
                 		<c:forEach var="record" items="${allBorrowRecords}">
		              			<tr>
					                  <td>#${record.id}</td> 
					                  <td><fmt:formatDate value="${record.recordDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					                  <td style="text-align:left">
											项目编号：#${record.project.id}<br/>
					                  		项目名称：${record.project.projectName}<br/>
					                  		部门名称：${record.project.department}<br/>
					                  		报销限额：${record.project.reimburseLimit}<br/>
					                  		项目状态：${record.project.state}<br/>
					                  		项目余额：${record.project.balance}元<br/>
										</td>
					                  <td>${record.remarks}</td>
					                  <td>${record.use}</td>
					                  <td>${record.amount}元</td>
					                  <td>${record.paidMoney}元</td>
					                  <td><fmt:formatNumber value="${record.amount-record.paidMoney}" pattern="#0.00"></fmt:formatNumber>元</td>
					                  <td><fmt:formatDate value="${record.paymentTime}" pattern="yyyy-MM-dd HH:mm" /></td>
					                  <td>
											<c:choose>
												<c:when test="${record.state == '还款中'}">
												<span class="label label-primary " >还款中</span>
												</c:when>
												<c:when test="${record.state == '已还清款项'}">
												<span class="label label-success " >已还清款项</span>
												</c:when>
												<c:when test="${record.state == '借款超期未还'}">
												<span class="label label-warning ">借款超期未还</span>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</td>
		            			</tr>
	            		</c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          
		
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_staff/js/borrow_info.js"></script>
  </body>
</html>
