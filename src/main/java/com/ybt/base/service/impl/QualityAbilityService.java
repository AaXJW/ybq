package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IQualityAbilityDao;
import com.ybt.base.entity.QualityAbility;
import com.ybt.base.service.IQualityAbilityService;


@Repository
@Transactional
public class QualityAbilityService extends GeneralServiceImpl<QualityAbility, IQualityAbilityDao> implements IQualityAbilityService{

}
