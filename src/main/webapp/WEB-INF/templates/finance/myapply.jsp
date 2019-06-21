<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>我的申请</title>
  </head>
  
  <body class="no-skin">
		 
	  	<div class="container-fluid inner-menu">	
	  		<div class="row inner">
  				<div id="pages">
  					<div class="params">
					 	<input type="hidden" id="currentPage" name="currentPage" value="0" />
				 	</div>
  				</div>
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
				$.post("${ctx}/finance/pageFromMyApply.htm",{"currentPage":parseInt(currentPage)+1},function(html){
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
