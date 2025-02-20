<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>平台协议编辑</title>
    
    <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	
	<link href="${ctx}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	
	<script src="${ctx }/plugins/ueditor/ueditor.config.js?v=8d13c59"></script>
	<script src="${ctx }/plugins/ueditor/ueditor.all.min.js?v=c65d9ea"></script>
	<script src="${ctx }/plugins/ueditor/lang/zh-cn/zh-cn.js?v=2869bec"></script>
	<style>
		.editor{
			padding-left: 0;
		}
	</style>
  </head>
  
  <body class="no-skin">
  		
  		<form action="${ctx}/manager/saveAgreement.htm" method="post" name="inputForm" id="inputForm" 
			data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
		    <input type="hidden" name="id" value="${entity.id}" />
		    
		    <div class="panel panel-default">
			  <div class="panel-body">
				    <div class="row form-group vcode-group">
						<div class="col-xs-12">
							  协议名称：<input type="text" class="form-control" placeholder="协议名称不能为空"
								required data-bv-notempty-message="请输入协议名称" id="agreementsTitle" name="agreementsTitle" aria-describedby="basic-addon3"
								value="${entity.agreementsTitle }"/>
								
						</div>
					</div>
				    
				    <div class="container-form">
				    		<script name="agreements" id="agreements" required data-bv-notempty-message="协议内容必须填写" class="col-xs-12 editor" type="text/plain" style="height:400px;">${entity.agreements}</script>
				    </div>
				    
				    <div class="container-form">
			  			<button id="submitBTN" type="submit" class="btn btn-primary col-xs-12 submit" autocomplete="off">
				  			<span id="words-icon"><i class="glyphicon glyphicon-ok"></i></span>
				  			<span id="loading-icon" style="display: none;"><i class="icon-spinner icon-spin"></i></span>
				  		</button>
		  			</div>
  			
  				</div>
  			
  			</div>
	    </form>
	    
	    <script>
	    
	    $(function(){
			/* $("#inputForm").bootstrapValidator(); */
			UE.getEditor('agreements');
    		});
	    </script>
  </body>
</html>
