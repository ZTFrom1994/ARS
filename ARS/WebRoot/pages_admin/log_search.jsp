<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>日志查询</title>
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
              <h3 class="box-title">日志列表</h3>
            </div>
			<div class="box-body">
				<div class="row"> 
					<div class="col-md-12"> 
						 <table  id="table_log_search"  border="1" class="cell-border" cellspacing="0" width="100%">
					        <thead>
					            <tr style="text-align:center"> 
					                <th>日志编号</th>
					                <th>类型</th>
					                <th>账号</th>
					                <th>姓名</th>
					                <th>账号类型</th>
					                <th>操作时间</th>
					                <th>操作项目</th>
					                <th>日志输出</th>
					            </tr>
					        </thead>
					        <tbody>
					            <tr>
					                <td>0000121</td>
					                <td>审核借款</td>
					                <td>0909123</td>
					                <td>张涛</td>
					                <td>审计员</td>
					                <td>2015-10-12</td>
					                <td>校园一卡通系统购入</td>
					                <td>对象：马志成-39123323 结果：完成</td>
					            </tr>
					             <tr>
					                <td>0000122</td>
					                <td>报销审核</td>
					                <td>0909123</td>
					                <td>张涛</td>
					                <td>审计员</td>
					                <td>2015-10-13</td>
					                <td>校园绿化设施购入</td>
					                <td>对象：马志成-39123323 结果：完成</td>
					            </tr>
					        </tbody>
					    </table>
					</div>				
				</div> 
		  	</div>
		 </div>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_admin/js/log_search.js"></script>
  </body>
</html>
