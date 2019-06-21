package com.ybt.base.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@SuppressWarnings("serial")

@Entity
@Table(name="ZBXKProblem")
public class ZBXKProblem extends BaseStringEntity{

	private String pNumber;//编号
	
	private String pProblem;//标题
	
	private String pType;//类型

	
	
	public String getpNumber() {
		return pNumber;
	}

	public void setpNumber(String pNumber) {
		this.pNumber = pNumber;
	}

	public String getpProblem() {
		return pProblem;
	}

	public void setpProblem(String pProblem) {
		this.pProblem = pProblem;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	
	
	
	
	
	
	
}
