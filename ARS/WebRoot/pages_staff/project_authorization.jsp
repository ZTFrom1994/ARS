<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目授权</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables --> 
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
	<!-- bootstrap datepicker -->
  	<link rel="stylesheet" href="./adminlte/plugins/datepicker/datepicker3.css">
  </head>
  
  <body>
    <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">项目授权</h3>
            </div>
			<div class="box-body">
                <div class="row">
                	<div class="form-group">
						<div class="col-md-12">
							<label >请选择项目</label>
							<table id="project_authorization_datatable" class="table table-bordered table-striped">
		               		 <thead>
				                	<tr>
				                 			<th>序号</th>
											<th>部门编号</th>
											<th>部门名称</th>
											<th>项目编号</th>
											<th>项目名称</th>
											<th>项目余额</th>
											<th>报销截止日期</th>
											<th>项目状态</th>
											<th>额度信息</th>
											<th>选择</th>
				               		</tr>
		                	</thead>
		                	<tbody>
			              			<tr>
						                  <td>1</td>
						                  <td>001</td>
						                  <td>教务处</td>
						                  <td>J001</td>
						                  <td>关于开学期间的安保工作</td>
						                  <td>20000.00</td>
						                  <td>11-7-2014</td>
						                  <td><span class="label label-success">已完成</span></td>
						                  <td><a href="#">查看</a></td>
						                  <td><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" ></td>
			            			</tr>
			              			
		                		</tbody>
		              	  	</table>
	              	  	</div>
					</div>	
                </div>
                <div class="row">
                	<div class="col-md-12">
                		<label >请选择被授权人</label>
							<table id="staff_datatable" class="table table-bordered table-striped">
		               		 	<thead>
				                	<tr>
					                  <th>职工号</th>
					                  <th>姓名</th>
					                  <th>性别</th>
					                  <th>职称</th>
					                  <th>注册时间</th>
					                  <th>选择</th>
					                </tr>
			                	</thead>
		                		<tbody>
					                <tr>
					                  <td>18332312</td>
					                  <td>魏诺</td>
					                  <td>男</td>
					                  <td>激光物理学教授</td> 
					                  <td>10-12-2015</td>
					                  <td><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked></td>
					                </tr>
		                		</tbody>
		              	  	</table>
                	</div>
                </div>
                <div class="row">
                	<div class="col-md-12">
                		<div style="float:left" >
	                		<label  style="float-left">授权类型:　</label>
	                		<input type="radio" style="float-left"name="authorization_type"  value="forever" checked>永久授权
	                		<input type="radio" style="float-left" name="authorization_type"  value="temporary" >短期授权
                			<label  style="float-left">　选择被授权人项目截止日期：</label>
                		</div>
                		<div class="input-group date" style="float-left;width:180px">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
			                  	<input type="text" class="form-control " id="datepicker"  disabled>
			            </div>
                	</div> 
                </div>
			</div>
			<div class="box-footer" >
					<button type="submit" class="btn btn-primary pull-right" style="margin-right:40px">
						提交
					</button>
			</div>
		</div>
		<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
	  	<script type="text/javascript" src="./pages_staff/js/project_authorization.js"></script>

  </body>
</html>
