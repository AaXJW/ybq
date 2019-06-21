<%--<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的注册申请</title>
    
    <%@ include file="/WEB-INF/jsp/upload_depends.jsp" %>
  </head>
  
  <body class="no-skin">
  
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <a class="navbar-brand" href="${ctx }/manager/index.htm">
				<img alt="Brand" height="20" src="${ctx }/static/images/logo.png">
			  </a>
			  <a class="navbar-brand" href="${ctx }/manager/index.htm">
			  	我的注册申请
			  </a>
		    </div>
		   </div>
		 </nav>
		 
		 <div class="container-fluid">
		 	<ol class="breadcrumb">
			  <li><a href="${ctx}/personal/index.htm">我的</a></li>
			  <li class="active">我的注册申请</li>
			</ol>
		 </div>
  
	  	<div class="container-fluid inner-menu">	  		
			<form action="${ctx}/personal/saveVoucherUrl.htm" method="post">
				<input type="hidden" name="id" value="${entity.id}">
				<ul class="list-group">
				  <li class="list-group-item">
				    <p class="list-group-item-text">编号：<span class="pull-right">${entity.approvalCode}</span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">状态：<span class="pull-right">${stateMc}</span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">类型：<span class="pull-right">${typeMc}</span></p>
				  </li>
				  <c:choose>
					  <c:when test="${power}">				  
						  <li class="list-group-item">
						    <p class="list-group-item-text">操作：<a href="${ctx}/personal/payApproval.htm?id=${entity.id}" class="btn btn-primary pull-right">已转账</a></p>
						  </li>
					  </c:when>
				  </c:choose>
				  <li class="list-group-item">
				    <p class="list-group-item-text">申请时间：<span class="pull-right"><fmt:formatDate value="${entity.addTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; </span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">打款超时时间：<span class="pull-right"><fmt:formatDate value="${entity.payOutTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; </span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">打款时间：<span class="pull-right"><fmt:formatDate value="${entity.payTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; </span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">审核时间：<span class="pull-right"><fmt:formatDate value="${entity.approvalTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; </span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text text-center">
				    	<img width="300" id="voucherUrlImg" src="${entity.voucherUrl}" class="" style="margin-right: 5px;cursor: pointer;" accept="image/gif,image.jpg" />
						<input type="file" name="voucherUrlFile" id="voucherUrlFile" maxlength="255" placeholder="这里上传凭证" title="凭证" style="width:98%;display: none;" keepDefaultStyle = "true"/>
						<input type="hidden" name="voucherUrl" id="voucherUrl" value="${entity.voucherUrl}" class="imgUrl" required data-bv-notempty-message="凭证必须上传" />
				    	<br/><span class="text-muted">点击图片重新上传</span>
				    </p>
				  </li>
				</ul>
				<div class="col-xs-12">
					<button class="btn btn-primary form-control" type="submit" >上传</button>
				</div>
			</form>
		</div>
		
		
		<script>
			$(function(){
				$("#voucherUrlImg").click(function(){
					$("#voucherUrlFile").click();;
				});
				$("#voucherUrlFile").localLoadImage(function(imgData){
					$("#voucherUrl").val(imgData);
					$("#voucherUrlImg").attr("src",imgData);
				});
			});
		</script>
  </body>
</html>
--%>