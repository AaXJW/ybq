package com.ybt.base.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IQualityAbilityResultDao;
import com.ybt.base.entity.QualityAbilityResult;
import com.ybt.base.service.IQualityAbilityResultService;


@Repository
@Transactional
public class QualityAbilityResultService extends GeneralServiceImpl<QualityAbilityResult, IQualityAbilityResultDao> implements IQualityAbilityResultService{

	@Override
	public QualityAbilityResult getQualityAbilityResult(int value,String type) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("qaFraction", getQAFraction(value));
		param.put("qaType", type);
		QualityAbilityResult qualityAbilityResult = this.findUniqueByProperty(param);
		return qualityAbilityResult;
	}

	
	public static int getQAFraction(int i) {
		if (i < 6) {
			return 5;
		}
		return 10;
	}
}
