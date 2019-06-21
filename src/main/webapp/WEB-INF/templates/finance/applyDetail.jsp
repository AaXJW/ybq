<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>申请详情</title>
    <backurl>${ctx }/finance/myapply.htm</backurl>
    <%@ include file="/WEB-INF/jsp/upload_depends.jsp" %>
    <style type="text/css">
    	.form-control[disabled]{background-color: #ED8C6A !important;}
    </style>
  </head>
  
  <body class="no-skin">		 
	  	<div class="container-fluid inner-menu">	  		
			<form action="${ctx}/finance/saveVoucherUrl.htm" method="post">
				<input type="hidden" name="id" value="${entity.id}">
				<ul class="list-group">
				  <li class="list-group-item">
				    <p class="list-group-item-text">编号：<span class="pull-right">${entity.approvalCode}</span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">状态：<span class="pull-right">${stateMc}</span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">类型：
				    <span class="pull-right">${entity.smallTitle}</span> 
				    </p>
				  </li>
				  <c:if test="${entity.approvalType == 1 || entity.approvalType == 2}">
				  <li class="list-group-item">
				    <p class="list-group-item-text">积分：
				    <span class="pull-right">${entity.approvalIntegral}分</span> <span class="text-muted" style="float: right;">(折合为 ${entity.approvalMoney} 元)</span>
				    </p>
				  </li>
				  </c:if>
				  <%--<c:choose>
					  <c:when test="${power}">				  
						  <li class="list-group-item">
						    <p class="list-group-item-text">操作：
						    <a href="javascript:approve('${entity.id}')" class="btn btn-primary btn-sm pull-right">已打款</a></p>
						  </li>
					  </c:when>
				  </c:choose>
				  --%><li class="list-group-item">
				    <p class="list-group-item-text">申请时间：<span class="pull-right"><fmt:formatDate value="${entity.addTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; </span></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">打款时间：<span class="pull-right"><fmt:formatDate value="${entity.payTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; </span>
				    <c:if test="${entity.approvalType!='1'}">
				    	<a href="javascript:openPayInfo();" class="btn btn-success btn-sm pull-right">收款信息</a>
				    </c:if></p>
				  </li>
				  <li class="list-group-item">
				    <p class="list-group-item-text">审核时间：<span class="pull-right"><fmt:formatDate value="${entity.approvalTime}" pattern="MM月dd日  HH:mm" />&nbsp;&nbsp; </span></p>
				  </li>
				  <li class="list-group-item">
				  <c:if test="${entity.state=='3'}">
					    <p class="list-group-item-text text-danger">您的该申请未通过平台审核<span class="pull-right">&nbsp;&nbsp;</span><a class="btn btn-primary btn-sm pull-right" href="${ctx }/finance/reApply.htm?id=${entity.id}">重新申请</a></p>
			  		</c:if>
			  		<c:if test="${entity.state=='2'}">
					    <p class="list-group-item-text text-success">您的该申请已经审核通过</p>
			  		</c:if>
			  		<c:if test="${entity.state=='1' && entity.approvalType!='1'}">
					    <p class="list-group-item-text text-warning">如果您已操作真实打款，请耐心等待管理员审核</p>
			  		</c:if>
			  		<c:if test="${entity.state=='0' && entity.approvalType!='1'}">
					    <p class="list-group-item-text text-danger">请在<fmt:formatDate value="${entity.payOutTime}" pattern="MM月dd日  HH:mm" />前打款，否则此次申请自动取消</p>
			  		</c:if>
				  </li>
				  
				  <c:if test="${entity.approvalType!='1'}">
					  <li class="list-group-item" id="voucherUrlImgCT">
					    <p class="list-group-item-text text-center">
					    	<span class="text-left pull-left">打款凭证：</span>
					    	<c:set var="voucherUrl" value="${ctx }/static/images/noimg.jpg"></c:set>
					    	<c:if test="${not empty entity.voucherUrl && entity.voucherUrl != ''}">
					    		<c:set var="voucherUrl" value="${entity.voucherUrl}"></c:set>
					    	</c:if>
					    	<!-- <a href="javascript:openFileDialog();"> -->
					    		
					    		<img width="300" id="voucherUrlImg" src="${voucherUrl}" class="" style="margin-right: 5px;cursor: pointer;" accept="image/gif,image.jpg" />
								<input type="hidden" name="voucherUrl" id="voucherUrl" value="${entity.voucherUrl}" class="imgUrl" required data-bv-notempty-message="凭证必须上传" />
						    	<c:if test="${entity.state!='3' && entity.state!='2' }"><br/><span class="text-muted">点击图片重新上传</span></c:if>
					    	<!-- </a> -->
					    	<input type="file" name="voucherUrlFile" id="voucherUrlFile" maxlength="255" placeholder="这里上传凭证" title="凭证" style="width:98%;display: none;" keepDefaultStyle = "true"/>
					    </p>
					  </li>
				  </c:if>
				</ul>
				
				<c:if test="${entity.approvalType!='1' && entity.state!='3' && entity.state!='2'}">
			    	<div class="col-xs-12">
						<button id="voucherBtn" class="btn btn-primary form-control" type="submit" <c:if test="${not empty voucherUrl}">disabled="disabled"</c:if>>
						<c:choose>
							<c:when test="${not empty entity.voucherUrl}">已上传</c:when>
							<c:otherwise>确认上传</c:otherwise>
						</c:choose>
						</button>
					</div>
			    </c:if>
				<c:choose>
			  		<c:when test="${power}">		
						<div class="col-xs-12" style="margin-top:10px;">
							<a class="btn btn-primary form-control" href="javascript:approve('${entity.id}')" >已打款</a>
						</div>
					</c:when>
				</c:choose>	
			</form>
		</div>
		
		<div id="payInfoCT" style="display: none;">
			<ul class="list-group">
			  <li class="list-group-item">
			    <p class="list-group-item-text text-danger">请充值到公司对公账户</p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">账户名：<span class="pull-right">${SYSTEM_PARAM.userReceivable }</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">账号：<span class="pull-right">${SYSTEM_PARAM.accountReceivable }</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">银行：<span class="pull-right">${SYSTEM_PARAM.bankReceivable }</span></p>
			  </li>
			  <li class="list-group-item">
			    <p class="list-group-item-text">支行：<span class="pull-right">${SYSTEM_PARAM.brbankReceivable }</span></p>
			  </li>
			</ul>
		
		</div>
		
		
		<script>
			$(function(){
				<c:if test="${entity.state!='3' && entity.state!='2' }">
					$("#voucherUrlImg").click(function(){
						openFileDialog();
					});
				</c:if>
				$("#voucherUrlFile").localLoadImage(function(imgData){
					$("#voucherUrl").val(imgData);
					$("#voucherUrlImg").attr("src",imgData);
					$("#voucherBtn").removeAttr("disabled").text("确认上传");
				});
			});
			
			
			function openFileDialog(){
				$("#voucherUrlFile").click();
			}
			
			function openPayInfo(){
				$.alertOpen({content:$("#payInfoCT").html(),title:"平台收款信息",height:420});
			}
			
			function approve(id){
				//${ctx}/finance/payApproval.htm?id=
				$.alertConfirm("您确定已经成功打款转账？",function(){
					top.location="${ctx}/finance/payApproval.htm?id="+id;
				});
			}
		</script>
  </body>
</html>
