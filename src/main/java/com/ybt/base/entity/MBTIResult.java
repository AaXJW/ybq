package com.ybt.base.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="MBTIResult")
public class MBTIResult extends BaseStringEntity{

	
	private String type;
	
	
	private String characterType;


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getCharacterType() {
		return characterType;
	}


	public void setCharacterType(String characterType) {
		this.characterType = characterType;
	}


	
}
