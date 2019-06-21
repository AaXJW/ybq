package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IUserInfoDao;
import com.ybt.base.entity.UserInfo;


@SuppressWarnings("serial")
@Repository
@Transactional
public class UserInfoDao extends EntityDaoSupport<UserInfo, String>implements IUserInfoDao{

}
