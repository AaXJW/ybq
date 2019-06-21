<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>重置支付密码</title>
     <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>		
	<link href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet" />
    <style>
    	.formDiv{width:100%;padding:0 20px;margin-top:30px;}
    </style>
  </head>
  
  <body class="no-skin">		 
	  	<%@ include file="/WEB-INF/templates/changePassword_template.jsp" %>
	  	<script type="text/javascript">
	  		$(function(){	  		
	  			$("#inputForm").attr("action","${ctx}/personal/saveChangePayPassword.htm");
	  		})
	  	</script>
  </body>
</html>
