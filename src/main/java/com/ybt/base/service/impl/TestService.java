package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.ITestDao;
import com.ybt.base.entity.Test;
import com.ybt.base.service.ITestService;


@Repository
@Transactional
public class TestService  extends GeneralServiceImpl<Test, ITestDao> implements ITestService{

}
