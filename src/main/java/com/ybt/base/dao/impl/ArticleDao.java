package com.ybt.base.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jiufengxinxi.core.dao.impl.EntityDaoSupport;
import com.ybt.base.dao.IArticleDao;
import com.ybt.base.entity.Article;



@SuppressWarnings("serial")
@Repository
@Transactional
public class ArticleDao extends EntityDaoSupport<Article, String>implements IArticleDao {

}
