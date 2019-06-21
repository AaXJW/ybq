<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>添加收款账户信息</title>
    <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>	
	<link href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet" />
    <style>
    	.formDiv{width:100%;padding:0 20px;margin-top:30px;}
    </style>
  </head>
  
  <body class="no-skin">
		 
	  	<div class="container-fluid inner-menu">
	  		<div class="formDiv">
				<form action="${ctx}/finance/saveAccount.htm" method="post" name="inputForm" id="inputForm" 
					data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
				    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
				    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
			    	<c:if test="${not empty message}">
					<div class="alert alert-danger alert-dismissible" role="alert">
					  ${message}
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
					</div>
					</c:if>		
			    	<div class="row form-group">
			    		<label>请输入您的收款卡号：</label>
			    		<div class="input-group">
			    			<span class="input-group-addon" id="basic-addon1"><i class="icon-credit-card text-success"></i></span>
							<input type="text" class="form-control" id="account" name="account" placeholder="请输入您的收款卡号"
							data-bv-notempty="true"  data-bv-notempty-message="卡号不能为空" aria-describedby="basic-addon1">						  	
			    		</div>
			    	</div>			    
			    	<button type="submit" class="form-control btn btn-primary">添加</button>
			    </form>
	  		</div>  		  		
		</div>
		<script type="text/javascript">
			$(function(){
					$("#inputForm").bootstrapValidator();
			});
		</script>
  </body>
</html>
