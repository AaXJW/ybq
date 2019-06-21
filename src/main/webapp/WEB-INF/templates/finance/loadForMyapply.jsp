<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
<c:choose>
	 <c:when test="${not empty page && page.totalCount >0}">
  		<c:forEach items="${page.result}" varStatus="vs" var="entity">	  					
			<div class="list-group">
			  <a href="${ctx}/finance/applyDetail.htm?id=${entity.id}" class="list-group-item">
			    <p class="list-group-item-text">						    
			       <%-- <c:if test="${entity.approvalType==0}">
					   ${entity.smallTitle}申请
				    </c:if>
			        <c:if test="${entity.approvalType==1}">提现申请</c:if>
			        <c:if test="${entity.approvalType==2}">充值申请</c:if>	 --%>	
			        ${entity.smallTitle}申请
			        <c:if test="${entity.approvalType == 1 || entity.approvalType == 2}"><span>${entity.approvalIntegral}分</span> <span class="text-muted"><%-- (折合为 ${entity.approvalMoney} 元) --%></span></c:if>		        
			    	<span class="text-success col-xs-1"><i class="icon-user"></i></span><span class="pull-right text-muted"><fmt:formatDate value="${entity.addTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; <i class="icon-angle-right"></i></span>
			    </p>
			  </a>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="alert alert-warning" role="alert">暂无数据</div>
	</c:otherwise>
</c:choose>  					
<div class="params">
	<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}" />
	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}" />
 	<input type="hidden" id="orderBy" name="orderBy" value="${page.orderBy}" />
	<input type="hidden" id="order" name="order" value="${page.order}" />
	<input type="hidden" id="totalPages" name="totalPages" value="${page.totalPages}" />
</div>