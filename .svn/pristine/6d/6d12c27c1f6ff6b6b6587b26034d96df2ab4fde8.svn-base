<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>提现申请</title>  
    <script src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <link href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet" />
    <script type='text/javascript' src='${ctx }/dwr/interface/validPasswordAccess.js'></script>
    <style>
    	.tableDiv{margin-top:20px;}
    </style>
  </head>
  
  <body class="no-skin">
		 
	  	<div class="container-fluid inner-menu">
	  		<div class="list-group">	  			
	  			<c:if test="${empty sessionScope.LOGINED_USER.account }">
	  			<a href="${ctx}/finance/addAccount.htm" class="list-group-item">
	  				<p class="list-group-item-text">
	  					<span class="col-xs-1"><i class="icon-picture"></i></span>
							请添加收款信息  <span class="text-warning">您还未添加收款账户信息</span>
						<span class="pull-right text-muted"><i class="icon-angle-right"></i></span>
					</p>
	  			</a>
	  			</c:if>
	  			
	  			
	  			<!-- <a href="javascript:openPayInfo();" class="list-group-item">
	  				<p class="list-group-item-text">
	  					<span class="col-xs-1 text-success"><i class="icon-credit-card"></i></span>
							查看平台收款账号
					</p>
	  			</a> -->
	  		</div>
	  		<form method="post" name="inputForm" id="inputForm" action="${ctx}/finance/saveCashApply.htm"
	  		data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
		  		<ul class="list-group">
			  		<li class="list-group-item">			  		
			  			<div class="form-group" style="margin-top:15px;">
			  				<label for="applyBonus" class="sr-only">提现积分</label>
			  				<div class="input-group">
			  				 <div class="input-group-addon">提现积分</div>
      						 <input type="number" class="form-control" id="applyBonus" name="applyBonus" placeholder="最大可提现积分${maxApplyBonus}" 
      						 data-bv-notempty="true" data-bv-notempty-message="提现积分不能为空" data-bv-numeric="true" data-bv-numeric-message="请输入有效提现积分数值" data-bv-greaterThan-message="请输入有效提现积分数值"
      						 data-bv-lessThan-message="提现积分不能超过最大可提现积分" aria-describedby="basic-addon1" 
      						  min="1" max="${maxApplyBonus}" required>    
      						  <a href="javascript:cashMoney(${maxApplyBonus});" class="input-group-addon btn btn-success" style="background-color: #38b44a;color: #ffffff;">全部提现</a> 						
			  				</div>			  				
			  			</div>		      				    						
				  	</li>	
				  	<li class="list-group-item">			  		
			  			<div class="form-group" style="margin-top:15px;">
			  				<label for="applyBonus" class="sr-only">二级密码</label>
			  				<div class="input-group">
			  				 <div class="input-group-addon">二级密码</div>
      						 <input type="text" class="form-control" id="password" name="password" placeholder="二级密码" 
      						 	data-bv-notempty="true" data-bv-notempty-message="二级密码不能为空" aria-describedby="basic-addon1" required
      						 	data-bv-remote="true" data-bv-remote-url="${ctx}/validSecPass.htm" data-bv-remote-message="二级密码不正确" data-bv-threshold="6" />
			  				</div>			  				
			  			</div>		      				    						
				  	</li>	
		  		</ul>
		  		<!-- <input type="hidden" id="password" name="password" />  -->
		  		<div class="col-xs-12">
			  		<input type="submit"  class="btn btn-primary form-control" value="确认提现"/>
		  		</div>
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
	  	<!-- <div id="payPasswordCT" style="display:none;">
	  		<div classs="form-group">
	  			<div class="input-group">
	  				<span class="input-group-addon"><i class="icon-key"></i></span>
   					<input type="password" class="form-control" id="payPassword" name="payPassword" required placeholder="请输入您的支付密码" onchange="listentPwInp();" maxlength="6">     						
  				</div>			
	  		</div>
	  		<div classs="form-group">
	  			<button class="btn btn-primary form-control" onclick="listentPwInp();">确定</button>
	  		</div>
	  	</div> -->
	  	
	  	<script type="text/javascript">
	  		$(function(){
  				<c:if test="${empty sessionScope.LOGINED_USER.account }">
					$("#sub-btn").attr("disabled","disabled");
					$("#applyBonus").attr("readonly","readonly");
				</c:if>
	  			$("#inputForm").bootstrapValidator();
	  		});
	  		
			$("#sub-btn").on("click",function(){
				var bootstrapValidator = $("#inputForm").data('bootstrapValidator');
				bootstrapValidator.validate();
			    if(bootstrapValidator.isValid()){
			      openPaypassword();
			    }else{
			     	return;
			    }
			});


			function cashMoney(money){
				$("#applyBonus").val(money);
			}
		  		
	  		function openPayInfo(){
				$.alertOpen({content:$("#payInfoCT").html(),title:"平台收款信息",height:420});
			}
			
			function openPaypassword(){
				var con1 ="<div classs='form-group'><div class='input-group'><span class='input-group-addon'><i class='icon-key'></i></span><input type='password' class='form-control' id='payPassword'required placeholder='请输入您的支付密码' onchange='listentPwInp();' maxlength='6'></div></div>";
	  			var con2 = "<small id='errorInfo' class='help-block' style='display:none;color:#cc0000;'></small>";
	  			var con3 ="<div classs='form-group' style='margin-top:10px;'><button id='payBtn' class='btn btn-primary form-control disabled' disabled='disabled' onclick='listentPwInp(true);'>确定</button></div>";
	  			var content =con1 + con2 + con3;		
				$.alertOpen({content:content,title:"支付密码",height:252,buttons:[]});
			}
			
			function listentPwInp(tosub){
				$("#payBtn").attr("disabled","disabled");
				var v = $("#payPassword").val();
				if(v==""){
					$("#payBtn").removeAttr("disabled");
					$("#errorInfo").text("请输入支付密码").show();
				}
				validPasswordAccess.validPayPassword(v,function(data){
					if(data.success){
						$("#password").val(v);
						if(tosub){
							$.alertClose();
							toSubmit();
						}
					}else{
						$("#payBtn").removeAttr("disabled");
						var message="";
						if(data.result=="0"){
							message="请输入支付密码"
						}else{
							message="密码错误"
						}
						$("#errorInfo").text(message).show();
					}
				});
			}
			
			function toSubmit(){
				$("#inputForm").data('bootstrapValidator').defaultSubmit();
				
			}
	  	</script>
  </body>
</html>
