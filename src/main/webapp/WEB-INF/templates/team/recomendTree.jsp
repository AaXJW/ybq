<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title>推荐关系图</title>
    <backurl>${ctx }/team/index.htm</backurl>
	
	<link rel="stylesheet" href="${ctx }/plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
    <script type="text/javascript" src="${ctx }/plugins/zTree/js/jquery.ztree.core.js"></script>
    
  </head>
  
  <body class="no-skin">
		
		<div class="container-fluid ztree">
			<div id="tree" style="margin-left: 20px;"></div>
		</div>
		
		
		<script>
			var setting = {
				data: {
					simpleData: {
						enable: true
					}
				}
			};
			var zNodes =${json};
			$(document).ready(function(){
				$.fn.zTree.init($("#tree"), setting, zNodes);
			});
		</script>
  </body>
</html>
