<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>提示</title>
  </head>
  
  <body class="no-skin">
  		<div class="container-fluid">
  			<div class="row text-center" style="margin-top: 50px;">
  				<img alt="Brand" style="max-width: 300px;" src="${ctx }/static/images/logo.png">
  			</div>
  			<div class="row text-center" style="margin-top: 30px;">
  				<c:if test="${not empty message}">
					  <h4 class="text-danger">${message}</h4>
				</c:if>
  			</div>
  			
  			<div class="row text-center" style="margin-top: 30px;">
  				 <button onclick="window.history.back();" class="btn btn-warning col-xs-12">返回</button>
  			</div>
  		</div>
  </body>
</html>
