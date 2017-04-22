<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>系统设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <!-- iCheck -->
 	<link href="./adminlte/plugins/iCheck/square/square.css" rel="stylesheet">
 	<link href="./adminlte/plugins/iCheck/flat/flat.css" rel="stylesheet">
 	<link href="./adminlte/plugins/iCheck/minimal/minimal.css" rel="stylesheet">
 	<link href="./pages_admin/css/system_settings.css" rel="stylesheet">

  </head>
  
  <body>
    <div class="row">
    	<div class="col-md-12">
    		<div class="box box-solid">
    			<div class="box-header">
    				<h3 class="box-title">系统开放</h3>
    			</div>
    			<div class="box-body" style="border-top:1px solid #F4F4F4">
    				<div class="row" >
    					<c:choose>
    						<c:when test="${systemSettings.systemOpen == 1}">
    							<div class="col-md-2" id="open_msg">
		    						<label style="font-size:16px;"> 
				                  		<input type="radio" name="system_on_off" class="square-black " checked value="1"><span>&nbsp开启系统</span>
				                	</label>
    							</div>
		    					<div class="col-md-2" id="close_msg">
		    						<label style="font-size:16px;" >
				                  		<input type="radio" name="system_on_off" class="square-black " value="0" ><span>&nbsp关闭系统</span>
				                	</label>
		    					</div>
    						</c:when>
    						<c:otherwise>
    							<div class="col-md-2" id="open_msg">
		    						<label style="font-size:16px;"> 
				                  		<input type="radio" name="system_on_off" class="square-black " value="1"><span>&nbsp开启系统</span>
				                	</label>
    							</div>
		    					<div class="col-md-2" id="close_msg">
		    						<label style="font-size:16px;" >
				                  		<input type="radio" name="system_on_off" class="square-black "  checked  value="0" ><span>&nbsp关闭系统</span>
				                	</label>
		    					</div>
    						</c:otherwise>
    					</c:choose>
    					
              		</div>
    			</div>
    			<div class="box-footer" >
					<button id="btn_system_open" type="submit" class="btn btn-primary pull-right" style="margin-right:40px">
						保存
					</button>
				</div>
    		</div>
    	</div>
    </div>
    <!-- iCheck -->
	<script src="./adminlte/plugins/iCheck/icheck.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="./adminlte/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script src="./pages_admin/js/system_settings.js"></script>
  </body>
</html>
