<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>个人资料</title>
    <thistitle><i class="icon-user"></i> ${sessionScope.LOGINED_USER.name}</thistitle>
  </head>
  
  <body class="no-skin">
		
		<div class="container-fluid inner-menu">
			<div class="list-group">
				<li class="list-group-item">
				    <p class="list-group-item-text">用户级别<span class="pull-right">${sessionScope.LOGINED_USER.levelsName}</span></p>
				</li>
				<li class="list-group-item">
			    	<p class="list-group-item-text">手机号码<span class="pull-right">${sessionScope.LOGINED_USER.tel}</span></p>
			  	</li> 
			  	<li class="list-group-item">
			    	<p class="list-group-item-text">状态
			    	<span class="pull-right">
			    		<c:if test="${sessionScope.LOGINED_USER.state==0}">
			    			待审核
			    		</c:if>
			    		<c:if test="${sessionScope.LOGINED_USER.state==1}">
			    			审核通过
			    		</c:if>
			    	</span></p>
			  	</li> 
			</div>			
			<div class="list-group">
			<li class="list-group-item">
			    <p class="list-group-item-text">推荐人<span class="pull-right">${sessionScope.LOGINED_USER.recommendertel}</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">银行卡号<span class="pull-right">${sessionScope.LOGINED_USER.account}</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">身份证号码<span class="pull-right">${sessionScope.LOGINED_USER.idNumber}</span></p>
			  </li>
			</div>
			
			<div class="list-group">
			  <li class="list-group-item">
			    <p class="list-group-item-text">余额<span class="pull-right">${sessionScope.LOGINED_USER.balance}</span></p>
			  </li>
			   <li class="list-group-item">
			    <p class="list-group-item-text">积分<span class="pull-right">${sessionScope.LOGINED_USER.bonus}</span></p>
			  </li>
			</div>
			
			<div class="list-group">
			  <li class="list-group-item">
			    <p class="list-group-item-text">微信<span class="pull-right">${sessionScope.LOGINED_USER.weixin}</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">消费平台账号<span class="pull-right">${sessionScope.LOGINED_USER.thirdPlatformAccount}</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">邮箱<span class="pull-right">${sessionScope.LOGINED_USER.email}</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">注册时间<span class="pull-right">${sessionScope.LOGINED_USER.addTime}</span></p>
			  </li>
			</div>
		</div>
  </body>
</html>
