<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>系统管理</title>
  </head>
  
  <body class="no-skin">
  		<div class="container-fluid inner-menu">
  			<table class="table table-bordered" style="background-color: #fff;color:#4c4c4c;">
  			  <tr>
					<th colspan="5" style="font-weight: normal;"><span class="text-success col-xs-1"><i class="icon-circle-blank"></i></span> 当月数据</th>
			  </tr>
			  <tr>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=1"><span class="text-success"><i class="icon-group icon-large"></i></span><br/>团购奖励<br/><span class="text-success"><c:set var="pkey" value="m_tgjl${proxyId }" />${StatisticsData[pkey]}</span></a></td>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=2"><span class="text-success"><i class="icon-user-md icon-large"></i></span><br/>推荐奖励<br/><span class="text-success"><c:set var="pkey" value="m_tjjl${proxyId }" />${StatisticsData[pkey]}</span></a></td>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=3"><span class="text-success"><i class="icon-random icon-large"></i></span><br/>抢单奖励<br/><span class="text-success"><c:set var="pkey" value="m_qdjl${proxyId }" />${StatisticsData[pkey]}</span></a></td>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=4"><span class="text-success"><i class="icon-exchange icon-large"></i></span><br/>提现积分<br/><span class="text-success"><c:set var="pkey" value="m_txjf${proxyId }" />${StatisticsData[pkey] }</span></a></td>
			  </tr>
			  <tr>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=5"><span class="text-success"><i class="icon-plus-sign icon-large"></i></span><br/>注册/复投金额<br/><span class="text-success"><c:set var="pkey" value="m_rfje${proxyId }" />${StatisticsData[pkey]}</span></a></td>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=6"><span class="text-success"><i class="icon-ok-sign icon-large"></i></span><br/>团购成功数<br/><span class="text-success"><c:set var="pkey" value="m_tgcgs${proxyId }" />${StatisticsData[pkey]}</span></a></td>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=7"><span class="text-success"><i class="icon-magnet icon-large"></i></span><br/>注册数<br/><span class="text-success"><c:set var="pkey" value="m_zcs${proxyId }" />${StatisticsData[pkey]}</span></a></td>
			  	<td class="text-center text-muted col-xs-3"><a href="${ctx}/manager/currentMonthData.htm?type=8"><span class="text-success"><i class="icon-retweet icon-large"></i></span><br/>复投数<br/><span class="text-success"><c:set var="pkey" value="m_fts${proxyId }" />${StatisticsData[pkey]}</span></a></td>
			  </tr>
			</table>
			
  			<table class="table table-bordered" style="background-color: #fff;color:#4c4c4c;">
  			  <tr>
					<th colspan="5" style="font-weight: normal;"><span class="text-warning col-xs-1"><i class="icon-circle"></i></span> 累计数据</th>
			  </tr>
			   <tr>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-group icon-large"></i></span><br/>团购奖励<br/><span class="text-warning"><c:set var="pkey" value="a_tgjl${proxyId }" />${StatisticsData[pkey]}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-user-md icon-large"></i></span><br/>推荐奖励<br/><span class="text-warning"><c:set var="pkey" value="a_tjjl${proxyId }" />${StatisticsData[pkey]}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-random icon-large"></i></span><br/>抢单奖励<br/><span class="text-warning"><c:set var="pkey" value="a_qdjl${proxyId }" />${StatisticsData[pkey]}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-exchange icon-large"></i></span><br/>提现积分<br/><span class="text-warning"><c:set var="pkey" value="a_txjf${proxyId }" />${StatisticsData[pkey] }</span></td>
			  </tr>
			  <tr>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-plus-sign icon-large"></i></span><br/>注册/复投金额<br/><span class="text-warning"><c:set var="pkey" value="a_rfje${proxyId }" />${StatisticsData[pkey]}</span></td>
			    <td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-ok-sign icon-large"></i></span><br/>团购成功数<br/><span class="text-warning"><c:set var="pkey" value="a_tgcgs${proxyId }" />${StatisticsData[pkey]}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-user icon-large"></i></span><br/>用户数<br/><span class="text-warning"><c:set var="pkey" value="a_yhs${proxyId }" />${StatisticsData[pkey]}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-headphones icon-large"></i></span><br/>抢单成功数<br/><span class="text-warning"><c:set var="pkey" value="a_qdcgs${proxyId }" />${StatisticsData[pkey]}</span></td>
			  </tr>
			</table>
			
			<%-- <table class="table table-bordered" style="background-color: #fff;color:#4c4c4c;">
  			  <tr>
					<th colspan="5" style="font-weight: normal;"><span class="text-warning col-xs-1"><i class="icon-circle"></i></span> 累计数据</th>
			  </tr>
			   <tr>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-group icon-large"></i></span><br/>团购奖励<br/><span class="text-warning">${StatisticsData.a_tgjl}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-user-md icon-large"></i></span><br/>推荐奖励<br/><span class="text-warning">${StatisticsData.a_tjjl}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-random icon-large"></i></span><br/>抢单奖励<br/><span class="text-warning">${StatisticsData.a_qdjl}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-exchange icon-large"></i></span><br/>提现积分<br/><span class="text-warning">${StatisticsData.a_txjf }</span></td>
			  </tr>
			  <tr>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-plus-sign icon-large"></i></span><br/>注册/复投金额<br/><span class="text-warning">${StatisticsData.a_rfje}</span></td>
			    <td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-ok-sign icon-large"></i></span><br/>团购成功数<br/><span class="text-warning">${StatisticsData.a_tgcgs}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-user icon-large"></i></span><br/>用户数<br/><span class="text-warning">${StatisticsData.a_yhs}</span></td>
			  	<td class="text-center text-muted col-xs-3"><span class="text-warning"><i class="icon-headphones icon-large"></i></span><br/>抢单成功数<br/><span class="text-warning">${StatisticsData.a_qdcgs}</span></td>
			  </tr>
			</table>
			
			
			
			<a href="${ctx }/finance/detail.htm">
			<div class="item-box col-xs-12">
				<div class="title">
					<span class="col-xs-8 text-warning"><i class="icon-money icon-large"></i>&nbsp;&nbsp;<span class="normalWord">注册/复投申请</span></span>
					<!-- <span class="label label-warning pull-right" style="margin-top:2px;">金额</span> -->
				</div>
				<div class="content">
					<h1 style="margin:0 !important;">${sumcashMoney}<i class="icon-money  pull-right" style="color: #eee"></i></h1>
					<small>已提现</small>
				</div>
			</div>
			</a> --%>
  		</div>
  </body>
</html>
