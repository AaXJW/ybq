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
						<form class="form-inline" action="${ctx}/finance/detail.htm" method="post">
							<div class="form-group">
								<div id="datepicker" class="input-group">							
									<input id="startDate" name="startDate" class="form-control form_datetime" type="datetime" placeholder="开始日期"  readonly 
									 value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd HH:mm" />">
									<span class="input-group-addon">到</span>
									<input id="endDate" name="endDate" class="form-control form_datetime" type="datetime" placeholder="截止日期"  readonly 
									value="<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd HH:mm" />">
								</div>
							</div>
							<div class="form-group">
								
								<select id="types" class="form-control" name="types">
									 <option value="">全部</option>
									 <c:forEach items="${typeMap }" var="item">
									 	<c:choose>
									 		<c:when test="${types==item.key}">
										    	<option value="${item.key}" selected="selected">${item.value}</option>								 			
									 		</c:when>
									 		<c:otherwise>
									 			<option value="${item.key}">${item.value}</option>
									 		</c:otherwise>
									 	</c:choose>
									</c:forEach>
								</select>												
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary form-control">查询</button>							
							</div>
							<div class="form-group">
								<button type="reset" class="btn btn-default form-control">重置</button>						
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
	 	<script type="text/javascript">
			$(".form_datetime").datetimepicker({
				  format: "yyyy-mm-dd hh:ii",
			      autoclose: true,
			      todayBtn: false,
			      language:'zh-CN',
			      pickerPosition:"bottom-right"
			});
			
			$("#startDate").datetimepicker().on('changeDate',function(ev){
				$("#endDate").datetimepicker('setStartDate',ev.date);
			});
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
					$.post("${ctx}/finance/pageFromDetail.htm",{"types":$("#types").val(),"startDate":$("#startDate").val(),
						"endDate":$("#endDate").val(),"currentPage":parseInt(currentPage)+1},function(html){
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
