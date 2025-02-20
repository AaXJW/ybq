<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <base href="${ctx}">
	<script>
		var ctx="${ctx}";
		var afterLoad=null;
		var befordMsg=null;
	</script>
	
	<%@ include file="/WEB-INF/jsp/top.jsp" %>
	
	<title>
	      <sitemesh:write property='title' />
	  </title>
	
	<style>
	
		.container-manager{
			padding: 0;
		}
		body { padding-top: 70px; }
		
		.outer{
			padding-top: 20px !important;
		}
		
	</style>
	
	<link href="${ctx}/static/style/index.css" rel="stylesheet" />
	
	<sitemesh:write property='head' />
  </head>
  
  <body class="no-skin">
	<nav class="navbar navbar-default navbar-fixed-top">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <a class="navbar-brand" href="${ctx }/manager/index.htm">
				<img alt="Brand" height="20" src="${ctx }/static/images/logo.png">
			  </a>
			  <a class="navbar-brand" href="${ctx }/manager/index.htm">
			  	管理平台
			  </a>
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <!-- <li class="disabled"><a>板块管理</a></li> -->
		        <c:if test="${sessionScope.MENUS['/manager/parameterSet.htm']}">
		        <li class="dropdown">
		        		<a class="dropdown-toggle" data-toggle="dropdown" href="${ctx}/deploing.htm">系统设置<span class="caret"></span></a>
		        		<ul class="dropdown-menu">
		        			<li><a href="${ctx }/manager/parameterSet.htm">系统参数配置</a></li>
		        			<li><a href="${ctx }/manager/agreement.htm">平台协议</a></li>
		        		</ul>
		        	</li>
		        </c:if>
		        
		        <c:if test="${sessionScope.MENUS['/manager/user/createUser.htm'] || sessionScope.MENUS['/manager/user/listUser.htm']}">
			        <li class="dropdown">
			        	<a class="dropdown-toggle" data-toggle="dropdown" href="${ctx}/deploing.htm">用户管理<span class="caret"></span></a>
			        	<ul class="dropdown-menu">
			        		<c:if test="${sessionScope.MENUS['/manager/user/createUser.htm']}">
			        			<li><a href="${ctx }/manager/user/createUser.htm">创建用户</a></li>
			        		</c:if>
			        		<c:if test="${sessionScope.MENUS['/manager/user/listUser.htm']}">
			        			<li><a href="${ctx}/manager/user/listUser.htm">用户查询</a></li>
			        		</c:if>
			        	</ul>
			        </li>
		        </c:if>
		        <c:if test="${sessionScope.MENUS['/manager/message/createMessage.htm'] || sessionScope.MENUS['/manager/message/list.htm']}">
			        <li class="dropdown">
			        	<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">消息管理<span class="caret"></span></a>
			        	<ul class="dropdown-menu">
			        		<c:if test="${sessionScope.MENUS['/manager/message/createMessage.htm']}">
			        			<li><a href="${ctx }/manager/message/createMessage.htm">创建消息</a></li>
			        		</c:if>
			        		<c:if test="${sessionScope.MENUS['/manager/message/list.htm']}">
			        			<li><a href="${ctx }/manager/message/list.htm">消息查询</a></li>
			        		</c:if>
			        	</ul>
			        </li>
		        </c:if>
		        
		        <c:if test="${sessionScope.MENUS['/manager/territoryArea/list.htm'] || sessionScope.MENUS['/manager/territory.htm']}">
			        <li class="dropdown">
			        		<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">团购管理<span class="caret"></span></a>
			        		<ul class="dropdown-menu">
				        		<c:if test="${sessionScope.MENUS['/manager/territoryArea/list.htm']}">
					        	<li><a href="${ctx }/manager/territoryArea/list.htm">团购区管理</a></li>
					        </c:if>
					        <c:if test="${sessionScope.MENUS['/manager/territory.htm']}">
					        	<li><a href="javascript:openTerritory();">结构图</a></li>
					        </c:if>
				        </ul>
			        </li>
		        </c:if>
		        
		        <c:if test="${sessionScope.MENUS['/manager/approval.htm']}">
			        <li class="dropdown">
				        <a href="${ctx}/deploing.htm" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">审批 <span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="${ctx }/manager/approval.htm?approvalType=0">注册/复投审批</a></li>
				            <li><a href="${ctx }/manager/approval.htm?approvalType=1">提现审批</a></li>
				            <li><a href="${ctx }/manager/approval.htm?approvalType=2">充值审批</a></li>
				          </ul>
			          </li>
		          </c:if>
		          
	            <c:if test="${sessionScope.MENUS['/manager/currentMonthData.htm']}">
		            <li class="dropdown">
		            	<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">统计<span class="caret"></span></a>
		            	<ul class="dropdown-menu">
			        		<li><a href="${ctx }/manager/currentMonthData.htm">当月数据</a></li>
			        		<%-- <li><a href="${ctx }/manager/exportCMD.htm">数据导出</a></li> --%>
			        	</ul>
		            </li>
	            </c:if>
	            
	            <c:if test="${sessionScope.MENUS['/manager/proxy/list.htm']}">
		            <li class="dropdown">
		            	<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">代理区管理<span class="caret"></span></a>
		            	<ul class="dropdown-menu">
			        		<li><a href="${ctx }/manager/proxy/list.htm">代理区</a></li>
			        		<li><a href="${ctx }/manager/proxy/create.htm">创建代理区</a></li>
			        		<%-- <li><a href="${ctx }/manager/exportCMD.htm">数据导出</a></li> --%>
			        	</ul>
		            </li>
	            </c:if>
	            
	            <li><a href="${ctx }/outlogin.htm">退出登录 <i class="glyphicon glyphicon-log-out"></i></a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<div class="container-fluid container-manager">
  			<sitemesh:write property='body' />
  		</div>
  		<script src="${ctx}/static/js/index.js"></script>
  		<script>
  		$(function(){

  	  		//befordMsg
  			if(befordMsg){
  				befordMsg();
				}
			<c:if test="${not empty message}">
				<c:if test="${empty messageType}">
					$.alertWarning("${message}");
				</c:if>
				<c:if test="${not empty messageType}">
					<c:if test="${messageType==0}">
						$.alertSuccess("${message}");
					</c:if>
					<c:if test="${messageType==1}">
						$.alertWarning("${message}");
					</c:if>
					<c:if test="${messageType==2}">
						$.alertDanger("${message}");
					</c:if>
				</c:if>
	  		</c:if>

	  		if(afterLoad){
				afterLoad();
				}
			var uag=window.navigator.userAgent;
			if(uag.indexOf("iPhone")>=0&&uag.indexOf(" ",uag.indexOf("Mobile/"))<0){
				$(".navbar-fixed-top").css({top:"20px"});
				$("body").append("<div style='width:100%;height:20px;position:fixed;top:0px;left:0px;background-color:#e95420;'></div>");
			}
			$('.dropdown-toggle').dropdown();;
	   	});
  		
  		function openTerritory(){
  			var ul=$('<div class="list-group"></div>');
			
			<c:forEach items="${sessionScope.territoryAreas}" varStatus="vs" var="entity">
				ul.append(buildLi("${entity.id}","${entity.areaName}","${entity.logoIcon}"));
			</c:forEach>
			
			$.alertOpen({content:ul,title:"请选择团购区",height:360});
  		}
  		
  		function buildLi(id,info,icon){
		    	var li=$('<a href="${ctx }/manager/territory.htm?territoryAreaId='+id+'" class="list-group-item"><i class="'+icon+'"></i>'+info+'</span></a>');
		    	return li;
	    }
  		</script>
  </body>
</html>
