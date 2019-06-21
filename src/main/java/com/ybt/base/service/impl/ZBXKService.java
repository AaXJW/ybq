package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IZBXKDao;
import com.ybt.base.entity.ZBXKProblem;
import com.ybt.base.service.IZBXKService;


@Repository
@Transactional
public class ZBXKService extends GeneralServiceImpl<ZBXKProblem, IZBXKDao> implements IZBXKService{

}
