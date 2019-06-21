<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>代理查询</title>   
  	<style>
	  	.form-content{
	  		padding:0px 10px;
		}  	 	
		.caretUp {
		  display: inline-block;
		  width: 0;
		  height: 0;
		  margin-top: 1px;
		  margin-left: 2px;
		  vertical-align: middle;
		  border-bottom: 4px solid;
		  border-right: 4px solid transparent;
		  border-left: 4px solid transparent;
		}	
		.panel-group .panel .panel-heading a:hover{text-decoration: none;}
		.panel-group .panel .panel-heading .panel-title,
		.panel-group .panel .panel-body .content{ word-break: break-all;word-wrap: break-word;}
		table{
			background-color: #fff;
		}
		td{
			padding: 10px;
		}
  	</style>
  </head>
  
  <body class="no-skin">		 
  		<div class="form-content outer" style="margin-top: 40px;padding-bottom: 10px;"> 
  			<div class="row">	
	  			<div class="panel-group">
				  	<div class="panel panel-default" id="accordionSearch">
					  <div class="row panel-heading">
						  	<a data-toggle="collapse" data-parent="#accordionSearch" href="#panelbodySearch" onclick="changeSpanCss('showhid','caret','caretUp')">
							    <p class="panel-title">搜索</p>								    
							    <i id="showhid" class="pull-right caret"></i>			  	
						  	</a>
					  </div>
					  <div id="panelbodySearch" class="panel-collapse collapse">
						  <div class="panel-body">
						    <div class="row col-xs-12">
						    	<form class="form-inline"  action="${ctx}/manager/message/list.htm" method="post">
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
										<button type="submit" class="btn btn-primary col-xs-5">查询</button>		
										<button type="reset" class="btn btn-default col-xs-5 pull-right">重置</button>					
									</div>
								</form>	
						    </div>
						  </div>
					  </div>
					</div>
				</div>			
  			</div>
  			<div class="row form-group">
  				<a class="btn btn-primary" href="${ctx}/manager/proxy/create.htm">创建分区</a>	
  			</div>
  			<div class="row">
  				<table class="table table-striped table-hover">
  					<tbody id="pages">
  						<input type="hidden" id="currentPage" name="currentPage" value="0" />
  					</tbody>
				</table>
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
				$.post("${ctx}/manager/proxy/pageFromProxy.htm",{"startDate":$("#startDate").val(),
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
			
			function changeSpanCss(id, removeStyle, addStyle) {
				if ($("#" + id).hasClass(removeStyle)) {
					$("#" + id).removeClass(removeStyle);
					$("#" + id).addClass(addStyle);
				} else {
					$("#" + id).removeClass(addStyle);
					$("#" + id).addClass(removeStyle);
				}
			}

			befordMsg=function(){
				buildDropLoad($(".inner"));
				loadDownFn({$element:$("#pages")});
				}

		</script>
  </body>
</html>
