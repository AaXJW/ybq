package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IResultDao;
import com.ybt.base.entity.Result;
import com.ybt.base.service.IResultService;


@Repository
@Transactional
public class ResultService extends GeneralServiceImpl<Result, IResultDao> implements IResultService{

}
