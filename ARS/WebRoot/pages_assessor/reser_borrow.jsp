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
    
    <title>借款预约审核</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="./pages_assessor/css/reservation.css"/>
  </head>
  
  <body>
     <div class="box box-solid">
        	<div class="box-header with-border">
              <h3 class="box-title">待审核列表</h3>
            </div>
            <div class="box-body">
              <table id="table_audit_borrow_reimbursement" class="table table-bordered ">
                <thead>
                	<tr>
                 			<th>申请编号</th> 
							<th>项目名称</th>
							<th>预约时间</th>
							<th>借款金额</th>
							<th>借款摘要</th>
							<th>借款用途</th>
							<th>借款时长</th>
							<th>借款人信息</th>
							<th>通过</th>
							<th>不通过</th>
               		</tr>
                </thead>
                <tbody> 
              			<c:forEach var="item" items="${borrowApplications}">
	              			<tr>
				                  <td>#BR${item.id}</td>
				                  <td>${item.project.projectName}</td>
				                  <td ><fmt:formatDate value="${item.event.startTime}" pattern="yyyy-MM-dd HH:mm" />至<fmt:formatDate value="${item.event.endTime}" pattern="HH:mm" /></td>
				                  <td>${item.amount}元</td>
				                  <td>${item.remarks}</td>
				                  <td>${item.use}</td>
				                  <td>${item.paymentDaysLimit}天</td>
				                  <td>
				                  			姓名：${item.borrower.name}<br/>
				                  			职位：${item.borrower.department}-${item.borrower.positionName}<br/>
				                  			信用分：${item.borrower.creditIntegral}<br/>
				                  </td>
				                  <td class="td-pass" title="1-${item.id}">
											<span style="font-size:40px;" class=" glyphicon glyphicon-ok ">
											</span>
								  </td>
				                  <td class="td-no-pass" title="0-${item.id}">
										<span  style="font-size:40px;" class="glyphicon glyphicon-remove ">
										</span>
				                  </td>
	            			</tr>
	            		</c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer" >
				<button type="submit" disabled="disabled" class="btn btn-primary pull-right" id="btn_borrow_submit" style="margin-right:40px">
					提交已选
				</button>
			</div>
          </div>
          <!-- /.box -->
		
		<!-- datatable --> 
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_assessor/js/reser_borrow.js"></script>
  </body>
</html>
