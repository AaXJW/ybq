package com.ybt.base.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.jiufengxinxi.core.entity.BusinessLongIdEntity;
import com.jiufengxinxi.core.entity.annotations.AnnoField;

@MappedSuperclass
public class BaseLongEntity extends BusinessLongIdEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7463128859577158873L;

}
