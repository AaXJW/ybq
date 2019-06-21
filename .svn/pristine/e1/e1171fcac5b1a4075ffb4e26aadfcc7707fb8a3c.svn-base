<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>创建用户</title>
    <c:if test="${not empty param.newType}">
    	<thistitle>创建抢位用户</thistitle>
    </c:if>
    
        <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	
		<script src="${ctx}/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
		
		<link href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet" />
		
		<link href="${ctx}/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
	    
    
    	<link href="${ctx}/static/style/register.css" rel="stylesheet" />
    	<style>
    		body{
    			padding-bottom: 120px;
    		}
    	</style>
  </head>
  
  <body class="no-skin">
  
  		<c:if test="${param.newType == 1}">
  			<div class="container-fluid">
  				<div class="alert alert-info" role="alert">请尽快完成新建用户，以便更快完成抢位</div>
  			</div>
  		</c:if>
  		<%@ include file="/WEB-INF/templates/register_template.jsp" %>
  		<script>
  			$(function(){
  				$("#inputForm").append('<button type="submit" class="btn btn-success col-xs-12"><i class="icon-circle-arrow-right icon-2x"></i></button>');
  				$("#inputForm").attr("action","${ctx}/personal/saveUser.htm");
  				$("#inputForm").append("<input type='hidden' name='newType' value='${param.newType}' />");
  				
  				$("#recommendertelCT").remove();
  			});
  		</script>
  </body>
</html>
