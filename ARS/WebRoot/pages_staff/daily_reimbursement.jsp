<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
	<head>
		<base href="<%=basePath%>">
		<title>日常报销</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- DataTables -->
    	<link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
    	<link href='./fullcalendar-3.2.0/fullcalendar.min.css' rel='stylesheet' />
		<link href='./fullcalendar-3.2.0/fullcalendar.print.min.css' />
		<link rel="stylesheet" href="./pages_staff/css/calendar.css">
	</head>

	<body>
	
	<div class="box box-solid" id="daily_box">
            <div class="box-header with-border">
              <h3 class="box-title">报销单据填写</h3>
            </div>
			<div class="box-body overlay-box">
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label for="exampleInputPassword2">申请人</label>
							<select class="form-control" disabled>
	                  			<option value="1">${currentUser.name}</option>
	                  		</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
	                	  	<label>请选择是否冲借款</label>
	                	  	<c:choose>
								<c:when test="${systemSettings.offsetFunction == 0}">
									<select class="form-control" id="daily_select_counteract" disabled>
			                  			<option value="1">否，我不要冲借款</option>
					                    <option value="0">是，我要冲借款</option>
			                  		</select>
								</c:when>
								<c:otherwise>
									<select class="form-control" id="daily_select_counteract">
			                  			<option value="1">否，我不要冲借款</option>
					                    <option value="0">是，我要冲借款</option>
			                  		</select>
								</c:otherwise>
							</c:choose>
	               		</div>
					</div>
					<div class="col-md-6">
						
					</div>
				</div>
				<div class="row hide" id="daily_counteract_selections">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
						        <h3 class="panel-title">冲借款选项</h3>
						    </div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label for="">请输入冲款金额</label>
											<input type="text" id="daily_counteract_number" class="form-control money-format" style="text-align:right" placeholder="0.00" >
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<label for="">请选择冲款项目</label>
										<table id="daily_counteract_datatable" class="table table-bordered table-striped" onkeypress="return (event.keyCode>=48&&event.keyCode<=57)||(event.keyCode == 46)">
						               		 <thead>
									                	<tr>
																<th>借款编号</th>
																<th>项目名称</th>
																<th>借款金额</th>
																<th>摘要</th>
																<th>还款截止日期</th>
																<th>状态</th>
																<th>已还金额</th>
																<th>借款人</th>
																<th>申请日期</th>
																<th>选择</th>
									               		</tr>
						                	</thead>
						                	<tbody>
						                		<c:forEach var="record" items="${payingBorrows}">
							              			<tr>
										                  <td>#BR${record.id}</td>
										                  <td>${record.project.projectName}</td>
										                  <td>${record.amount}</td>
										                  <td>${record.remarks}</td>
										                  <td><fmt:formatDate value="${record.paymentTime}" pattern="yyyy-MM-dd HH:mm" /></td>
										                  <td>${record.state}</td>
										                  <td>${record.paidMoney}</td>
										                  <td>${record.borrower.name}</td>
										                  <td><fmt:formatDate value="${record.recordDate}" pattern="yyyy-MM-dd HH:mm" /></td>
										                  <td><input type="radio" name="daily_reimbursement_borrowing_radio"  title="${record.id}" ></td>
							            			</tr>
							            		</c:forEach>
						                	</tbody>
						              	  </table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                <div class="row">
                	<div class="form-group">
						<div class="col-md-12">
							<label >请选择项目</label>
							<table id="daily_project_datatable" class="table table-bordered table-striped">
		               		 <thead>
				                	<tr>
				                 			<th>项目编号</th>
											<th>项目名称</th>
											<th>部门名称</th>
											<th>负责人姓名</th>
											<th>项目额度</th>
											<th>项目余额</th>
											<th>项目状态</th>
											<th>选择</th>
				               		</tr>
		                	</thead>
		                	<tbody>
		                		<c:forEach var="project" items="${projects}">
				                	<tr>
				                		<td>#PR${project.id}</td>
				                		<td>${project.projectName}</td>
				                		<td>${project.department}</td>
				                		<td>${project.principal.name}</td>
				                		<td>${project.reimburseLimit}</td>
				                		<td>${project.balance}</td>
				                		<td>${project.state}</td>
						                 <td><input type="radio" name="daily_reimbursement_project_radio"  title="${project.id}" ></td>
				                	</tr>
                				</c:forEach>
		                		</tbody>
		              	  	</table>
	              	  	</div>
					</div>	
                </div>
				
				<div class="row" style="margin-top:30px;">
					<div class="col-md-12">
							<div class="row">
								<div class="col-md-12">
										<label>填写报销明细</label>
	      								<table class="table" id="table_daily_reimbursement">
							                <tr>
							                  <th style="width:50px">项目</th>
							                  <th style="width:50px">子项目</th>
							                  <th style="width:80px">详细物品（用  ,分开）</th>
							                  <th style="width:20px">数量</th>
							                  <th style="width:40px">总金额</th>
							                  <th style="width:170px">描述</th>
							                </tr>
							                <tr>
							                  <td rowspan="3">办公费</td> 
							                  <td>办公用品</td>
							                  <td><input  class="form-control input-sm" type="text"  name=""/></td>
							                  <td><input ng-model="d11"class="form-control input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
							                  <td><input ng-model="d12" class="form-control input-sm money-format " type="text" style="text-align: right" placeholder="0.00"/></td>
							                  <td style="text-align:left">购买打印纸、复印纸、笔、计算器、公文夹订书机、档案袋等办公用品时使用此项</td>
							                </tr>
							                <tr>
							                  <td>报刊资料费</td>
							                  <td><input class="form-control input-sm " type="text" name=""/></td>
							                  <td><input ng-model="d21" class="form-control  input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
							                  <td><input ng-model="d22" class="form-control  money-format input-sm " type="text" style="text-align: right" placeholder="0.00"/></td>
							                  <td style="text-align:left">书籍、报刊杂志、查新检索、小软件等</td>
							                </tr>
							                <tr>
							                  <td>其他</td>
							                  <td><input class="form-control input-sm " type="text" name=""/></td>
							                  <td><input ng-model="d31" class="form-control  input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
							                  <td><input ng-model="d32" class="form-control  money-format input-sm" type="text" style="text-align: right" placeholder="0.00"/></td>
							                  <td style="text-align:left">办公室的饮用水、评审费、工作餐</td>
							                </tr>
							                <tr>
							                  <td>印刷费</td>
							                  <td>印刷费</td>
							                  <td><input class="form-control input-sm " type="text" name=""/></td>
							                  <td><input ng-model="d41" class="form-control input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"  /></td>
							                  <td><input ng-model="d42" class="form-control money-format input-sm " type="text" style="text-align: right" placeholder="0.00"/></td> 
							                  <td style="text-align:left">单位的印刷费、出图费、出版费、打印复印费、冲印费等</td>
							                </tr>
							                <tr>
							                	<td >咨询费</td>
							                	<td>咨询费</td>
							                	<td><input class="form-control input-sm " type="text" /></td>
								                <td><input ng-model="d51" class="form-control input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
								                <td><input ng-model="d52" class="form-control money-format input-sm " type="text"  style="text-align: right" placeholder="0.00"/></td> 
								                <td style="text-align:left">向专业机构购咨询详细，购买专业版权、知识等</td>
							                </tr>
							                <tr>
							                	<td rowspan="2">邮电费</td>
							                	<td>邮费</td>
							                	<td><input class="form-control  input-sm" type="text" name=""/></td>
								                <td><input ng-model="d61" class="form-control  input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"  /></td>
								                <td><input ng-model="d62" class="form-control money-format input-sm " type="text" style="text-align: right" placeholder="0.00"/></td> 
								                <td style="text-align:left">邮寄、快递费用</td>
							                </tr>
							                <tr>
							                	<td>话费</td>
							                	<td><input class="form-control input-sm " type="text" name=""/></td>
								                <td><input ng-model="d71" class="form-control input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"  /></td>
								                <td><input ng-model="d72" class="form-control input-sm money-format" type="text" style="text-align: right" placeholder="0.00"/></td> 
								                <td style="text-align:left">有线电话费、手机话费</td>
							                </tr>
							                <tr>
							                	<td>其他</td>
							                	<td>其他</td>
							                	<td><input class="form-control input-sm" type="text" name=""/></td>
								                <td><input ng-model="d81" class="form-control input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/></td>
								                <td><input ng-model="d82" class="form-control input-sm money-format" type="text" style="text-align: right" placeholder="0.00"/></td> 
								                <td style="text-align:left">其他费用</td>
							                </tr>
		           						</table>
								</div>
							</div>
           					<div class="row">
           						<div class="col-md-4"></div>
           						<div class="col-md-4"></div>
           						<div class="col-md-4 text-align-right">
           							<table border="0" align="right" width="130" class="text-align-right">
           								<tr>
           									<td>总数量:</td>
           									<td><span class="daily_reimbursement_total_number">{{d11*1+d21*1+d31*1+d41*1+d51*1+d61*1+d71*1+d81*1}}</span>个</td>
           								</tr>
           								<tr>
           									<td>总金额:</td>
           									<td><span class="daily_reimbursement_total_money">{{d12*1+d22*1+d32*1+d42*1+d52*1+d62*1+d72*1+d82*1}}</span>¥</td>
           								</tr>
           							</table>
           						</div>
           					</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="exampletextarea">报销事由</label>
							<textarea class="form-control"  rows="3" id="daily_reimbursement_message" placeholder="输入报销事由"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label>已选预约时间：</label><br/>
						<span id="d_has_selected_time">暂无</span>
					</div>
					<div class="col-md-8" style="color:red">
						<br/>
						　备注：1.只可预约明日之后的日期   <br/>
						　　　　2.预约时间长度不超过1小时
					</div>
				</div><div class="row">
					<div class="col-md-12">
						<div id='daily_reimbursement_calendar'></div> 
					</div>
				</div>
				<c:choose>
					<c:when test="${systemSettings.dailyFunction == 0}">
						<div class="overlay " id="login-overlay" style="height:100%;width:100%;left:0;top:0">
		        			<i class="fa fa-close">功能已关闭</i>
          				</div>
					</c:when>
				</c:choose>
			</div><!-- /.box-body -->
			<div class="box-footer" >
				<button type="submit" class="btn btn-primary pull-right" id="btn_daily_submit" style="margin-right:40px">
					提交
				</button>
			</div>
	</div>
		<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_staff/js/daily_reimbursement.js"> </script>
		
	</body>
</html>
