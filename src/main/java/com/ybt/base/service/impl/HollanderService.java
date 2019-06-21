package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IHollanderDao;
import com.ybt.base.entity.Hollander;
import com.ybt.base.service.IHollanderService;

@Repository
@Transactional
public class HollanderService extends GeneralServiceImpl<Hollander, IHollanderDao> implements IHollanderService{

}
