<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>团队管理</title>
    <title><i class="icon-user icon-large"></i>
		        ${sessionScope.LOGINED_USER.name}<small>(${sessionScope.LOGINED_USER.tel})</small></title>
		        
    <backurl>${ctx }/team/index.htm</backurl>
    <style>
    	
    </style>
    
  </head>
  
  <body class="no-skin">
		
		<div class="container-fluid inner-menu">
			<%-- <c:set var="isCan" value="false"></c:set> --%>
			<ul class="list-group">
			
				<c:choose>
		  			<c:when test="${not empty ters}">
		  				<c:forEach items="${ters}" var="entity" varStatus="vs">	
		  					<li class="list-group-item">
							    <p class="list-group-item-text">第<strong class="text-info">${entity.depth}</strong>层，有<strong class="text-warning">${entity.seatPrice}</strong>抢位奖励积分</p>
							  </li>  		
		  				</c:forEach>
		  				<c:choose>
				  			<c:when test="${not empty users}">
				  				<li class="list-group-item">
				  					<h5 class="list-group-item-heading">符合抢位的用户有
				  					<c:if test="${!isCan}">
					  					，您暂无参与资格
					  				</c:if>
					  				</h5>
					  				<c:forEach items="${users}" var="user" varStatus="vs">	
							  			<span class="label label-success">${user[1]}</span>
							  			
							  			<c:if test="${user[0] == sessionScope.LOGINED_USER.tel}">
							  				<c:set var="isCan" value="true"></c:set>
							  			</c:if>
					  				</c:forEach>
					  				
				  				</li>
				  			</c:when>
				  			<c:otherwise>
				  				<div class="alert alert-warning text-center" role="alert">无可参与抢单的用户</div>
				  			</c:otherwise>
				  		</c:choose> 
		  			</c:when>
		  			<c:otherwise>
		  				<div class="alert alert-warning text-center" role="alert">系统暂无抢单位</div>
		  			</c:otherwise>
		  		</c:choose>  	
		  		
			</ul>
			
			<c:if test="${isCan}">
  				<div class="row" style="padding: 10px;">
  				<c:if test="${sessionScope.LOGINED_USER.territoryState == 2}">
					<a href="javascript:compete(1);" class="btn btn-primary col-xs-12"><i class="icon-bolt"></i>&nbsp;&nbsp;&nbsp;&nbsp;复投抢位 </a>
				</c:if>
				<a href="javascript:compete(2);" class="btn btn-danger col-xs-12" style="margin-top: 10px;"><i class="icon-bolt"></i>&nbsp;&nbsp;&nbsp;&nbsp;推荐抢位 </a>
				</div>
  			</c:if>
		</div>
		<script type="text/javascript">
			function compete(type){
				$.alertConfirm("您确定要参与抢位？抢位成功后"+(type==1?"需要缴纳复投金才可通过审核":"需要推荐一人，被推荐人通过审核后您才能获得抢单奖"),function(){
					$.blockUI();
					top.Location()="${ctx }/team/compete.htm?type="+type;
				});
			}
		</script>
  </body>
</html>
