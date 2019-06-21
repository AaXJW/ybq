<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <base href="${ctx}">
	<script>
		var ctx="${ctx}";
		
		window.onbeforeunload = function(){
			$.blockUI();
			return;
		};

		var befordMsg=null;
		var afterLoad=null;
		
	</script>
	
	<style>
	
		body { padding-top: 20px; }
	
		.message-coner{
			position: relative;
			padding: 12px 15px !important;
		}
		
		.navbar-brand .corner{
			position: absolute;
			right:3px;
			top:3px;
		}
		
		.eclis{
			overflow:hidden;white-space:nowrap;text-overflow:ellipsis; 
		}
		
		.navbar-fixed-top{
			max-height: 51px;
		}
		
		.outer{
			padding-top: 80px !important;
		}
		
		.navbar-fixed-top a{color: #fff !important;}
		
	</style>
	
	<%@ include file="/WEB-INF/jsp/top.jsp" %>
	
	<link href="${ctx}/static/style/index.css" rel="stylesheet" />
	
	<title>
	      <sitemesh:write property='title' /> 
	      
	      
	  </title>
	<sitemesh:write property='head' />
  </head>
  
  <body class="no-skin">
  
  		<%-- <nav class="navbar navbar-default navbar-fixed-top">
		  <div class="container-fluid" style="max-height: 60px;overflow: hidden;">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header col-xs-9" style="padding-left: 0;">
		      <%   
					String url=request.getAttribute("javax.servlet.forward.request_uri").toString();  
		      		if(url.indexOf("/index.htm")>=0||url.indexOf("/login.htm")>=0||url.equals("/")||url.equals("")){
				%> 
					<a class="navbar-brand pull-left" style="width:50px;" href="${ctx}<sitemesh:write property='backurl' default="/index.htm" />">
						<img alt="Brand" height="20" src="${ctx}/static/images/logo.png">
					</a>
				<%}else{ %>
					<a class="navbar-brand pull-left" style="width:50px;" href="<sitemesh:write property='backurl' default="javascript:{$.blockUI();window.history.back();}" />">
						<i class="glyphicon glyphicon-menu-left"></i>
					</a>
				<%}%>
			  <span class="navbar-brand col-xs-12 eclis" style="padding-left: 0px" id="title_t"><sitemesh:write property='title' />霍兰德测试录入</span>
			  
			  <span class="navbar-brand col-xs-12 eclis" style="padding-left: 0px" id="title_i"><sitemesh:write property='thistitle'/>霍兰德测试录入</span>
			  
		    </div>
		    <div class="navbar-header pull-right col-xs-3" style="padding-right: 0;">
		    	<a class="navbar-brand pull-right message-coner" href="${ctx }/personal/myselfMessage.htm">
				  <span class="h3"><i class="icon-comments-alt"></i></span>
				  	<c:if test="${not empty UNREAD_MSE_PARAM && UNREAD_MSE_PARAM[sessionScope.LOGINED_USER.tel] > 0 }">
				  		<span id="msg_corner" class="badge corner">${UNREAD_MSE_PARAM[sessionScope.LOGINED_USER.tel] }</span>
				  	</c:if>
			  	</a>
		    </div>
		   </div>
		 </nav>
  		 --%>
  		<sitemesh:write property='body' />
  		<%-- <nav class="navbar navbar-default navbar-fixed-bottom">
		  <div class="container-fluid">
		    <ul class="nav nav-pills">
			  <li role="presentation" id="index" class="col-xs-3 text-center"><a href="${ctx }/index.htm"><i class="icon-home icon-large"></i><br/>首页</a></li>
			  <li role="presentation" id="team" class="col-xs-3 text-center active"><a href="${ctx }/team/index.htm"><i class="icon-sitemap icon-large"></i><br/>团队</a></li>
			  <li role="presentation" id="finance" class="col-xs-3 text-center"><a href="${ctx }/finance/index.htm"><i class="icon-credit-card icon-large"></i><br/>财务</a></li>
			  <li role="presentation" id="personal" class="col-xs-3 text-center"><a href="${ctx }/personal/index.htm"><i class="icon-user icon-large"></i><br/>我的</a></li>
			</ul>
		  </div>
		</nav> --%>
		<script src="${ctx}/static/js/index.js"></script>
		<script>
		$(function(){
			if(befordMsg){
  				befordMsg();
				}
			<c:if test="${not empty message}">
				<c:if test="${empty messageType}">
					$.alertWarning("${message}");
				</c:if>
				<c:if test="${not empty messageType}">
					<c:if test="${messageType==0}">
						$.alertSuccess("${message}");
					</c:if>
					<c:if test="${messageType==1}">
						$.alertWarning("${message}");
					</c:if>
					<c:if test="${messageType==2}">
						$.alertDanger("${message}");
					</c:if>
				</c:if>
	  		</c:if>
	  		
	  		if(!$("#title_t").html()){
				$("#title_t").remove();
			}
			
			if($("#title_i").html()){
				$("#title_t").remove();
			}else{
				$("#title_i").remove();
			}

			if(afterLoad){
				afterLoad();
				}

			var uag=window.navigator.userAgent;
			if(uag.indexOf("iPhone")>=0&&uag.indexOf(" ",uag.indexOf("Mobile/"))<0){
				$(".navbar-fixed-top").css({top:"20px"});
				$("body").append("<div style='width:100%;height:20px;position:fixed;top:0px;left:0px;background-color:#e95420;'></div>");
				$("body").css("padding-top","90px !important");
				$(".outer").css({"padding-top": "20px !important"});
			}
	   	});
	   	
		$(function(){
			
			chooseNav();
			
		});
		</script>
  </body>
</html>
