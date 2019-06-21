<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
	<table class="table table-bordered" style="background-color: #fff;">
<c:if test="${page.currentPage ==1}">
  <tr>
  	<td width="20%" class="text-center">类型</td>
  	<td width="20%"  class="text-center ">积分</td>
  	<td width="25%" class="text-center">--</td>
  	<td width="35%" class="text-center">申请时间</td>
  </tr>
  </c:if>
  <c:choose>
  	<c:when test="${not empty page && page.totalCount >0}">
  		<c:forEach items="${page.result}" varStatus="vs" var="entity">
  		  <tr>
		  	<td width="20%" class="text-center"><c:if test="${not empty entity.types}">${entity.types.desc()}</c:if>&nbsp;</td>
		  	<td width="20%" class="text-center" >${entity.integral}</td>
		  	<td width="25%" class="text-center">${entity.amount}</td>
		  	<td width="35%" class="text-center"><fmt:formatDate value="${entity.addTime}" pattern="MM月dd日  HH:mm" /></td>
		  </tr>
  		</c:forEach>
  	</c:when>
  </c:choose>
  </table>  
<div class="params">
	<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}" />
	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}" />
 	<input type="hidden" id="orderBy" name="orderBy" value="${page.orderBy}" />
	<input type="hidden" id="order" name="order" value="${page.order}" />
	<input type="hidden" id="totalPages" name="totalPages" value="${page.totalPages}" />
</div>