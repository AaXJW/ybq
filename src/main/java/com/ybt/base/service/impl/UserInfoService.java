package com.ybt.base.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.service.impl.GeneralServiceImpl;
import com.ybt.base.dao.IUserInfoDao;
import com.ybt.base.entity.UserInfo;
import com.ybt.base.service.IUserInfoService;


@Repository
@Transactional
public class UserInfoService extends GeneralServiceImpl<UserInfo, IUserInfoDao> implements IUserInfoService{

}
