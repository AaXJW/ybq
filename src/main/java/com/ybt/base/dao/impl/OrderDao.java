package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IOrderDao;
import com.ybt.base.entity.Order;



@SuppressWarnings("serial")
@Repository
@Transactional
public class OrderDao extends EntityDaoSupport<Order, String>implements IOrderDao {

}
