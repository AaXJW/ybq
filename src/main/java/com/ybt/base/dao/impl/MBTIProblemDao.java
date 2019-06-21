package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IMBTIProblemDao;
import com.ybt.base.entity.MBTIproblem;


@SuppressWarnings("serial")
@Repository
@Transactional
public class MBTIProblemDao extends EntityDaoSupport<MBTIproblem, String>implements IMBTIProblemDao{

}
