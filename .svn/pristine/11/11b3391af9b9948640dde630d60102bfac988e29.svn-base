;(function(a){
	a.alert=null;
	a.color={
			success:"#cc0000",//"#BCDF95",
			warning:"#cc0000",//"#F89A2B",
			danger:"#cc0000"//"#E32925"
	}
	a.icon={
			success:"<i class='icon-ok'></i>",
			warning:"<i class='icon-lightbulb'></i>",
			danger:"<i class='icon-remove'></i>"
	}
	a.alertClose=function(){
		if(a.alert){
			a.alert.modal('hide');
			//a.alert.remove();
		}
	}
	a.config={};
	
	a.initConfig=function(){
		a.config={tag:"body",type:'success',buttons:[{type:'close',text:'关闭',onClick:function(){a.alertClose()}}],content:"...",url:null,title:"...",width:300,height:174,icon:"glyphicon-exclamation-sign",onClose:function(){},onOpened:function(mwindow){}};
	}
	
	a.fn.alertRander=function(){
		var l=new Date().getTime();
		a.alert=jQuery("<div class='modal fade' id='gtwgAlertModal_"+l+"' tabindex='-1' role='dialog' aria-labelledby='gtwgModalLabel'><div class='modal-dialog' role='document'><div class='modal-content'><div class='modal-header'><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button><h4 class='modal-title' id='myModalLabel'><span class='glyphicon'></span> <span class='modal-title-info'>Modal title</span></h4></div><div class='modal-body'>...</div><div class='modal-footer'></div></div></div></div>");
		a(this).append(a.alert);
		a.alert.modal({show:false});
		return a.alert;
	}
	a.alertOpen=function(config){
		a.initConfig();
		config=a.extend(a.config,config);
		if(a.alert){
			a.alert.remove();
		}
		a.alert=a(config.tag).alertRander();
		a.alert.find(".modal-header").css("color",a.color[config.type]);
		a.alert.find(".modal-title-info").html(config.title);
		a.alert.find(".modal-body").css({"height":(config.height-122)+"px","overflow":"auto"});
		a.alert.find(".modal-dialog").css("width",config.width+"px");//margin: 10px auto;
		a.alert.find(".modal-dialog").css("margin","10px auto");
		a.alert.find(".modal-content").css("width",config.width+"px");
		//a.alert.find(".glyphicon").addClass(config.icon);
		if(config.url){
			var iframe=jQuery("<iframe frameborder='0'></iframe>");
			iframe.css("height",(config.height-125)+"px");
			iframe.css("width",(config.width-50)+"px");
			a.alert.find(".modal-body").html("");
			a.alert.find(".modal-body").append(iframe);
			iframe.attr("src",config.url);
			a.alert.find(".modal-body").block();
			iframe.load(function(){
				a.alert.find(".modal-body").unblock();
			});
		}else{
			a.alert.find(".modal-body").html(config.content);
		}
		
		a.alert.find(".glyphicon").remove();
		if(config.buttons){
			a.alert.find(".modal-footer").show();
			buttons=config.buttons;
			for(var i=0;i<buttons.length;i++){
				var clas="btn-danger";
				var btn=jQuery('<button type="button" class="btn">'+buttons[i].text+'</button>');
				a.alert.find(".modal-footer").append(btn);
				if(buttons[i].type=='close'){
					clas="btn-default";
				}
				btn.addClass(clas);
				if(buttons[i].onClick){
					btn.click(buttons[i].onClick);
				}
			}
		}else{
			a.alert.find(".modal-footer").hide();
		}
		
		var model=a.alert.modal('show');
		
		if(window.browser.name!="ie"||(parseFloat(window.browser.version)>9)){
			model.find(".modal-content").hide();
		}/*else{
			var top=jQuery(window).height()/2 - (jQuery(this).find(".modal-content").height()/2)-30;
			//model.find(".modal-content").fadeIn("fast");
			model.css({"margin-top":top+"px"});
		}*/
		
		/*model.css({"margin-top": function () {
			return jQuery(window).height()/2 - (model.find(".modal-content").height()/2)-30;
			}
		});*/
		
		a.alert.on('shown.bs.modal',function(e){
			var top=jQuery(window).height()/2 - (jQuery(this).find(".modal-content").height()/2)-30;
			model.find(".modal-content").fadeIn("fast");
			model.animate({marginTop:top+"px"},"normal");
			config.onOpened(a.alert);
		});
		
		a.alert.on('hidden.bs.modal', function (e) {
			a.alert.remove();
			a.alert=null;
			config.onClose();
			config=a.extend(config,a.config);
		})
		
		return a.alert;
	}
	a.alertSuccess=function(content,config){
		if(!config){
			config={};
		}
		config["type"]="success";
		if(!config.title){
			config["title"]="恭喜";
		}
		var img='<span class="text-success"> '+a.icon.success+' </span>  ';
		config["content"]=img+content;
		return a.alertOpen(config);
	};
	
	a.alertWarning=function(content,config){
		a.initConfig();
		if(!config){
			config={};
		}
		config["type"]="warning";
		if(!config.title){
			config["title"]="温馨提示";
		}
		var img='<span class="text-warning"> '+a.icon.warning+' </span>  ';
		config["content"]=img+content;
		return a.alertOpen(config);
	};
	
	a.alertDanger=function(content,config){
		a.initConfig();
		if(!config){
			config={};
		}
		config["type"]="danger";
		if(!config.title){
			config["title"]="警告";
		}
		var img='<span class="text-danger"> '+a.icon.danger+' </span>  ';
		config["content"]=img+content;
		return a.alertOpen(config);
	};
	
	a.alertConfirm=function(content,callbackOk,callbackCancel,config){
		a.initConfig();
		if(!config){
			config={};
		}
		config["buttons"]=a.config.buttons;
		config.buttons[0].onClick=function(){
			a.alertClose();
			if(callbackCancel){
				callbackCancel();
			}
		}
		config.buttons.push({type:'confirm',text:'确认',onClick:function(){
			if(callbackOk){
				callbackOk();
			}else{
				a.alertClose();
			}
		}});
		config["type"]="warning";
		if(!config.title){
			config["title"]="请确认";
		}
		config["content"]=content;
		return a.alertOpen(config);
	};
}(jQuery));


jQuery(function(){
	//jQuery("head").append("<script src='/resources/normalize/base/js/browser.js' type='text/javascript'></script>");
});