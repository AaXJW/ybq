<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>${approvalTypeMc}</title>
    <script type='text/javascript' src='${ctx }/dwr/interface/validPasswordAccess.js'></script>
  </head>
  
  <body class="no-skin">
  		<input type="hidden" id="approvalType" value="${approvalType }" />
  		<div class="container-fluid outer">
  			<div class="row text-center" style="margin-top: 60px;">
  				<div class="btn-group" data-toggle="buttons">
				  <label class="btn btn-primary active">
				    <input type="radio" name="options" id="option1" autocomplete="off" value="0" onchange="changeOption(this.value)" checked>申请中
				  </label>
				  <label class="btn btn-primary">
				    <input type="radio" name="options" id="option2" autocomplete="off" value="1" onchange="changeOption(this.value)">已经审批
				  </label>
				</div>  			
  			</div>
			
			<div class="row inner" id="ing">
				<ul class="list-group" style="padding: 15px;">
					<div class="params">
					 	<input type="hidden" id="currentPage" name="currentPage" value="0" />
				 	</div>
				</ul>
			</div>
			
			<div class="row inner" id="done" style="display: none;">
				<ul class="list-group" style="padding: 15px;">
				 	<div class="params">
					 	<input type="hidden" id="currentPage" name="currentPage" value="0" />
				 	</div>
				</ul>
			</div>
  		</div>
	    <script>
	    
	    var sub_flag=false;
	    
	    function openImg(imgurl){
	    	var href=$("<a>");
	    	href.attr("href",imgurl).attr("target","_blank");
	    	var img=$("<img style='max-width:250px;' />");
	    	img.attr("src",imgurl);
	    	href.append(img);
	    	$.alertOpen({content:href,height:350,title:"转账凭证"});
	    }

	    var loadUpFn=function(me){
	    	window.location.reload();
		}

	    var loadDownFn=function(me){
	    	var obj=me.$element;

	    	var id=obj.attr("id");

	    	var totalPages=obj.find("#totalPages").val();
	    	var currentPage=obj.find("#currentPage").val();

		    if(totalPages){
				if(parseInt(currentPage)>=parseInt(totalPages)){
					//dropload[id].lock();
					//obj.find(".dropload-down").hide();
					me.resetload();
					return;
				}
				$.blockUI();
			}

			var states="";
		    
			if(id=="ing"){
				states="0,1";
			}

			if(id=="done"){
				states="2,3";
			}

			try{
				$.post("${ctx}/manager/pageFromApproval.htm",{"approvalType":$("#approvalType").val(),
					"currentPage":parseInt(currentPage)+1,"approvalStates":states},function(html){
						obj.find(".list-group > .params").remove();
						obj.find(".list-group").append(html);
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
	    
	    function changeOption(optionValue){
	    	//申请中
	    	if(optionValue==0){
	    		/* $(".approved").each(function(index,item){
	    			$(item).removeClass("show").addClass("hidden");
	    		});
	    		$(".not-approved").each(function(index,item){
	    			$(item).removeClass("hidden").addClass("show");
	    		});	   */
	    		$("#done").hide();
	    		$("#ing").show();
	    		if($("#ing .list-group-item").length==0){
	    			loadDownFn({$element:$("#ing")});
		    	}
	    		return;
	    	}
	    	//已经审批	    
	    	if(optionValue==1){		
	    		/* $(".not-approved").each(function(index,item){
	    			$(item).removeClass("show").addClass("hidden");
	    		});
	    		$(".approved").each(function(index,item){
	    			$(item).removeClass("hidden").addClass("show");
	    		}); */
	    		
	    		$("#ing").hide();
	    		$("#done").show();
	    		if($("#done .list-group-item").length==0){
	    			loadDownFn({$element:$("#done")});
		    	}
	    		return;
	    	}
	    }
	    
	    
	    function approve(id,type,ab){
			//${ctx}/finance/payApproval.htm?id=
				
			$.alertConfirm("您确定对此申请进行"+(ab?" 审核通过 ":" 审核不通过 ")+"操作？",function(){
				if(sub_flag){
					return;
				}
				$.blockUI();
				if(ab){
					top.location="${ctx}/manager/passApproval.htm?id="+id+"&approvalType="+type;
				}else{
					top.location="${ctx}/manager/notPassApproval.htm?id="+id+"&approvalType="+type;
				}
				sub_flag=true;
				$("button").attr("disabled","disabled").append("<i class='icon-spinner icon-spin'></i>");
			});
		}
	    
	    
	    function getReciverInfo(id){
	    	$.blockUI();
	    	validPasswordAccess.getReciverInfo(id,function(data){
	    		$.unblockUI();
	    		if(!data.msg){
	    			var ul=$('<ul class="list-group"></ul>');
	    			ul.append(buildLi("银行支行",data.bankBranch));
	    			ul.append(buildLi("银行账户",data.account));
	    			ul.append(buildLi("微信号",data.weixin));
	    			ul.append(buildLi("消费平台账号",data.thirdPlatformAccount));
	    			$.alertOpen({content:ul,title:data.username+"的收款信息",height:360});
	    		}
	    	});
	    }
	    
	    function buildLi(tt,info){
	    	var li=$('<li class="list-group-item"><p class="list-group-item-text">'+tt+':<span class="pull-right">'+info+'</span></p></li>');
	    	return li;
	    }

	    befordMsg=function(){
	    	buildDropLoad($("#ing"));
	    	buildDropLoad($("#done"));
	    	changeOption(0);
	    }

	   
	    </script>
  </body>
</html>
