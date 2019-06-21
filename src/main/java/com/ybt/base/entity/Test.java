package com.ybt.base.entity;


import javax.persistence.Entity;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Test")
public class Test  extends BaseStringEntity {

	private String synopsis;//简介
	
	private String teseName;//测试名称
	
	private String imagePath;//图片地址
	
	private double price;//价格
	

	public String getSynopsis() {
		return synopsis;
	}




	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}




	public String getTeseName() {
		return teseName;
	}




	public void setTeseName(String teseName) {
		this.teseName = teseName;
	}




	public String getImagePath() {
		return imagePath;
	}




	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}




	public double getPrice() {
		return price;
	}




	public void setPrice(double price) {
		this.price = price;
	}


}
