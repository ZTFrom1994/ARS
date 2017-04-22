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
    
    <title>现场报账审核登记</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="./pages_assessor/css/check_register_reimbursement.css">
  </head>
  
  <body>
     <div class="box box-solid">
        	<div class="box-header with-border">
              <h3 class="box-title">待登记的报账列表</h3>
            </div>
            <div class="box-body">
              <table id="table_reservated_reimbursement" class="table table-bordered ">
                <thead>
                	<tr>
                			<th>预约时间</th>
                			<th>统一报销表编号</th>
							<th>类型</th>
							<th style="width:200px;">申请信息</th>
							<th>申请提交时间</th>
							<th>申请人</th>
							<th>发票核实选项</th>
							<th>报销结果操作</th>
							<th>备注</th>
               		</tr>
                </thead>
                <tbody>	
                	<c:forEach items="${checkAndRegisterList}" var="item">
                		<c:choose>
                			<c:when test="${not empty  item.dailyReimbursement }">
                				<tr>
                				  <td><fmt:formatDate value="${item.dailyReimbursement.event.startTime}" pattern="yyyy-MM-dd HH:mm" />至<fmt:formatDate value="${item.dailyReimbursement.event.endTime}" pattern="HH:mm" /></td>
				                  <td>#BX${item.id}</td>
				                  <td>日常报销</td>
				                  <td style="text-align:left;">	
				                  		<label>项目信息：</label><br/>
										项目编号：#PR${item.dailyReimbursement.project.id}<br/>
				                  		项目名称：${item.dailyReimbursement.project.projectName}<br/>
				                  		报销限额：${item.dailyReimbursement.project.reimburseLimit}<br/>
				                  		项目状态：${item.dailyReimbursement.project.state}<br/>
				                  		项目余额：${item.dailyReimbursement.project.balance}<br/>
				                  		<label>报销信息：</label><br/>
				                  		票据：${item.dailyReimbursement.totalNumber}张<br/>
										总额：${item.dailyReimbursement.totalMoney}元<br/>
										事由：${item.dailyReimbursement.remarks}<br/>
										<label>明细：</label><br/>
										<c:forEach var="i" items="${item.dailyReimbursement.itemList}" varStatus="var">
											 		${var.index+1}.${i.name}-共${i.number}个-总计${i.total}元 <br/>
										</c:forEach>
										<label>冲借款信息：</label><br/>
										<c:choose>
											<c:when test="${item.dailyReimbursement.offsetBorrowing.id ==0}">
												无
											</c:when>
											<c:otherwise>
												<c:set var="item" value="#{item.dailyReimbursement}"></c:set>
												冲借款金额：${item.offsetBorrowing.amount} 元<br/>
												<label>借款信息：</label><br/>
												借款记录号：#BR${item.offsetBorrowing.borrowRecord.id}<br/>
												借款总额：${item.offsetBorrowing.borrowRecord.amount}元<br/>
												还需还款：<fmt:formatNumber value="${item.offsetBorrowing.borrowRecord.amount-item.offsetBorrowing.borrowRecord.paidMoney}" pattern="#0.00"></fmt:formatNumber>元
												借款人：${item.offsetBorrowing.borrowRecord.borrower.name}<br/>
											</c:otherwise>
										</c:choose>
							      </td>
				                  <td><fmt:formatDate value="${item.dailyReimbursement.applyDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				                  <td style="text-align:left;">
											姓名：${item.dailyReimbursement.proposer.name}<br/>
				                  			职位：${item.dailyReimbursement.proposer.department}-${item.dailyReimbursement.proposer.positionName}<br/>
				                  			信用分：${item.dailyReimbursement.proposer.creditIntegral}<br/>
									</td>
				                   <td >
										<div class="row invoice_options">
											<p class="check-ok-text check-text" title="d-${item.id}-1">发票无误</p>
											<p class="check-no-text check-text" title="d-${item.id}-0">不合格</p>
										</div>
								  </td>
				                  <td >
										<div class="row">
											<p class="check-ok-text check-text" title="-1">已报销</p>
											<p class="check-no-text check-text" title="-0">未报销</p>
										</div>
								  </td>
				                  <td >
											<textarea   rows="6" id="" placeholder="发票未通过原因、未完成报销原因.."></textarea>
								 </td>
								</tr>
                			</c:when>
                			<c:otherwise>
                				<c:choose>
	                				<c:when test="${not empty item.travelReimbursement}">
	                					<tr>
	                					  <td><fmt:formatDate value="${item.travelReimbursement.event.startTime}" pattern="yyyy-MM-dd HH:mm" />至<fmt:formatDate value="${item.travelReimbursement.event.endTime}" pattern="HH:mm" /></td>
						                  <td>#BX${item.id}</td>
						                  <td>差旅费报销</td>
						                  <td style="text-align:left;">
											<label>出差信息：</label><br/>
											出差地点：${item.travelReimbursement.place}<br/>
					                  		出差时间：<fmt:formatDate value="${item.travelReimbursement.travelTime}" pattern="yyyy-MM-dd" /><br/>
					                  		出差人数：${item.travelReimbursement.peopleNumber}<br/>
											<label>项目信息：</label><br/>
											项目编号：##PR${item.travelReimbursement.project.id}<br/>
					                  		部门名称：${item.travelReimbursement.project.department}<br/>
					                  		报销限额：${item.travelReimbursement.project.reimburseLimit}<br/>
					                  		项目状态：${item.travelReimbursement.project.state}<br/>
					                  		项目余额：${item.travelReimbursement.project.balance}<br/>
					                  		<label>报销信息：</label><br/>
					                  		票据：${item.travelReimbursement.totalSheets}张<br/>
											总额：${item.travelReimbursement.totalMoney}元<br/>
											事由：${item.travelReimbursement.remarks}<br/>
											明细：<br/>
											<c:forEach var="i" items="${item.travelReimbursement.itemList}" varStatus="var">
											 ${var.index+1}.${i.smallClass}-${i.description}-单价：${i.singlePrice}元 -${i.peopleNumber}人-票据${i.sheetNumber}张<br/>
											</c:forEach>
											<label>冲借款信息：</label><br/>	
											<c:choose>
												<c:when test="${item.travelReimbursement.offsetBorrowing.id == 0}">
													无
												</c:when>
												<c:otherwise>
													<c:set var="t" value="#{item.travelReimbursement}"></c:set>
													冲借款金额：${t.offsetBorrowing.amount} 元<br/>
													<label>借款信息：</label><br/>
													借款记录号：#BR${t.offsetBorrowing.borrowRecord.id}<br/>
													借款总额：${t.offsetBorrowing.borrowRecord.amount}元<br/>
													还需还款：<fmt:formatNumber value="${t.offsetBorrowing.borrowRecord.amount-t.offsetBorrowing.borrowRecord.paidMoney}" pattern="#0.00"></fmt:formatNumber>元
													借款人：${t.offsetBorrowing.borrowRecord.borrower.name}<br/>
												</c:otherwise>
											</c:choose>
										   </td>
						                  <td ><fmt:formatDate value="${item.travelReimbursement.applyDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					                  		<td style="text-align:left;">
												姓名：${item.travelReimbursement.proposer.name}<br/>
					                  			职位：${item.travelReimbursement.proposer.department}-${item.travelReimbursement.proposer.positionName}<br/>
					                  			信用分：${item.travelReimbursement.proposer.creditIntegral}<br/>
											</td>
						                  <td >
											<div class="row invoice_options">
												<p class="check-ok-text check-text" title="t-${item.id}-1">发票无误</p>
												<p class="check-no-text check-text" title="t-${item.id}-0">不合格</p>
											</div>
										  </td>
						                  <td >
												<div class="row">
													<p class="check-ok-text check-text" title="-1">已报销</p>
													<p class="check-no-text check-text" title="-0">未报销</p>
												</div>
										  </td>
						                  <td >
													<textarea   rows="6" id="" placeholder="发票未通过原因、未完成报销原因.."></textarea>
										 </td>
										</tr>
	                				</c:when>
                				</c:choose>
                			</c:otherwise>
                		</c:choose>
            			</tr>
                	</c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer ">
					<button id="btn_r_check_register_submit" type="submit" class="btn btn-primary pull-right" style="margin-right:40px" disabled>
						提交
					</button>
			   </div>
          </div>
          <!-- /.box -->
		
		<!-- datatable --> 
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="./pages_assessor/js/check_register_reimbursement.js"></script>
  </body>
</html>
