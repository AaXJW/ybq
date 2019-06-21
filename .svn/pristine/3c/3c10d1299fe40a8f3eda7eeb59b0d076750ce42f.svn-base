<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
    
  		<form action="${ctx}/manager/message/saveMessage.htm" method="post" name="inputForm" id="inputForm" 
			data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
		    
		    <div class="panel panel-default">
			  <div class="panel-body">
			    <c:if test="${not empty message}">
					<div class="alert alert-danger alert-dismissible" role="alert">
					  ${message}
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
					</div>
				</c:if>
			    
			    <div class="row form-group">
	  				<div class="input-group">
	  					<select name="mtype" id="mtype" class="selectpicker" data-width="auto" title="请选择一个消息类别" required data-bv-notempty-message="请选择消息类别" aria-describedby="basic-addon3" onchange="changeMtype(this.value)">	  						
		  					<option value="0" <c:if test="${mtype==0 }">selected="selected"</c:if>>私信</option>	  						
	  						<option value="1" <c:if test="${mtype==1 }">selected="selected"</c:if>>资讯</option>	
	  					</select>
					  <span class="input-group-addon" id="basic-addon3"><i class="icon-sitemap"></i></span>
					</div>
	  			</div>
	  			
			    <div id="reciverCT" class="row form-group">
	  				<div class="input-group" >
					  <input type="text" class="form-control" id="reciver" name="reciver" placeholder="请输入接收人手机号" value="${reciver }"
						required data-bv-notempty="true" data-bv-notempty-message="接收人手机号不能为空" aria-describedby="basic-addon1" data-bv-threshold="11"
			   			data-bv-phone="true" data-bv-phone-country="CN" data-bv-phone-message="输入不是有效的手机号 " />
					  <span class="input-group-addon" id="basic-addon1"><i class="icon-tablet"></i></span>
					</div>
	  			</div>	  			
	  			
	  			<div class="row form-group">
	  				<div class="input-group">
					  <input type="text" class="form-control" id="title" name="title" placeholder="请输入消息标题" value="${title }"
						required data-bv-notempty-message="消息标题不能为空" aria-describedby="basic-addon2">
					  <span class="input-group-addon" id="basic-addon2"><i class="icon-tag"></i></span>
					</div>
	  			</div>	  			
	  			
	  			<div class="row form-group">
	  				<textarea id="content" name="content" rows="6"  class="form-control" placeholder="请输入消息内容" maxlength="150" required data-bv-notempty-message="消息内容不能为空" aria-describedby="basic-addon4">${content}</textarea>
	  			</div>
	  			
			  </div>
			</div>
		    
	    </form>
	    
	    <script>
			$(function(){
				$("#inputForm").bootstrapValidator();
			});
			function changeMtype(mtype){  				
  				if(mtype=='0'){
  					$("#reciverCT").addClass("show").removeClass("hidden");
  					$("#reciver").attr("required");
  				}else if(mtype=='1'){
  					$("#reciverCT").addClass("hidden").removeClass("show");
  					$("#reciver").removeAttr("required");
  				}
  			}
		</script>
