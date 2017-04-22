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
    
    <title>主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="./pages_staff/css/home.css"> 
  </head>
  
  <body>
  		<div class="row">
  			<div class="col-md-9">
  				<div class="row">
  					<div class="col-md-12">
  						<div class="div-mysheet">
  								<div class="div-circle">
				              		<i class="fa   fa-files-o"></i>
				              	</div>
				              	<div class="div-mysheetlabel">
				              		<p><h3>我的报账单</h3></p>
				              		<p>本月共有${staffHomeData.monthTotalReimbursement}张申请表，已通过审批${staffHomeData.monthTotalApprovedReim}张</p> 
				              	</div>
				              	<div class="div-reimbursement-info">
				              		<p><h3>¥${staffHomeData.totalReimMoney}</h3></p>
				              		<p>已报销金额</p>
				              	</div>
  						</div>
  						<div class="div-mysheet-details" style="padding-left:10px;padding-right:10px;">
  							<div class="row">
  								<div class="col-md-12" >
  										<div class="div-option-right-title"><i class="fa  fa-clock-o i-logo"></i>&nbsp 最近的申请单</div>
  										<c:forEach var="item"  items="${staffHomeData.applicationSheets}">  
  													<div class="div-right-items">
  														<div class="row">
  															<div class="div-item"><label>${item.type}单</label></div>
  														</div>
			  											<div class="row">
			  												<div class="col-md-3">
			  													编号：#${item.id}	
			  												</div>
			  												<div class="col-md-3">
			  													状态：${item.reimbursementResult}
			  												</div>
			  												<div class="col-md-3">
			  													其他：${item.remarks}
			  												</div>
			  												<div class="col-md-3">
			  													<fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd" />
			  												</div>
			  											</div>
  													</div>
  										</c:forEach>
  								</div>
  							</div>
  						</div>
  					</div>
  					
  				</div>
  			</div>
  			<div class="col-md-3">
  				<div class="row">	
  					<div class="col-md-12">
		  				<div class="small-box bg-yellow">
						            <div class="inner">
						              <h3>${staffHomeData.numberOfSentReservations}</h3>
						              <p>已发送预约申请</p>
						            </div>
						            <div class="icon">
						              <i class="ion ion-clock"></i> 
						            </div>
				            		<a  class="small-box-footer a-left-btn">查看详情<i class="fa fa-arrow-circle-right"></i></a>
				         </div>
			         </div>
  				</div>
  				<div class="row">
  					<div class="col-md-12">
		  				<div class="small-box bg-red">
				            <div class="inner">
				              <h3>${staffHomeData.numberOfFailReimSheets}</h3>
				              <p>报销未通过</p>
				            </div>
				            <div class="icon">
				              <i class="ion ion-ios-close-outline"></i>
				            </div>
		            		<a  class="small-box-footer a-left-btn">查看详情 <i class="fa fa-arrow-circle-right"></i></a>
		          		</div>
		          	</div>
  				</div>
  				<div class="row" >
		  			<div class="col-md-12">
		  				<div class="small-box bg-aqua ">
				            <div class="inner">
				              <h3>${staffHomeData.numberOfMyBorrowingRecord}</h3>
				              <p>在借款项</p> 
				            </div>
				            <div class="icon">
				              <i class="ion  ion-ios-calculator-outline"></i>
				            </div>
		            		<a  class="small-box-footer a-left-btn">查看详情<i class="fa fa-arrow-circle-right"></i></a>
		          		</div>
		          	</div>
  				</div>
  			</div>
  		</div>
  </body>
</html>
