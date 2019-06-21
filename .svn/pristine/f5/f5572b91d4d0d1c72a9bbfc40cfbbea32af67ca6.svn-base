<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>充值</title>  
    <style>
    	.recharge{margin-top:15px;}
    </style>
  </head>
  
  <body class="no-skin">
  		<%-- <nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="${ctx }/manager/index.htm">
				<img alt="Brand" height="20" src="${ctx }/static/images/logo.png">
			  </a>
			  <a class="navbar-brand" href="${ctx }/manager/index.htm">
			  	充值
			  </a>
		    </div>
		   </div>
		 </nav> --%>
		 
	  	<div class="container-fluid inner-menu">
	  		<div class="list-group">
	  			<!-- <a href="${ctx}/deploing.htm" class="list-group-item">
	  				<p class="list-group-item-text">
	  					<span class="col-xs-1"><i class="icon-credit-card"></i></span>
							<c:choose>
								<c:when test="${not empty sessionScope.LOGINED_USER.account }">
									${sessionScope.LOGINED_USER.account}
								</c:when>
								<c:otherwise>
									请添加银行卡
								</c:otherwise>
							</c:choose>	
						<span class="pull-right text-muted"><i class="icon-angle-right"></i></span>
					</p>
	  			</a> -->
	  			<c:if test="${empty sessionScope.LOGINED_USER.account }">
	  			<a href="${ctx}/deploing.htm" class="list-group-item">
	  				<p class="list-group-item-text">
	  					<span class="col-xs-1"><i class="icon-credit-card"></i></span>
							请添加银行卡  <span class="text-warning">您还未添加收款账户信息</span>
						<span class="pull-right text-muted"><i class="icon-angle-right"></i></span>
					</p>
	  			</a>
	  			</c:if>
	  		</div>
	  		<form action="${ctx}/finance/saveRecharge.htm" method="post">
		  		<ul class="list-group">
			  		<li class="list-group-item">			  		
				  			<div class="form-group recharge" style="margin-top:15px;">
				  				<label class="sr-only" for="bonus">积分充值</label>
				  				<div class="input-group">
					  				 <div class="input-group-addon">积分充值</div>
		      						 <input type="text" class="form-control" id="applyBalance" placeholder="请输入积分" name="applyBalance" value="${applyBalance}" required min="1">  						
				  				</div>			  				
				  			</div>	
			  		</li>
		  		</ul>
		  		<div class="col-xs-12">
			  		<button type="submit" id="sub-btn" class="btn btn-primary form-control">充值</button>
		  		</div>
	  		</form>	  		
	  	</div>	
	  	
	  	<script type="text/javascript">
	  		$(function(){
  				
  				<c:if test="${empty sessionScope.LOGINED_USER.account }">
  					$("#sub-btn").attr("disabled","disabled");
  					$("#applyBalance").attr("disabled","disabled");
  				</c:if>
	  		});
	  		
	  		
	  	</script>
  </body>
</html>
