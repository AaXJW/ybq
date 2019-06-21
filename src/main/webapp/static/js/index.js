dropload={};
function buildDropLoad(ob){
	
	dropload[ob.attr("id")] = ob.dropload({
	    domUp : {
	        domClass   : 'dropload-up',
	        domRefresh : '<div class="dropload-refresh">↓下拉刷新</div>',
	        domUpdate  : '<div class="dropload-update">↑释放更新</div>',
	        domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中...</div>'
	    },
	    domDown : {
	        domClass   : 'dropload-down',
	        domRefresh : '<div class="dropload-refresh">↑上拉加载更多</div>',
	        domUpdate  : '<div class="dropload-update">↓释放加载</div>',
	        domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中...</div>'
	    },
	    loadUpFn : loadUpFn,
	    loadDownFn : loadDownFn
	});
	
}



function chooseNav(){
	setTimeout(function(){
		var mark = getMark(location.href);
		if(!mark){
			mark="index";
		}
		
		var nv=$(".navbar-fixed-bottom .nav li");
		nv.removeClass("active");
		
		$("#"+mark).addClass("active");
	},0);
}

function getMark(url){
	/*var st=ctx.indexOf(":",6);
	var ed=ctx.indexOf("\/",st);
	var port=window.location.port;*/
	ctx=ctx+"/";
	ctx=ctx.replace("\:80\/","\/");
	//ctx=ctx.substring(0,ctx.length-1);
	/*if(ctx.substring(st,ed)=="80"){
		
	}*/
	var mark=url.substring(ctx.length-1,url.length);
	if(mark.indexOf("/")>0){
		mark=mark.substring(0,mark.indexOf("/"));
	}else{
		mark=mark.substring(0,mark.indexOf('.'));
	}
	return mark;
}


var browser = {
        versions: function () {
            var u = navigator.userAgent, app = navigator.appVersion;
            return {         //移动终端浏览器版本信息
               trident: u.indexOf('Trident') > -1, //IE内核
               presto: u.indexOf('Presto') > -1, //opera内核
               webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
               gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
               mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
               ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
               android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
               iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
               iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
           };
        }(),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    }