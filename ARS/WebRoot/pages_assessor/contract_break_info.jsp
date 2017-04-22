<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>违约信息管理</title>
    
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
              <h3 class="box-title">违约信息列表</h3>
            </div>
            <div class="box-body">
              <table id="table_break_info" class="table table-bordered ">
                <thead>
                	<tr>
                 			<th>业务序号</th>
							<th>业务类型</th>
							<th>违约类型</th>
							<th>相关项目详细</th>
							<th>违约原因</th>
							<th>违约人姓名</th>
							<th>违约人账号</th>
							<th>扣除信用分</th>
							<th>操作人</th>
							<th>备注</th>
               		</tr>
                </thead>
                <tbody>
              			<tr>
			                  <td>00001</td>
			                  <td>借款</td>
			                  <td>逾期未还款</td>
			                  <td><a href="">查看</a></td>
			                  <td>暂无</td>
			                  <td>张涛</td>
			                  <td>131004004</td>
			                  <td>30</td>
			                  <td>马志成</td>
			                  <td>暂无</td>
            			</tr>
              			<tr>
			                  <td>00002</td>
			                  <td>报销</td>
			                  <td>单据造假</td>
			                  <td><a href="">查看</a></td>
			                  <td>暂无</td>
			                  <td>张涛</td>
			                  <td>131004004</td>
			                  <td>30</td>
			                  <td>张春</td>
			                  <td>暂无</td>
            			</tr>
              			
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
		
		<!-- datatable --> 
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="./pages_assessor/js/contract_break_info.js"></script>
  </body>
</html>
