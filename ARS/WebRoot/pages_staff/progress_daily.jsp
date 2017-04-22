<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>日常报销进度</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="./adminlte/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome --> 
 		<link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.min.css">
 		<!-- Ionicons --> 
 		<link rel="stylesheet" href="./ionicons-2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="./adminlte/dist/css/AdminLTE.min.css"> 
	<link rel="stylesheet" href="./adminlte/dist/css/skins/skin-green-light.min.css">
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="./pages_staff/css/search_progress.css"/>
    <!-- jQuery 2.2.3 -->
	<script src="./adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./adminlte/dist/js/app.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="./adminlte/bootstrap/js/bootstrap.min.js"></script>
    <script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
   	<script src="./pages_staff/js/progress_daily.js"></script>
  </head>
  
  <body>	
        <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">申请记录</h3>
            </div>
            <div class="box-body">
	            
	            	<table id="table_daily_progress" class="table table-bordered ">
		                <thead>
		                	<tr>
									<th>编号</th> 
									<th>项目名称</th>
									<th>项目详细</th>
									<th>预约时间</th>
									<th>报销内容</th>
									<th>冲借款详细</th>
									<th>申请人信息</th>
									<th>状态</th>
									<th>其他</th>
									<th>打印</th>
		               		</tr>
		                </thead>
		                <tbody class="mytbody">
		                	<c:forEach var="item" items="${searchedDailyReims}">
			              			<tr>
						                  <td>${item.id}</td>
						                  <td style="width:80px;">${item.project.projectName}</td>
						                  <td style="text-align:left;width:120px;">
						                  		项目编号：#PR${item.project.id}<br/>
						                  		部门名称：${item.project.department}<br/>
						                  		报销限额：${item.project.reimburseLimit}<br/>
						                  		项目状态：${item.project.state}<br/>
						                  		项目余额：${item.project.balance}<br/>
						                  </td>
						                  <td style="width:80px;">
						                  			<fmt:formatDate value="${item.event.startTime}" pattern="yyyy-MM-dd HH:mm" />
						                  				至
						                  			<fmt:formatDate value="${item.event.endTime}" pattern="HH:mm" />
						                  	</td>
						                  <td style="text-align:left;">
												票据：${item.totalNumber}张<br/>
												总额：${item.totalMoney}元<br/>
												事由：${item.remarks}<br/>
												明细：<br/>
												<c:forEach var="i" items="${item.itemList}" varStatus="var">
											 		${var.index+1}.${i.name}-共${i.number}个-总计${i.total}元 <br/>
												</c:forEach>
										  </td>
						                  <c:choose>
						                  	<c:when test="${item.offsetBorrowing.id != 0}">
						                  		<td style="text-align:left;">
													冲借款金额：${item.offsetBorrowing.amount} 元<br/>
													<label>借款信息：</label><br/>
													借款记录号：#BR${item.offsetBorrowing.borrowRecord.id}<br/>
													借款总额：${item.offsetBorrowing.borrowRecord.amount}元<br/>
													还需还款：<fmt:formatNumber value="${item.offsetBorrowing.borrowRecord.amount-item.offsetBorrowing.borrowRecord.paidMoney}" pattern="#0.00"></fmt:formatNumber>元
													借款人：${item.offsetBorrowing.borrowRecord.borrower.name}<br/>
												</td>
						                  	</c:when>
						                  	<c:otherwise>
							                  		<td>无</td>
						                  	</c:otherwise>
						                  </c:choose>
						                  <td style="text-align:left;width:120px;">
						                  			姓名：${item.proposer.name}<br/>
						                  			职位：${item.proposer.department}-${item.proposer.positionName}<br/>
						                  			信用分：${item.proposer.creditIntegral}<br/>
						                  			
						                  </td>
						                  <td  class="td-state">
						                  		<c:choose>
													<c:when test="${item.state == '预约中'}">
													   <span class="label label-warning " >预约中</span>
													</c:when>
													<c:when test="${item.state == '预约失败'}">
													    <span class="label label-default " >预约失败</span>
													</c:when>
													<c:when test="${item.state == '审核中'}">
													    <span class="label label-info ">可提交现场审核</span>
													</c:when>
													<c:when test="${item.state == '未通过审核'}">
													    <span class="label label-default ">未通过审核</span>
													</c:when>
													<c:when test="${item.state == '已报销'}">
													    <span class="label label-success ">已报销</span>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>
										  </td>
										  <td style="text-align:left">
										  		${item.leaveMessages}
										  </td>
										  <td>
										  	<c:choose>
											  	<c:when test="${item.state == '审核中'}">
											  		<input type="radio" class="daily_print_radio" name="daily_print_radio" value="${item.id}">
										  		</c:when>
										  		<c:otherwise>
										  			
										  		</c:otherwise>
										  	</c:choose>
										  </td>
			            			</tr>
			            		</c:forEach>
		                </tbody>
		              </table>
	            </div>
	            <div class="box-footer ">
					<button id="btn_print_daily_sheet" type="submit" class="btn btn-primary pull-right" style="margin-right:40px" disabled>
						打印所选报账单
					</button>
			   </div>
	          </div>
  </body>
</html>
