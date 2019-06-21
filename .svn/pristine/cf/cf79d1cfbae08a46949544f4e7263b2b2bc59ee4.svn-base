<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
    
  		<div class="container-fluid inner-menu">
	  		<div class="formDiv">
				<form method="post" name="inputForm" id="inputForm"
					data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
				    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
				    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
				    
				    <input type="hidden" name="tel" value="${tel }" />
				    
				     <c:if test="${not empty message}">
					<div class="alert alert-danger alert-dismissible" role="alert">
					  ${message}
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
					</div>
					</c:if>								    	
			    	<!-- <div class="row form-group" id="resPass">
			    		<div class="input-group">
						  	<span class="input-group-addon" id="basic-addon1"><i class="icon-barcode"></i></span>
						  	<input type="password" id="oldPassword" name="oldPassword" class="form-control" placeholder="请输入原始密码"
					      	data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" data-bv-notempty-message="原始密码不能为空"
					 		data-bv-stringlength-message="密码须为%s-%s个字符 " required id="basic-addon1">					 		
						</div>
			    	</div> -->
			    	<div class="row form-group">
			    		<div class="input-group">
			    			<span class="input-group-addon" id="basic-addon2"><i class="icon-barcode"></i></span>
						  	<input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="请输入新密码"
					      	data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" data-bv-stringlength-message="密码须为%s-%s个字符 "
					 		required data-bv-notempty-message="新密码不能为空" id="basic-addon2">					 		
						</div>
			    	</div>
			    	<div  class="row form-group">
						<div class="input-group">
						  <span class="input-group-addon" id="basic-addon3"><i class="icon-barcode"></i></span>
						  <input type="password" id="newPasswordC" name="newPasswordC" class="form-control" placeholder="请确认新密码"
					      	data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" data-bv-stringlength-message="密码须为%s-%s个字符 "
					 		required data-bv-notempty-message="确认新密码不能为空" id="basic-addon3" data-bv-identical="true" data-bv-identical-field="newPassword"
					 		 data-bv-identical-message="密码不一致 ">					 		
						</div>
					</div>
					<div class="row form-group">
						<button type="submit" class="btn btn-primary form-control">确定</button>
					</div>
			    </form>
	  		</div>  		  		
		</div>
		<script type="text/javascript">
			$(function(){
				$("#inputForm").bootstrapValidator();
			});
			
		</script>