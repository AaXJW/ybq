<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
  	<title>财务管理</title>
  </head>
  
  <body class="no-skin">
		 
	  	<div class="container-fluid inner-menu">
	  		<%--<div class="btn-group no-radius clearfix" role="group" aria-label="...">
			  <a class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-muted"><i class="icon-user icon-large"></i></span><br/>抢单积分
			  	<br/>${balance}
			  </a>
			  <a class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-info"><i class="icon-edit icon-large"></i></span><br/>奖励积分
			  	<br/>${bonus}
			  </a>
			  <a class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-warning"><i class="icon-pencil icon-large"></i></span><br/>总积分
			  	<br/>${totalAssets}
			  </a>
			  <a class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-warning"><i class="icon-pencil icon-large"></i></span><br/>总提现
			  	<br/>${sumcashMoney}
			  </a>
			  <a class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-warning"><i class="icon-pencil icon-large"></i></span><br/>当前换算率
			  	<br/>${balance}
			  </a>
			</div>
			
			--%>
			<table class="table table-bordered" style="background-color: #fff;color: #4c4c4c;">
				<!-- <tr>
					<th colspan="5" style="font-weight: normal;"><span class="text-warning col-xs-1"><i class="icon-credit-card"></i></span> 财务统计</th>
				</tr> -->
			  <tr>
			  	<%-- <td class="text-center text-muted"><span class="text-warning"><i class="icon-random icon-large"></i></span><br/>抢单积分<br/><span class="text-warning">${balance}</span></td> --%>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-gift icon-large"></i></span><br/>奖励积分<br/><span class="text-warning">${bonus}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-magnet icon-large"></i></span><br/>总积分<br/><span class="text-warning">${totalAssets}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-money icon-large"></i></span><br/>总提现<br/><span class="text-warning">${sumcashMoney}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-exchange icon-large"></i></span><br/>换算率<br/><span class="text-warning">${SYSTEM_PARAM.conversionRate }</span></td>
			  </tr>
			</table>
	  	
	  		  		
			<div class="list-group">
			  <%--<a class="list-group-item">
			    <p class="list-group-item-text"><span class="text-success col-xs-1"><i class="icon-user"></i></span>财务统计<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  	<div class="table-responsive">
			  		<table class="table style="background-color: #fff;">
					  <tr>
					  	<td class="text-center"><span class="text-primary"><i class="icon-user icon-large"></i></span><br/>现金钱包</td>
					  	<td class="text-center"><span class="text-warning"><i class="icon-pencil icon-large"></i></span><br/>总奖金</td>
					  	<td class="text-center"><span class="text-info"><i class="icon-edit icon-large"></i></span><br/>总资金</td>
					  	<td class="text-center"><span class="text-warning"><i class="icon-pencil icon-large"></i></span><br/>总提现</td>
					  	<td class="text-center"><span class="text-warning"><i class="icon-pencil icon-large"></i></span><br/>抢单币</td>
					  </tr>
					  <tr>
					  	<td class="text-center">${balance}</td>
					  	<td class="text-center">${bonus}</td>
					  	<td class="text-center">${totalAssets}</td>
					  	<td class="text-center">${sumcashMoney}</td>
					  	<td class="text-center">0.00</td>
					  </tr>
					</table>
		  		  </div>
			  	
			  </a>
			  --%><a href="${ctx}/finance/detail.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-info col-xs-1"><i class="icon-list-alt"></i></span>财务明细<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a>
			  <%-- <a href="${ctx}/finance/recharge.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-success col-xs-1"><i class="icon-plus-sign"></i></span>充值(抢单积分)<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a> --%>
			  <a href="${ctx}/finance/cashApply.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-danger col-xs-1"><i class="icon-money"></i></span>提现申请<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a>
			  <a href="${ctx}/finance/myapply.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-primary col-xs-1"><i class="icon-flag"></i></span>我的申请<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a>
			</div>
		</div>
  </body>
</html>
