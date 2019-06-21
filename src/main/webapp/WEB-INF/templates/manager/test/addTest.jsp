<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
    <title>测试录入</title>
    <h2 align="center">测试录入</h2>
  		<form action="${ctx}/Test/save.htm" method="post" name="inputForm" id="inputForm"  enctype="multipart/form-data"
			data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
		    
		    <div class="panel panel-default">
			  <div class="panel-body">
			  
			  	<%--<div class="row form-group" style="text-align: center;">
	  				<div class="btn-group" data-toggle="buttons">
					  <label class="btn btn-success">
					    <input type="radio" name="login-regist" id="login-regist1" autocomplete="off"> 登录
					  </label>
					  <label class="btn btn-success active">
					    <input type="radio" name="login-regist" id="login-regist2" autocomplete="off" checked> 注册
					  </label>
					</div>
	  			</div>
			  
			    --%>
			    <c:if test="${not empty message}">
					<div class="alert alert-danger alert-dismissible" role="alert">
					  ${message}
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
					</div>
				</c:if>
			    
		<%-- 	    <div id="recommendertelCT" class="row form-group">
	  				<div class="input-group" >
					  <input type="text" class="form-control" id="recommendertel" name="recommendertel" placeholder="请输入推荐人手机号" value="${recommendertel }"
						required data-bv-notempty="true" data-bv-notempty-message="推荐人手机号不能为空" aria-describedby="basic-addon1" data-bv-threshold="11"
			   			data-bv-phone="true" data-bv-phone-country="CN" data-bv-phone-message="输入不是有效的手机号 " 
					  data-bv-remote="true" data-bv-remote-url="${ctx}/hasUST.htm?id=${entity.id}" data-bv-remote-message="该推荐人不存在"  <c:if test="${not empty recommendertel }"> readonly="readonly"</c:if> />
					  <span class="input-group-addon" id="basic-addon1"><i class="icon-tablet"></i></span>
					</div>
	  			</div> --%>
	  			
	  			
	  			<div id="nameCT" class="row form-group">
	  				<div class="input-group">
	  				<span class="input-group-addon" id="basic-addon3">简介</span>
					  <input type="text" class="form-control" id="synopsis" name="synopsis" placeholder="请输入测试简介" value="${synopsis }"
						required data-bv-notempty-message="简介不能为空" aria-describedby="basic-addon3">
					  
					</div>
	  			</div>
	  			
	  				<div id="nameCT" class="row form-group">
	  				<div class="input-group">
	  				<span class="input-group-addon" id="basic-addon3">价格</span>
					  <input type="text" class="form-control" id="price" name="price" placeholder="请输入价格，保留两位小数" value="${price }"
						required data-bv-notempty-message="价格不能为空" aria-describedby="basic-addon3">
					  
					</div>
	  			</div>
	  			
	  			<div id="nameCT" class="row form-group">
	  				<div class="input-group">
	  				<span class="input-group-addon" id="basic-addon3">测试名称</span>
					  <input type="text" class="form-control" id="teseName" name="teseName" placeholder="请输入测试名称" value="${teseName }"
						required data-bv-notempty-message="测试名称不能为空" aria-describedby="basic-addon3">
					  
					</div>
	  			</div>
	  			
	  			<div id="nameCT" class="row form-group">
	  				<div class="input-group">
	  				<span class="input-group-addon" id="basic-addon3">上传封面图片</span>
					   <input
							class="form-control" id="imagePath" name="imagePath" type="file" />
					  
					</div>
	  			</div>
	  			
	  		
	  			
	  			
	  			
	  			<div style="text-align: center">
	  			<button type="submit" class="btn btn-primary"> 确认录入
				</button>
				</div>
				<%-- <div id="levelsCT" class="row form-group">
	  				<div class="input-group">
	  					<select name="levels" id="levels" class="selectpicker" data-width="auto" title="请选择一个用户级别" required data-bv-notempty-message="请选择用户级别" aria-describedby="basic-addon8">
	  						<c:choose>
								 <c:when test="${not empty SYSTEM_PARAM}"> 
								 	<c:forEach items="${SYSTEM_PARAM.levels }" var="var" varStatus="vs">
			  							<option value="${vs.index }">${var.levelName }(${var.levelPrice })</option>
			  						<</c:forEach>
			  						</c:when>
										<c:otherwise>
											<!-- 暂无问题 -->
										</c:otherwise>
								</c:choose>
	  					</select>
					  <span class="input-group-addon" id="basic-addon8"><i class="icon-sitemap"></i></span>
					</div>
	  			</div> --%>
	  			
				<div class="hidden" id="agreements">
					${SYSTEM_PARAM.agreements }
				</div>
			  </div>
			</div>
		    
	    </form>
	    
	    <script>
			function refreshCode(){
				$("#vmcode").attr("src","${ctx}/code.htm?t="+new Date().getTime());
			}
			
			$(function(){
				
				//<button type="submit" class="btn btn-success col-xs-12 submit"><i class="icon-circle-arrow-right icon-2x"></i></button>
				$("#inputForm").bootstrapValidator({
					fields:{
						idNumber:{
		    				validators:{
		    					regexp:{
		    						regexp : /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/,
									message : "请输入正确的身份证码号"
		    					}
		    				}
		    			}
		    		}
				});
				
				$("input[name='login-regist']").change(function(){
					top.location="${ctx}/login.htm";
				});
				$("#levels").val("${levels}");
				//$("#quesion").val("${quesion}");
				
				$("#agreement_confirm").change(function(){
					if(this.checked){
						$("button[type='submit']").removeAttr("disabled");
					}else{
						$("button[type='submit']").attr("disabled","disabled");
					}
				});
			});
			
			
			function viewAgreements(){
	  			var content=$($("#agreements").html());
				
				$.alertOpen({content:content,title:"${SYSTEM_PARAM.agreementsTitle }",height:400});
	  		}
		</script>
