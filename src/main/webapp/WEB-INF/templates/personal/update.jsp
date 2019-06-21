<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    	<title>资料修改</title>
    
        <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	
		<script src="${ctx}/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
		
		<link href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet" />
		
		<link href="${ctx}/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
	    
    
    	<link href="${ctx}/static/style/register.css" rel="stylesheet" />
  </head>
  
  <body class="no-skin">
  		<%@ include file="/WEB-INF/templates/register_template.jsp" %>
  		<script>
  			$(function(){
  				var telhtml = "<div class='input-group'><input class='form-control' type='text' id='tel' name='tel' value='${tel}' readonly><span class='input-group-addon'><i class='icon-tablet'></i></span></div>";
  				var idNumberhtml ="<div class='input-group'><input class='form-control' type='text' id='idNumber' name='idNumber' value='${idNumber}' readonly><span class='input-group-addon'><i class='icon-credit-card'></i></span></div>";
  				$(".panel-heading").text("资料修改");
  				$("#inputForm .panel-body").append('<button type="submit" class="btn btn-success col-xs-12">修改</button>');
  				$("#inputForm").attr("action","${ctx}/manager/user/saveUser.htm");
  				$("#telCT").remove();
  				$("#telDiv").prepend(telhtml);
  				$("#idNumberCT").remove();
  				$("#idNumberDiv").prepend(idNumberhtml);
  				$("#recommendertelCT").remove();
  				$("#lgpasswordCT").remove();
  				$("#relgpasswordCT").remove();
  				$("#paypasswordCT").remove();
  				$("#repaypasswordCT").remove();
  				$("#levelsCT").remove();
  				$("#vcodeCT").remove();
  				$("#inputForm").attr("action","${ctx}/personal/saveProfile.htm");
  			});
  		</script>
  </body>
</html>
