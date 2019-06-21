;(function(blk){
	
	blk.blockUI=function(){
		blk.mask("body");
	};
	
	blk.unblockUI=function(){
		blk.removeMask("body");
	};
	
	blk.fn.block=function(){
		blk.mask(this);
	};
	
	blk.fn.unblock=function(){
		blk.removeMask(this);
	};
	
	
	blk.mask=function(a){
		$(a).data("blockId",new Date().getTime());
		if($(a).find(".modal-backdrop").length>0){
			$(a).find(".modal-backdrop").fadeIn('fast');
			$(a).find(".modal").fadeIn('fast');
			return;
		}
		var mask=$('<div class="modal-backdrop fade in" style="display: none;"></div>');
		var ct=$('<div class="modal fade in text-center" style="display: none;padding-top:180px;color:#fff;"><i class="icon-spinner icon-spin icon-4x"></i></div>');
		$(a).append(mask);
		$(a).append(ct);
		mask.fadeIn();
		ct.fadeIn();
	};
	
	blk.removeMask=function(a){
		$(a).find(".modal-backdrop").fadeOut('fast');
		$(a).find(".modal").fadeOut('fast');
	};
	
}(jQuery));