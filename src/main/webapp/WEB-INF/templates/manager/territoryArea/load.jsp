<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
<c:choose>
  	<c:when test="${not empty page && page.totalCount >0}">
  		<c:forEach items="${page.result}" varStatus="vs" var="entity">
 				<tr>
 					<td>
 						<p>名称：<i class="${entity.logoIcon}"></i> ${entity.areaName}</p>
 						<p>门槛：${entity.sillAmount}，${entity.areaLevel}级</p>
 					</td>
			    	<td>
			    		<p>
			    			状态：<c:choose>
			    				<c:when test="${entity.state }">
			    					已启用
			    				</c:when>
			    				<c:otherwise>
			    					未启用
			    				</c:otherwise>
			    			</c:choose>
			    		</p>
			    		<p>创建时间：<fmt:formatDate value="${entity.addTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></p>
			    	</td>
			    	<td align="right">
			    		<a class="btn btn-info btn-sm" href="${ctx}/manager/territoryArea/edit.htm?id=${entity.id}">编辑</a>
			    		<br>
			    		<c:if test="${!entity.defaults }">
			    			<a class="btn btn-success btn-sm" href="${ctx}/manager/territoryArea/default.htm?id=${entity.id}">设置默认</a>
			    		</c:if>
			    		
			    		<c:if test="${entity.defaults }">
			    			<span class="text-muted">默认</span>
			    		</c:if>
			    	</td>
			    </tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td>
				<div class="alert alert-danger alert-dismissible" role="alert">
				  查询无相关数据
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
				</div>
			</td>
		</tr>
	</c:otherwise>
</c:choose>	

	<tr class="params">
		<td colspan="3">
			<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}" />
			<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}" />
		 	<input type="hidden" id="orderBy" name="orderBy" value="${page.orderBy}" />
			<input type="hidden" id="order" name="order" value="${page.order}" />
			<input type="hidden" id="totalPages" name="totalPages" value="${page.totalPages}" />
		</td>
    </tr>