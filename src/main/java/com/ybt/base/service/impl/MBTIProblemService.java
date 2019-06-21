package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IMBTIProblemDao;
import com.ybt.base.entity.MBTIproblem;
import com.ybt.base.service.IMBTIProblemService;




@Repository
@Transactional
public class MBTIProblemService extends GeneralServiceImpl<MBTIproblem, IMBTIProblemDao> implements IMBTIProblemService{

}
