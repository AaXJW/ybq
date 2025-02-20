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
		window.onbeforeunload = function(){
			$.blockUI();
			return;
		};
	</script>
	
	<title>
	      <sitemesh:write property='title' /> <sitemesh:write property='thistitle' default="-" /> 
	  </title>
	
	<%@ include file="/WEB-INF/jsp/top.jsp" %>
	
	<link href="${ctx}/static/style/index.css" rel="stylesheet" />
	
	<style>
     	body{
     		padding-top: 20px;
     	}
     </style>
	
	<sitemesh:write property='head' />
  </head>
  
  <body class="no-skin">
  		<nav class="navbar navbar-default navbar-fixed-top">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <%   
					String url=request.getAttribute("javax.servlet.forward.request_uri").toString();  
		      		if(url.indexOf("/index.htm")>=0||url.indexOf("/login.htm")>=0){
				%> 
					<a class="navbar-brand" href="${ctx}<sitemesh:write property='backurl' default="/index.htm" />">
						<img alt="Brand" height="20" src="${ctx}/static/images/logo.png">
					</a>
				<%}else{ %>
					<a class="navbar-brand" href="<sitemesh:write property='backurl' default="javascript:window.history.back();" />">
						<i class="glyphicon glyphicon-menu-left"></i>
					</a>
				<%}%>
			  <span class="navbar-brand">
			  	<sitemesh:write property='title' /> <sitemesh:write property='thistitle'/>
			  </span>
		    </div>
		   </div>
		 </nav>
  		<sitemesh:write property='body' />
  		<script>
  		$(function(){
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
			var uag=window.navigator.userAgent;
			if(uag.indexOf("iPhone")>=0&&uag.indexOf(" ",uag.indexOf("Mobile/"))<0){
				$(".navbar-fixed-top").css({top:"20px"});
				$("body").append("<div style='width:100%;height:20px;position:fixed;top:0px;left:0px;background-color:#e95420;'></div>");
			}
	   	});
  		</script>
  </body>
</html>
