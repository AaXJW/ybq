<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title><c:choose><c:when test="${type=='0' }">我的私信</c:when><c:otherwise>平台资讯</c:otherwise></c:choose></title>   
    <script type='text/javascript' src='${ctx }/dwr/interface/MSGAccess.js'></script>
  	<style>
	  	.message{padding:0px 10px;}
	  	.message .time{margin-bottom: 20px;color:#808080}
	  	.message .list-group a,.message .list-group a:hover{color:inherit !important;text-decoration: none;}
	  	.message .list-group .checkDetail{margin-bottom: 20px;} 	 
	  		
  	</style>
  </head>
  
  <body class="no-skin">		 
  	<div class="form-content outer" style="padding-top: 60px;padding-bottom: 10px;"> 
  	<input type="hidden" id="mtype" name="mtype" value="${type}" />
  	  <div class="row message inner">
  	  	<div id="pages" class="list-group">
  	  		<div class="params">
				<input type="hidden" id="currentPage" name="currentPage" value="0" />
			</div>
		</div> 		
	  </div>	
	</div>
	 	<script type="text/javascript">						
			function changeReaded(id,url){
				$.blockUI();
				MSGAccess.readed(id,function(){
					top.location=url;
				});
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
					$.post("${ctx}/personal/pageFromMessage.htm",{"mtype":$("#mtype").val(),"currentPage":parseInt(currentPage)+1},
						function(html){
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
