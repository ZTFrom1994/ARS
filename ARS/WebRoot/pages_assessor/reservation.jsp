<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="images/logo.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="images/logo.ico">
	<link rel="Bookmark" href="images/logo.ico">
	<!-- Bootstrap 3.3.6 -->
		<link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap.min.css">
	<link href='./fullcalendar-3.2.0/fullcalendar.min.css' rel='stylesheet' />
	<link href='./fullcalendar-3.2.0/fullcalendar.print.min.css' />
	<!-- jQuery 2.2.3 -->
	<script src="./adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
	<script src='./fullcalendar-3.2.0/lib/moment.min.js'></script>
	<script src='./fullcalendar-3.2.0/lib/jquery-ui.min.js'></script>
	<script src='./fullcalendar-3.2.0/fullcalendar.min.js'></script>
	<script src='./fullcalendar-3.2.0/locale/zh-cn.js'></script> 
	<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="./pages_assessor/js/reservation.js"></script>
  </head>
  
  <body>
    	<div class="row">
    		<div class="col-md-12">
    			<div id="assessor_calender"></div>
    		</div>
    	</div>
  </body>
</html>
