package com.ybt.base.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "QualityAbilityResult")
public class QualityAbilityResult extends BaseStringEntity {

	private int qaFraction;
	
	private String qaAnalysis;
	
	private String qaStudy;
	
	private String qaProposal;
	
	private String qaType;

	public int getQaFraction() {
		return qaFraction;
	}

	public void setQaFraction(int qaFraction) {
		this.qaFraction = qaFraction;
	}

	public String getQaAnalysis() {
		return qaAnalysis;
	}

	public void setQaAnalysis(String qaAnalysis) {
		this.qaAnalysis = qaAnalysis;
	}

	public String getQaStudy() {
		return qaStudy;
	}

	public void setQaStudy(String qaStudy) {
		this.qaStudy = qaStudy;
	}

	public String getQaProposal() {
		return qaProposal;
	}

	public void setQaProposal(String qaProposal) {
		this.qaProposal = qaProposal;
	}

	public String getQaType() {
		return qaType;
	}

	public void setQaType(String qaType) {
		this.qaType = qaType;
	}

	@Override
	public String toString() {
		return "QualityAbilityResult [qaFraction=" + qaFraction + ", qaAnalysis=" + qaAnalysis + ", qaStudy=" + qaStudy
				+ ", qaProposal=" + qaProposal + ", qaType=" + qaType + "]";
	}
	
	
	
	
	
	
	

}
