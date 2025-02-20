<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
<c:choose>
  	<c:when test="${not empty page && page.totalCount >0}">
  		<c:forEach items="${page.result}" varStatus="vs" var="entity">
 				<div class="panel-group" id="accordion${vs.index}">
			  	<div class="panel panel-default">
				  <div class="row panel-heading">
					  	<a data-toggle="collapse" data-parent="#accordion${vs.index}" href="#panelbody${vs.index}"onclick="changeSpanCss('showhid','caret','caretUp')">
						    <p class="panel-title">主题：${entity.title }</p>								    
						    <i id="showhid" class="pull-right caret"></i>			  	
					  	</a>
				  </div>
				  <div id="panelbody${vs.index}" class="panel-collapse collapse">
				  <div class="panel-body">
				    <div class="row col-xs-12">
				    	<p><small>发送时间：<fmt:formatDate value="${entity.addTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></small></p>
				    	<p><small>发送人：${entity.sender}</small></p>
				    	<p><small>接收人：<c:choose><c:when test="${entity.mtype=='0' }">${entity.reciver}</c:when><c:otherwise>所有用户</c:otherwise></c:choose></small></p>
				    	<p class="content"><small>内容：${entity.content}</small></p>
				    </div>
				  </div>
				  </div>
				</div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="alert alert-danger alert-dismissible" role="alert">
		  查询无相关数据
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