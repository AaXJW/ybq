<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title></title>
    <script type='text/javascript' src='${ctx }/dwr/interface/MSGAccess.js'></script>
  </head>
  
  <body class="no-skin">
  	<!-- 轮播图 -->
  	<div class="container-fluid banner">  	
  		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="${ctx}/static/images/1.jpg" width="100%" style="height:208px;">
		    </div>
		    <div class="item">
		      <img src="${ctx}/static/images/2.jpg" width="100%" style="height:208px;">
		    </div>
		    <div class="item">
		      <img src="${ctx}/static/images/3.jpg" width="100%" style="height:208px;">
		    </div>
		  </div>		
		</div>				
  	 	<!-- 快捷菜单 -->
  	 	<div class="container-fluid inner-menu">
			<div class="btn-group no-radius clearfix" role="group">
			  <a href="${ctx}/team/recomendTree.htm" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-info"><i class="icon-group icon-large"></i></span><br/><span class="normalWord">推荐关系图</span>
			  </a>
			  <a href="javascript:openTerritory();" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-warning"><i class="icon-sitemap icon-large"></i></span><br/><span class="normalWord">团购网络图</span>
			  </a>
			  <a <%-- href="${ctx}/finance/recharge.htm" --%> href="${ctx }/deploing.htm" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-warning"><i class="icon-plus-sign icon-large"></i></span><br/><span class="normalWord">充值</span>
			  </a>
			  <a href="javascript:showQRCode('${sessionScope.LOGINED_USER.userQRCode}')" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-success"><i class="icon-pencil icon-large"></i></span><br/><span class="normalWord">推广</span>			  		
			  </a>
			  <a href="${ctx}/finance/cashApply.htm" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-danger"><i class="icon-money icon-large"></i></span><br/><span class="normalWord">申请提现</span>
			  </a>
			  <a href="${ctx}/finance/detail.htm" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-warning"><i class="icon-list-alt icon-large"></i></span><br/><span class="normalWord">财务明细</span>
			  </a>
			  <a href="${ctx}/team/competeArea.htm" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-primary"><i class="icon-road icon-large"></i></span><br/><span class="normalWord">抢位区</span>
			  </a>
			  <a href="${ctx}/personal/profile.htm" class="btn btn-link text-center no-radius col-xs-3">
			  	<span class="text-info"><i class="icon-sitemap icon-large"></i></span><br/><span class="normalWord">个人资料</span>			  		
			  </a>
		</div>
		<div class="row box-group">
			<div class="item-box col-xs-12" style="height: auto;">
				<div class="title">
					<span class="col-xs-8 text-danger"><i class="icon-comments-alt icon-large"></i>&nbsp;&nbsp;<span class="normalWord">最近消息</span></span>
					<a href="${ctx}/personal/myselfMessage.htm" class="pull-right">更多>>&nbsp;</a>
				</div>				
				<div class="list-group">
		  	  	<c:choose>
				  	<c:when test="${not empty lists }">
				  		<c:forEach items="${lists}" varStatus="vs" var="entity">
						  <c:if test="${entity.mtype=='0'}"><a href="javascript:changeReaded('${entity.id}','${ctx}/${entity.url}');"></c:if>
							  <div class="list-group-item message-item">
							    <h4 class="list-group-item-heading">
							    	<strong>${entity.title}</strong>
							    	<small><fmt:formatDate value="${entity.addTime}" pattern="yyyy.MM.dd HH:mm" /></small>
								    <%-- <c:if test="${entity.state=='0'}">
								    	<span class="badge pull-right" id="noread_${entity.id }">未读</span>
								    </c:if> --%>
							    </h4>
							    <p class="list-group-item-text" style="color:#808080">${entity.content}</p>
							  </div>
							  <!-- <span class="list-group-item checkDetail">查看详情&nbsp;<i class="icon-angle-right"></i></span> -->
						  <c:if test="${entity.mtype=='0'}"></a></c:if>				
						</c:forEach>
				  	</c:when>
				  	<c:otherwise>
						<div class="alert alert-danger alert-dismissible" role="alert">
						  <c:choose><c:when test="${type=='0' }">暂无您的私信消息</c:when><c:otherwise>暂无资讯消息</c:otherwise></c:choose>
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
						</div>
					</c:otherwise>
				  </c:choose>		 
				</div> 						
			</div>
		</div>
		
  	 	<div class="row box-group">
  	 		<a href="${ctx }/finance/detail.htm">
				<div class="item-box col-xs-12">
					<div class="title">
						<span class="col-xs-8 text-primary"><i class="icon-magnet icon-large"></i>&nbsp;&nbsp;<span class="normalWord">总积分</span></span>
						<span class="label label-primary pull-right" style="margin-top:2px;">积分</span>
					</div>
					<div class="content">
						<h1 style="margin:0 !important;">${totalAssets}<i class="icon-magnet  pull-right" style="color: #eee"></i></h1>
						<small>总收入</small>
					</div>
				</div>
			</a>
			<%-- <div class="item-box col-xs-12">
				<div class="title">
					<span class="col-xs-8 text-primary"><i class="icon-random icon-large"></i>&nbsp;&nbsp;<span class="normalWord">抢单积分</span></span>
					<span class="label label-primary pull-right" style="margin-top:2px;">积分</span>
				</div>
				<div class="content">
					<h1 style="margin:0 !important;">${balance}<i class="icon-random  pull-right" style="color: #eee"></i></h1>
					<small>可抢单积分</small>
				</div>
			</div> --%>
			<%-- <a href="">
				<div class="item-box col-xs-12">
					<div class="title">
						<span class="col-xs-8 text-primary"><i class="icon-gift icon-large"></i>&nbsp;&nbsp;<span class="normalWord">奖励积分</span></span>
						<span class="label label-primary pull-right" style="margin-top:2px;">积分</span>
					</div>
					<div class="content">
						<h1 style="margin:0 !important;">${bonus}<i class="icon-gift  pull-right" style="color: #eee"></i></h1>
						<small>总奖励积分</small>
					</div>
				</div>
			</a> --%>
			<a href="${ctx }/finance/detail.htm">
			<div class="item-box col-xs-12">
				<div class="title">
					<span class="col-xs-8 text-warning"><i class="icon-money icon-large"></i>&nbsp;&nbsp;<span class="normalWord">总提现</span></span>
					<span class="label label-warning pull-right" style="margin-top:2px;">金额</span>
				</div>
				<div class="content">
					<h1 style="margin:0 !important;">${sumcashMoney}<i class="icon-money  pull-right" style="color: #eee"></i></h1>
					<small>已提现</small>
				</div>
			</div>
			</a>
			
			<a href="${ctx }/team/recomendTree.htm">
			<div class="item-box col-xs-12">
				<div class="title">
					<span class="col-xs-8 text-success"><i class="icon-sitemap icon-large"></i>&nbsp;&nbsp;<span class="normalWord">推荐用户</span></span>
					<span class="label label-success pull-right" style="margin-top:2px;">人数</span>
				</div>
				<div class="content">
					<h1 style="margin:0 !important;">${recommendCount }<i class="icon-sitemap  pull-right" style="color: #eee"></i></h1>
					<small>人数</small>
				</div>
			</div>
			</a>
			<div class="item-box col-xs-12">
				<div class="title">
					<span class="col-xs-8 text-danger"><i class="icon-exchange icon-large"></i>&nbsp;&nbsp;<span class="normalWord">积分兑换率</span></span>
					<span class="label label-danger pull-right" style="margin-top:2px;">百分比</span>
				</div>
				<div class="content">
					<h1 style="margin:0 !important;">${SYSTEM_PARAM.conversionRate }<i class="icon-exchange  pull-right" style="color: #eee"></i></h1>
					<small>百分比</small>
				</div>
			</div>
		</div>

	</div>
	<script>
		$(function(){
			$(".navbar").css("margin-bottom","0");			
		})
		function showQRCode(img){
  				$.alertOpen({title:"我的二维码",content:"<img width='200' style='margin:0 auto;' src='"+img+"' />",height:350});
  			}
		function changeReaded(id,url){
			$.blockUI();
			MSGAccess.readed(id,function(){
				top.location=url;
			});
		}
		
		function openTerritory(){
  			var ul=$('<div class="list-group"></div>');
			
			<c:forEach items="${sessionScope.territoryAreas}" varStatus="vs" var="entity">
				ul.append(buildLi("${entity.id}","${entity.areaName}","${entity.logoIcon}"));
			</c:forEach>
			
			$.alertOpen({content:ul,title:"请选择团购区",height:360});
  		}
  		
  		function buildLi(id,info,icon){
		    	var li=$('<a href="${ctx }/team/territory.htm?territoryAreaId='+id+'" class="list-group-item"><i class="'+icon+'"></i>'+info+'</span></a>');
		    	return li;
	    }
	</script>	 	
  </body>
</html>
