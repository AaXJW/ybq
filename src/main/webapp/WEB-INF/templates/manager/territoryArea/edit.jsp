<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
	
<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<title>代理编辑</title>  
		<backurl>${ctx }/manager/territoryArea/list.htm</backurl>
		<script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
		
		<script src="${ctx}/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
		
		<script src="${ctx}/plugins/icon-picker/js/iconPicker.min.js"></script>
		
		<link href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet" />
		
		<link href="${ctx}/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
		
		<link href="${ctx}/plugins/icon-picker/css/icon-picker.min.css" rel="stylesheet" />
		
		<link href="${ctx}/static/style/register.css" rel="stylesheet" />
		
		<style>
			.bv-form .bv-icon-input-group{
				top:18px;
			}
		</style>
	</head>
	
	<body>
		<form action="${ctx}/manager/territoryArea/save.htm" method="post" name="inputForm" id="inputForm" 
			data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
		    <input type="hidden" name="territoryAreaid" value="${territoryArea.id}" />
		    <ul class="list-group">
			  <li class="list-group-item">
			  	<div id="areaNameCT" class="row form-group">
			  		<h5 class="list-group-item-heading text-muted"> 团购区名称：</h5>
	  				<div class="input-group" >
					  <input type="text" class="form-control" id="areaName" name="areaName" placeholder="请输入团购区名称" value="${territoryArea.areaName }"
						required data-bv-notempty="true" data-bv-notempty-message="团购区名称不能为空" aria-describedby="basic-addon1" />
					  <span class="input-group-addon" id="basic-addon1"><i class="icon-book"></i></span>
					</div>
	  			</div>
	  			
	  			<div id="territoryAreaCodeCT" class="row form-group">
	  				<h5 class="list-group-item-heading text-muted"> 等级：</h5>
	  				<div class="input-group" >
					  <select name="areaLevel" id="areaLevel" class="selectpicker" data-width="auto" title="请选择一个等级" required data-bv-notempty-message="请选择等级" >
					  	<option>1</option>
					  	<option>2</option>
					  	<option>3</option>
					  	<option>4</option>
					  	<option>5</option>
					  	<option>6</option>
					  	<option>7</option>
					  	<option>8</option>
					  	<option>9</option>
					  </select>
					  <span class="input-group-addon" id="basic-addon2"><i class="icon-sitemap"></i></span>
					</div>
	  			</div>
	  			
	  			
	  			<div id="sillAmountCT" class="row form-group">
	  				<h5 class="list-group-item-heading text-muted"> 团购区图标：</h5>
	  				<input type="text" value="${territoryArea.logoIcon }" name="logoIcon" id="logoIcon" class="icon-picker" placeholder="点击右边图标选择" required data-bv-notempty="true" data-bv-notempty-message="请选择一个图标"/>
  				</div>
	  				
	  			
	  			
	  			<div id="sillAmountCT" class="row form-group">
	  				<h5 class="list-group-item-heading text-muted"> 门槛资金：</h5>
	  				<div class="input-group" >
					  <input type="text" class="form-control" id="sillAmount" name="sillAmount" placeholder="请输入门槛资金" value="${territoryArea.sillAmount }"
						required data-bv-notempty="true" data-bv-notempty-message="门槛资金不能为空" aria-describedby="basic-addon1"
						data-bv-numeric="true" data-bv-numeric-message="门槛资金必须为数字" />
					  <span class="input-group-addon" id="basic-addon1"><i class="icon-lemon"></i></span>
					</div>
	  			</div>
	  			
	  			<div id="enableCT" class="row form-group">
	  				<div class="input-group" >
	  					<select class="form-control" name="state" id="state">
	  						<option value="true" >启用</option>
	  						<option value="false" >停用</option>
	  					</select>
					  <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-link"></i></span>
					</div>
	  			</div>
			  </li>
			  
			  
			</ul>
		    
		    <button type="submit" class="btn btn-success col-xs-6">
		  		保存
		  	</button>
		  	
		  	<a  class="btn btn-primary col-xs-6" href="${ctx}/manager/territoryArea/list.htm">
		  		返回
		  	</a>
		    
	    </form>
	    <script>
			
			$("#areaLevel").val("${territoryArea.areaLevel}");
			$("#state").val("${territoryArea.state}");
			$(function(){
				$(".icon-picker").iconPicker().click(function(){
					$(this).after().trigger("click");
				});
				$("#inputForm").bootstrapValidator();
			});
		</script>
	</body>

</html>
