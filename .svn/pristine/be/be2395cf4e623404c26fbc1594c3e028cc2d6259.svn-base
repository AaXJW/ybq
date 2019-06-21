;(function(lr){
	lr.fn.localLoadImage=function(callback){
		var file=$(this);
		file.change(function(){
			$.blockUI();
			lrz(this.files[0], {
				width:800,
				height:600,
				quality:0.8,
	            before: function() {
	            	$.unblockUI();
	                console.log('压缩开始');
	            },
	            fail: function(err) {
	            	$.unblockUI();
	                console.error(err);
	            },
	            always: function() {
	            	$.unblockUI();
	                console.log('压缩结束');
	            },
	            done: function (results) {
	            	$.unblockUI();
		            // 你需要的数据都在这里，可以以字符串的形式传送base64给服务端转存为图片。
		            console.log(results);
		            if(callback){
		            	callback(results.base64);
		            }
	            }
	        });
		});
	};
}(jQuery));


$(function(){
	$(".noimg").each(function(){
		if($(this).attr("src")){
			$(this).attr("src",ctx+$(this).attr("src"));
			$(this).parent().attr("href",$(this).attr("src")).attr("title","点击查看原图");
		}else{
			$(this).attr("src",ctx+"/static/images/noimg.jpg");
		}
	});
});