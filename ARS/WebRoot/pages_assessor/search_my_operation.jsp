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
    
    <title>我的操作记录</title>
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
    <link rel="stylesheet" href="./pages_staff/css/search_progress.css"/>
    <!-- jQuery 2.2.3 -->
	<script src="./adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./adminlte/dist/js/app.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
    <script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
   	<script src="./pages_assessor/js/search_my_operation.js"></script>
  </head>
  
  <body >	
        <div class="box box-solid">
            <div class="box-body">
	            	<table id="table_my_operation" border="1" class="cell-border" cellspacing="0" width="100%">
		                <thead>
		                	<th>序号</th>
		                	<th>操作记录号</th>
							<th>操作人</th>
							<th>申请类型</th>
							<th>审核类别</th>
							<th>操作时间</th>
							<th>操作结果</th>
		                </thead>
		                <tbody> 
		              			<c:forEach var="record" varStatus="var" items="${myOperationRecords}">
		                			<tr>
						                  <td>${var.index+1}</td>
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
  </body>
</html>
