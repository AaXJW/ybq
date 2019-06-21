package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IOrderDao;
import com.ybt.base.entity.Order;
import com.ybt.base.service.IOrderService;


@Repository
@Transactional
public class OrderService  extends GeneralServiceImpl<Order, IOrderDao> implements IOrderService{

}
