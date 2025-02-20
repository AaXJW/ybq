<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <title></title>
    
    <meta name='apple-itunes-app' content='app-id=1251860909'>
    
    
    <style>
    	body{
    		background:#e8b6a5;
    	}
    	
    	@-webkit-keyframes 'wobble' {
		     0% {
		        margin: -590px auto auto auto;
		     }
		     
		     50% {
		     	margin: 50px auto auto auto;
		     	-webkit-filter: blur(0px); /* Chrome, Opera */
			    -moz-filter: blur(0px);
			    -ms-filter: blur(0px);    
			    filter: blur(0px);    
		     }
		     
		     80% {
		     	-webkit-filter: blur(0px); /* Chrome, Opera */
			    -moz-filter: blur(0px);
			    -ms-filter: blur(0px);    
			    filter: blur(0px);    
		     }
		     
		     100% {
		        -webkit-filter: blur(10px); /* Chrome, Opera */
			    -moz-filter: blur(10px);
			    -ms-filter: blur(10px);    
			    filter: blur(10px);    
		     }
		  }
    	
    	.blur {    
		    -webkit-filter: blur(10px); /* Chrome, Opera */
		    -moz-filter: blur(10px);
		    -ms-filter: blur(10px);    
		    filter: blur(10px);    
		}
		
		.appimg-ct{
			width: 350px;
			margin: 50px auto auto auto;
			-webkit-filter: blur(10px); /* Chrome, Opera */
		    -moz-filter: blur(10px);
		    -ms-filter: blur(10px);    
		    filter: blur(10px);  
		}
		.appimg-ct img{width: 100%;padding-top: 20px;}
    	
    	
    	
    	@-webkit-keyframes 'words' {
		     0% {
		        filter:alpha(Opacity=0);-moz-opacity:0;opacity: 0;
		        top: 180px;
		     }
		     
		     
		     100% {
		        filter:alpha(Opacity=100);-moz-opacity:1;opacity: 1;   
		        top: 160px;
		     }
		  }
    	
    	.donwload-button{
    		position:absolute;
    		width: 100%;
    		left: 0px;
    		top: 160px;
    		text-align: center;
    		filter:alpha(Opacity=100);-moz-opacity:1;opacity: 1;   
	        top: 160px;
    	}
    	
    	.donwload-button .btn{
    		width: 250px;
    		margin-top: 20px;
    	}
    	
    	.donwload-button .img-rounded{
    		width: 100px;
    	}
    	
    	.donwload-button h3{
			color:#e95420; 
    	}
    	
    	.donwload-button p{
    		font-size:20px;
    	}
    	
    	.donwload-button p span{
    		font-size:40px;
    		color:#e95420; 
    		 -moz-transform: rotate(45deg);/* Firefox 旋转属性，参数表示角度(deg表示角度)，负数逆时针，正数顺时针 */                
			-webkit-transform: rotate(45deg);/* Safari和Chrome */
			-ms-transform: rotate(45deg);/* IE 9 */
			-o-transform: rotate(45deg);/* Opera */
    	}
    </style>
    
    <script>
    	/* $(function(){
    		setTimeout(function(){
    			$(".appimg-ct").addClass("blur");
    			$(".donwload-button").css({"filter":"alpha(Opacity=100)","-moz-opacity":"1","opacity":"1","top":"160px"});
    		},4500);
    	}); */
    </script>
  </head>
  
  <body class="no-skin">
  	 <div class="appimg-ct">
  	 	<img src="${ctx }/static/images/app.png" />
  	 </div>
  	 
  	 <div class="donwload-button">
  	 	<img class="img-rounded" src="${ctx }/static/images/logo.png" />
  	 	<br/>
  	 	<h3>宝易通移动APP</h3><br/>
  	 	
  	 	<p><span>快</span> 人 一 步 , 快 下 载 吧 <i class="glyphicon glyphicon-hand-down"></i></p>
  	 	<a class="btn btn-success btn-lg" href="${ctx }/app/apk/bao1tong.apk"><img src="${ctx }/static/images/android.png" width="30" /> 安卓版</a>
  	 	<br/>
  	 	<a class="btn btn-danger btn-lg" href="https://itunes.apple.com/cn/app/id1251860909" id="openApp"><img src="${ctx }/static/images/ios.png" width="30" /> 苹果版</a>
  	 </div>
  	 <script type='text/javascript' src='${ctx }/dwr/interface/fileTransferAccess.js'></script>
  	 <script>
	  	function dowloadAPK(){
	  		fileTransferAccess.downloadFile("/app/apk/bao1tong.apk","bao1tong.apk",function (data){  
	            dwr.engine.openInDownload(data);});
		}
		function dowloadIos(){
			$.alertWarning("IOS版即将推出，敬请期待");
		}
  	 </script>
  	 
  </body>
</html>
