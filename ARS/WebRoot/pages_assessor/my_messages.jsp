<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>assessor消息列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
    	<div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">消息列表</h3>
            </div>
            <div class="box-body">
              <table id="table_admin_message" class="table table-bordered ">
                <thead>
                	<tr>
							<th>序号</th>
							<th>内容</th>
							<th>发送人</th>
							<th>时间</th>
               		</tr>
                </thead>
                <tbody>
                		<c:forEach varStatus="status" var="message" items="${assessorMessages}">
	              			<tr>
				                  <td>${status.index + 1}</td>
				                  <td>${message.content}</td>
				                  <td>
				                  	<c:choose>
										<c:when test="${message.admin != null}">
											管理员
										</c:when>
										<c:otherwise>
											系统消息
										</c:otherwise>
									</c:choose>
				                  </td>
				                  <td><fmt:formatDate value="${message.date}" pattern="yyyy-MM-dd HH:mm"/></td>
	            			</tr> 
                		</c:forEach>
                </tbody>
              </table>
            </div>
          </div>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_assessor/js/my_messages.js"></script>
  </body>
</html>
