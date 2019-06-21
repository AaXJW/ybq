package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.ITestDao;
import com.ybt.base.entity.Test;



@SuppressWarnings("serial")
@Repository
@Transactional
public class TestDao extends EntityDaoSupport<Test, String>implements ITestDao {

}
