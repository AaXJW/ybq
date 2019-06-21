<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>创建消息</title>
    
        <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	
		<script src="${ctx}/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
		
		<link href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet" />
		
		<link href="${ctx}/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
	    
    
    	<link href="${ctx}/static/style/register.css" rel="stylesheet" />
  </head>
  
  <body class="no-skin">
  		<%@ include file="/WEB-INF/templates/createMessage_template.jsp" %>
  		<script>
  			$(function(){
  				$("#inputForm").append('<button type="submit" class="btn btn-primary col-xs-12 submit">发送</button>');
  				$("#inputForm").attr("action","${ctx}/manager/message/saveMessage.htm");
  			});  			
  		</script>
  </body>
</html>
