<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>团队管理</title>
    <backurl>${ctx }/team/index.htm</backurl>
    <style>
    	
    </style>
    
  </head>
  
  <body class="no-skin">
  		<div class="list-group">
		  <a href="javascript:void(0);" class="list-group-item">
		  	<c:set var="tericon" value="icon-user" ></c:set>
		  	<c:if test="${terr.state == 0}"><c:set var="tericon" value=" icon-circle-blank" ></c:set></c:if>
		  	<c:if test="${terr.state == 1}"><c:set var="tericon" value="icon-star-half" ></c:set></c:if>
		  	<c:if test="${terr.state == 2}"><c:set var="tericon" value="icon-star-empty" ></c:set></c:if>
		  	<c:if test="${terr.state == 3}"><c:set var="tericon" value="icon-star" ></c:set></c:if>
		  	<c:if test="${terr.state == 4}"><c:set var="tericon" value="icon-circle" ></c:set></c:if>
		    <div class="list-group-item-heading h4"><i class="${tericon } icon-large"></i>&nbsp;&nbsp;&nbsp;
		    
		    	<c:if test="${not empty terr.territoryName}">${terr.territoryName}</c:if>
		    	<c:if test="${empty terr.territoryName}">游民</c:if>
		    	<small>(${sessionScope.LOGINED_USER.tel})</small> 
		    	<c:if test="${not empty sessionScope.LOGINED_USER.territoryAreaLevelName }">
					<small>当前团购级别</small> <span class="text-danger">${sessionScope.LOGINED_USER.territoryAreaLevelName }</span>
			</c:if>
		    </div>
		    	<c:if test="${sessionScope.LOGINED_USER.territoryState == 1}">
		    		<c:if test="${sessionScope.LOGINED_USER.territoryCount == 1}">
			    		正在进行第${sessionScope.LOGINED_USER.territoryCount}次团购
			    	</c:if>
		    	</c:if>
		    	
		    	<c:if test="${sessionScope.LOGINED_USER.territoryState == 2}">
		    		已经完成${sessionScope.LOGINED_USER.territoryCount}次团购
		    		<c:if test="${sessionScope.LOGINED_USER.territoryCount > 0}">
		    		,上一次团购于<fmt:formatDate value="${sessionScope.LOGINED_USER.lastTerritoryTime}" pattern="yyyy-MM-dd  HH:mm:ss" />团购成功
		    		</c:if>
		    	</c:if>
		    	
		    	<c:if test="${sessionScope.LOGINED_USER.territoryState == 3}">
		    		正在进行第${sessionScope.LOGINED_USER.territoryCount}次团购
		    	</c:if>
		    
		  </a>
		  <%--<a href="javascript:void(0);" class="list-group-item">
		    <p class="list-group-item-text">本轮不在组内，总推荐10人</p>
		  </a>
		--%></div>
		
		<div class="container-fluid inner-menu">
			<div class="list-group">
				<c:if test="${sessionScope.LOGINED_USER.territoryState == 1 || sessionScope.LOGINED_USER.territoryState == 3}">
				  <a href="javascript:;" class="list-group-item">
				    <p class="list-group-item-text"><span class="text-success col-xs-1"><i class="icon-map-marker"></i></span>本轮已经推荐<strong class="text-info">${terr.recommendCount }</strong>人,团购奖励<strong class="text-warning">${terr.seatPrice }</strong>积分</p>
				  </a>
			  </c:if>
			  <a href="${ctx}/team/recomendTree.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-success col-xs-1"><i class="icon-group"></i></span>推荐关系图<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a>
			  <%-- <a href="${ctx }/team/territory.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-primary col-xs-1"><i class="icon-sitemap"></i></span>团购网络图<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
			  </a> --%>
			  <c:forEach items="${terLevels}" varStatus="vs" var="entity">
			  	<a href="${ctx }/team/territory.htm?territoryAreaId=${entity.id}" class="list-group-item">
				    <p class="list-group-item-text"><span class="text-primary col-xs-1"><i class="icon-sitemap"></i></span>${entity.areaName}网络图<span class="pull-right text-success"><i class="${entity.logoIcon}"></i></span></p>
				  </a>
			  </c:forEach>
			  
			  
			  <a href="${ctx}/team/competeArea.htm" class="list-group-item">
			    <p class="list-group-item-text"><span class="text-danger col-xs-1"><i class="icon-road"></i></span>抢位区<span class="pull-right text-muted"><c:if test="${competeSiteCount > 0 }"><span class="badge" style="background-color: #e95420;">${competeSiteCount }</span> &nbsp;&nbsp;</c:if> <i class="icon-angle-right"></i></span></p>
			  </a>
			  <c:if test="${empty terr && hasTerr==0}">
				  <!-- <a href="javascript:recast();" class="list-group-item">
				    <p class="list-group-item-text"><span class="text-info col-xs-1"><i class="icon-retweet"></i></span>复投<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
				  </a> -->
				  <c:forEach items="${tareas}" varStatus="vs" var="entity">
				  	  <a href="javascript:recast(${entity.id});" class="list-group-item">
					    <p class="list-group-item-text"><span class="text-info col-xs-1"><i class="icon-retweet"></i></span>复投${entity.areaName}区<span class="pull-right text-danger"><i class="${entity.logoIcon}"></i></span></p>
					  </a>
				  </c:forEach>
				  
				  <a href="javascript:buyCar();" class="list-group-item">
					    <p class="list-group-item-text"><span class="text-info col-xs-1"><i class="icon-truck"></i></span>申请购车<span class="pull-right text-muted"><i class="icon-angle-right"></i></span></p>
					  </a>
			  </c:if>
			</div>
		</div>
		<script type="text/javascript">
			function recast(areaId){
				$.alertConfirm("您确定要进行复投？此操作不可撤销",function(){
					$.blockUI();
					top.location="${ctx }/team/reCast.htm?territoryAreaId="+areaId;
				});
			}
			
			function buyCar(){
				$.alertConfirm("购车申请通过审核后你的团购等级和积分将回到初始状态，您确定要进行购车申请？",function(){
					$.blockUI();
					top.location="${ctx }/team/buycar.htm";
				},null,{"height":300});
			}
		</script>
  </body>
</html>
