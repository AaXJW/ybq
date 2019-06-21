<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>网络图</title>
    <backurl>${ctx }/team/index.htm</backurl>
    
    <link href="${ctx }/plugins/jOrgChart/css/jquery.jOrgChart.css" rel="stylesheet" />
    <link href="${ctx }/plugins/jOrgChart/css/prettify.css" rel="stylesheet" />
    <link href="${ctx}/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
    
    <script type='text/javascript' src='${ctx }/static/js/jquery-ui.min.js'></script>
    <script type='text/javascript' src='${ctx }/plugins/jOrgChart/js/prettify.js'></script>
	<script type='text/javascript' src='${ctx }/plugins/jOrgChart/js/jquery.jOrgChart.js'></script>
	
	<script src="${ctx}/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
	
	<style>
		.jOrgChart .node{
			width: auto;
			max-width:100px;
			height: auto;
			background-color: #f3f3f4;
		}
		
		.jOrgChart table{
			margin: 0 auto;
		}
		
		.btn-first {
		    color: #ffffff;
		    background-color: #33CCFF;
		    border-color: #33CCFF;
		}
		
		.btn-asfirst {
		    color: #FFFFCC;
		    background-color: #3300FF;
		    border-color: #3300FF;
		}
		
		.btn{
			position: relative;
		}
		
		.huibiao{
			position: absolute !important;
			right: -10px  !important;
			top:-15px  !important;
		}
	</style>
  </head>
  
  <body class="no-skin">
		 
		 <div class="container-fluid">
			<div class="col-xs-6 text-right">
				<form method="get" action="${ctx }/manager/territory.htm" id="inputForm">
					<h3><i class="${territoryArea.logoIcon }"></i> ${territoryArea.areaName } 团购区</h3>
					<br/>
					<input  type="hidden" name="territoryAreaId" value="${territoryArea.id }"/>
					<select onchange="toTel(this.value)">
						<c:forEach items="${terss }" var="ter" varStatus="status">
						     <option value="${ter.id}" <c:if test="${ter.id == param.id}">selected="selected"</c:if>>${ter.tel}</option>
						</c:forEach>
					</select>的分区&nbsp;
					显示到：<select name="level" id="level" onchange="toSubmit();">
						<c:forEach var="i" begin="3" end="${SYSTEM_PARAM.areaMaxLevel }" varStatus="status">
						     <option value="${status.index}">第 ${status.index} 层</option>
						</c:forEach>
					</select>
					
					<input type="hidden" name="id" id="tel" value="${param.tel }" />
					
					<input type="hidden" name="firstId" id="firstId" />
					
					<input type="hidden" name="cancelFirstId" id="cancelFirstId" />
				</form>
			</div>
		 </div>
		 
		 <div class="container-fluid">
		 	<div class="btn-group btn-group-sm" role="group">
		 		<button type="button" class="btn btn-default" disabled='disabled'>空位 </button>
		 		<button type="button" class="btn btn-success" style="background-color:#CC0000;border-color:#CC0000;">抢单位</button>
		 		<button type="button" class="btn btn-info">${SYSTEM_PARAM.territoryThirdName }</button>
		 		<button type="button" class="btn btn-warning">${SYSTEM_PARAM.territorySecondName }</button>
		 		<button type="button" class="btn btn-primary">${SYSTEM_PARAM.territoryTopName }</button>
		 		<button type="button" class="btn btn-success">团购成功</button>
			</div>
			<c:if test="${not empty param.id }">
				<a class="btn btn-danger btn-sm pull-right" href="javascript:returns();">返回</a>
			</c:if>
			
		 </div>
		 
		 <div class="container-fluid">
		 	<div class="table-responsive" style="text-align:center;padding: 20px 5px;">
		 		<div id="chart" class="orgChart center-block"></div>
		 		<ul id="top" style="display:none"></ul>
		 	</div>
		 	<c:if test="${not empty message}">
				<div class="alert alert-danger alert-dismissible" role="alert">
				  ${message}
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>
				</div>
			</c:if>
		 </div>
		 <!-- <div id="myTreeContainer" style="position: relative;"></div> -->
		 
		 <script>
			//$.blockUI();
			
			var booMap={};
			
		 	function buildTree(tree){
			 	for(var i=0;i<tree.length;i++){
			 		var pct=null;
			 		if(tree[i].parentId){
			 			pct=$("#u_"+tree[i].parentId);
			 			if(pct.length==0){
			 				pct=$("#top");
			 			}
			 		}else{
			 			pct=$("#top");
			 		}
			 		pct.append(buildNode(tree[i]));
			 	}
		 	}
		 	
		 	function buildNode(node){
		 		
		 		var clas="btn-default";
		 		
		 		var dsb="disabled='disabled'";
		 		
		 		var href="javascript:toTel(\""+node.id+"\")";
		 		
		 		var style="";

		 		var no0=true;
		 		
		 		switch(node.state){
		 			case 0: href="javascript:;";
		 				if(parseInt(node.seatPrice)>0&&node.state=='0'&&!(node.placeholderTel)){
		 					clas="btn-danger";
		 					style="background-color:#CC0000;border-color:#CC0000;";
		 					dsb="";
		 					no0=false;
		 					href="javascript:toFirst("+node.id+")";
		 				} break;
		 			case 1: clas="btn-info"; dsb=""; booMap[node.id]=true; break;
		 			case 2: clas="btn-warning"; dsb=""; booMap[node.id]=true; break;
		 			case 3: clas="btn-primary"; dsb=""; booMap[node.id]=true;break;
		 			case 4: clas="btn-success"; dsb=""; break;
		 		}

		 		if(booMap[node.parentId]&&no0&&node.state==0){
		 			dsb="";
		 			clas="btn-first";
		 			href="javascript:toFirst("+node.id+")";
			 	}

			 	if(node.piid>0&&node.state==0){
			 		clas="btn-asfirst";
			 		node.name="优先位";
			 		href="javascript:cancelFirst("+node.id+")";
				 }

				 
		 		//btn-asfirst
		 		var table=$("<li><a href='"+href+"' class='btn "+clas+" btn-xs' "+dsb+" style='"+style+"'>"+node.name+"<br/>&nbsp;"+(node.userName?("("+node.userName+")"):"")+"</a><ul id='u_"+node.id+"'></ul></li>");
		 		return table;
		 	}

		 	function toFirst(id){
		 		$.alertConfirm("您确定将此节点设置为优先入位节点？",function(){
					$.blockUI();
					$("#firstId").val(id);
					$("#inputForm").submit();
				});
			 }

		 	function cancelFirst(id){
		 		$.alertConfirm("您确定取消该优先入位节点？",function(){
					$.blockUI();
					$("#cancelFirstId").val(id);
					$("#inputForm").submit();
				});
			 }
		 	
		 	function returns(){
		 		toTel("");
		 	}
		 	
		 	function toTel(tel){
		 		$("#tel").val(tel);
		 		toSubmit();
		 	}
		 	
		 	function toSubmit(){
		 		$.blockUI();
		 		$("#inputForm").submit();
		 	}
		 	
		 	var tree=${ters};
		 	
		 	$(function(){
		 		buildTree(tree);
		 		$("#top").jOrgChart({
		            chartElement : '#chart',
		            dragAndDrop  : true
		        });
		 		
		 		$("#show-list").click(function(e){
	                e.preventDefault();
	                
	                $('#list-html').toggle('fast', function(){
	                    if($(this).is(':visible')){
	                        $('#show-list').text('Hide underlying list.');
	                        $(".topbar").fadeTo('fast',0.9);
	                    }else{
	                        $('#show-list').text('Show underlying list.');
	                        $(".topbar").fadeTo('fast',1);                  
	                    }
	                });
	            });
	            
	            $('#list-html').text($('#org').html());
	            
	            $("#top").bind("DOMSubtreeModified", function() {
	                $('#list-html').text('');
	                
	                $('#list-html').text($('#top').html());
	                
	                prettyPrint();                
	            });


	            try{
	            	var scd=$(".table-responsive")[0];
		            
		            scd.scrollTo((scd.scrollWidth-scd.offsetWidth)/2,0); 
		            }catch (e) {
					// TODO: handle exception
				}
		 		
	            var level='${param.level}';
	            
	            if(!level){
	            	level='5';
	            }
	            
	            $("#level").val(level);
	            $.unblockUI();
	            
	            //$(".btn").append('<span class="huibiao badge"><i class="${territoryArea.logoIcon }"></i></span>');
		 	});
		 	
		 </script>
  </body>
</html>
