<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>团购区管理</title>
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
  			<div class="row form-group">
  				<a class="btn btn-primary" href="${ctx}/manager/territoryArea/create.htm">创建团购区</a>	
  			</div>
  			<div class="row">
  				<table class="table table-striped table-hover">
  					<tbody id="pages">
  						<input type="hidden" id="currentPage" name="currentPage" value="0" />
  					</tbody>
				</table>
			</div>
	  </div>	
	  
	 	<script type="text/javascript">

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
				$.post("${ctx}/manager/territoryArea/pageFromTerritoryArea.htm",{"currentPage":parseInt(currentPage)+1},function(html){
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
