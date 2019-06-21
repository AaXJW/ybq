<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
	<table class="table table-bordered" style="background-color: #fff;">
<c:if test="${page.currentPage ==1}">
	<tr>
		<td colspan="4" align="right">共 ${page.totalCount } 个用户，<span class="">已认证(白色)</span>，<span class="text-warning">未认证(橙色)</span></td>
	</tr>
  <tr>
  	<th width="20%" class="text-center">手机</th>
  	<th width="20%"  class="text-center ">姓名</th>
  	<th width="40%" class="text-center">注册时间</th>
  	<th width="15%" class="text-center">操作</th>
  </tr>
  </c:if>
  <c:choose>
  	<c:when test="${not empty page && page.totalCount >0}">
  		<c:forEach items="${page.result}" varStatus="vs" var="entity">
  		  <tr   
  		 	<c:if test="${entity.state == 0}">
  		 		class="warning"
  		 	</c:if>
  		  >
		  	<td width="20%" class="text-center">${entity.tel}</td>
		  	<td width="20%" class="text-center" >${entity.name}</td>
		  	<td width="40%" class="text-center"><fmt:formatDate value="${entity.addTime}" pattern="MM月dd日  HH:mm" /></td>
		  	<td width="15%" class="text-center"><button class="btn btn-primary btn-xs" onclick="resetPsw('${entity.id}');">重置密码</button></td>
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