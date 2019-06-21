<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>财务明细</title>   
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
  </head>
  
  <body class="no-skin">
		 
	  	<div class="container-fluid inner-menu outer">
	  		<div class="form-content" style="padding-top: 60px;padding-bottom: 10px;"> 
	  			<div class="row">
		  			<div class="container-fluid">	  				
						<form class="form-inline" action="${ctx}/manager/user/listUser.htm" method="post">
							<div>
								<input id="filter_LIKE_name_OR_tel" name="filter_LIKE_name_OR_tel" class="col-xs-6" type="text" placeholder="姓名或手机号"  value="${filter_LIKE_name_OR_tel}"/>
								&nbsp;<button type="button" onclick="location.reload();" class="btn btn-default btn-sm pull-right">重置</button>&nbsp; <button type="submit" class="btn btn-primary btn-sm pull-right">查询</button>&nbsp;				
							</div>
						</form>	  				
		  			</div>
		  		</div>
	  		</div>
	  	
		  	<div class="finance-detail row inner">					
				<div id="pages" class="table-responsive">
				  		<div class="params">
						 	<input type="hidden" id="currentPage" name="currentPage" value="0" />
					 	</div>					  
			 	</div>
		 	</div>
	 	</div>
	 	
	 	<script type='text/javascript' src='${ctx }/dwr/interface/validPasswordAccess.js'></script>
	 	<script type="text/javascript">
	 		
	 		function resetPsw(id){
	 			$.alertConfirm("<input type='text' id='confirmPsw' class='form-control' value='123456' />",function(){
	 				validPasswordAccess.resetpsw(id,confirm("是否同时重置二级密码？"),$("#confirmPsw").val(),function(data){
	 					$.alertClose();
		 				alert(data.msg);
		 			});
	 			},function(){
	 				$.alertClose();
	 			},{height:"300px"});
	 		}
	 	
			var loadUpFn=function(me){
		    	window.location.reload();
			}

		    var loadDownFn=function(me){
		    	var obj=me.$element;

		    	var id=obj.attr("id");

		    	var totalPages=$("#totalPages").val();
		    	var currentPage=$("#currentPage").val();

			    if(totalPages){
					if(parseInt(currentPage)>=parseInt(totalPages)){
						me.resetload();
						return;
					}
					$.blockUI();
				}

				try{
					$.post("${ctx}/manager/user/loadMoreUser.htm",{"filter_LIKE_name_OR_tel":$("#filter_LIKE_name_OR_tel").val(),"currentPage":parseInt(currentPage)+1},function(html){
							$(".params").remove();
							$("#pages").append(html);
							if(totalPages){
								$.unblockUI();
							}
							if(me.resetload){
								me.resetload();
							}
					},"html");
				}catch(e){
					$.unblockUI();
					me.resetload();
				}
				
			}
		    befordMsg=function(){
				buildDropLoad($(".inner"));
				loadDownFn({$element:$("#pages")});
				}
		</script>
  </body>
</html>
