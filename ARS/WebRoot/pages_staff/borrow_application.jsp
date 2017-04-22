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
    
    <title >我要借款</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables --> 
   	<link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
   	<link rel="stylesheet" href="./pages_staff/css/borrow_application.css">
  </head>
  
  <body>
     <div class="box box-solid">
     		<div class="box-header with-border">
              <h3 class="box-title">借款申请表</h3>
            </div>
     		<div class="box-body overlay-box">
     			<div class="row">
     				<div class="col-md-6">
    						<p style="text-align:center;font-size:18px"><b>借款规则</b></p>
				              <table class="table table-bordered">
				                <tr>
				                  <th style="">用户信用分</th>
				                  <th>借款时长上限</th>
				                  <th>借款金额上限</th>
				                  <th style="">在借款记录上限</th>
				                </tr>
				                <tr>
				                  <td>0以下</td>
				                  <td>0天</td>
				                  <td>0元</td>
				                  <td>0</td>
				                </tr>
				                <tr>
				                  <td>0-49</td>
				                  <td>50天</td>
				                  <td>2000元</td>
				                  <td>1</td>
				                </tr>
				                <tr>
				                  <td>50-99</td>
				                  <td>100天</td>
				                  <td>3000元</td>
				                  <td>2</td>
				                </tr>
				                <tr>
				                  <td>100-149</td>
				                  <td>150天</td>
				                  <td>5000元</td>
				                  <td>3</td>
				                </tr>
				                <tr>
				                  <td>150以上</td>
				                  <td>200天</td>
				                  <td>10000元</td>
				                  <td>5</td>
				                </tr>
				              </table>
     				</div>
     				<div class="col-md-6">
     						<p style="text-align:center;font-size:18px"><b>信用分规则</b></p>
				              <table class="table table-bordered" >
				                <tr >
				                  <th>用户操作</th>
				                  <th>积分操作</th>
				                </tr>
				                <tr>
				                  <td>完成一次日常报销</td>
				                  <td>+报销金额×0.9%(向下取整，最低1分)</td>
				                </tr>
				                <tr>
				                  <td>完成一次差旅费报销</td>
				                  <td>+报销金额×0.2%(向下取整，最低1分)</td>
				                </tr>
				                <tr>
				                  <td>按时结算一笔借款</td>
				                  <td>+借款金额×0.3%(向下取整，最低1分)</td>
				                </tr>
				                <tr>
				                  <td>提供问题发票进行报销</td>
				                  <td>-100</td>
				                </tr>
				                <tr>
				                  <td>借款逾期归还</td>
				                  <td>-超期天数×4</td>
				                </tr>
				              </table>
			            </div>
     			</div>
     			<div class="row">
     				<div class="form-group">
						<div class="col-md-12">
							<label >请选择借款项目</label>
							<table id="borrow_application_datatable" class="table table-bordered table-striped">
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
				                		<td>${project.id}</td>
				                		<td>${project.projectName}</td>
				                		<td>${project.department}</td>
				                		<td>${project.principal.name}</td>
				                		<td>${project.reimburseLimit}</td>
				                		<td>${project.balance}</td>
				                		<td>${project.state}</td>
						                <td><input type="radio" name="borrow_application_project_radio"  ></td>
				                	</tr>
                				</c:forEach>
		                		</tbody>
		              	  	</table>
	              	  	</div>
					</div>	
     				
   				</div>
     			<div class="row">
     				<div class="col-md-2">
     					<div class="form-group">
	                	  	<label>最长借款天数</label>
	                	  	<c:choose>
	                	  		<c:when test="${currentUser.creditIntegral < 0}">
	                	  			<input type="text" class="form-control input_payment_days"  value="0" disabled="disabled"/>
	                	  		</c:when>
	                	  		<c:when test="${currentUser.creditIntegral >= 0 && currentUser.creditIntegral <= 49}">
	                	  			<input type="text" class="form-control input_payment_days"  value="50" disabled="disabled"/>
	                	  		</c:when>
	                	  		<c:when test="${currentUser.creditIntegral >= 50 && currentUser.creditIntegral <= 99}">
	                	  			<input type="text" class="form-control input_payment_days"  value="100" disabled="disabled"/>
	                	  		</c:when>
	                	  		<c:when test="${currentUser.creditIntegral >= 100 && currentUser.creditIntegral <= 149}">
	                	  			<input type="text" class="form-control input_payment_days"  value="150" disabled="disabled"/>
	                	  		</c:when>
	                	  		<c:when test="${currentUser.creditIntegral >= 150 }">
	                	  			<input type="text" class="form-control input_payment_days"  value="200" disabled="disabled"/>
	                	  		</c:when>
	                	  	</c:choose>
	               		</div>
     				</div>
     				<div class="col-md-3">
     					<div class="form-group">
	                	  	<label >用途 </label>
	                  		<select id="borrow_select_use"class="form-control" disabled="disabled">
			                    <option value="0">预支(其他选项暂不支持)</option>
	                  		</select>
	               		</div>
     				</div>
     				<div class="col-md-3">
     					<div class="form-group">
	                	  	<label >支付方式 </label>
	                  		<select class="form-control" id="select_cash" disabled="disabled">
	                  			<option value="0">现金支付(其他选项暂不支持)</option>
			                    <option value="1">网上银行</option>
	                  		</select>
	               		</div>
     				</div>
     				<div class="col-md-4">
     					<div class="form-group">
							<label >借款金额 </label>
							<span style="color:red" >
								<c:choose>
									<c:when test="${currentUser.creditIntegral < 0}">
										（当前信用分为：${currentUser.creditIntegral} 借款上限为：<span class="user-borrow-limit">0</span>¥）
									</c:when>
									<c:when test="${currentUser.creditIntegral > 0 && currentUser.creditIntegral <= 49}">
										（当前信用分为：${currentUser.creditIntegral} 借款上限为：<span class="user-borrow-limit">2000</span>¥）
									</c:when>
									<c:when test="${currentUser.creditIntegral >= 50 && currentUser.creditIntegral <= 99}">
										（当前信用分为：${currentUser.creditIntegral} 借款上限为：<span class="user-borrow-limit">3000</span>¥）
									</c:when>
									<c:when test="${currentUser.creditIntegral >= 100 && currentUser.creditIntegral <= 149}">
										（当前信用分为：${currentUser.creditIntegral} 借款上限为：<span class="user-borrow-limit">5000</span>¥）
									</c:when>
									<c:when test="${currentUser.creditIntegral >= 150 }">
										（当前信用分为：${currentUser.creditIntegral} 借款上限为：<span class="user-borrow-limit">10000</span>¥）
									</c:when>
								</c:choose>
							</span>
							<input type="text" class="form-control" id="input_borrow_number" placeholder="输入借款金额 " style="text-align:right;" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false">
						</div>
     				</div>
     			</div>
     			<div class="row">
     				<div class="col-md-12">
     					<div class="form-group">
							<div class="form-group">
								<label for="exampletextarea">借款摘要</label>
								<textarea class="form-control"  rows="3" id="borrow_application_remarks" ></textarea>
							</div>
						</div>
     				</div>
     			</div>
     			<div class="row">
					<div class="col-md-4">
						<label>已选预约时间：</label><br/>
						<span id="b_has_selected_time">暂无</span>
					</div>
					<div class="col-md-8" style="color:red">
						<br/>
						　备注：1.只可预约明日之后的日期 <br/>
						　　　　2.预约时间长度不超过1小时
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div id='borrow_application_calendar'></div> 
					</div>
				</div>
				<c:choose>
					<c:when test="${systemSettings.borrowFunction == 0}">
						<div class="overlay " id="login-overlay" style="height:100%;width:100%;left:0;top:0">
		        			<i class="fa fa-close">功能已关闭</i>
          				</div>
					</c:when>
				</c:choose>
     		</div>
     		<div class="box-footer" >
				<button type="submit" class="btn btn-primary pull-right" id="btn_borrow_submit"style="margin-right:40px">
					提交申请
				</button>
		</div>
     </div>
		<!-- bootstrap datepicker --> 
		<script src="./adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
		<!-- datatable -->
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script> 
		
		<script src="./pages_staff/js/borrow_application.js"></script> 
  </body>
</html>
