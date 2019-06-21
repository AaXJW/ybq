<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
<c:choose>
 	<c:when test="${not empty page && page.totalCount >0}">
 		<c:forEach items="${page.result}" varStatus="vs" var="entity">
	   <p class="text-center time"><fmt:formatDate value="${entity.addTime}" pattern="M/dd HH:mm" /></p>
	 	<a href="javascript:changeReaded('${entity.id}','${ctx}/${entity.url}');">
		  <div class="list-group-item">
		    <h4 class="list-group-item-heading">
		    	<strong>${entity.title}</strong>
			    <c:if test="${entity.state=='0'}">
			    	<span class="badge pull-right" id="noread_${entity.id }">未读</span>
			    </c:if>
		    </h4>
		    <p><small><fmt:formatDate value="${entity.addTime}" pattern="yyyy.MM.dd HH:mm" /></small></p>
		    <p class="list-group-item-text" style="color:#808080">${entity.content}</p>
		  </div>
		  <span class="list-group-item checkDetail">查看详情&nbsp;<i class="icon-angle-right"></i></span>
		</a>		
	</c:forEach>
 	</c:when>
 	<c:otherwise>
	<div class="alert alert-danger alert-dismissible" role="alert">
	  <c:choose><c:when test="${type=='0' }">暂无您的私信消息</c:when><c:otherwise>暂无资讯消息</c:otherwise></c:choose>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
	</div>
</c:otherwise>
 </c:choose>		 

<div class="params">
	<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}" />
	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}" />
 	<input type="hidden" id="orderBy" name="orderBy" value="${page.orderBy}" />
	<input type="hidden" id="order" name="order" value="${page.order}" />
	<input type="hidden" id="totalPages" name="totalPages" value="${page.totalPages}" />
</div>