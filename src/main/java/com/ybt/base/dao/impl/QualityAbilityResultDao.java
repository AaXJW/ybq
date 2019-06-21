package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IQualityAbilityResultDao;
import com.ybt.base.entity.QualityAbilityResult;


@SuppressWarnings("serial")
@Repository
@Transactional
public class QualityAbilityResultDao extends EntityDaoSupport<QualityAbilityResult, String>implements IQualityAbilityResultDao{

}
