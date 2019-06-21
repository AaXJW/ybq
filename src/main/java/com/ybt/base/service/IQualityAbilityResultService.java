package com.ybt.base.service;

import com.jiufengxinxi.core.service.IGeneralService;
import com.ybt.base.entity.QualityAbilityResult;

public interface IQualityAbilityResultService extends IGeneralService<QualityAbilityResult>{

	public QualityAbilityResult getQualityAbilityResult(int value,String type)throws Exception;
	
}
