<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'business_function.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap-switch.css">
	<link rel="stylesheet" href="./pages_admin/css/business_function.css">
	<script type="text/javascript" src="./pages_admin/js/business_function.js"></script>

  </head>
  <body>
  			<div class="box box-solid" >
  				<div class="box-header">
	              <h3 class="box-title">功能列表</h3>
	            </div>
	            <div class="box-body">
           			<table id="table_function" class="table table-bordered ">
		                <thead>
		                	<tr>
									<th>#</th>
									<th>功能名称</th>
									<th>描述</th>
									<th>状态</th>
									<th>开启</th>
									<th>关闭</th>
		               		</tr>
		                </thead>
		                <tbody>
		              			<tr>
					                  <td>1</td>
					                  <td>日常报销</td>
					                  <td>教职工日常报销申请，审计员的日常报销预约审核与现场审核</td>
					                  <td>开放中</td>
					                  <c:choose>
					                  	<c:when test="${systemSettings.dailyFunction == 1}">
						                  	<td><input type="radio" name="daily_function_radio" value = "1" checked="checked"/></td>
						                  	<td><input type="radio" name="daily_function_radio" value = "0"/></td>
					                  	</c:when>
					                  	<c:otherwise>
					                  		<td><input type="radio" name="daily_function_radio" value = "1" /></td>
					                  		<td><input type="radio" name="daily_function_radio" value = "0" checked="checked"/></td>
					                  	</c:otherwise>
					                  </c:choose>
		            			</tr> 
		              			<tr>
					                  <td>2</td>
					                  <td>差旅费报销</td>
					                  <td>教职工差旅费报销申请，审计员的差旅费报销预约审核与现场审核</td>
					                  <td>开放中</td>
					                  <c:choose>
					                  	<c:when test="${systemSettings.travelFunction == 1}">
					                  		<td><input type="radio" name="travel_function_radio" value="1" checked="checked"/></td>
					                  		<td><input type="radio" name="travel_function_radio" value="0"/></td>
					                  	</c:when>
					                  	<c:otherwise>
					                  		<td><input type="radio" name="travel_function_radio" value="1"/></td>
					                  		<td><input type="radio" name="travel_function_radio" value="0" checked="checked"/></td>
					                  	</c:otherwise>
					                  </c:choose>
		            			</tr> 
		              			<tr>
					                  <td>3</td>
					                  <td>冲借款</td>
					                  <td>对在借款项使用报销额度对其还款</td>
					                  <td>开放中</td>
					                  <c:choose>
					                  	<c:when test="${systemSettings.offsetFunction == 1}">
					                  		<td><input type="radio" name="offset_function_radio" value="1"checked="checked"/></td>
					                  		<td><input type="radio" name="offset_function_radio" value="0"/></td>
					                  	</c:when>
					                  	<c:otherwise>
					                  		<td><input type="radio" name="offset_function_radio" value="1"/></td>
					                 	 	<td><input type="radio" name="offset_function_radio" value="0" checked="checked"/></td>
					                  	</c:otherwise>
					                  </c:choose>
					                  
		            			</tr> 
		              			<tr>
					                  <td>4</td>
					                  <td>借款</td>
					                  <td>个人通过项目额度进行借款</td>
					                  <td>开放中</td>
					                  <c:choose>
					                  	<c:when test="${systemSettings.borrowFunction == 1}">
					                  		<td><input type="radio" name="borrow_function_radio" value="1" checked="checked"/></td>
					                  		<td><input type="radio" name="borrow_function_radio" value="0"/></td>
					                  	</c:when>
					                  	<c:otherwise>
					                  		<td><input type="radio" name="borrow_function_radio" value="1" /></td>
					                  		<td><input type="radio" name="borrow_function_radio" value="0"checked="checked"/></td>
					                  	</c:otherwise>
					                  </c:choose>
		            			</tr> 
		                </tbody>
		              </table>
	            </div>
	            <div class="box-footer" >
					<button id="btn_function_submit" type="submit" class="btn btn-primary pull-right" style="margin-right:40px">
						保存
					</button>
				</div>
			</div>
  </body>
</html>
