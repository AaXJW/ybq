package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IQualityAbilityDao;
import com.ybt.base.entity.QualityAbility;


@SuppressWarnings("serial")
@Repository
@Transactional
public class QualityAbilityDao extends EntityDaoSupport<QualityAbility, String>implements IQualityAbilityDao{

}
	