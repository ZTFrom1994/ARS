<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html  >
  <head> 
    <base href="<%=basePath%>">
    
    <title>差旅费报销</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables -->
   	<link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
	<!-- bootstrap datepicker -->
  	<link rel="stylesheet" href="./adminlte/plugins/datepicker/datepicker3.css">
  	<link href='./fullcalendar-3.2.0/fullcalendar.min.css' rel='stylesheet' />
	<link href='./fullcalendar-3.2.0/fullcalendar.print.min.css' />
	<link rel="stylesheet" href="./pages_staff/css/calendar.css">
	
  </head>
  
  <body >
    	<div class="box box-solid" id="travel_box">
     		<div class="box-header with-border">
              <h3 class="box-title">报销单据填写</h3>
            </div>
     		<div class="box-body overlay-box" >
     			<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label >申请人</label>
							<select class="form-control" disabled>
	                  			<option value="1">${currentUser.name}</option>
	                  		</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="exampleInputPassword2">出差人数</label>
							<input type="text" class="form-control" id="input_people_number" placeholder="输入人数.." onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" ng-model="travelNumber">
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="exampleInputPassword3">出差地点</label>
							<input type="text" class="form-control"   id="input_travel_place" placeholder="XX省XX市XX大学(具体到某单位) ">
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
	                		<label >出差时间：</label>
		                    <div class="input-group date" style="float-left;width:250px">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div> 
			                  	<input type="text" class="form-control " id="traveling_datepicker"  >
			            	</div>
			            </div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
	                	  	<label>请选择是否冲借款</label>
	                	  	<c:choose>
								<c:when test="${systemSettings.offsetFunction == 0}">
									<select class="form-control" id="travel_select_counteract" disabled>
	                  					<option value="1">否，我不要冲借款</option>
			                   			 <option value="0">是，我要冲借款</option>
	                  				</select>
								</c:when>
								<c:otherwise>
									<select class="form-control" id="travel_select_counteract">
			                  			<option value="1">否，我不要冲借款</option>
					                    <option value="0">是，我要冲借款</option>
	                  					</select>
								</c:otherwise>
							</c:choose>
	               		</div>
					</div>
					<div class="col-md-6"></div>
				</div>
				<div class="row hide" id="travel_counteract_selections">
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
											<input type="text" id="travel_counteract_number" class="form-control money-format" style="text-align:right" placeholder="0.00" >
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<label for="">请选择冲款项目</label>
										<table id="travel_counteract_datatable" class="table table-bordered table-striped">
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
										                  <td><input type="radio" name="travel_reimbursement_borrowing_radio"  title="${record.id}" ></td>
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
				 <div class="row" >
                	<div class="form-group">
						<div class="col-md-12">
							<label >请选择项目</label>
							<table id="travel_project_datatable" class="table table-bordered table-striped">
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
						                <td><input type="radio" name="travel_reimbursement_project_radio"  title="${project.id}" ></td>
				                	</tr>
                				</c:forEach>
		                		</tbody>
		              	  	</table>
	              	  	</div>
					</div>	
                </div>
                <div class="row" >
                	<div class="col-md-12">
                			<div class="row">
								<div class="col-md-12">
						       	 	<label>填写报销明细</label>
      								<table class="table" id="table_travel_reimbursement">
					                <tr>
					                  <th style="width:50px">项目</th>
					                  <th style="width:50px">子项目</th>
					                  <th style="width:20px">人数</th>
					                  <th style="width:20px">单价</th>
					                  <th style="width:20px">票据单数</th>
					                  <th style="width:170px">描述</th>
					                </tr>
					                <tr>
					                  <td rowspan="3">交通费</td> 
					                  <td>飞机</td>
					                  <td><input ng-model="t11" class="form-control input-sm" type="text" placeholder="0" style="text-align: right"  onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/></td>
					                  <td><input ng-model="t12" class="form-control input-sm money-format" placeholder="0.00" type="text" style="text-align: right"   /></td>
					                  <td><input ng-model="t13" class="form-control input-sm" type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
					                  <td><input class="form-control input-sm " type="text" placeholder="航空公司/舱位等"  /></td>
					                </tr>
					                <tr>
					                  <td>火车/动车/高铁</td>
					                  <td><input ng-model="t21" class="form-control input-sm" type="text" placeholder="0" style="text-align: right" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/></td>
					                  <td><input ng-model="t22" class="form-control input-sm money-format" placeholder="0.00" type="text" style="text-align: right"  /></td>
					                  <td><input ng-model="t23" class="form-control input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"   /></td>
					                  <td><input class="form-control input-sm " type="text" name="" placeholder="一等座/二等座/硬卧/硬座/站票"/></td>
					                </tr>
					                <tr>
					                  <td>公交车</td>
					                  <td><input ng-model="t31"class="form-control input-sm" type="text" placeholder="0" style="text-align: right"  onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/></td>
					                  <td><input ng-model="t32" class="form-control input-sm money-format" placeholder="0.00" type="text" style="text-align: right" /></td>
					                  <td><input ng-model="t33"class="form-control input-sm " type="text" style="text-align: right"  placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/></td>
					                  <td><input class="form-control input-sm " type="text"  placeholder="自动投币/人工售票"/></td>
					                </tr>
					                <tr>
					                  <td>住宿费</td>
					                  <td>住宿费</td>
					                  <td><input ng-model="t41" class="form-control input-sm" placeholder="0" style="text-align: right"  type="text" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/></td>
					                  <td><input ng-model="t42" class="form-control input-sm money-format" placeholder="0.00" type="text" style="text-align: right" /></td>
					                  <td><input ng-model="t43" class="form-control input-sm " type="text" style="text-align: right" placeholder="0" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td> 
					                  <td><input class="form-control input-sm " type="text" placeholder="星级酒店/宾馆/快捷酒店"/></td>
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
       									<td>总票据:</td>
       									<td><span class="travel_reimbursement_total_sheets">{{t13*1+t23*1+t33*1+t43*1}}</span>张</td>
       								</tr>
       								<tr> 
       									<td>总金额:</td>
       									<td ><span class="travel_reimbursement_total_money">{{t11*t12+t21*t22+t31*t32+t41*t42}}</span>¥</td>
       								</tr>
       							</table>
       						</div>
       					</div>
					</div>
                </div>
                <div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="exampletextarea">其他备注</label>
							<textarea class="form-control"  rows="4" id="travel_reimbursement_message" placeholder="备注.."></textarea>
						</div>
					</div>
				</div> 
				<div class="row">
					<div class="col-md-4">
						<label>已选预约时间：</label><br/>
						<span id="t_has_selected_time">暂无</span>
					</div>
					<div class="col-md-8" style="color:red">
						<br/>
						　备注：1.只可预约明日之后的日期 <br/>
						　　　　2.预约时间长度不超过1小时
					</div>
				</div>
                <div class="row">
					<div class="col-md-12">
						<div id='travel_reimbursement_calendar'></div> 
					</div>
				</div>
				<c:choose>
					<c:when test="${systemSettings.travelFunction == 0}">
						<div class="overlay " id="login-overlay" style="height:100%;width:100%;left:0;top:0">
		        			<i class="fa fa-close">功能已关闭</i>
          				</div>
					</c:when>
				</c:choose>
     		</div>
     		<div class="box-footer" >
				<button id="btn_travel_submit"type="submit" class="btn btn-primary pull-right" style="margin-right:40px">
					提交
				</button>
			</div>
     </div>
    	
     	<script src='./fullcalendar-3.2.0/lib/moment.min.js'></script>
		<script src='./fullcalendar-3.2.0/lib/jquery-ui.min.js'></script>
		<script src='./fullcalendar-3.2.0/fullcalendar.min.js'></script>
		<script src='./fullcalendar-3.2.0/locale/zh-cn.js'></script> 
		<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_staff/js/traveling_reimbursement.js"></script>
  </body>
</html>
