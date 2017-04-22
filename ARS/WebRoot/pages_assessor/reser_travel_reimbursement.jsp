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
    
    <title>差旅费报销预约审核</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- DataTables -->
    <link rel="stylesheet" href="./adminlte/plugins/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="./pages_assessor/css/reservation.css">
  </head>
  
  <body>
     <div class="box box-solid">
        	<div class="box-header with-border">
              <h3 class="box-title">待审核列表</h3>
            </div>
            <div class="box-body">
              <table id="table_audit_travel_reimbursement" class="table table-bordered ">
                <thead>
                	<tr>
                 			<th>申请编号</th> 
                 			<th>出差地点</th> 
                 			<th>出差人数</th> 
                 			<th>出差时间</th> 
							<th>所因项目</th>
							<th>预约时间</th>
							<th>报销内容</th>
							<th>冲借款详细</th>
							<th>申请人信息</th>
							<th>通过</th>
							<th>不通过</th>
               		</tr>
                </thead>
                <tbody> 
              			<c:forEach var="item" items="${travelReimbursements}">
	              			<tr>
				                  <td>#TBX${item.id}</td>
				                  <td style="width:80px">${item.place}</td>
				                  <td>${item.peopleNumber}</td>
				                  <td><fmt:formatDate value="${item.travelTime}" pattern="yyyy-MM-dd" /></td>
				                  <td style="text-align:left;">
				                  		项目编号：#PR${item.project.id}<br/>
				                  		项目名称：${item.project.projectName}<br/>
				                  		部门名称：${item.project.department}<br/>
				                  		报销限额：${item.project.reimburseLimit}<br/>
				                  		项目状态：${item.project.state}<br/>
				                  		项目余额：${item.project.balance}<br/>
				                  </td>
				                  <td style="width:80px;"><fmt:formatDate value="${item.event.startTime}" pattern="yyyy-MM-dd HH:mm" />至<fmt:formatDate value="${item.event.endTime}" pattern="HH:mm" /></td>
				                  <td style="text-align:left">
										总额：${item.totalMoney}元<br/>
										单据：${item.totalSheets}张<br/>
										事由：${item.remarks}<br/>
										明细：<br/>
										<c:forEach var="i" items="${item.itemList}" varStatus="var">
											 ${var.index+1}.${i.smallClass}-${i.description}-单价：${i.singlePrice}元 -${i.peopleNumber}人-票据${i.sheetNumber}张<br/>
										</c:forEach>
								  </td>
				                  <c:choose>
				                  	<c:when test="${item.offsetBorrowing.id != 0}">
				                  		<td style="text-align:left;">
				                  			冲借款金额：${item.offsetBorrowing.amount} 元<br/>
											借款信息：<br/>
											借款记录号：#BR${item.offsetBorrowing.borrowRecord.id}<br/>
											借款总额：${item.offsetBorrowing.borrowRecord.amount}元<br/>
											还需还款：<fmt:formatNumber value="${item.offsetBorrowing.borrowRecord.amount-item.offsetBorrowing.borrowRecord.paidMoney}" pattern="#0.00"></fmt:formatNumber>元<br/>
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
				                  <td class="td-pass" title="1-${item.id}">
											<span style="font-size:40px;" class=" glyphicon glyphicon-ok ">
											</span>
								  </td>
				                  <td class="td-no-pass" title="0-${item.id}">
										<span  style="font-size:40px;" class="glyphicon glyphicon-remove ">
										</span>
				                  </td>
	            			</tr>
	            		</c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer" >
				<button type="submit" disabled="disabled" class="btn btn-primary pull-right" id="btn_travel_submit" style="margin-right:40px">
					提交已选
				</button>
			</div>
          </div>
          <!-- /.box -->
		
		<!-- datatable --> 
		<script src="./adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="./adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="./pages_assessor/js/reser_travel_reimbursement.js"></script>
  </body>
</html>
