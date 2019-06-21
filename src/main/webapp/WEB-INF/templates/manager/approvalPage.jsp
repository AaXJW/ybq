<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<c:choose>	
 	<c:when test="${not empty page && page.totalCount >0}">
 		<c:forEach items="${page.result}" var="entity" varStatus="vs">				 			
 			<c:set var="state" scope="session" value="${entity.state}"></c:set>
 			<c:set var="color" scope="page" value="label-primary"></c:set>
 			<c:if test="${entity.approvalType==0}">
 				<c:if test="${entity.smallTitle=='注册'}">
 					<c:set var="color" value="label-primary"></c:set>
 				</c:if>
 				<c:if test="${entity.smallTitle=='复投'}">
 					<c:set var="color" value="label-info"></c:set>
 				</c:if>
 			</c:if>
	        <c:if test="${entity.approvalType==1}"><c:set var="color" value="label-success"></c:set></c:if>
	        <c:if test="${entity.approvalType==2}"><c:set var="color" value="label-warning"></c:set></c:if>
 			<!-- 未审批 -->
 			<c:if test="${'0'==state || '1'==state}">			 				
	 			<li class="list-group-item show not-approved">
				    <p class="list-group-item-heading"><strong>${entity.approvalName}</strong> <span class="pull-right label ${color }">&nbsp;${entity.smallTitle}申请&nbsp;</span></p>
				    <p class="list-group-item-text">
				    	<span>状态：</span><span><c:if test="${'0'==state}">未打款</c:if><c:if test="${'1'==state || entity.approvalType==1}">待审批</c:if></span>
				    	<c:if test="${!empty entity.territoryAreaId }">
				    		"${taMap[entity.territoryAreaId] }区"
				    	</c:if>
				    	<br/>
				    	<span>金额：</span><span>${entity.approvalMoney}</span><br/>
				    	<span>积分：</span><span>${entity.approvalIntegral }</span><br/>								    	
				    	<c:choose>
				    		<c:when test="${entity.approvalType==1}">
				    			<span>收款账号：</span><span><a href="javascript:getReciverInfo('${entity.applyUserId}')">点击查看</a></span><br/>
				    		</c:when>
				    		<c:otherwise>
				    			<span>打款证明：</span><span><a href="javascript:openImg('${entity.voucherUrl}')">点击查看</a></span><br/>
				    		</c:otherwise>
				    	</c:choose>
				    	<span>申请时间：</span><span><fmt:formatDate value="${entity.addTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></span><br/>
				    	<span>打款超时时间：</span><span><fmt:formatDate value="${entity.payOutTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></span><br/>									    	
				    	<span>打款时间：</span><span><c:if test="${'0'==state }">暂无</c:if><c:if test="${'1'==state}"><fmt:formatDate value="${entity.addTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></c:if></span><br/>		
				    	<span>备注：</span><span class="text-muted">${entity.remark }</span><br/>						    	
				    	<c:if test="${entity.approvalType != 1 &&'1'==state}">
					    	<a href="javascript:approve('${entity.id}','${entity.approvalType}',false);" class="btn btn-info btn-sm" target="_self">不通过</a>
							<a href="javascript:approve('${entity.id}','${entity.approvalType}',true);" class="btn btn-info btn-sm" target="_self">通过</a>
				    	</c:if>							    	
				    	<c:if test="${entity.approvalType == 1 && ('0'==state || '1'==state) }">
					    	<a href="javascript:approve('${entity.id}','${entity.approvalType}',false);" class="btn btn-info btn-sm" target="_self">不通过</a>
							<a href="javascript:approve('${entity.id}','${entity.approvalType}',true);" class="btn btn-info btn-sm" target="_self">通过</a>
				    	</c:if>								    
				    </p>
				</li>
 			</c:if>
 			<!-- 已审批 -->
 			<c:if test="${'2'==state || '3'==state}">
 				<li class="list-group-item approved">
				    <p class="list-group-item-heading"><strong>${entity.approvalName}</strong>  <span class="pull-right label ${color }">&nbsp;${entity.smallTitle}申请&nbsp;</span></p>
				    <p class="list-group-item-text">
				    	<span>状态：</span><span><c:if test="${'2'==state}">审批通过</c:if><c:if test="${'3'==state}">审批不通过</c:if></span>
				    	<c:if test="${!empty entity.territoryAreaId }">
				    		"${taMap[entity.territoryAreaId] }区"
				    	</c:if>
				    	<br/>
				    	<span>金额：</span><span>${entity.approvalMoney}</span><br/>
				    	<span>积分：</span><span>${entity.approvalIntegral }</span><br/>
				    	<c:choose>
				    		<c:when test="${entity.approvalType==1}">
				    			<span>收款账号：</span><span><a href="javascript:getReciverInfo('${entity.applyUserId}')">点击查看</a></span><br/>
				    		</c:when>
				    		<c:otherwise>
				    			<span>打款证明：</span><span><a href="javascript:openImg('${entity.voucherUrl}')">点击查看</a></span><br/>
				    		</c:otherwise>
				    	</c:choose>
				    	<span>申请时间：</span><span><fmt:formatDate value="${entity.addTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></span><br/>								    	
				    	<span>打款时间：</span><span><fmt:formatDate value="${entity.payTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></span><br/>								    								    							    									    
				    	<span>打款超时时间：</span><span><fmt:formatDate value="${entity.payOutTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></span><br/>	
				    	<span>审批时间：</span><span><fmt:formatDate value="${entity.approvalTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></span><br/>
				    	<span>备注：</span><span class="text-muted">${entity.remark }</span><br/>	
				    </p>
				</li>
 			</c:if>
 		</c:forEach>
 	</c:when>	
 	<c:otherwise>
 		<!-- 暂无数据 -->
 	</c:otherwise>	 				  
 </c:choose>
 
<div class="params">
	<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}" />
	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}" />
 	<input type="hidden" id="orderBy" name="orderBy" value="${page.orderBy}" />
	<input type="hidden" id="order" name="order" value="${page.order}" />
	<input type="hidden" id="totalPages" name="totalPages" value="${page.totalPages}" />
</div>