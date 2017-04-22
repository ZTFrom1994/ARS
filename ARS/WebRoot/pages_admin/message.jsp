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
    
    <title>历史消息列表</title>
    
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
              <h3 class="box-title">消息列表</h3>
            </div>
			<div class="box-body">
				<div class="row"> 
					<div class="col-md-12"> 
						 <table  id="table_message"  border="1" class="cell-border" cellspacing="0" width="100%">
					        <thead>
					            <tr style="text-align:center"> 
					                <th>序号</th>
					                <th>内容</th>
					                <th>对象</th>
					                <th>推送人账号</th>
					                <th>推送人姓名</th>
					                <th>推送时间</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:forEach var="message" varStatus="status" items="${allPushedMessages}">
						            <tr>
						                <td>${status.index + 1}</td>
						                <td>${message.content}</td>
						                <td>
													<c:choose>
														<c:when test="${message.object == 0}">全部人</c:when>
														<c:when test="${message.object == 1}">审计员</c:when>
														<c:when test="${message.object == 2}">教职工</c:when>
														<c:when test="${message.object == 3}">管理员</c:when>
													</c:choose>
										</td>
						                <td>${message.admin.id}</td>
						                <td>${message.admin.name}</td>
						                <td><fmt:formatDate value="${message.date}" pattern="yyyy-MM-dd HH:mm"/></td>
						            </tr>
					            </c:forEach>
					        </tbody>
					    </table>
					</div>				
				</div> 
		  	</div>
		 </div>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_admin/js/message.js"></script>
  </body>
</html>
