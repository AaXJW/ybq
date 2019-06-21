<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>${typeE }</title>   
  	<style>
	  	.form-content{
	  		padding:0px 10px;
		}
  	 		
  		.finance-detail{
  			width:100%;
  			padding:0px 10px;
  			margin-top:20px;
  		}
  	</style>
  	
  	<script>

		$(function(){
			$("#type").val(${type}).change(function(){
				$("#export").val(false);
				$(".form-inline").submit();
			});
		})
		
		function exports(){
			$("#export").val(true);
			$(".form-inline").submit();
		}
  	</script>
  </head>
  
  <body class="no-skin">
		 
	  	<div class="container-fluid inner-menu outer">
	  		<div class="form-content" style="padding-top: 60px;padding-bottom: 10px;"> 
	  			<div class="row">
		  			<div class="container-fluid">	  				
						<form class="form-inline" action="${ctx}/manager/currentMonthData.htm" method="post">
							<div class="form-group">
								<div id="datepicker" class="input-group">							
									当月 <select name="type" id="type">
										<option value="1">团购奖励</option>
										<option value="2">推荐奖励</option>
										<option value="3">抢单奖励</option>
										<option value="4">提现积分</option>
										<option value="5">注册/复投资金</option>
										<option value="6">团购成功</option>
										<option value="7">注册用户</option>
										<option value="8">复投用户</option>
									</select> ${numb } ${unit } &nbsp;&nbsp;&nbsp;${tiao }条数据
									&nbsp;&nbsp;
									<input type="hidden" name="export" id="export" value="false" />
									<button type="button" class="btn btn-success" onclick="exports()"> 导出</button>
								</div>
							</div>
						</form>	  				
		  			</div>
		  		</div>
	  		</div>
	  	
		  	<div class="finance-detail row inner">					
				<div id="pages" class="table-responsive">
					<table class="table table-bordered" style="background-color: #fff;">
				  		<c:if test="${type >=1 && type <=6 }">
				  			<tr>
							  	<td width="5%" class="text-center">No.</td>
							  	<td width="20%"  class="text-center">积分</td>
							  	<td width="40%" class="text-center">用户</td>
							  	<td width="35%" class="text-center">时间</td>
							  </tr>
							  <c:forEach items="${funds}" varStatus="vs" var="entity">
							  	<tr>
								  	<td class="text-center">${vs.index+ 1}</td>
								  	<td class="text-center">${entity.integral}</td>
								  	<td class="text-center">${entity.userName}(${entity.userTel})</td>
								  	<td class="text-center"><fmt:formatDate value="${entity.addTime}" pattern="MM月dd日  HH:mm" /></td>
								  </tr>
							  </c:forEach>
				  		</c:if>		
				  		<c:if test="${type >6 }">
				  			<tr>
							  	<td class="text-center">No.</td>
							  	<td class="text-center">用户</td>
							  	<c:if test="${type == 7 }">
							  		<td class="text-center">推荐人</td>
							  	</c:if>
							  	<td class="text-center">时间</td>
							  </tr>
							  <c:forEach items="${members}" varStatus="vs" var="entity">
							  	<tr>
								  	<td class="text-center">${vs.index + 1}</td>
								  	<td class="text-center">${entity.name}(${entity.tel})
								  		
								  		<c:if test="${type != 7 }">
									  		<c:if test="${not empty entity.remark }">
									  			${entity.remark }
									  		</c:if>
								  		</c:if>
								  	</td>
								  	<c:if test="${type == 7 }">
								  		<td class="text-center">${entity.recommenderName}(${entity.recommendertel})</td>
								  		<td class="text-center"><fmt:formatDate value="${entity.addTime}" pattern="MM月dd日  HH:mm" /></td>
								  	</c:if>
								  	<c:if test="${type == 8 }">
								  		<td class="text-center"><fmt:formatDate value="${entity.modifyTime}" pattern="MM月dd日  HH:mm" /></td>
								  	</c:if>
								  </tr>
							  </c:forEach>
				  		</c:if>		  
				  	</table>
			 	</div>
		 	</div>
	 	</div>
	 	<script type="text/javascript">
		</script>
  </body>
</html>
