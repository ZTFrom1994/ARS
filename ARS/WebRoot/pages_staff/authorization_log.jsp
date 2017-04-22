<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>授权日志</title>
    
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
						 <table  id="table_authorization_log"  border="1" class="cell-border" cellspacing="0" width="100%">
					        <thead>
					            <tr>
					                <th>被授权人姓名</th>
					                <th>被授权人职工号</th>
					                <th>项目编号</th>
					                <th>项目名称</th>
					                <th>授权开始时间</th>
					                <th>授权结束时间</th>
					                <th>授权人姓名</th>
					                <th>授权人职工号</th>
					            </tr>
					        </thead>
					        <tbody>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					             <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					             <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					            <tr>
					                <td>魏诺</td>
					                <td>1667</td>
					                <td>J001</td>
					                <td>大型正负电子对撞机</td>
					                <td>11-12-2014</td>
					                <td>-</td>
					                <td>张涛</td>
					                <td>1668</td>
					            </tr>
					        </tbody>
					    </table>
					</div>				
				</div> 
		  	</div>
		 </div>
		<!-- datatable -->
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_staff/js/authorization_log.js"></script>
  </body>
</html>
