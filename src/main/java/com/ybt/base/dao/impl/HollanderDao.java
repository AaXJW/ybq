package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IHollanderDao;
import com.ybt.base.entity.Hollander;

@SuppressWarnings("serial")
@Repository
@Transactional
public class HollanderDao extends EntityDaoSupport<Hollander, String>implements IHollanderDao {

}
