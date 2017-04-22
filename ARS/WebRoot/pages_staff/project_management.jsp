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
    
    <title>项目管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
    <script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
   	<script src="./pages_staff/js/project_management.js"></script>
  </head>
  
  <body>
        <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">项目列表</h3>
            </div>
            <div class="box-body">
              <table id="table_project_datatable" class="table table-bordered table-striped">
                <thead>
                	<tr>
							<th>项目编号</th>
							<th>项目所属部门</th>
							<th>项目名称</th>
							<th>负责人姓名</th>
							<th>项目额度</th>
							<th>余额</th>
							<th>借款金额</th>
							<th>已授权人</th>
							<th>报销单</th>
							<th>借款单</th>
							<th>项目状态</th>
               		</tr>
                </thead>
                <tbody class="mytbody">
                	<c:forEach var="project" items="${projects}">
		                	<tr>
		                		<td>${project.id}</td>
		                		<td>${project.department}</td>
		                		<td>${project.projectName}</td>
		                		<td>${project.principal.name}</td>
		                		<td>${project.reimburseLimit}</td>
		                		<td>${project.balance}</td>
		                		<td>添补</td>
		                		<td>添补</td>
		                		<td><a href="#">添补</a></td>
		                		<td><a href="#">添补</a></td>
		                		<td>${project.state}</td>
		                	</tr>
                	</c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
  </body>
</html>
