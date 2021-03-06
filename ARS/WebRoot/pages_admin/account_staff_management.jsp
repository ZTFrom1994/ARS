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
    
    <title>教职工账户</title>
    
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
              <h3 class="box-title">账户列表</h3>
              <div class="box-tools pull-right"> 
	                	<button type="button" class="btn btn-primary " id="btn_add_staff">添加账户</button>
              </div>
            </div>
            <div class="box-body">
              <table id="table_account_staff" class="table table-bordered ">
                <thead>
                	<tr>
							<th>职工编号</th>
							<th>姓名</th>
							<th>所属部门</th>
							<th>职位</th>
							<th>注册时间</th>
							<th>账号状态</th>
							<th>禁封操作</th>
               		</tr>
                </thead>
                <tbody>
                		<c:forEach var="staff" items="${staffList}">
	              			<tr>
				                  <td>${staff.id}</td>
				                  <td>${staff.name}</td>
				                  <td>${staff.department}</td>
				                  <td>${staff.positionName}</td>
				                  <td><fmt:formatDate value="${staff.registerDate}" pattern="yyyy-MM-dd"/></td>
				                  <td>${staff.state}</td>
				                  <td>
				                  	<c:choose>
				                  		<c:when test="${staff.state == '正常'}">
				                  		 	<a class="a-staff-handle" name="0" title="${staff.id}">封禁</a>
				                  		</c:when>
				                  		<c:when test="${staff.state == '已封禁'}">
				                  		 	<a class="a-staff-handle" name="1" title="${staff.id}">解除封禁</a>
				                  		</c:when>
				                  	</c:choose>
				                 </td>
	            			</tr> 
                		</c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <div class="modal " id="addStaffModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="margin-top:100px;">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">添加教职工账户</h4>
		            </div>
		            <div class="modal-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label >职工编号</label><span id="staff_id_tips" class="hide" style="color:red">(输入的职工号已存在!)</span>
										<input type="text" class="form-control" id="input_staff_id"  onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label >姓名</label>
										<input type="text" class="form-control" id="input_staff_name"  >
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label >部门名称</label>
										<input type="text" class="form-control" id="input_staff_department"  >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label >职位名称</label>
										<input type="text" class="form-control" id="input_staff_position"  >
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label >初始密码</label>
										<input type="text" class="form-control" value="666666" disabled>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label >性别</label>
										<select class="form-control" id="select_staff_sex">
											<option value="0">男</option>
											<option value="1">女</option>
										</select>
									</div>
								</div>
							</div>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" class="btn btn-primary" id="btn_add_staff_submit">提交</button>
		            </div>
		        </div>
		    </div>   
		  </div>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_admin/js/account_staff.js"></script>
  </body>
</html>
