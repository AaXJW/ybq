package com.ybt.base.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.jiufengxinxi.core.entity.BusinessStringIdEntity;
import com.jiufengxinxi.core.entity.annotations.AnnoField;

@MappedSuperclass
public class BaseStringEntity extends BusinessStringIdEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 201018136439736755L;



}
