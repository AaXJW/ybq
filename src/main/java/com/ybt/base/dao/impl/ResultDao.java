package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IResultDao;
import com.ybt.base.entity.Result;


@SuppressWarnings("serial")
@Repository
@Transactional
public class ResultDao extends EntityDaoSupport<Result, String>implements IResultDao {

}
