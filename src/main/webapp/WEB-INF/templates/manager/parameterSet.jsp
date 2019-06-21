<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>系统参数设置</title>
    
    <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	
	<link href="${ctx}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  </head>
  
  <body class="no-skin">
  		
  		<form action="${ctx}/manager/saveParameter.htm" method="post" name="inputForm" id="inputForm" 
			data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
		    <input type="hidden" name="id" value="${entity.id}" />
			  	<ul class="list-group">
			  		<li class="list-group-item">
			  			<h5 class="list-group-item-heading text-muted"> 财务配置：</h5>
			  			<div class="container-form">
			  				<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">收款账号</span>
								  	<input type="text" class="form-control" id="accountReceivable" name="accountReceivable" placeholder="请输入收款账号" value="${entity.accountReceivable}"
										required data-bv-notempty-message="收款账号不能为空" aria-describedby="basic-addon1">
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">收款人姓名</span>
								  	<input type="text" class="form-control" id="userReceivable" name="userReceivable" placeholder="请输入收款人姓名" value="${entity.userReceivable}"
										required data-bv-notempty-message="收款人姓名不能为空" aria-describedby="basic-addon1">
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">收款银行</span>
								  	<input type="text" class="form-control" id="bankReceivable" name="bankReceivable" placeholder="请输入收款银行" value="${entity.bankReceivable}"
										required data-bv-notempty-message="收款银行不能为空" aria-describedby="basic-addon1">
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">收款支银行</span>
								  	<input type="text" class="form-control" id="brbankReceivable" name="brbankReceivable" placeholder="请输入收款支银行" value="${entity.brbankReceivable}"
								  	required data-bv-notempty-message="收款支银行不能为空" aria-describedby="basic-addon1">
								</div>
				  			</div>
				  			
				  			
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">团购成功一等奖</span>
								  	<input type="text" class="form-control" id="outAllAward" name="outAllAward" placeholder="请输入团购成功一等奖积分" value="${entity.outAllAward}"
								  	required data-bv-notempty-message="团购成功一等奖不能为空" aria-describedby="basic-addon1">
								  	<span class="input-group-addon" id="basic-addon1">分</span>
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">团购成功二等奖</span>
								  	<input type="text" class="form-control" id="outSecAward" name="outSecAward" placeholder="请输入团购成功二等奖积分" value="${entity.outSecAward}"
								  	required data-bv-notempty-message="团购成功二等奖不能为空" aria-describedby="basic-addon1">
								  	<span class="input-group-addon" id="basic-addon1">分</span>
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">团购成功二等奖</span>
								  	<input type="text" class="form-control" id="outThrAward" name="outThrAward" placeholder="请输入团购成功二等奖积分" value="${entity.outThrAward}"
								  	required data-bv-notempty-message="团购成功二等奖不能为空" aria-describedby="basic-addon1">
								  	<span class="input-group-addon" id="basic-addon1">分</span>
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">推荐奖金</span>
								  	<input type="text" class="form-control" id="recomendAward" name="recomendAward" placeholder="请输入推荐奖金" value="${entity.recomendAward}"
								  	required data-bv-notempty-message="推荐奖金不能为空" aria-describedby="basic-addon1">
								  	<span class="input-group-addon" id="basic-addon1">分</span>
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">抢单奖励积分</span>
								  	<input type="text" class="form-control" id="grabOrderPrice" name="grabOrderPrice" placeholder="请输入抢单奖励积分" value="${entity.grabOrderPrice}"
								  	required data-bv-notempty-message="抢单金额不能为空" aria-describedby="basic-addon1">
								  	<span class="input-group-addon" id="basic-addon1">分</span>
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">抢单所需金额</span>
								  	<input type="text" class="form-control" id="competePrice" name="competePrice" placeholder="请输入抢单所需金额" value="${entity.competePrice}"
								  	required data-bv-notempty-message="抢单所需金额不能为空" aria-describedby="basic-addon1">
								  	<span class="input-group-addon" id="basic-addon1">元</span>
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">积分转换率</span>
								  	<input type="text" class="form-control" id="conversionRate" name="conversionRate" placeholder="请输入积分转换率" value="${entity.conversionRate}"
								  	required data-bv-notempty-message="积分转换率不能为空" aria-describedby="basic-addon1">
								  	<span class="input-group-addon" id="basic-addon1">%</span>
								</div>
				  			</div>
			  			</div>
			  		</li>
			  		
			  		<li class="list-group-item">
			  			<h5 class="list-group-item-heading text-muted"> 业务配置：</h5>
			  			<div class="container-form">
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">首层称谓</span>
								  	<input type="text" class="form-control" id="territoryTopName" name="territoryTopName" placeholder="请输入版图顶点名称" value="${entity.territoryTopName}" aria-describedby="basic-addon1"
											required data-bv-notempty-message="首层称谓不能为空">
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">二层称谓</span>
								  	<input type="text" class="form-control" id="territorySecondName" name="territorySecondName" placeholder="请输入版图二级名称" value="${entity.territorySecondName}" aria-describedby="basic-addon1"
											required data-bv-notempty-message="二层称谓不能为空">
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">三层称谓</span>
								  	<input type="text" class="form-control" id="territoryThirdName" name="territoryThirdName" placeholder="请输入版图三级名称" value="${entity.territoryThirdName}" aria-describedby="basic-addon1"
											required data-bv-notempty-message="三层称谓不能为空">
								</div>
				  			</div>
				  			
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">单区最大层</span>
								  	<input type="text" class="form-control" id="areaMaxLevel" name="areaMaxLevel" placeholder="请输入单区最大层" value="${entity.areaMaxLevel}" aria-describedby="basic-addon1"
											required data-bv-notempty-message="单区最大层不能为空">
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">复投周期</span>
								  	<input type="text" class="form-control" id="reCastCycle" name="reCastCycle" placeholder="请输入复投周期" value="${entity.reCastCycle}" aria-describedby="basic-addon1"
											required data-bv-notempty-message="复投周期不能为空">
									<span class="input-group-addon" id="basic-addon1">天</span>
								</div>
				  			</div>
				  			
				  			<div class="row form-group">
				  				<div class="input-group">
				  					<span class="input-group-addon" id="basic-addon1">打款超时</span>
								  	<input type="text" class="form-control" id="payTimeOutValue" name="payTimeOutValue" placeholder="请输入打款超时" value="${entity.payTimeOutValue}" aria-describedby="basic-addon1"
											required data-bv-notempty-message="打款超时不能为空">
									<span class="input-group-addon" id="basic-addon1">小时</span>
								</div>
				  			</div>
				  			
						</div>
						<div class="panel-group" id="accordion" style="margin: auto -5px;" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      <h4 class="panel-title">
						        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          	用户等级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="pull-right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-usd"></i></span>
						        </a>
						      </h4>
						    </div>
						    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						      <div class="panel-body" style="padding: 5px;">
						        <table class="table table-striped">
								  <thead>
								  	<tr>
								  		<th>#</th>
								  		<th>等级名称</th>
								  		<th>等级金额</th>
								  	</tr>
								  </thead>
								  <tbody>
								  	<tr>
								  		<td>1</td>
								  		<td><input type="text" class="form-control" id="levelName_1" name="levelName_1" value="${entity.levels[0].levelName}" placeholder="请输入等级1名称"></td>
								  		<td><input type="text" class="form-control" id="levelPrice_1" name="levelPrice_1" value="${entity.levels[0].levelPrice}" placeholder="请输入等级1金额" ></td>
								  	</tr>
								  	<tr>
								  		<td>2</td>
								  		<td><input type="text" class="form-control" id="levelName_2" name="levelName_2" value="${entity.levels[1].levelName}" placeholder="请输入等级2名称"></td>
								  		<td><input type="text" class="form-control" id="levelPrice_2" name="levelPrice_2" value="${entity.levels[1].levelPrice}" placeholder="请输入等级2金额" ></td>
								  	</tr>
								  	<tr>
								  		<td>3</td>
								  		<td><input type="text" class="form-control" id="levelName_3" name="levelName_3" value="${entity.levels[2].levelName}" placeholder="请输入等级3名称"></td>
								  		<td><input type="text" class="form-control" id="levelPrice_3" name="levelPrice_3" value="${entity.levels[2].levelPrice}" placeholder="请输入等级3金额" ></td>
								  	</tr>
								  	<tr>
								  		<td>4</td>
								  		<td><input type="text" class="form-control" id="levelName_4" name="levelName_4" value="${entity.levels[3].levelName}" placeholder="请输入等级4名称"></td>
								  		<td><input type="text" class="form-control" id="levelPrice_4" name="levelPrice_4" value="${entity.levels[3].levelPrice}" placeholder="请输入等级4金额" ></td>
								  	</tr>
								  	<tr>
								  		<td>5</td>
								  		<td><input type="text" class="form-control" id="levelName_5" name="levelName_5" value="${entity.levels[4].levelName}" placeholder="请输入等级5名称"></td>
								  		<td><input type="text" class="form-control" id="levelPrice_5" name="levelPrice_5" value="${entity.levels[4].levelPrice}" placeholder="请输入等级5金额" ></td>
								  	</tr>
								  </tbody>
								</table>
								<input type="hidden" name="levelSize" value="5" />
						      </div>
						    </div>
						  </div>
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingTwo">
						      <h4 class="panel-title">
						        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						          	安全问题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="pull-right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-question-sign"></i></span>
						        </a>
						      </h4>
						    </div>
						    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="panel-body">
						        	<table class="table table-striped">
										  <thead>
										  	<tr>
										  		<th>#</th>
										  		<th>问题</th>
										  	</tr>
										  </thead>
										  <tbody>
										  	<tr>
										  		<td>1</td>
										  		<td><input type="text" class="form-control" id="quesion_1" name="quesion_1" value="${entity.quesion[0]}" placeholder="请输入等级名称"></td>
										  	</tr>
										  	<tr>
										  		<td>2</td>
										  		<td><input type="text" class="form-control" id="quesion_2" name="quesion_2" value="${entity.quesion[1]}" placeholder="请输入等级名称"></td>
										  	</tr>
										  	<tr>
										  		<td>3</td>
										  		<td><input type="text" class="form-control" id="quesion_3" name="quesion_3" value="${entity.quesion[2]}" placeholder="请输入等级名称"></td>
										  	</tr>
										  	<tr>
										  		<td>4</td>
										  		<td><input type="text" class="form-control" id="quesion_4" name="quesion_4" value="${entity.quesion[3]}" placeholder="请输入等级名称"></td>
										  	</tr>
										  	<tr>
										  		<td>5</td>
										  		<td><input type="text" class="form-control" id="quesion_5" name="quesion_5" value="${entity.quesion[4]}" placeholder="请输入等级名称"></td>
										  	</tr>
										  </tbody>
										</table>
										<input type="hidden" name="quesionSize" value="5" />
						      </div>
						    </div>
						  </div>
						</div>
			  		</li>
			  	</ul>
			  	<div class="container-form">
		  			<button id="submitBTN" type="submit" class="btn btn-primary col-xs-12 submit" autocomplete="off">
			  			<span id="words-icon"><i class="glyphicon glyphicon-ok"></i></span>
			  			<span id="loading-icon" style="display: none;"><i class="icon-spinner icon-spin"></i></span>
			  		</button>
	  			</div>
	    </form>
	    
	    <script>
	    
	    $(function(){
			$("#inputForm").bootstrapValidator({
				submitHandler: function (validator, form, submitButton) {
	                alert("submit");
	            }
			}).on("success.form.bv",function(e){
					//$("#submitBTN").button('loading');
					$("#loading-icon").show();
					$("#words-icon").hide();
				});
			
    	});
	    </script>
  </body>
</html>
