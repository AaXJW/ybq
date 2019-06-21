<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
  	<title>个人中心</title>
    <thistitle><!-- <i class="icon-user icon-large"></i> --> &nbsp;${sessionScope.LOGINED_USER.name}<small>(${sessionScope.LOGINED_USER.tel})</small></thistitle>
    <style>
    	.modal-body{
    		text-align: center;
    	}
    </style>
  </head>
  
  <body class="no-skin">
		
		<div class="container-fluid">
			<c:if test="${sessionScope.LOGINED_USER.state == 0}">
				<div class="alert alert-danger alert-dismissible" role="alert">
				  	您还未完成认证，请及时完成用户认证 <a class="btn btn-success btn-xs" href="${ctx }/finance/applyDetail.htm?id=${apid}">去认证</a>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
				</div>
			</c:if>
		</div>
		
		<div class="container-fluid inner-menu">
			<div class="btn-group no-radius clearfix" role="group" aria-label="...">
			  <a href="${ctx}/personal/profile.htm" class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-info"><i class="icon-user icon-large"></i></span><br/>个人资料
			  </a>
			  <a href="${ctx}/personal/update.htm" class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-primary"><i class="icon-edit icon-large"></i></span><br/>资料修改
			  </a>
			  <a href="${ctx}/personal/question.htm" class="btn btn-link text-center no-radius col-xs-4">
			  	<span class="text-success"><i class="icon-pencil icon-large"></i></span><br/>修改密码
			  </a>
			</div>
			
			<div class="list-group">
				<c:if test="${sessionScope.LOGINED_USER.state == 1}">
				  <a href="javascript:showQRCode('${sessionScope.LOGINED_USER.userQRCode}')" class="list-group-item">
				    <p class="list-group-item-text"><span class="text-info col-xs-1"><i class="icon-qrcode"></i></span>推广<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
				  </a>
				  <a href="${ctx }/personal/createUser.htm" class="list-group-item">
				    <p class="list-group-item-text"><span class="text-success col-xs-1"><i class="glyphicon glyphicon-plus"></i></span>创建新用户<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
				  </a>
			  </c:if>
			  <c:if test="${sessionScope.LOGINED_USER.state == 0}">
				  <a href="${ctx }/finance/applyDetail.htm?id=${apid}" class="list-group-item">
				    <p class="list-group-item-text"><span class="text-success col-xs-1"><i class="icon-qrcode"></i></span>我的注册申请<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
				  </a>
			  </c:if>
			</div>
			
			<div class="list-group">
			  <a href="${ctx}/personal/myselfMessage.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-info col-xs-1"><i class="icon-envelope-alt"></i></span>私信
			    
			    
				    <span class="pull-right text-muted">
				    	<c:if test="${not empty UNREAD_MSE_PARAM && UNREAD_MSE_PARAM[sessionScope.LOGINED_USER.tel] > 0 }">
					  		<span  style="background-color: #e95420;" class="badge">${UNREAD_MSE_PARAM[sessionScope.LOGINED_USER.tel] }</span> &nbsp;&nbsp;
					  	</c:if>
					    <i class="icon-angle-right"></i>
				    </span>
			    </p>
			  </a>
			  <a href="${ctx}/personal/platformMessage.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-info col-xs-1"><i class="icon-globe"></i></span>平台资讯<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a>
			</div>
			
			<div class="list-group">
			  <a href="javascript:outlogin();" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-danger col-xs-1"><i class="icon-signout"></i></span>退出登录<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a>
			</div>
		</div>
  		<script>
  			function showQRCode(img){
  				$.alertOpen({title:"我的二维码",content:"<img width='200' style='margin:0 auto;' src='"+img+"' />",height:350});
  			}
  		
  			function outlogin(){
  				$.alertConfirm("您确定要退出登录？",function(){
  					top.location="${ctx }/outlogin.htm";
				});
  				
  			}
  		</script>
  </body>
</html>
