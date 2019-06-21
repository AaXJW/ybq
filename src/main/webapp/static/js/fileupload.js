function fileSizeJudge(id,size,accept){
	var ua = window.navigator.userAgent;
	var filesize=0;
	var obj_file = document.getElementById(id);
	if (ua.indexOf("MSIE")>=1){
		obj_file.dynsrc=obj_file.value;
	    filesize = obj_file.fileSize/1024;
	}else{
		filesize = obj_file.files[0].size/1024;
	}
	
	if(filesize&&filesize>size){
		/*if(jQuery.alert){
			jQuery.alertWarning("上传文件大小不能大于 "+size+" kb");
		}else{*/
		return "上传文件大小不能大于 "+size+" kb";
		//}
	}
	
	
	
	var file=jQuery(obj_file).val();  
	var filename=file.replace(/.*(\/|\\)/, "");  
	var fileExt=(/[.]/.exec(filename)) ? /[^.]+$/.exec(filename.toLowerCase()) : '';  
	if(accept.indexOf("."+fileExt)<0){
		/*if(jQuery.alert){
			jQuery.alertWarning("只能上传  "+accept+" 类型的文件");
		}else{*/
		return "只能上传  "+accept+" 类型的文件";
		//}
	}
	
	return null;
}


/**
 * 图片上传
 * @param id file 表单的id属性
 * @param uploadBack 回调方法 参数 jsonData
 */
function uploadImage(id,uploadBack,oldFile){
	var fs=fileSizeJudge(id,2048,".jpeg,.jpg,.gif,.png");
	if(!fs){
		jQuery.blockUI();
		fileTransferAccess.imageUpload(dwr.util.getValue(id),oldFile,{callback:function(data){
			if(uploadBack){
				uploadBack(data);
			}
			jQuery.unblockUI();
		}}); 
	}else{
		if(uploadBack){
			uploadBack({success:false,msg:fs});
		}
	}
}


/**
 * 常用压缩文件上传
 * @param id file 表单的id属性
 * @param uploadBack 回调方法 参数 jsonData
 */
function uploadCommonCompress(id,uploadBack,oldFile){
	var fs=fileSizeJudge(id,20480,".zip,.rar");
	if(!fs){
		jQuery.blockUI();
		fileTransferAccess.commonCompressUpload(dwr.util.getValue(id),oldFile,{callback:function(data){
			if(uploadBack){
				uploadBack(data);
			}
			jQuery.unblockUI();
		}});  
	}else{
		if(uploadBack){
			uploadBack({success:false,msg:fs});
		}
	}
}

/*function uploadPre(id,uploadBack,oldFile,size,type){
	var fs=fileSizeJudge(id,size,type);
	if(!fs){
		jQuery.blockUI();
		 
	}else{
		if(uploadBack){
			uploadBack({success:false,msg:fs});
		}
	}
}*/


function commonOfficeUpload(id,uploadBack,oldFile){
	var fs=fileSizeJudge(id,20480,".dox,.docx,.xls,.xlsx,.ppt,.pptx,.pdf");
	if(!fs){
		jQuery.blockUI();
		fileTransferAccess.commonOfficeUpload(dwr.util.getValue(id),oldFile,{callback:function(data){
			if(uploadBack){
				uploadBack(data);
			}
			jQuery.unblockUI();
		}});  
	}else{
		if(uploadBack){
			uploadBack({success:false,msg:fs});
		}
	}
}


/**
 * 下载文件
 * @param filePath 文件相对路径(不带主机名、端口、协议)
 */
function downloadFile(filePath,fileName){
	fileTransferAccess.downloadFile(filePath,fileName,function (data){  
        dwr.engine.openInDownload(data);  
    }); 
}


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