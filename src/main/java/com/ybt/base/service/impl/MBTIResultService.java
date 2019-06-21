package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IMBTIResultDao;
import com.ybt.base.entity.MBTIResult;
import com.ybt.base.service.IMBTIResultService;



@Repository
@Transactional
public class MBTIResultService  extends GeneralServiceImpl<MBTIResult, IMBTIResultDao> implements IMBTIResultService{

}
