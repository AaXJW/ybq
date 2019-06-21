package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IZBXKDao;
import com.ybt.base.entity.ZBXKProblem;


@SuppressWarnings("serial")
@Repository
@Transactional
public class ZBXKDao extends EntityDaoSupport<ZBXKProblem, String>implements IZBXKDao{

}
