package com.ybt.base.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="MBTIProblem")
public class MBTIproblem extends BaseStringEntity {

	private int mbtiNumber; //题目编号
	
	private String mbtiProblem;//题目
	
	private String resultA;//A结果
	
	private String resultB;//B结果
	
	private String type;//类型
	
	private String isScore; //是否加分

	public int getMbtiNumber() {
		return mbtiNumber;
	}

	public void setMbtiNumber(int mbtiNumber) {
		this.mbtiNumber = mbtiNumber;
	}

	public String getMbtiProblem() {
		return mbtiProblem;
	}

	public void setMbtiProblem(String mbtiProblem) {
		this.mbtiProblem = mbtiProblem;
	}

	public String getResultA() {
		return resultA;
	}

	public void setResultA(String resultA) {
		this.resultA = resultA;
	}

	public String getResultB() {
		return resultB;
	}

	public void setResultB(String resultB) {
		this.resultB = resultB;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIsScore() {
		return isScore;
	}

	public void setIsScore(String isScore) {
		this.isScore = isScore;
	}
	
	
	
}
