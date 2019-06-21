package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IMBTIResultDao;
import com.ybt.base.entity.MBTIResult;

@SuppressWarnings("serial")
@Repository
@Transactional
public class MBTIResultDao  extends EntityDaoSupport<MBTIResult, String>implements IMBTIResultDao{

}
