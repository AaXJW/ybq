<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>数据导出</title>   
    
    <script src="${ctx}/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
		
	<link href="${ctx}/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
    
    <link href="${ctx}/static/style/register.css" rel="stylesheet" />
    
  	<style>
	  	.form-content{
	  		padding:0px 10px;
		}
  	 		
  		.finance-detail{
  			width:100%;
  			padding:0px 10px;
  			margin-top:20px;
  		}
  	</style>
  	
  	<script>

		$(function(){
			$("#type").val(${type}).change(function(){
				$(".form-inline").submit();
			});
		})
	
  	</script>
  </head>
  
  <body class="no-skin">
		 
	  	<div class="container-fluid inner-menu outer">
	  		<div class="form-content" style="padding-top: 60px;padding-bottom: 10px;"> 
	  			<div class="row">
		  			<div class="container-fluid">	  				
						<form class="form-inline" action="${ctx}/manager/currentMonthData.htm" method="post">
							<div class="row form-group">
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon6">选择时间范围</span>
								  <select name="date" id="date" class="selectpicker" data-width="auto" aria-describedby="basic-addon9">
										<option value="0">今天</option>
										<option value="-30">本月</option>
										<option value="7">一周</option>
										<option value="30">一个月</option>
										<option value="90">三个月</option>
										<option value="183">半年</option>
										<option value="365">一年</option>
									</select>
								</div>
							</div>
							
							<div class="row form-group">
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon6">导出类型</span>
								  <select name="type" id="type" class="selectpicker" data-width="auto" aria-describedby="basic-addon9">
										<option value="0">排位工作表</option>
										<option value="-30">提现表</option>
									</select>
								</div>
							</div>
							
							<div class="row form-group col-xs-12">
								<button type="submit" class="btn btn-success col-xs-12"> 导出</button>
							</div>
						</form>	  				
		  			</div>
		  		</div>
	  		</div>
	 	</div>
  </body>
</html>
